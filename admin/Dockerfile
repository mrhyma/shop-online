FROM python:3.9
ENV PYTHONUNBUFFERED 1
WORKDIR /admin
COPY requirements.txt /admin/requirements.txt
RUN python3 -m pip install --upgrade pip && python3 -m pip install -r requirements.txt
COPY . /admin/
