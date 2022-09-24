#syntax=docker/dockerfile:1

FROM python:rc-slim
# FROM python:3.8-slim-buster

WORKDIR /python-docker

COPY ./backend/requirements.txt requirements.txt
#RUN pip3 install -r requirements.txt
RUN pip install --trusted-host pype.phyton.org -r requirements.txt
COPY . .

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
CMD ["gunicorn","app:app"]


# #cria imagem inicial
# FROM python:rc-slim
# #Diretrorio de trabalho
# WORKDIR /app
# #Copiar a aplicação para pasta
# COPY . /app
# #Instalar depencdencias
# COPY ./backend/requirements.txt requirements.txt
# RUN pip install --trusted-host pype.phyton.org -r requirements.txt
# #Inciar a aplicaação
# CMD ["gunicorn","app:app"]