# 1. Using a minimal base image
FROM python:3.9-slim

# 2. Adding required Labels
LABEL maintainer="Muhammad Qasim Tahir"
LABEL version="1.0"
LABEL description="Optimized Sakila Flask App"

# 3. Creating a non-root user for security
RUN useradd -m -r appuser

WORKDIR /app

# 4. Leveraging layer caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copying app and change ownership to our secure user
COPY . .
RUN chown -R appuser:appuser /app

# Switching to the non-root user
USER appuser

EXPOSE 5000

# 6. Adding a Healthcheck using Python's built-in urllib
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/')" || exit 1

CMD ["python", "app.py"]