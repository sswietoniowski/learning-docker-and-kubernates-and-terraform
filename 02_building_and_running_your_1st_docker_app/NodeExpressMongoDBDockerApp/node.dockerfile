# Build: docker build -f node.dockerfile -t danwahlin/nodeapp .

# Option 1: Create a custom bridge network and add containers into it

# docker network create --driver bridge isolated_network
# docker run -d --net=isolated_network --name mongodb mongo

# NOTE: $(pwd) in the following line is for Mac and Linux. See https://blog.codewithdan.com/docker-volumes-and-print-working-directory-pwd/ for Windows examples.
# docker run -d --net=isolated_network --name nodeapp -p 3000:3000 -v $(pwd)/logs:/var/www/logs danwahlin/nodeapp

# Seed the database with sample database
# Run: docker exec nodeapp node dbSeeder.js

# Option 2 (Legacy Linking - this is the OLD way)
# Start MongoDB and Node (link Node to MongoDB container with legacy linking)
 
# docker run -d --name my-mongodb mongo
# docker run -d -p 3000:3000 --link my-mongodb:mongodb --name nodeapp danwahlin/nodeapp

# Base image (in this case Alpine Linux)
FROM        node:alpine
# Our labels
LABEL       author="Sławomir Świętoniowski"
# We can define some variables here
ARG         PACKAGES=nano
# Define environment variables
ENV         TERM xterm
# Different commands to run
RUN         apk update && apk add $PACKAGES
# Starting point of your app
WORKDIR     /var/www
# Copy settings, scripts, etc. to the container
COPY        package.json package-lock.json ./
# As abowe
RUN         npm install
# Again copy the rest of files
COPY        . ./
# Expose port from this container, in this case we're exposing port 3000
EXPOSE      $PORT
# What to execute when the container starts
ENTRYPOINT  ["npm", "start"]
# More info about these commands: https://docs.docker.com/engine/reference/builder/