#!/bin/sh
go install github.com/pressly/goose/v3/cmd/goose@latest
goose -dir ./sql/schema postgres "postgres://user:pass@postgres:5432/db?sslmode=disable" up