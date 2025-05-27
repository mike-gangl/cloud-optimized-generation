from python:3.12
workdir /opt/cloud-optimized
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN pip install numcodecs==0.15.1
COPY generate_cloud_optimized_store.ipynb .
COPY wrapper.sh .
RUN chmod 755 wrapper.sh

RUN apt-get update; apt-get install -y jq awscli
ENTRYPOINT ["/opt/cloud-optimized/wrapper.sh"]
