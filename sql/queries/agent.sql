-- name: GetAgent :one
SELECT * FROM agents
WHERE id = $1;

-- name: ListAgents :many
SELECT * FROM agents
ORDER BY name;

-- name: CreateAgent :one
INSERT INTO agents (name, email)
VALUES ($1, $2)
RETURNING *;

-- name: UpdateAgent :one
UPDATE agents
SET name = $2, email = $3
WHERE id = $1
RETURNING *;

-- name: DeleteAgent :one
DELETE FROM agents
WHERE id = $1
RETURNING *;
