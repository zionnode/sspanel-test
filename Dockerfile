FROM python:3.8-alpine as base

LABEL Name=django-sspanel

COPY requirements.txt /tmp/requirements.txt

RUN apk add --update --no-cache mariadb-connector-c-dev \
	&& apk add --no-cache --virtual .build-deps mariadb-dev gcc musl-dev libffi-dev make \
	# TODO workaround start
	&& pip install --upgrade pip \
	&& pip install --no-cache-dir -r /tmp/requirements.txt \
	# TODO workaround end
	&& apk del .build-deps
