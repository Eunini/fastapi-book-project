FROM python:3.10-slim

# Install dependencies
RUN apt-get update && apt-get install -y nginx

# Install application dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Copy application code
COPY . /app

# Copy the nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the application port
EXPOSE 80

# Start both Nginx and the FastAPI app with Gunicorn
CMD ["nginx", "-g", "daemon off;"]
