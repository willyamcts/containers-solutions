FROM python:alpine

WORKDIR /usr/src/counters

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

CMD [ "python", "./printers_counter.py" ]
