FROM golang:1.18 AS dev
RUN pwd
COPY src/* /go/src
RUN go build src/who-rocks.go
RUN cp who-rocks who-rocks-prod
RUN strip --strip-all who-rocks-prod
ENTRYPOINT ["/go/who-rocks"]

FROM scratch AS prod
COPY --from=dev /go/who-rocks-prod /
ENTRYPOINT [ "/who-rocks-prod" ]