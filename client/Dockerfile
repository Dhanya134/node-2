FROM node:12.18.1-alpine
# RUN adduser --disabled-password karanth
# USER karanth
WORKDIR /code
COPY package*.json ./ 
RUN npm install 
COPY . .
RUN chmod -R 777 /code
EXPOSE 3000
CMD ["npm","start"]


# FROM redhat/ubi9
# RUN adduser --no-create-home myuser
# WORKDIR /code
# RUN chmod -R 777 /code
# COPY package*.json ./
# RUN yum install -y nodejs
# RUN npm install --cache /code/.npm-cache
# COPY . .
# EXPOSE 3000
# USER myuser
# CMD ["npm", "start"]



# # Stage 1 - Build
# FROM node:12.18.1-alpine as build
# WORKDIR /app 
# COPY package*.json ./
# RUN npm install --no-cache
# COPY . .

# # Stage 2 - Run
# FROM node:12.18.1-alpine
# WORKDIR /app 
# COPY --from=build /app .
# RUN chmod -R 777 /app
# EXPOSE 3000
# CMD ["npm","start"]



