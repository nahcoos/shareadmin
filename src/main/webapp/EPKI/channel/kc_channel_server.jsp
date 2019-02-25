﻿<%@page language="java" contentType="text/html; charset=UTF-8" import="javax.servlet.http.HttpSession,
                java.math.BigInteger, com.epki.api.EpkiApi, com.epki.session.SecureSession, com.epki.cert.X509Certificate,
				com.epki.cert.CertValidator, com.epki.crypto.*, com.epki.conf.ServerConf,
				com.epki.util.Base64, com.epki.exception.*, com.epki.cms.*, org.json.simple.*, java.io.IOException"%>
<%
    HttpSession m_Session = request.getSession();
    String sessionID = m_Session.getId();

    String tempplainText = request.getParameter("plainText");

    String plainText = new String(tempplainText.getBytes("ISO-8859-1"), "UTF-8");

    String testResult = "";

    String strSessionKey = (String)m_Session.getAttribute("sessionKey");
    String strSessionIV = (String)m_Session.getAttribute("sessionIV");
    String strAlgID = (String)m_Session.getAttribute("algorithm");

    try {
        EpkiApi.initApp();

        byte[] bsessionKey = null;
        byte[] bsessionIV = null;
        byte[] bplainData = null;
        // 세션키 Base64 디코딩
        Base64 base64 = new Base64();
        bsessionKey = base64.decode(strSessionKey);
        bsessionIV = base64.decode(strSessionIV);
	
        SecretKey secretKey = new SecretKey(strAlgID, bsessionKey, bsessionIV);
		
				Cipher cipher = Cipher.getInstance(strAlgID);
				cipher.init(Cipher.ENCRYPT_MODE, secretKey);
       
        byte[] encryptedData = cipher.doFinal(plainText.getBytes("UTF-8"));

        testResult = base64.encode(encryptedData);

    } catch (EpkiException e) {
        testResult = e.toString();
    } 
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>KSign CASE Test</title>

    <!-- 부트스트랩  CSS -->
    <link rel="stylesheet" href="../../kcase/lib/css/bootstrap.min.css"/>

    <!-- KSign Style Sheet -->
    <link rel="stylesheet" href="../../kcase/lib/css/kcase.css"/>

    <!-- Sample CSS -->
    <link rel="stylesheet" href="../../kcase/lib/css/sample.css"/>

    <script src="../../kcase/lib/js/jquery-1.11.3.js"></script>
    <script src="../../kcase/lib/js/jquery-ui.js"></script>

    <script src="../../kcase/lib/js/kcase_os_check.js"></script>
    <script src="../../kcase/EPKICommon.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            var sessionId = '<%=sessionID%>';

            /* init - server's sessionId */
            epki.init(sessionId);

            var decryptInputs = $("#channel_decrypt_result .api-btn-list").find("input");
            var decryptTexts = $("#channel_decrypt_result .table-input-text").find("textarea");

            decryptInputs.eq(1).click(function() {

                /* Call Back Function Definition */
                var success = function(output) {
                		decryptTexts.eq(2).val(output);
                };
                var error = function(errCode, errMsg) {
                    alert(errCode + ": " + errMsg);
                };

                var encryptedData = '<%=testResult%>';

                epki.sessionDecrypt(sessionId, encryptedData, success, error);
            });

            $("footer").css("top", $(window).scrollTop() + $(window).height() - 30);

            $(window).scroll(function () {
                $("footer").css("top", $(window).scrollTop() + $(window).height() - 30);
            });

            $(window).resize(function () {
                $("footer").css("top", $(window).scrollTop() + $(window).height() - 30);
            });
        });
    </script>
</head>
<body>

<div class="header">
    <h1 style="margin: 0px;">
        <div style="height:30px;"></div>
        <span onclick="javascript:location.href='../index.jsp'">HTML5 KSignCase-Agent Server API Test</span>
        <br/>
        <div>KSign Toolkit Development Dept.</div>
    </h1>
</div>

<div style="width:100%; height:1px; background-color: mediumpurple"></div>

<div class="content">
    <h2>인증서 로그인 및 채널보안</h2>
    <div>이 페이지는 인증서 로그인과 채널보안 및 신원확인에 대하여 테스트합니다.</div>
    <section>
        <div id="channel_decrypt_result" class="api-description-box">
            <h3 class="api-description-msg">채널보안 복호화 결과</h3>
            <!-- 테스트 설명 -->
            <div class="api-description-content">
                <h5>

                </h5>
            </div>
            <div class=".api-description-box-gray">
                <div class="api-description-subject"><h4>기능 시험</h4></div>
                <div class="api-description-func">
                    <div style="width:100%;" class="">
                        <form action="" method="post">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="table-input-name">
                                        클라이언트에서 전송된 평문
                                    </td>
                                    <td class="table-input-text">
                                        <textarea ondblclick="textareaResize(this)"><%=plainText%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-input-name">
                                        서버에서 암호화한 값
                                    </td>
                                    <td class="table-input-text">
                                        <textarea ondblclick="textareaResize(this)"><%=testResult%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-input-name">
                                        클라이언트에서 복호화한 값
                                    </td>
                                    <td class="table-input-text">
                                        <textarea ondblclick="textareaResize(this)"></textarea>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="api-btn-list">
                        <input class="kc-btn-blue" onclick="javascript:history.back()" type="button" value="이전" />
                        <input class="kc-btn-blue" type="button" value="복호화" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<footer style="position: absolute;">
    <div>
        Copyright 2016. KSIGN all rights reserved.
    </div>
</footer>
</body>
</html>
