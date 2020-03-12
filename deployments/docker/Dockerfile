FROM python

COPY . /app

RUN pip install -r /app/requirements.txt

CMD ["/bin/bash", "-c", "python /app/source-kube.py"]