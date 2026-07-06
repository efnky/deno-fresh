FROM denoland/deno:2.1.4 AS builder
WORKDIR /app
COPY deno.json fresh.config.ts fresh.gen.ts dev.ts main.ts ./
COPY routes ./routes
RUN deno task build

FROM denoland/deno:2.1.4
WORKDIR /app
COPY --from=builder /app .
RUN deno cache main.ts
RUN mkdir -p /deno-dir/remote && chown -R deno:deno /deno-dir
EXPOSE 8080
USER deno
CMD ["deno", "run", "-A", "main.ts"]