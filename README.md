# Tecnologías Web – Apuntes

Repositorio con los apuntes y materiales de las clases del curso. Cada carpeta
contiene el archivo principal de la sesión en formato Markdown y su versión en
PDF generada con Pandoc.

## Estructura de carpetas

- `00-extras/`: Materiales complementarios (API, OAuth2, revisiones).
- `01-introduction/` a `10-react-tailwind/`: Apuntes principales de cada clase
numerada. Dentro de cada carpeta encontrarás un archivo `NN-nombre.md` y su PDF
correspondiente.
- `Tecnologías Móviles y Web.pdf`: Presentación general del curso.

## Cómo generar todos los PDFs

1. Instala las dependencias necesarias:
   - [Pandoc](https://pandoc.org/) (variable `PANDOC_COMMAND`, por defecto
   `pandoc`).
   - Un motor LaTeX con soporte para XeLaTeX (por ejemplo, TeX Live) utilizado
   por Pandoc (`PDF_ENGINE`, por defecto `xelatex`).
2. Ejecuta el script de compilación desde la raíz del repositorio:

   ```bash
   ./scripts/compilar_pdfs.sh
   ```

El script recorre cada carpeta que contiene un archivo Markdown de clase y
genera el PDF correspondiente utilizando el comando:

```bash
pandoc -t beamer --pdf-engine=xelatex archivo.md -o archivo.pdf
```

Puedes sobreescribir el comando de Pandoc y el motor de PDF mediante las
variables de entorno `PANDOC_COMMAND` y `PDF_ENGINE` al ejecutar el script.

## Evaluaciones 2025

### Evaluación 1: **Frontend Web**

- 📅 **Martes 11 de noviembre 2025** → muestra preliminar + feedback
- 📅 **Jueves 13 de noviembre 2025** → entrega final (URL + código +
presentación)

### Evaluación 2: **Frontend Móvil**

- 📅 **Martes 02 de diciembre 2025** → muestra preliminar + feedback
- 📅 **Jueves 04 de diciembre 2025** → entrega final (app + código +
presentación)
