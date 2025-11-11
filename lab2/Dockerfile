# Сборка
FROM python:3-alpine AS builder

WORKDIR /app

# Устанавливаем инструменты сборки и dev-заголовки, нужные для сборки psycopg2 и прочих пакетов
RUN apk add --no-cache \
    build-base \
    gcc \
    musl-dev \
    python3-dev \
    libffi-dev \
    openssl-dev \
    postgresql-dev

# Копируем requirements и ставим зависимости в отдельную папку
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --target /app/dependencies

# Финальный (runtime) образ
FROM python:3-alpine

WORKDIR /app

# Устанавливаем только runtime-библиотеки PostgreSQL (libpq) — без компиляторов
RUN apk add --no-cache postgresql-libs

# Копируем зависимости, код и скрипты
COPY --from=builder /app/dependencies /app/dependencies
COPY . /app

# Указываем python path на папку с зависимостями
ENV PYTHONPATH="/app/dependencies:$PYTHONPATH"

# Создаём пользователя и назначаем права
RUN addgroup -S djangogroup \
    && adduser -S -G djangogroup djangouser \
    && chown -R djangouser:djangogroup /app

USER djangouser

EXPOSE 8000

CMD ["sh", "init.sh"]
