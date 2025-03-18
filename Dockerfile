# Use an official lightweight Python image as a base
FROM python:3.11-slim

# Set a non-root user
RUN useradd --create-home appuser
USER appuser

# Set the working directory
WORKDIR /home/appuser/app

# Copy the application files
#COPY --chown=appuser:appuser . .   
COPY --chown=appuser:appuser simple_time_service.py requirements.txt ./


# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "simple_time_service.py"]
