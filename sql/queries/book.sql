-- name: GetBook :one
SELECT * FROM books
WHERE id = $1;

-- name: ListBooks :many
SELECT * FROM books
ORDER BY title;

-- name: CreateBook :one
INSERT INTO books (title, description, cover)
VALUES ($1, $2, $3)
RETURNING *;

-- name: UpdateBook :one
UPDATE books
SET title = $2, description = $3, cover = $4
WHERE id = $1
RETURNING *;

-- name: DeleteBook :one
DELETE FROM books
WHERE id = $1
RETURNING *;

-- name: SetBookAuthor :exec
INSERT INTO book_authors (book_id, author_id)
VALUES ($1, $2);

-- name: UnsetBookAuthors :exec
DELETE FROM book_authors
WHERE book_id = $1;

-- name: ListAuthorsByAgentIDs :many
SELECT authors.* FROM authors, agents
WHERE authors.agent_id = agents.id AND agents.id = ANY($1::bigint[]);

-- name: ListBooksByAuthorIDs :many
SELECT books.*, book_authors.author_id FROM books, book_authors
WHERE book_authors.book_id = books.id AND book_authors.author_id = ANY($1::bigint[]);

-- name: ListAuthorsByBookIDs :many
SELECT authors.*, book_authors.book_id FROM authors, book_authors
WHERE book_authors.author_id = authors.id AND book_authors.book_id = ANY($1::bigint[]);

-- name: ListAgentsByAuthorIDs :many
SELECT agents.*, authors.id AS author_id FROM agents, authors
WHERE agents.id = authors.agent_id AND authors.id  = ANY($1::bigint[]);