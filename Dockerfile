FROM python:3.12-slim

WORKDIR /usr/src/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# Make port 6000 available to the world outside this container
EXPOSE 6000

ENV FLASK_APP=app.py

CMD ["flask", "run", "--host=0.0.0.0", "--port=6000"]
