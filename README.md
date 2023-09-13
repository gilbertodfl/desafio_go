DESAFIO

Esse desafio é muito empolgante principalmente se você nunca trabalhou com a linguagem Go!
Você terá que publicar uma imagem no docker hub. Quando executarmos:

docker run <seu-user>/fullcycle

Temos que ter o seguinte resultado: Full Cycle Rocks!!
---------------------------------------------------

Se você perceber, essa imagem apenas realiza um print da mensagem como resultado final, logo, vale a pena dar uma conferida no próprio site da Go Lang para aprender como fazer um "olá mundo".
Lembrando que a Go Lang possui imagens oficiais prontas, vale a pena consultar o Docker Hub.

A imagem de nosso projeto Go precisa ter menos de 2MB

            Comandos executados:

PASSO 01: Crie o arquivo Dockerfile
    mkdir go 
    cd go 
    vim Dockerfile

        FROM golang as builder
        WORKDIR /app
        COPY *.go /app
        RUN go build -ldflags "-s -w" hello_world.go

        FROM scratch
        WORKDIR /app
        COPY --from=builder /app/hello_world /app/hello_world
        CMD [ "/app/hello_world" ]

PASSO 02: Crie o arquivo hello_world.go
vim hello_world.go
    package main

    import "fmt"

    func main() {
        fmt.Println("Full Cycle Rocks!!!")
    }

PASSO 03: Crie a imagem
    docker build -t gilbertofl/project_go .

PASSO 04: Rode a imagem

    docker run -it --rm --name full_cyle_rocks gilbertofl/project_go

    Full Cycle Rocks!!!

PASSO 05: Confira o tamanho
    gilberto@bsb239170:~/docker/go$ docker image ls | grep projec
    gilbertofl/project_go  latest  9ecfb45d9f8d   5 minutes ago   1.17MB    
PASSO 06: Coloque no docker para avaliação.
    docker push gilbertofl/project_go    