# Use lightweight nginx image
FROM nginx:alpine

# Remove default nginx files (optional but clean)
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML files
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
