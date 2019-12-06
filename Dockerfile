FROM python:3.7.3-stretch

## Step 1:
RUN mkdir application

## Step 2:
COPY app.py /application/

COPY ./model_data/ /application/model_data

## Step 3:
# Install packages from requirements.txt./
# hadolint ignore=DL3013
#RUN pip install -r requirements.txt 
RUN pip install flask numpy pandas scikit-learn==0.20.3 pylint

## Step 4:
EXPOSE 80 8000

WORKDIR /application/

## Step 5:
CMD ["python","app.py"]


