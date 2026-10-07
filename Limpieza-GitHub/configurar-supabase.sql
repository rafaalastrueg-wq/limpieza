-- En Supabase: abre SQL Editor, pega este archivo completo y pulsa Run.
-- RLS usa el código privado compartido por los tres móviles.

create table if not exists public.cleaning_signatures (
  home_id text not null,
  week_start date not null,
  zone text not null,
  person text not null,
  cleaned_on date not null,
  photo_data text,
  created_at timestamptz not null default now()
);

alter table public.cleaning_signatures add column if not exists photo_data text;
alter table public.cleaning_signatures enable row level security;
alter table public.cleaning_signatures drop constraint if exists cleaning_signatures_pkey;
alter table public.cleaning_signatures add constraint cleaning_signatures_pkey primary key (home_id, week_start, zone, person);
revoke all on public.cleaning_signatures from anon, authenticated;
grant select, insert, update on public.cleaning_signatures to anon;

drop policy if exists "Shared piso app access" on public.cleaning_signatures;
drop policy if exists "Piso read own signatures" on public.cleaning_signatures;
drop policy if exists "Piso insert own signatures" on public.cleaning_signatures;
drop policy if exists "Piso update own signatures" on public.cleaning_signatures;

create policy "Piso read own signatures"
  on public.cleaning_signatures for select to anon
  using (home_id = nullif(current_setting('request.headers', true)::jsonb ->> 'x-home-code', ''));

create policy "Piso insert own signatures"
  on public.cleaning_signatures for insert to anon
  with check (home_id = nullif(current_setting('request.headers', true)::jsonb ->> 'x-home-code', ''));

create policy "Piso update own signatures"
  on public.cleaning_signatures for update to anon
  using (home_id = nullif(current_setting('request.headers', true)::jsonb ->> 'x-home-code', ''))
  with check (home_id = nullif(current_setting('request.headers', true)::jsonb ->> 'x-home-code', ''));




