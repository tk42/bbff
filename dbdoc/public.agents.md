# public.agents

## Description

## Columns

| Name | Type | Default | Nullable | Children | Parents | Comment |
| ---- | ---- | ------- | -------- | -------- | ------- | ------- |
| id | bigint | nextval('agents_id_seq'::regclass) | false | [public.authors](public.authors.md) |  |  |
| name | text |  | false |  |  |  |
| email | text |  | false |  |  |  |

## Constraints

| Name | Type | Definition |
| ---- | ---- | ---------- |
| agents_pkey | PRIMARY KEY | PRIMARY KEY (id) |

## Indexes

| Name | Definition |
| ---- | ---------- |
| agents_pkey | CREATE UNIQUE INDEX agents_pkey ON public.agents USING btree (id) |

## Relations

![er](public.agents.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)
