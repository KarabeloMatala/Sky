FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install nginx curl

# Create directories for each page
RUN mkdir -p /var/www/html/home
RUN mkdir -p /var/www/html/about
RUN mkdir -p /var/www/html/products
RUN mkdir -p /var/www/html/blog
RUN mkdir -p /var/www/html/contacts

# Copy HTML files for each page
COPY home/index.html /var/www/html/home/index.html
COPY about/index.html /var/www/html/about/index.html
COPY products/index.html /var/www/html/products/index.html
COPY blog/index.html /var/www/html/blog/index.html
COPY contacts/index.html /var/www/html/contacts/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
