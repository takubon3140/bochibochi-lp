// Supabase の接続先。空のままなら「端末内保存のみ」で動く。
// Project Settings → API の Project URL と anon public key を入れる（service_role は絶対に入れない）
// apple: Apple でログインを Supabase 側で有効化したら true にする（Apple Developer Program が必要）
window.BOCHI_SUPABASE = {
  url: "",
  anonKey: "",
  apple: false,
};
