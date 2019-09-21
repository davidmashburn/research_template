FROM python:3.7-slim

WORKDIR /research_template

COPY ./requirements.txt ./
COPY ./requirements-dev.txt ./

RUN apt-get update && apt-get install -y libfreetype6-dev libpng-dev ffmpeg

RUN pip install -r requirements.txt && pip install -r requirements-dev.txt
RUN pip install jupyter jupytext
RUN echo '/' > /usr/local/lib/python3.7/site-packages/path_hack.pth

CMD bash