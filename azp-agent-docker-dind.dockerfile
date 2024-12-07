FROM docker:27.3.1-dind-alpine3.20
ENV TARGETARCH="linux-musl-x64"

# Another option:
# FROM arm64v8/alpine
# ENV TARGETARCH="linux-musl-arm64"

RUN apk update
RUN apk upgrade
RUN apk add bash curl git icu-libs jq

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN adduser -D agent
RUN addgroup agent docker
RUN chown agent ./
USER agent

ENTRYPOINT [ "./start.sh" ]
