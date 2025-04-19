FROM mysterysd/wzmlx:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip3 install --upgrade setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Ensure the start script is executable
RUN chmod +x start.sh

# Expose the port your application runs on
EXPOSE 8080

# Specify the script to run when the container starts
CMD ["bash", "start.sh"]
