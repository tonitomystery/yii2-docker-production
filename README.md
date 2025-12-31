# yii2-docker-production

Este proyecto contiene la configuración necesaria para construir y desplegar una imagen Docker de una aplicación Yii2.

**Docker Hub:** [amaristany/yii2-docker-prod](https://hub.docker.com/r/amaristany/yii2-docker-prod)

## Estructura
- `Dockerfile`: Archivo de configuración para construir la imagen Docker.
- `.github/workflows/docker-image.yml`: Workflow de GitHub Actions para compilar y subir la imagen a DockerHub.

## Uso

### Compilar la imagen localmente

```sh
docker build -t <usuario_dockerhub>/yii2-docker-production:latest .
```

### Subir la imagen a DockerHub

```sh
docker login
# Luego
docker push <usuario_dockerhub>/yii2-docker-production:latest
```

### Automatización con GitHub Actions

Cada vez que se realiza un push a la rama `main`, el workflow compila y sube la imagen a DockerHub automáticamente.

#### Configuración de secretos

Agrega los siguientes secretos en la configuración de tu repositorio en GitHub:
- `DOCKERHUB_USERNAME`: Tu usuario de DockerHub
- `DOCKERHUB_TOKEN`: Token de acceso generado en DockerHub

## Personalización

Modifica el `Dockerfile` según las necesidades de tu aplicación Yii2.

## Licencia

MIT
