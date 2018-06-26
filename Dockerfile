FROM hashicorp/terraform

MAINTAINER Chris Every <eversmcc@gmail.com>

RUN apk add python

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/bin
RUN tar -C /usr/local/bin -xvf /tmp/google-cloud-sdk.tar.gz
RUN /usr/local/bin/google-cloud-sdk/install.sh

ENV PATH $PATH:/usr/local/bin/google-cloud-sdk/bin

RUN gcloud components install docker-credential-gcr -q --no-user-output-enabled
RUN gcloud components install kubectl -q --no-user-output-enabled

ENTRYPOINT ["/bin/sh"]