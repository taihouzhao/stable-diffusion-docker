FROM tensorflow/tensorflow:2.11.0-gpu

RUN rm -rf /usr/local/cuda/lib64/stubs

COPY requirements.txt /

RUN pip install -r requirements.txt \
  --extra-index-url https://download.pytorch.org/whl/cu117

COPY docker-entrypoint.py /usr/local/bin

ENTRYPOINT [ "docker-entrypoint.py" ]
