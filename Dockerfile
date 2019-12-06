FROM python:3.7.3-stretch

## Step 1:
WORKDIR /application/

## Step 2:
COPY app.py /application/

COPY ./model_data/ /application/model_data

COPY requirements.txt /application/

## Step 3:
# Install packages from requirements.txt./
# hadolint ignore=DL3013
#RUN pip install -r requirements.txt 
RUN pip install -r requirements.txt 

## Step 4:
EXPOSE 80 8000

## Step 5:
CMD ["python","app.py"]


