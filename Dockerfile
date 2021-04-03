# Dockerfile

FROM node:12.13.0-alpine
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser -S app
COPY squarepos/ .
RUN npm install
RUN npm install pm2 -g
RUN chown -R app /opt/app
USER app
EXPOSE 3000
# CMD ["pm2-runtime", "processes.json"]
# CMD [ "npm", "run", "pm2" ]
CMD [ "npm", "run", "start" ]