// Supabase の接続先。空のままなら「端末内保存のみ」で動く。
// Project Settings → API の Project URL と publishable(anon) key を入れる（secret / service_role は絶対に入れない）
// apple: Apple でログインを Supabase 側で有効化したら true にする（Apple Developer Program が必要）
window.BOCHI_SUPABASE = {
  url: "https://tfwsksdnfdiwficbfqhf.supabase.co",
  anonKey: "sb_publishable_dHUPsVPNOosVo1tdNwUxuA_1wyx_942",
  apple: true,
};
