# Stage 1 - Builder
FROM alpine as builder
WORKDIR /app
COPY app/start.sh .
RUN chmod +x start.sh

# Stage 2 - Runtime
FROM alpine
WORKDIR /app

# Create non-root user
RUN adduser -D -g '' dockeruser
USER dockeruser

# Set ENV from .env (optional fallback)
ENV USER_NAME=Sathya
ENV ROLE="Docker Defender"

COPY --from=builder /app/start.sh .
CMD ["./start.sh"]
