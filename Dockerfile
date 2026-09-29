# Imagen base ligera de Python
FROM python:3.11-slim

# Directorio de trabajo
WORKDIR /app

# Instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código fuente
COPY app.py .

# Exponer el puerto del contenedor (3000)
EXPOSE 3000

# Usuario no privilegiado por seguridad
USER 1000

# Comando de arranque para producción con Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:3000", "--workers", "2", "app:app"]