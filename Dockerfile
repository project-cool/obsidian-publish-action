FROM node:16

COPY entrypoint.sh /app/entrypoint.sh

# change permission to execute the script and
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
