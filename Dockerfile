FROM node:7.3

# https://github.com/codekitchen/dinghy/issues/17#issuecomment-209545602
RUN echo "int chown() { return 0; }" > preload.c && gcc -shared -o /libpreload.so preload.c && rm preload.c
ENV LD_PRELOAD=/libpreload.so

WORKDIR /var/www/nolimits
