-- +goose Up
CREATE TABLE IF NOT EXISTS books (
    id BIGSERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    cover TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS book_authors (
    id BIGSERIAL PRIMARY KEY,
    book_id BIGINT NOT NULL,
    author_id BIGINT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE,
    UNIQUE (book_id,author_id)
);

-- +goose Down
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS book_authors;