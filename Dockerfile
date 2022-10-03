
# From the source image
FROM tensorflow/tensorflow:1.15.4-gpu-jupyter as base

# Identify maintainer
LABEL maintainer = "mokhtar.sellami@gmail.com"

# Set the default working directory
WORKDIR /app/

# Copy requirements.txt outside the container
# to /app/ inside the container
COPY requirements.txt /app/

# Install required packages
RUN pip install -r ./requirements.txt
# FROM base as builder
# Copy app.py and__init__.py outside the container
# to /app/ inside the container
COPY . /app
#FROM base
# When the container starts, run this
ENTRYPOINT python ./src/ukgse.py --dataset ppi5k --dimension 128 --batchsize 128 --epochs 200

