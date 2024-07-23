FROM python:3.11-slim

WORKDIR /usr/src/app

#RUN apt-get update && \
#    apt-get install -y --no-install-recommends build-essential && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /usr/src/app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /var/log/agentcontainer

RUN chmod -R 755 /var/log/agentcontainer

# Make port 6000 available to the world outside this container
EXPOSE 6000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "6000"]

