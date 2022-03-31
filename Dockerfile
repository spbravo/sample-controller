FROM golang:1.17 AS builder

WORKDIR /sample-controller
COPY . .
RUN go get -d -v ./...
# Build the binary.
RUN go build -o /go/bin/main
############################
# STEP 2 build a small image
############################
#FROM scratch
# Copy our static executable.
#COPY --from=builder /go/bin/main /go/bin/main
# Run the main binary.
ENTRYPOINT ["/go/bin/main", "-kubeconfig=$HOME/.kube/config"]
