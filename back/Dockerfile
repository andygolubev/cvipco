FROM ubuntu:kinetic
WORKDIR /app
COPY . .
RUN apt update
RUN apt install -y software-properties-common
RUN python3 --version
RUN apt-get -y install python3-pip
RUN pip3 --version
# RUN add-apt-repository ppa:deadsnakes/ppa
# RUN apt update
# RUN sudo apt update && sudo apt -y install python3.11
#RUN python3 --version
RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install
CMD ["python3", "src/main.py"]
EXPOSE 80