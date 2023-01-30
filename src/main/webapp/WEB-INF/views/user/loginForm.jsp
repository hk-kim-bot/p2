<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/css/signin.css" />
    
  </head>
  <body>
    <div class="login-wrapper">
      <div class="login-form">
        <h3>SHARE HOUSE</h3>
        <form action="/auth/loginProc" method="POST">
          <div class="id-box">
            <img id="userid-icon" src="/img/user-id.png" alt="">
            <input type="text" placeholder="아이디" title="id"name="username"/>

          </div>
          <div class="pwd-box">
            <img id="userpassword-icon" src="/img/user-password.png" alt="">
            <input type="password" placeholder="비밀번호"title="password"name="password"/>

          </div>

          <button type="submit">로그인</button>
        </form>
      </div>
      <div class="helpbox">
        <div class="signup"><a href="/auth/signup">회원가입</a></div>
        <div class="findid-pw"><a href="">아이디/비밀번호 찾기</a></div>
      </div>
      <div class="social">
        <div class="social-login naver"></div>
        <div class="social-login google"></div>
        <div class="social-login kakao"><a href="https://kauth.kakao.com/oauth/authorize?client_id=bc3d1da7dfe8afb92b61f8f94ad85623&redirect_uri=http://localhost:8006/oauth/kakao&response_type=code"></a></div>
      </div>
    </div>
  </body>
</html>