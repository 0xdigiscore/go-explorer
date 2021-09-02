drop table blocks;
drop table accounts;
drop table transactions;

create table if not exists blocks {
    hash varchar(400) not null,
    height int not null,
    creator           varchar(200) not null,
    ts                timestamp    not null,
};
create index idx_blocks_creator on blocks (creator);
create index idx_blocks_ts on blocks (ts);
create index idx_blocks_height on blocks (height);

create table if not exists accounts
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
create index idx_accounts_firstseen on accounts (firstseen);
create index idx_accounts_lastseen on accounts (lastseen);
create index idx_accounts_balance on accounts (balance);
create index idx_accounts_delegate on accounts (delegate);
create index idx_accounts_txsent on accounts (txsent);
create index idx_accounts_txreceived on accounts (txreceived);
create index idx_accounts_blocksproposed on accounts (blocksproposed);
create index idx_accounts_snarkjobs on accounts (snarkjobs);