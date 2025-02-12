# Use an official lightweight Python image
<<<<<<< HEAD
FROM python:3.9-slim
=======
FROM python:3.8-slim
>>>>>>> 6663fdaf9b6451f08c054aca73d03bad72647ce2

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port
EXPOSE 8000

# Command to run the application
<<<<<<< HEAD
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
=======
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
>>>>>>> 6663fdaf9b6451f08c054aca73d03bad72647ce2
