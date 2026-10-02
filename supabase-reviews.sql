create table if not exists public.reviews (
    id uuid primary key default gen_random_uuid(),
    display_name text,
    review_text text not null,
    rating smallint not null,
    status text not null default 'pending',
    created_at timestamptz not null default now(),
    constraint reviews_display_name_length check (
        display_name is null or char_length(trim(display_name)) <= 40
    ),
    constraint reviews_text_length check (
        char_length(trim(review_text)) between 1 and 300
    ),
    constraint reviews_text_word_limit check (
        array_length(regexp_split_to_array(trim(review_text), '\s+'), 1) <= 25
    ),
    constraint reviews_rating_range check (rating between 1 and 5),
    constraint reviews_status_value check (status in ('pending', 'approved', 'rejected'))
);

alter table public.reviews enable row level security;

drop policy if exists "Anyone can read approved reviews" on public.reviews;
create policy "Anyone can read approved reviews"
    on public.reviews
    for select
    to anon
    using (status = 'approved');

drop policy if exists "Anyone can submit pending reviews" on public.reviews;
create policy "Anyone can submit pending reviews"
    on public.reviews
    for insert
    to anon
    with check (status = 'pending');

revoke all on public.reviews from anon, authenticated;
grant select, insert on public.reviews to anon;
