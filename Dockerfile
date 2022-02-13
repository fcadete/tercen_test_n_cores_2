FROM tercen/dartrusttidy:1.0.7

USER root
WORKDIR /operator

RUN git clone https://github.com/fcadete/tercen_test_n_cores_R

WORKDIR /operator/tercen_test_n_cores_R

RUN echo 0.0.1 && git pull
RUN git checkout

RUN R -e "renv::restore(confirm=FALSE)"

ENV TERCEN_SERVICE_URI https://tercen.com

COPY start.R /start.R

ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","/start.R"]






