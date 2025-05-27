from python:3.12
workdir /opt/cloud-optimized
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY generate_cloud_optimized_store.ipynb .
COPY wrapper.sh .
RUN chmod 755 wrapper.sh
ENTRYPOINT = ["wrapper.sh"]
