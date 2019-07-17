FROM ubuntu:18.04

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		bzip2 \
		ca-certificates \
		curl \
	; \
	rm -rf /var/lib/apt/lists/*

ARG VERSION

RUN curl -L https://downloads.getmonero.org/cli/monero-linux-x64-v${VERSION}.tar.bz2 | tar -xj --strip-components=2 -C /usr/bin/

RUN useradd -m -u 1000 -s /bin/bash runner
USER runner

ENTRYPOINT ["monerod"]
