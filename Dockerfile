# # syntax=docker/dockerfile:1

# FROM python:3.8-slim-buster

# WORKDIR /python-docker

# COPY ./backend/requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt

# COPY . .

# ENV PORT 8080
# ENV HOST 0.0.0.0
# EXPOSE 8080

# CMD [ "python3", "-m" , "flask","-p", "8080", "run", "--host=0.0.0.0"]

# Use uma Imagem Official do Python
FROM python:3.9-slim

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Instrução para iniciar a aplicação.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app