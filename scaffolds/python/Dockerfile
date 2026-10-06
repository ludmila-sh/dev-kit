# Reference snippets for the common cases, not runnable as-is:
# pick one CMD and add the needed packages (e.g. fastapi, uvicorn) to requirements.txt.
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Run as a non-root user; /app must be writable for the logs folder
RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

# FastAPI
EXPOSE 8000
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}"]

# Scripts/bots:
# CMD ["python", "-m", "app.main"]

# Worker:
# CMD ["python", "-m", "app.worker"]
