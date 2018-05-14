#FROM golang:onbuild

#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o main
#CMD ["/app/main"]




# Download Golang image
FROM golang:1.8

RUN mkdir -p /go/src/app

WORKDIR /go/src/app

COPY /todo.go .
COPY /todo_test.go .
COPY /schema.sql .

RUN go-wrapper download
RUN go-wrapper install



EXPOSE 8080

CMD go test && go run todo.go  


