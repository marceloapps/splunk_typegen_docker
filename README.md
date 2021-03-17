# Splunk Typegen

Imagem docker baseada no Splunk 7.3.4 que instala um splunk standalone no local com uma licença free e um app instalado, carinhosamente apelidado de Typegen. Esse app põe uma capa por cima da página de Add Data do próprio Splunk para que a pessoa sem permissão para tal possa testar seus arquivos de log.

## Alterando o app padrao

Caso necessite alterar o app padrão, seus arquivos estão dentro de app/splunk_typegen. Para que a imagem funcione bem, rode o seguinte comando e será gerado um tgz do app. Este tgz será extraído no diretório de apps do Splunk.

```bash
tar -czvf splunk_typegen_v1.tgz ../apps/splunk_typegen
```

Feito isso, compile a imagem:

```docker
docker build -t splunk_typegen .
```

## Variáveis de ambiente

A imagem já é compilada com algumas variáveis de ambiente para facilitar a subida do container, seja direto pelo comando (docker run marceloarakaki/splunk:latest) ou dentro de um arquivo docker-compose.yml para compor sua stack com outros componentes.

```docker
ENV SPLUNK_START_ARGS=--accept-license
ENV SPLUNK_LICENSE_URI=Free
ENV SPLUNK_PASSWORD=1234Abc@
ENV SPLUNK_ROLE=splunk_standalone
ENV SPLUNK_HOME=/opt/splunk
ENV SPLUNK_IGNORE_LICENSE=true
ENV SPLUNK_DEFAULTS_HTTP_MAX_TIMEOUT=50
ENV SPLUNK_DEFAULTS_HTTP_MAX_RETRIES=3
ENV SPLUNK_DEFAULTS_HTTP_MAX_DELAY=10
```

## NGINX

A imagem sobe também um web server nginx que serve 2 propósitos. O primeiro é controlar o acesso à URL, para que seja executado o redirect para a url do app ao se tentar entrar na url base do Splunk. O segundo é gravar no arquivo de log do nginx os acessos à página para conseguir extrair métricas. E o arquivo de log é mantido na máquina.