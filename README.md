# 🔄 Reconnect Wi-Fi Simple

Una herramienta ligera para reconectar automáticamente tu Wi-Fi en Linux cuando se detecta una desconexión. Ideal para entornos donde la estabilidad de red es crítica.

## 🚀 Características

- Reconexión automática usando `nmcli`
- Servicio systemd para ejecución continua
- Configuración simple por archivo `.conf`
- Fácil instalación vía `.deb`

## 📦 Instalación

Descargá el paquete `.deb` desde la [sección de Releases](https://github.com/tuusuario/reconnect-wifi/releases) y ejecutá:

```bash
wget https://github.com/tuusuario/reconnect-wifi/releases/download/v1.0/reconnect_wifi_simple.deb
sudo apt install ./reconnect_wifi_simple.deb

⚙️ Configuración
Editá el archivo de configuración en:

bash
/etc/reconnect_wifi/wifi_name.conf
WIFI_NAME="MiRedWiFi"
Y Edita con el nombre de tu red.

🛠️ Servicio systemd
El servicio se instala automáticamente. Para verificar su estado:

bash
sudo systemctl status reconnect_wifi.service

Para habilitarlo en el arranque:

bash
sudo systemctl enable reconnect_wifi.service

🧪 Pruebas
Probado en Debian y Ubuntu. Si tenés problemas, abrí un issue.

🤝 Contribuciones
¡Toda mejora es bienvenida! Podés:

* Abrir issues

* Enviar pull requests

* Sugerir mejoras en la documentación

📄 Licencia
Este proyecto está bajo la licencia GPLV3. Ver LICENSE para más detalles.
