# Use official MongoDB image
FROM mongo:6.0

# Copy your master data into MongoDB init folder
COPY master-data.js /docker-entrypoint-initdb.d/

# Expose default MongoDB port
EXPOSE 27017
