FROM python:latest

WORKDIR /code

COPY projects/telegram_random_bot/ .

RUN pip install -r requirements.txt

CMD [ "python", "./core/echo_bot.py" ]
