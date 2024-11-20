FROM python:3.12-slim-bookworm AS builder

WORKDIR /app


# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1
# --no-install-recommends

RUN apt update > /dev/null && apt install --no-install-recommends -y curl ca-certificates > /dev/null
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
RUN uv pip install -q --strict --no-cache -r /opt/necessary/requirements.txt 
RUN uv cache clean 



# final stage
FROM python:3.12-slim-bookworm AS final

# COPY --from=builder /opt/venv/bin /opt/venv/bin
# COPY --from=builder /opt/venv/lib /opt/venv/lib
# COPY --from=builder /opt/venv/pyvenv.cfg /opt/venv/pyvenv.cfg
# COPY --from=builder /bin/sh /bin/sh

COPY --from=builder /opt/venv /opt/venv

COPY --from=builder /root/.local/bin/ /root/.cargo/bin/

ENV PATH="/root/.local/bin/:$PATH"


WORKDIR /app


COPY entrypoint.sh /opt/necessary/entrypoint.sh
# COPY source_file.sh /app/source_file.sh

ENV VIRTUAL_ENV="/opt/venv"

ENV PATH="/opt/venv/bin:$PATH"

RUN chmod u+x /opt/necessary/entrypoint.sh

EXPOSE 8888

# ENTRYPOINT [ "jupyter", "lab", "--port=8889", "--no-browser" ]

# ENTRYPOINT [ "jupyter","lab", "--port=8889", "--no-browser", "--ip=0.0.0.0" , "--allow-root" ]

CMD ["/opt/necessary/entrypoint.sh"]
