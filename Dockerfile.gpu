FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

RUN apt update
RUN apt install -y git wget

WORKDIR /app
RUN git clone https://github.com/ggerganov/whisper.cpp.git

WORKDIR /app/whisper.cpp

RUN ./models/download-ggml-model.sh small
RUN GGML_CUDA=1 make server

CMD ["./server", "-m", "models/ggml-small.bin", "--host", "0.0.0.0", "-l", "ja"]
