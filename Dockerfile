# FROM nikolaik/python-nodejs:latest
FROM nikolaik/python-nodejs:python3.10-nodejs18-alpine

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

WORKDIR /app/code
RUN git clone https://github.com/project-cool/obsidian-to-mkdocs .
RUN npm install

RUN apt update && apt -y install imagemagick

RUN pip3 install mkdocs-material

ENTRYPOINT ["/app/entrypoint.sh"]
