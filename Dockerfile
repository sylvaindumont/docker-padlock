FROM golang

EXPOSE 3000

RUN go get github.com/maklesoft/padlock-cloud

ENTRYPOINT ["padlock-cloud", "--email-server", "${MAIL_SERVER}", "--email-port", "${MAIL_PORT}", "--email-user", "${MAIL_USER}", "--email-password", "${MAIL_PASSWORD}", "runserver", "--cors", "--base-url", "${BASE_URL}"]
