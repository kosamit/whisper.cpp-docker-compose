FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

WORKDIR /app
RUN git clone https://github.com/ggerganov/whisper.cpp.git

WORKDIR /app/whisper.cpp

RUN ./models/download-ggml-model.sh small
RUN WHISPER_CUBLAS=1 make server

CMD ["./server", "-m", "models/ggml-small.bin" "-l", "ja"]