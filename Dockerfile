FROM node:20-slim
#Prisma deu erro por conta da versão de uma aplicação
RUN apt update && apt install -y openssl procps
#atualizo o debian do slim e instalo o que preciso
#linha importante para colocar todos os comandos iniciais

# user vai criar o usuário padrão que tem o mesmo nível de acesso do nosso user do SO
USER node
#usuário não root, pode usar o RUN useradd ou USER node 1000 para ter mesmo acesso do usuário do desenvolvedor

RUN mkdir /home/node/app

WORKDIR /home/node/app

# não usar COPY package ou RUN npm i em ambiente de desenvolvimento pois mesmo com volume anônimo o node_modules será criado só no container
# chown é para o usuário node ser o dono dos arquivos copiados
# COPY --chown=node:node package*.json ./

# RUN npm install

CMD [ "/home/node/app/.docker/start-dev.sh" ]