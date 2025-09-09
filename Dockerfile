#Begginer style
FROM node:20

USER node

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

CMD ["node","server.js"]


#Intermediate
#FROM node:20
#
##run useradd in cli and -m create a home directory for the user ex /home/appuser and -s sets the default shell to /bin/bash and username is appuser
##so basically i am creating a user called as app user and giving him home directory and setting default shell to bash
#RUN useradd -ms /bin/bash appuser
#USER appuser
#
#WORKDIR /app
#
#LABEL maintainer="vinay"
#LABEL version="1.0"
#LABEL description="Catalogue microservice"
#
#COPY package*.json ./
#
#RUN npm ci --only=production
#
##this sets up the owner ship of all copied file to user appuser and group appuser
#COPY --chwon=appuser:appuser . .
#
#CMD ["node","server.js"]

#Advanced
#stage 1:Build
#FROM node:20 AS build
#
#WORKDIR /app
#
#COPY package*.json ./
#
#RUN npm ci
#
#LABEL maintainer=vinay
#
#COPY . .
#
##stage 2:production
##add group -S= system group (appgroup) adduser -S=system user appuser -G appgroup=add appuser to appgroup
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
#USER appuser
#
#COPY --from=build /app /app
#
#ENV NODE_ENV=production
#ENV PORT=8080
#
#EXPOSE 8080
#
#HEALTHCHECK --interval=30s --timeout=3s \
#    CMD curl -f http:localhost:8080/health || exit 1
#
#CMD ["node","server.js"]

