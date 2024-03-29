FROM nikolaik/python-nodejs:latest

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

WORKDIR /app/code
RUN git clone https://github.com/project-cool/obsidian-to-mkdocs .
RUN npm install

RUN apt update && apt -y install imagemagick && apt -y install zip

RUN pip3 install mkdocs-material
RUN pip3 install --force "mkdocs<1.4"

ENTRYPOINT ["/app/entrypoint.sh"]
