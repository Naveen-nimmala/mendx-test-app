FROM python:3.6.4-alpine3.6

COPY . /app

WORKDIR /app
#install required packages
RUN pip install -r requirements.txt

#Unit test
RUN python -m pytest test_app.py

CMD [ "hug", "-f", "app.py" ]