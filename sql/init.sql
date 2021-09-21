drop table blockchain_blocks;
drop table blockchain_accounts;
//drop table blockchain_transactions;

create table if not exists blockchain_blocks 
(
    hash varchar(400) not null,
    height int not null,
    creator varchar(200) not null,
    ts timestamp    not null
);
create index idx_blocks_creator on blockchain_blocks (creator);
create index idx_blocks_ts on blockchain_blocks (ts);
create index idx_blocks_height on blockchain_blocks (height);

create table if not exists blockchain_accounts
(
    publickey        varchar(200) not null primary key,
    balance          numeric      not null,
    nonce            int          not null,
    receiptchainhash varchar(400) not null,
    delegate         varchar(200) not null,
    votingfor        varchar(200) not null,
    txsent           int          not null,
    txreceived       int          not null,
    blocksproposed   int          not null,
    snarkjobs        int          not null,
    firstseen        timestamp    not null,
    lastseen         timestamp    not null
);
