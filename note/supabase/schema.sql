-- ぼちぼちノート: Supabase スキーマ（SQL Editor に貼って実行）
create table if not exists public.notes (
  user_id uuid not null references auth.users(id) on delete cascade,
  date date not null,
  mood text check (mood in ('good','ok','tired','rest','')),
  done text default '',
  tomorrow text default '',
  rest boolean default false,
  updated_at timestamptz not null default now(),
  primary key (user_id, date)
);

alter table public.notes enable row level security;

-- 本人だけが読む・書く・消す
create policy "notes_select_own" on public.notes for select using (auth.uid() = user_id);
create policy "notes_insert_own" on public.notes for insert with check (auth.uid() = user_id);
create policy "notes_update_own" on public.notes for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "notes_delete_own" on public.notes for delete using (auth.uid() = user_id);

-- 運営が見てよいのは件数だけ（中身は見ない）: 集計用ビュー（service_role のみ想定）
create or replace view public.notes_daily_counts as
  select date, count(*) as users from public.notes group by date;
revoke all on public.notes_daily_counts from anon, authenticated;
