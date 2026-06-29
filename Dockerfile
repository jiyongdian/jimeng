FROM python:3.11-slim

WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright with system dependencies
RUN pip install playwright && \
    playwright install --with-deps

# Copy application code
COPY . .

# Run the application
CMD ["python", "run.py"]
