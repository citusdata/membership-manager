FROM python:3

RUN pip install docker psycopg2

ADD manager.py /

# the manager creates a file when ready to consume events
HEALTHCHECK --interval=1s --start-period=1s CMD /bin/bash -c 'test -f /manager-ready'

# -u necessary to flush logging to docker in a timely manner
CMD [ "python", "-u", "./manager.py"]
