# Use a imagem base oficial do Flutter
FROM cirrusci/flutter:stable

# Crie um novo usuário
RUN useradd -m -d /home/flutteruser flutteruser

# Adicione o diretório do Flutter à lista de diretórios seguros do Git
RUN git config --global --add safe.directory /sdks/flutter

# Conceda permissões apropriadas ao diretório do Flutter
RUN chown -R flutteruser:flutteruser /sdks/flutter

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o arquivo pubspec.yaml para o diretório de trabalho no contêiner
COPY pubspec.yaml pubspec.yaml


# Conceda permissões apropriadas ao diretório de trabalho
RUN chown -R flutteruser:flutteruser /app

# Mude para o novo usuário
USER flutteruser

# Instale as dependências
RUN flutter pub get

# Copie o restante do código do aplicativo para o container
COPY . ./

# Exponha a porta padrão do Flutter
EXPOSE 8080

# Comando para iniciar o aplicativo
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]
