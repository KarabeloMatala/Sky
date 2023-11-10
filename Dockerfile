FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx curl

# Install Back4App CLI
RUN curl -sL https://cli.back4app.com/install | sh

# Back4App login
RUN b4a login --appId 6099baad-7120-41b7-894e-ac218e8e25fc --appSecret YOUR_APP_SECRET

# Copy website files to the Nginx directory
COPY . /var/www/html

# Expose port 80
EXPOSE 80

# Start the Nginx server in daemon mode
CMD ["nginx", "-g", "daemon off;"]
