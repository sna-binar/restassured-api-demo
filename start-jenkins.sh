#!/bin/bash

echo "🚀 Menjalankan Jenkins dengan Docker Compose..."
docker-compose up -d --build

echo "⏳ Menunggu Jenkins container aktif (10 detik)..."
sleep 10

echo "🔐 Mengambil initial admin password Jenkins..."
PASSWORD=$(docker exec jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null)

if [ -z "$PASSWORD" ]; then
  echo "❌ Gagal mengambil password. Coba tunggu beberapa detik lalu jalankan lagi perintah berikut:"
  echo "   docker exec jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword"
else
  echo ""
  echo "✅ Jenkins siap diakses di: http://localhost:8080"
  echo "🔑 Password admin awal:"
  echo "$PASSWORD"
fi

