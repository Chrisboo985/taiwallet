CREATE TABLE tokenlists (
  id SERIAL PRIMARY KEY,
  chain VARCHAR NOT NULL REFERENCES chains (id) ON DELETE CASCADE,
  url VARCHAR NOT NULL,
  version INTEGER NOT NULL,
  UNIQUE(chain, url)
);