# Use a Python 3.10 image as base
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install gunicorn explicitly
RUN pip install gunicorn

# Expose port 8000
EXPOSE 8000

# Start the FastAPI application with gunicorn
CMD ["gunicorn", "-w", "4", "main:app", "--bind", "0.0.0.0:8000"]
