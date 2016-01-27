FROM djmax/alpine-telegraf

MAINTAINER Max Metral <max@pyralis.com>

ENV CONSUL_VERSION 0.6.3
ENV CONSUL_SHA256 b0532c61fec4a4f6d130c893fd8954ec007a6ad93effbe283a39224ed237e250

# Install consul and setup executable
RUN apk --update add curl ca-certificates && \
    curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk && \
        apk add --allow-untrusted /tmp/glibc-2.21-r2.apk && \
	    rm -rf /tmp/glibc-2.21-r2.apk /var/cache/apk/*
	    ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
	    RUN echo "${CONSUL_SHA256}  /tmp/consul.zip" > /tmp/consul.sha256 \
	      && sha256sum -c /tmp/consul.sha256 \
	        && cd /bin \
		  && unzip /tmp/consul.zip \
		    && chmod +x /bin/consul \
		      && rm /tmp/consul.zip

ADD run_consul.sh /etc/service/consul/run

RUN chmod +x /etc/service/consul/run && \
    mkdir /etc/consul.d
