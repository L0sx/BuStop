# Use uma imagem base oficial do Python
FROM python:3.9-slim

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o arquivo de requisitos para o container
COPY requirements.txt requirements.txt

# Instale as dependências
RUN pip install -r requirements.txt

# Copie o conteúdo da aplicação para o diretório de trabalho
COPY app/ app/

# Exponha a porta que a aplicação vai rodar
EXPOSE 5000

# Comando para rodar a aplicação
CMD ["python", "app/api.py"]
