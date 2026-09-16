# ぼちぼち LP

「人生を、ぼちぼち良くする。」— ブランド「ぼちぼち」の公式ランディングページ（静的サイト）。

- 公開URL: https://takubon3140.github.io/bochibochi-lp/
- 親ブランド: https://github.com/takubon3140/bochibochi（ブランドブック・トークン・実装ガイド）
- 編集ルール: `CLAUDE.md`、判断基準: `docs/BRAND_CONTEXT.md`
- ローカル確認: `python3 -m http.server 8000` → http://localhost:8000

ぼちぼち作業室（Discord・先着100名まで無料）: https://discord.gg/DdUfR2rM8W

## ぼちぼちノート（/note/）

- 静的ページ。ログインしなければ `localStorage`（`bochibochi.note.v1`）だけに保存。
- ログイン（Google / 将来 Apple）すると Supabase に同期。接続先は `note/config.js`（publishable key のみ。secret / service_role は置かない）。
- テーブル・RLS は `note/supabase/schema.sql`（Supabase プロジェクト `bochibochi`・東京）。本人の行しか読み書きできない。
- Google ログインは Google Cloud プロジェクト `bochibochi`（OAuth クライアント `bochibochi-note-supabase`、本番公開済み）。
- Apple ログインを出すには Apple Developer Program 登録後、Supabase で Apple を有効化し `config.js` の `apple: true`。
