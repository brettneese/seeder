# This is the base for our build step container
# which has all our build essentials
FROM resin/raspberry-pi-alpine-node:8.11.3 AS buildstep

# Copy in package.json, install 
# and build all node modules
RUN mkdir -p /home/pi/seeder
WORKDIR /home/pi/seeder
COPY . .
RUN npm install && npm cache clean --force && rm -rf /tmp/*

# we have to build here sadly
RUN npm run build

# clear away buildeps
RUN npm prune --production 

# This is our runtime container that will end up
# running on the device.
FROM resin/raspberry-pi-alpine-node:8.11.3-slim

WORKDIR /home/pi/seeder
# Copy our app into our deployable container context.
COPY --from=buildstep /home/pi/seeder/ .

# Launch our App.
CMD ["node", "server.js"]