CREATE SCHEMA IF NOT EXISTS auth;

CREATE TABLE IF NOT EXISTS public.api_action (
   type text NOT NULL,
   payload jsonb NULL,
   created_at timestamp NULL DEFAULT now(),
   CONSTRAINT api_action_pkey PRIMARY KEY(type)
);

CREATE TABLE IF NOT EXISTS public.collection (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT collection_pkey PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.collection_activity (
   collection_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT collection_activity_pkey PRIMARY KEY(collection_id,id),
   CONSTRAINT collection_activity_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.collection_listing (
   collection_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT collection_listing_pkey PRIMARY KEY(collection_id,id),
   CONSTRAINT collection_listing_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.collection_stat (
   collection_id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT collection_stat_pkey PRIMARY KEY(collection_id),
   CONSTRAINT collection_stat_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.launchpad (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT launchpad_pkey PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS public.token (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT token_pkey PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.token_activity (
   token_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT token_activity_pkey PRIMARY KEY(token_id,id),
   CONSTRAINT token_activity_token_id_fkey FOREIGN KEY (id) REFERENCES public.token(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.token_listing (
   token_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT token_listing_pkey PRIMARY KEY(token_id,id),
   CONSTRAINT token_listing_token_id_fkey FOREIGN KEY (id) REFERENCES public.token(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.token_offer_received (
   token_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT token_offer_received_pkey PRIMARY KEY(token_id,id),
   CONSTRAINT token_offer_received_token_id_fkey FOREIGN KEY (id) REFERENCES public.token(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.wallet (
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT wallet_pkey PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS public.wallet_activity (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT wallet_activity_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT wallet_activity_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.wallet(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.wallet_escrow_balance (
   wallet_id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT wallet_escrow_balance_pkey PRIMARY KEY(wallet_id),
   CONSTRAINT wallet_escrow_balance_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.wallet(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.wallet_offers_made (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT wallet_offers_made_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT wallet_offers_made_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.wallet(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.wallet_offers_received (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT wallet_offers_received_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT wallet_offers_received_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.wallet(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.wallet_token (
   wallet_id text NOT NULL,
   id text NOT NULL,
   data jsonb NOT NULL,
   updated_at timestamp NULL DEFAULT now(),
   CONSTRAINT wallet_token_pkey PRIMARY KEY(wallet_id,id),
   CONSTRAINT wallet_token_wallet_id_fkey FOREIGN KEY (id) REFERENCES public.wallet(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.scan_log (
   id text NOT NULL,
   scanned_at timestamp NOT NULL DEFAULT now(),
   created_at timestamp NULL DEFAULT now(),
   CONSTRAINT scan_log_pkey PRIMARY KEY(id)
);
