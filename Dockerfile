FROM python:3.12

ENV PYTHONUNBUFFERED=1
# Define where Chrome will store its user data
ENV CHROME_USER_DATA_DIR=/home/user/chrome_data

RUN apt-get install -y chromium-driver chromium

# Create symbolic links for the expected Google Chrome names to the Chromium executable
RUN ln -s /usr/bin/chromium /usr/bin/google-chrome && \
    ln -s /usr/bin/chromium /usr/bin/google-chrome-stable && \
    ln -s /usr/bin/chromium /usr/bin/google-chrome-beta && \
    ln -s /usr/bin/chromium /usr/bin/google-chrome-dev

# Create a directory for your application
RUN mkdir /app

# Copy the application files
COPY . /app

# Set read/write permissions for the data directory
RUN chmod -R 777 /app

# Install Python dependencies
RUN pip install -r /requirements.txt

# Set the working directory
WORKDIR /app
