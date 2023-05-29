# Use the official Nginx base image
FROM nginx:latest

# Copy the website files to the container
COPY ./website /usr/share/nginx/html

# Set the desired port using sed command
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

# Expose the port Nginx listens on
EXPOSE 8080

# Start Nginx with the modified configuration
CMD envsubst '8080' < /etc/nginx/nginx.template.conf > /etc/nginx/nginx.conf && nginx -g 'daemon off;

Optional 1 
# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
