#!/bin/bash

LOGFILE="/var/log/reconnect_wifi.log"
WIFI_NAME=$(cat /etc/reconnect_wifi/wifi_name.conf)
#WIFI_NAME="WiFi_Mesh-729568"
PING_TARGET="8.8.8.8"
MAX_FAILS=3
FAIL_COUNT=0

# Asegura que el archivo de log exista
touch "$LOGFILE"
echo "$(date): Iniciando script de reconexión Wi-Fi" >> "$LOGFILE"

# Verifica que nmcli esté disponible
if ! command -v nmcli > /dev/null; then
    echo "$(date): ERROR - nmcli no está disponible o no está en el PATH" >> "$LOGFILE"
    exit 1
fi

# Verifica que el adaptador Wi-Fi esté presente
if ! nmcli device status | grep -q "wifi"; then
    echo "$(date): ERROR - No se detecta adaptador Wi-Fi" >> "$LOGFILE"
    exit 1
fi

# Verifica permisos
if [ "$EUID" -ne 0 ]; then
    echo "$(date): ERROR - Se requieren permisos de administrador (sudo)" >> "$LOGFILE"
    exit 1
fi

# Bucle principal
while true; do
    if ping -c 1 "$PING_TARGET" > /dev/null 2>&1; then
        echo "$(date): Conexión -OK-" >> "$LOGFILE"
        FAIL_COUNT=0
    else
        echo "$(date): Falló el ping a $PING_TARGET" >> "$LOGFILE"
        ((FAIL_COUNT++))
        if [ "$FAIL_COUNT" -ge "$MAX_FAILS" ]; then
            echo "$(date): Intentando reconectar Wi-Fi..." >> "$LOGFILE"

            if nmcli -t -f NAME,DEVICE connection show --active | grep -q "$WIFI_NAME"; then
                echo "$(date): Bajando conexión activa '$WIFI_NAME'" >> "$LOGFILE"
                nmcli connection down "$WIFI_NAME" >> "$LOGFILE" 2>&1
                sleep 2
            fi

            echo "$(date): Levantando conexión '$WIFI_NAME'" >> "$LOGFILE"
            nmcli connection up "$WIFI_NAME" >> "$LOGFILE" 2>&1
	    if [ $? -eq 0 ]; then
    		echo "$(date): ✅ Reconexión exitosa con '$WIFI_NAME'" >> "$LOGFILE"
	    else
    		echo "$(date): ❌ ERROR - Falló la reconexión con '$WIFI_NAME'" >> "$LOGFILE"
	    fi
            FAIL_COUNT=0
        fi
    fi
    sleep 10
done
