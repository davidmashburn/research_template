FROM python:3.10-slim

WORKDIR /research_template

COPY ./requirements.txt ./
COPY ./requirements-dev.txt ./

RUN apt-get update && apt-get install -y libfreetype6-dev libpng-dev ffmpeg

RUN pip install -r requirements-dev.txt
RUN pip install -r requirements.txt
RUN pip install jupyter jupytext
RUN python -m ipykernel install
RUN echo '/' > /usr/local/lib/python3.10/site-packages/path_hack.pth

CMD bash