# FROM node:12.18.1-alpine
# RUN adduser --disabled-password karanth
# USER karanth
# WORKDIR /app 
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN chmod -R 777 /app
# EXPOSE 5000
# CMD ["npm","run","server"]


#taking ubi as base image
# FROM redhat/ubi8
# WORKDIR /app 
# COPY package*.json ./
# RUN yum install -y nodejs 
# RUN npm install
# COPY . .
# RUN chmod -R 777 /app
# EXPOSE 5000
# CMD ["npm","run","server"]

# Stage 1 - Build dependencies
FROM node:12.18.1-alpine as build
WORKDIR /app
COPY package*.json ./ 
RUN npm install 

# Stage 2 - Build the application
FROM build as build-app
WORKDIR /app
COPY . .

# Stage 3 - Run
FROM node:12.18.1-alpine
WORKDIR /app
COPY --from=build-app /app .
RUN chmod -R 777 /app
EXPOSE 5000
CMD ["npm","run","server"]