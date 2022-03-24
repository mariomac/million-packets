FROM fedora:37 as builder

RUN dnf install -y llvm clang

WORKDIR /app

COPY . .

RUN ./build.sh

FROM fedora:37

WORKDIR /

COPY --from=builder /app/udpsender .
COPY --from=builder /app/udpreceiver .

