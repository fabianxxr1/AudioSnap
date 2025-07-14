FROM python:3.10-slim

# Instala ffmpeg y dependencias básicas
RUN apt-get update && \
    apt-get install -y ffmpeg wget curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar dependencias e instalarlas
COPY deps.txt .
RUN pip install --no-cache-dir -r deps.txt

# Copiar el resto de los archivos del proyecto
COPY . .

# Exponer el puerto que usa Flask
EXPOSE 5000

# Lanzar la app con Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "backend:app"]
