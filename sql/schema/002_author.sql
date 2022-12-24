-- +goose Up
CREATE TABLE IF NOT EXISTS authors (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    website TEXT,
    agent_id BIGINT NOT NULL,
    FOREIGN KEY (agent_id) REFERENCES agents(id) ON DELETE RESTRICT
);

-- +goose Down
DROP TABLE IF EXISTS authors;