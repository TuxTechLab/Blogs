FROM squidfunk/mkdocs-material:latest

LABEL maintainer="TuxTechLab <root.tuxtechlab@gamil.com>"

WORKDIR /docs

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE "${BLOGS_CTR_INTERNAL_PORT}"
