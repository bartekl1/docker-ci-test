ARG BASE_IMAGE=python:3.14
FROM ${BASE_IMAGE}
ENV GUNICORN_WORKERS=1
WORKDIR /app
COPY dist/ .
RUN pip install --requirement requirements.txt --no-deps
RUN pip install gunicorn
EXPOSE 8080
CMD gunicorn --bind 0.0.0.0:8080 --workers ${GUNICORN_WORKERS} "app:create_app()"
