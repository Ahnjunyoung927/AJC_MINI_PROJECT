<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Favoree 클론 | 회원가입</title>
  <link rel="stylesheet" href="style.css" />


  
  <style>
  :root{
  --bg:#0b0d10;
  --card:#12161b;
  --muted:#9aa3ad;
  --text:#e9eef3;
  --brand:#6c7bff;
  --brand-2:#9a6cff;
  --red:#ff5c7a;
  --ring: 0 0 0 3px rgba(108,123,255,.25);
}

*{box-sizing:border-box}
html,body{height:100%}
body{
  margin:0; font-family:system-ui, -apple-system, "Segoe UI", Roboto, Arial, sans-serif;
  background:linear-gradient(180deg, #ffffff, #ffffff);
  color:var(--text);
}

a{color:var(--brand); text-decoration:none}
a:hover{text-decoration:underline}

.container{width:min(960px, 92%); margin-inline:auto}

.site-header{
  position:sticky; top:0; z-index:10;
  backdrop-filter: blur(6px);
  background: rgba(11,13,16,.6);
  border-bottom:1px solid rgba(255,255,255,.06);
}
.header-bar{
  display:flex; align-items:center; gap:16px; padding:14px 0;
}
.brand{font-weight:800; letter-spacing:.2px}
.nav{margin-left:auto; display:flex; gap:14px}
.nav-link{color:var(--muted)}
.nav-link:hover{color:var(--text)}
.header-actions{display:flex; gap:8px}

.btn{
  display:inline-flex; align-items:center; justify-content:center;
  padding:10px 14px; border-radius:10px; border:1px solid rgba(255,255,255,.08);
  background:transparent; color:var(--text); cursor:pointer; text-decoration:none;
}
.btn:hover{background:rgba(255,255,255,.05)}
.btn.primary{
  background:linear-gradient(135deg, var(--brand), var(--brand-2));
  border:none;
}
.btn.primary:hover{filter:brightness(1.04)}
.btn.ghost{border:1px solid rgba(255,255,255,.12)}
.btn.full{width:100%}

.auth-hero{padding:56px 0 8px}
.auth-hero h1{margin:0 0 6px}
.sub{margin:0; color:var(--muted)}

.auth-card{
  background:var(--card);
  border:1px solid rgba(255,255,255,.06);
  border-radius:16px;
  padding:28px;
  margin:18px auto 64px;
  box-shadow: 0 6px 30px rgba(0,0,0,.25);
  max-width:520px;
}

.form-row{margin-bottom:16px}
.form-row label{display:block; font-weight:600; margin:0 0 8px}
.form-row input[type="text"],
.form-row input[type="email"],
.form-row input[type="password"]{
  width:100%; padding:12px 14px; border-radius:10px; border:1px solid rgba(255,255,255,.12);
  background:#0f1318; color:var(--text); outline:none;
}
.form-row input:focus{box-shadow:var(--ring); border-color:transparent}

.pw-group .pw-input{position:relative}
.pw-toggle{
  position:absolute; right:6px; top:50%; translate:0 -50%;
  padding:6px 10px; border-radius:8px; border:1px solid rgba(255,255,255,.12);
  background:#0f1318; color:var(--muted); cursor:pointer;
}
.pw-toggle:hover{color:var(--text)}
.hint{color:var(--muted); font-size:.9rem; margin:.5rem 0 0}

.checkbox .checkbox-line{display:flex; gap:10px; align-items:flex-start}
.checkbox input{margin-top:3px}

.error{color:var(--red); font-size:.9rem; margin:.4rem 0 0; min-height:1.1em}

.site-footer{
  border-top:1px solid rgba(255,255,255,.06);
  padding:20px 0; color:var(--muted)
}
.footer-inner{display:flex; justify-content:space-between; gap:12px; align-items:center; flex-wrap:wrap}
</style>
</head>
<body>
  <!-- ===== Header (제공) ===== -->
  <header class="site-header">
    <div class="container header-bar">
      <a class="brand" href="#">Favoree</a>
      <nav class="nav">
        <a href="#" class="nav-link">홈</a>
        <a href="#" class="nav-link">채널</a>
        <a href="#" class="nav-link">리뷰</a>
      </nav>
      <div class="header-actions">
        <a class="btn ghost" href="#">로그인</a>
        <a class="btn primary" href="#">회원가입</a>
      </div>
    </div>
  </header>

  <main>
    <section class="auth-hero">
      <div class="container">
        <h1>회원가입</h1>
        <p class="sub">좋아하는 채널을 모아 보고, 리뷰와 평점을 남겨보세요.</p>
      </div>
    </section>

    <section class="auth-card container">
      <form id="registerForm" novalidate>
        <div class="form-row">
          <label for="email">이메일</label>
          <input id="email" name="email" type="email" placeholder="you@example.com" required />
          <p class="error" data-error-for="email"></p>
        </div>

        <div class="form-row">
          <label for="displayName">닉네임</label>
          <input id="displayName" name="displayName" type="text" placeholder="표시할 이름" minlength="2" maxlength="20" required />
          <p class="error" data-error-for="displayName"></p>
        </div>

        <div class="form-row pw-group">
          <label for="password">비밀번호</label>
          <div class="pw-input">
            <input id="password" name="password" type="password" placeholder="" minlength="8" required />
            <button type="button" class="pw-toggle" aria-label="비밀번호 보기 토글" data-target="password">보기</button>
          </div>
          <p class="hint">8자 이상을 권장해요.</p>
          <p class="error" data-error-for="password"></p>
        </div>

        <div class="form-row pw-group">
          <label for="confirm">비밀번호 확인</label>
          <div class="pw-input">
            <input id="confirm" name="confirm" type="password" placeholder="비밀번호가 일치하는지 확인해주세요." minlength="8" required />
            <button type="button" class="pw-toggle" aria-label="비밀번호 보기 토글" data-target="confirm">보기</button>
          </div>
          <p class="error" data-error-for="confirm"></p>
        </div>

        <div class="form-row checkbox">
          <label class="checkbox-line">
            <input id="terms" type="checkbox" required />
            <span>이용약관 및 개인정보처리방침에 동의합니다.</span>
          </label>
          <p class="error" data-error-for="terms"></p>
        </div>

        <button class="btn primary full" type="submit">가입하기</button>
        <p class="tos">가입 시 <a href="#">이용약관</a>과 <a href="#">개인정보처리방침</a>에 동의하게 됩니다.</p>
      </form>
    </section>
  </main>

  <!-- ===== Footer (제공) ===== -->
  <footer class="site-footer">
    <div class="container footer-inner">
      <div class="footer-left">© 2025 Favoree Clone. All rights reserved.</div>
      <div class="footer-right">
        <a href="#">About</a>
        <a href="#">Contact</a>
        <a href="#">Privacy</a>
      </div>
    </div>
  </footer>

  <script src="main.js"></script>
</body>
</html>
