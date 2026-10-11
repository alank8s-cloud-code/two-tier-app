# 1. Build Environment & Base Image
FROM python:3.12-slim

# Update the package lists and upgrade existing OS libraries
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

# 2. Working Directory Setup
WORKDIR /app

# 3. Dependency Management
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Application Source Code
COPY . .

# 5. Network Configuration
EXPOSE 5000

# 6. Container Runtime Execution
CMD ["python", "app.py"]

