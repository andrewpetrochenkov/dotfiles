CREATE TABLE IF NOT EXISTS agents(
    path TEXT PRIMARY KEY,
    label TEXT UNIQUE
);
CREATE TABLE IF NOT EXISTS locks(
    path TEXT,
    key TEXT,
    FOREIGN KEY(path) REFERENCES agents(path),
    UNIQUE (path,key)
);
