FROM golang

EXPOSE 3000

RUN go get github.com/maklesoft/padlock-cloud

ENTRYPOINT ["padlock-cloud", "runserver", "--cors", "--base-url", "$BASE_URL"]
