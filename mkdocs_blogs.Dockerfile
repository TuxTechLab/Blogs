FROM minidocks/mkdocs:latest

LABEL maintainer="Arindam Tanti <arindamtanti123@gmail.com>"

USER root

COPY ./TuxTechBlogs/ /blogs
WORKDIR /blogs

RUN pip install mkdocs && \
    apk add git --no-cache && \
    rm -rf /var/cache/apk/*

EXPOSE 8000

CMD [ "mkdocs", "serve", "-a", "0.0.0.0:8000", "-w", "/blogs/", "-f", "/blogs/mkdocs.yml", "--verbose"]