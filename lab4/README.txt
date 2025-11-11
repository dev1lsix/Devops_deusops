# 1. Собираем system образ
docker build -t system -f Dockerfile-system.dockerfile .

# 2. Собираем build образ (компилируем приложение)
docker build -t build -f Dockerfile-build.dockerfile .

# 3. Собираем run образ (финальный)
docker build -t run -f Dockerfile-run.dockerfile .

# 4. Запускаем контейнер
docker run -d -p 8080:8080 --name java-app run