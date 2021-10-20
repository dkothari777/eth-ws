CREATE TABLE transactions(
    block_id TEXT,
    hash TEXT,
    time TEXT,
    size TEXT,
    weight TEXT,
    version TEXT,
    lock_time TEXT,
    is_coinbase TEXT,
    has_witness TEXT,
    input_count TEXT,
    output_count TEXT,
    input_total TEXT,
    input_total_usd TEXT,
    output_total TEXT,
    output_total_usd TEXT,
    fee TEXT,
    fee_usd TEXT,
    fee_per_kb TEXT,
    fee_per_kb_usd TEXT,
    fee_per_kwu TEXT,
    fee_per_kwu_usd TEXT,
    cdd_total TEXT,
    CONSTRAINT transactions_pkey PRIMARY KEY(block_id)
);

CREATE INDEX idx_block_id ON transactions (block_id);

COPY transactions FROM '/data/transactions/blockchair_bitcoin_transactions_20090103.tsv' DELIMITER E'\t' CSV HEADER;
COPY transactions FROM '/data/transactions/blockchair_bitcoin_transactions_20090109.tsv' DELIMITER E'\t' CSV HEADER;

CREATE TABLE blocks(
    id   TEXT,
    hash TEXT,
    time TEXT,
    median_time TEXT,
    size TEXT,
    stripped_size TEXT,
    weight TEXT,
    version TEXT,
    version_hex TEXT,
    version_bits TEXT,
    merkle_root TEXT,
    nonce TEXT,
    bits TEXT,
    difficulty TEXT,
    chainwork TEXT,
    coinbase_data_hex TEXT,
    transaction_count TEXT,
    witness_count TEXT,
    input_count TEXT,
    output_count TEXT,
    input_total TEXT,
    input_total_usd TEXT,
    output_total TEXT,
    output_total_usd TEXT,
    fee_total TEXT,
    fee_total_usd TEXT,
    fee_per_kb TEXT,
    fee_per_kb_usd TEXT,
    fee_per_kwu TEXT,
    fee_per_kwu_usd TEXT,
    cdd_total TEXT,
    generation TEXT,
    generation_usd TEXT,
    reward TEXT,
    reward_usd TEXT,
    guessed_miner TEXT,
    CONSTRAINT blocks_pkey PRIMARY KEY(hash)
);

CREATE INDEX idx_hash ON blocks (hash);

COPY blocks FROM '/data/blocks/blockchair_bitcoin_blocks_20090103.tsv' DELIMITER E'\t' CSV HEADER;
COPY blocks FROM '/data/blocks/blockchair_bitcoin_blocks_20090109.tsv' DELIMITER E'\t' CSV HEADER;
