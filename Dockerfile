FROM python:3.7-buster

WORKDIR /code

COPY projects/stores .

RUN mkdir ${HOME}/.ssh/
RUN touch ${HOME}/.ssh/known_hosts

RUN echo "${SSH_PRIVATE_KEY}" >> ${HOME}/.ssh/id_rsa && chmod 400 ${HOME}/.ssh/id_rsa

RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN pip install -r ./app/shoppub/requirements/requirements.txt

CMD [ "python", "manage.py runserver" ]
