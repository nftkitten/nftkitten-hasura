CREATE SCHEMA IF NOT EXISTS auth;

CREATE TABLE IF NOT EXISTS public.api_action (
   type text NOT NULL,
   payload jsonb NULL,
   created_at timestamp NULL DEFAULT now(),
   CONSTRAINT api_action_pkey PRIMARY KEY(type)
);

CREATE TABLE IF NOT EXISTS public.me_collection (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_collection_pkey PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.me_collection_activity (
   collection_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_collection_activity_pkey PRIMARY KEY(collection_id,id),
   CONSTRAINT me_collection_activity_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.me_collection(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_collection_listing (
   collection_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_collection_listing_pkey PRIMARY KEY(collection_id,id),
   CONSTRAINT me_collection_listing_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.me_collection(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_collection_stat (
   collection_id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_collection_stat_pkey PRIMARY KEY(collection_id),
   CONSTRAINT me_collection_stat_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.me_collection(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_launchpad (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_launchpad_pkey PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS public.me_token (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_token_pkey PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.me_token_activity (
   token_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_token_activity_pkey PRIMARY KEY(token_id,id),
   CONSTRAINT me_token_activity_token_id_fkey FOREIGN KEY (id) REFERENCES public.me_token(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_token_listing (
   token_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_token_listing_pkey PRIMARY KEY(token_id,id),
   CONSTRAINT me_token_listing_token_id_fkey FOREIGN KEY (id) REFERENCES public.me_token(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_token_offer_received (
   token_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_token_offer_received_pkey PRIMARY KEY(token_id,id),
   CONSTRAINT me_token_offer_received_token_id_fkey FOREIGN KEY (id) REFERENCES public.me_token(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_wallet (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_wallet_pkey PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.me_wallet_activity (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_wallet_activity_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT me_wallet_activity_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.me_wallet(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_wallet_escrow_balance (
   wallet_id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_wallet_escrow_balance_pkey PRIMARY KEY(wallet_id),
   CONSTRAINT me_wallet_escrow_balance_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.me_wallet(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_wallet_offers_made (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_wallet_offers_made_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT me_wallet_offers_made_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.me_wallet(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_wallet_offers_received (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_wallet_offers_received_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT me_wallet_offers_received_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.me_wallet(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_wallet_token (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_wallet_token_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT me_wallet_token_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.me_wallet(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.me_scan_log (
   id text NOT NULL,
   scanned_at timestamp NOT NULL DEFAULT now(),
   created_at timestamp NULL DEFAULT now(),
   CONSTRAINT me_scan_log_pkey PRIMARY KEY(id)
);
