FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 
#this for not writting the byte code 
ENV PYTHONUNBUFFERED=1        
#this for appearing of logs immeditaly

WORKDIR /app
#this all are OS level dependinces from PHASE1 we had few problems
RUN apt-get update && apt-get install -y \
    gcc \
    pkg-config \
    default-libmysqlclient-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/* 
#learnt this from chatgpt this helps in reducing the image size

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . . 
#this copies all the project code into the image
  

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# this will run the script

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]


