FROM python:latest

WORKDIR /code

COPY projects/PiramixBot/ .

RUN pip install -r requirements.txt

CMD [ "python", "./core/echo_bot.py" ]
