// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0

package sqlc

import (
	"database/sql"
)

type Agent struct {
	ID    int64
	Name  string
	Email string
}

type Author struct {
	ID      int64
	Name    string
	Website sql.NullString
	AgentID int64
}

type Book struct {
	ID          int64
	Title       string
	Description string
	Cover       string
}

type BookAuthor struct {
	ID       int64
	BookID   int64
	AuthorID int64
}
