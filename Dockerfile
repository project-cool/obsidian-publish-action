FROM node:16

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

RUN git clone https://github.com/project-cool/obsidian-to-mkdocs /app/code

RUN apt update && apt -y install imagemagick

ENTRYPOINT ["/app/entrypoint.sh"]
