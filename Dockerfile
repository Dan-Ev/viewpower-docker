FROM debian:bookworm-slim AS builder

RUN apt update
RUN apt install wget -y

RUN mkdir /build
WORKDIR /build
RUN wget -c https://www.power-software-download.com/viewpower/ViewPower_linux_x64_text.tar.gz
RUN tar -xvzf ViewPower_linux_x64_text.tar.gz
RUN rm ViewPower_linux_x64_text.tar.gz

FROM debian:bookworm-slim AS runtime

RUN mkdir /install
WORKDIR /install
COPY --from=builder /build/ViewPower_linux_x64_text.sh /install/ViewPower_linux_x64_text.sh

RUN apt update
RUN apt install sudo lib32z1 -y

RUN echo "o\n/opt/ViewPower\nn\nn\n" | ./ViewPower_linux_x64_text.sh
RUN rm ViewPower_linux_x64_text.sh
WORKDIR /
RUN rmdir /install

WORKDIR /opt/ViewPower
COPY ./entrypoint /opt/ViewPower/entrypoint
RUN chmod +x ./entrypoint
ENTRYPOINT ["./entrypoint"]
