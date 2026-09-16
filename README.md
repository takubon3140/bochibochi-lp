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
- Apple ログインは Apple Developer チーム DRIP, inc.（R3QRMYTS85）で設定。App ID `jp.drip-inc.bochibochi.note`、Services ID `jp.drip-inc.bochibochi.note.web`、キー ID `PT8X94JC3T`。
  - Supabase の Apple シークレットは 6 か月で失効する。**次回更新: 2027-03-18 まで**。`node ~/.secrets/bochibochi/make_apple_secret.mjs` でクリップボードに新しいシークレットを作り、Supabase → Authentication → Sign In / Providers → Apple の Secret Key に貼って Save。
  - 秘密鍵 `.p8` と生成スクリプトは `~/.secrets/bochibochi/`（Git 管理外）。
