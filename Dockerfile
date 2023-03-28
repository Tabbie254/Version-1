# Base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy the HTML file to the container
COPY index.html .

# Expose port 80 for web traffic
EXPOSE 80

# Install any necessary packages
RUN apt-get update && \
    apt-get install -y nginx

# Configure nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/sites-enabled/default && \
    ln -s /app/nginx.conf /etc/nginx/sites-enabled/ && \
    chown -R www-data:www-data /var/lib/nginx

# Start nginx
CMD ["nginx"]

