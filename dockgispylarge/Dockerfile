FROM python:3.9-slim-bookworm AS builder

WORKDIR /app


# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1
# --no-install-recommends

RUN apt update > /dev/null && apt install --no-install-recommends -y curl ca-certificates g++ gcc openmpi-bin libgdal-dev libopenmpi-dev libboost-iostreams-dev python3-dev git > /dev/null
# sudo apt install openmpi-bin libgdal-dev libopenmpi-dev libboost-iostreams-dev
# g++ python3-dev gcc

# ENV PROJ_DIR=/usr/local/bin/proj

ADD https://astral.sh/uv/install.sh /uv-installer.sh

RUN sh /uv-installer.sh > /dev/null && rm /uv-installer.sh

ENV PATH="/root/.local/bin/:$PATH"

RUN uv venv /opt/venv

# RUN uv venv  /app/venv
ENV VIRTUAL_ENV=/opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt /opt/necessary/requirements.txt

# COPY requirements.txt .
# RUN uv pip install Cython 
RUN uv pip install richdem > /dev/null
# RUN git clone --recursive https://github.com/r-barnes/richdem.git ghrichdem
# RUN cd ghrichdem/wrappers/pyrichdem && uv pip install .
RUN uv pip install --strict --no-cache -r /opt/necessary/requirements.txt > /dev/null
RUN uv cache clean 



# final stage
FROM python:3.9-slim-bookworm AS final

RUN apt update > /dev/null && apt install -y python3-launchpadlib > /dev/null
COPY --from=builder /opt/venv /opt/venv
COPY --from=builder /root/.local/bin /root/.local/bin
# COPY --from=builder /opt/venv/bin /opt/venv/bin
# COPY --from=builder /opt/venv/lib /opt/venv/lib
# COPY --from=builder /opt/venv/pyvenv.cfg /opt/venv/pyvenv.cfg
# COPY --from=builder /bin/sh /bin/sh
RUN apt-get update --fix-missing > /dev/null \
    && apt-get install -y software-properties-common > /dev/null \
    && add-apt-repository ppa:ubuntugis/ubuntugis-unstable \
    && apt-get update > /dev/null && \
    apt-get clean && \
    apt update > /dev/null && apt install  -y --no-install-recommends > /dev/null \ 
    gdal-bin libgdal-dev gcc build-essential libtiff5-dev > /dev/null && \
    rm -rf /var/lib/apt/lists/*
    ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
    ENV C_INCLUDE_PATH=/usr/include/gdal

ENV PATH="/root/.local/bin/:$PATH"
ENV VIRTUAL_ENV="/opt/venv"

ENV PATH="/opt/venv/bin:$PATH"

RUN uv pip install GDAL==`gdal-config --version` > /dev/null


WORKDIR /app


COPY entrypoint.sh /opt/necessary/entrypoint.sh
# COPY source_file.sh /app/source_file.sh



RUN chmod +x /opt/necessary/entrypoint.sh

EXPOSE 8888



CMD ["/opt/necessary/entrypoint.sh"]
