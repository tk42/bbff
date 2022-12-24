-- name: GetAuthor :one
SELECT * FROM authors
WHERE id = $1;

-- name: ListAuthors :many
SELECT * FROM authors
ORDER BY name;

-- name: CreateAuthor :one
INSERT INTO authors (name, website, agent_id)
VALUES ($1, $2, $3)
RETURNING *;

-- name: UpdateAuthor :one
UPDATE authors
SET name = $2, website = $3, agent_id = $4
WHERE id = $1
RETURNING *;

-- name: DeleteAuthor :one
DELETE FROM authors
WHERE id = $1
RETURNING *;
