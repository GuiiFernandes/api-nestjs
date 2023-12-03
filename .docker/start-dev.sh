#!/bin/bash

npm install
npx prisma migrate dev

# Create .env file if not exists
if [ ! -f ".env" ]; then
  cp .env.example .env
fi
#dica adicional, se não tiver um .env cria a partir do .env.example

tail -f /dev/null
