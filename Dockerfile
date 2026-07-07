# 1. FROM con imagen base recomendada
FROM python:3.11-slim

# Comando para actualizar el sistema base
RUN apt-get update && apt-get upgrade -y && apt-get clean

# 2. WORKDIR para establecer el directorio de trabajo
WORKDIR /app

# [CORRECCIÓN TRIVY]: Actualizar las herramientas internas de Python a versiones seguras
RUN pip install --no-cache-dir --upgrade pip setuptools wheel jaraco.context

# 3. COPY y RUN para copiar archivos e instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código de la aplicación
COPY main.py .
COPY tests/ ./tests/

# 4. EXPOSE con el puerto de la aplicación
EXPOSE 5000

# 5. CMD para arrancar la aplicación
CMD ["python", "main.py"]
