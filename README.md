# 🔄 Reconnect Wi-Fi Simple

Una herramienta ligera para reconectar automáticamente tu Wi-Fi en Linux cuando se detecta una desconexión. Ideal para entornos donde la estabilidad de red es crítica, como servidores, entornos de trabajo remoto o sistemas auto-hospedados.

---

## 🚀 Características

- Reconexión automática usando `nmcli`
- Servicio systemd para ejecución continua
- Configuración simple mediante archivo `.conf`
- Instalación profesional vía `.deb` y repositorio APT propio
- Probado en Debian, Ubuntu y derivados

---

## 📦 Instalación

### Opción 1: Usando el repositorio APT

bash

```
echo "deb [trusted=yes] http://entdev.duckdns.org/downloads stable main" | sudo tee /etc/apt/sources.list.d/reconnect.list
sudo apt update
sudo apt install reconnect-wifi
```

### Opción 2: Descarga directa desde el servidor personal

bash

```
wget http://entdev.duckdns.org/downloads/reconnect_wifi_simple.deb
sudo apt install ./reconnect_wifi_simple.deb
```

### Opción 3: Descarga desde GitHub Releases

Visitá la sección de Releases en GitHub y descargá la última versión del `.deb`.

bash

```
wget https://github.com/cyberpro1990-ai/wifi-reconnect/releases/download/v1.0.0/reconnect_wifi_simple.deb
sudo apt install ./reconnect_wifi_simple.deb
```

## ⚙️ Configuración

Editá el archivo de configuración para definir tu red Wi-Fi:

bash

```
sudo nano /etc/reconnect_wifi/wifi_name.conf
```

Ejemplo:

bash

```
"MiRedWiFi"
```

## 🛠️ Servicio systemd

El servicio se instala automáticamente y se habilita al arranque del sistema. 
Para verificar su estado:

bash

```
sudo systemctl status reconnect_wifi.service
```

Para habilitarlo en el arranque:

bash

```
sudo systemctl enable reconnect_wifi.service
```

Para reiniciarlo manualmente:

bash

```
sudo systemctl restart reconnect_wifi.service
```

## 🧪 Compatibilidad

Probado en:

- Debian 11+
- Ubuntu 20.04+
- Linux Mint

Si tenés problemas, podés abrir un issue o contactarme directamente.

## 🤝 Contribuciones

¡Toda mejora es bienvenida! Podés:

- Abrir issues
- Enviar pull requests
- Sugerir mejoras en la documentación
- Probar el paquete en otras distros

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 📬 Contacto

¿Tenés sugerencias, dudas o querés colaborar?

Podés escribirme a: **david@entdev.duckdns.org**   O visitar el sitio: http://entdev.duckdns.org/downloads
