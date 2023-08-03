
# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install Git and any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get install -y git

# Install pip separately before installing packages from requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run ShortGPT.py when the container launches
CMD ["python", "ShortGPT.py"]
