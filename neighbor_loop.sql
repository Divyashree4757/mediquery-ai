-- Neighbor Loop AI (Semantic Search)

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    embedding vector(768)
);

INSERT INTO items (name, description)
VALUES
('Old Chair', 'Wooden chair in good condition'),
('Study Table', 'Large wooden table for study'),
('Sofa', 'Comfortable sofa for living room');

-- Semantic search
SELECT name
FROM items
ORDER BY embedding <-> (ai.embedding('text-embedding-005', 'furniture')::vector)
LIMIT 3;
