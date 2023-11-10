FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install nginx curl

RUN mkdir -p /var/www/html/home /var/www/html/about /var/www/html/products /var/www/html/blog /var/www/html/contacts
COPY index.html /var/www/html/index.html
COPY home.html /var/www/html/home/index.html
COPY about.html /var/www/html/about/index.html
COPY products.html /var/www/html/products/index.html
COPY blog.html /var/www/html/blog/index.html
COPY contacts.html /var/www/html/contacts/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
