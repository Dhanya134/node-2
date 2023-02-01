#FROM node:12.18.1-slim
#RUN adduser --disabled-password karanth
#USER karanth
#WORKDIR /app 
#COPY package*.json ./
#RUN npm install
#COPY . .
#RUN chmod -R 777 /app
#EXPOSE 5000
#CMD ["npm","run","server"]


#taking ubi as base image
FROM redhat/ubi8
WORKDIR /app 
COPY package*.json ./
RUN yum install -y nodejs 
RUN npm install
COPY . .
RUN chmod -R 777 /app
EXPOSE 5000
CMD ["npm","run","server"]

# FROM node:12.18.1-slim AS builder
# WORKDIR /app
# RUN chmod -R 777 /app
# COPY package*.json ./
# RUN npm install 
# COPY . .

# FROM builder as expose
# COPY --from=builder /app /app
# WORKDIR /app
# EXPOSE 3000
# CMD ["npm","run","server"]