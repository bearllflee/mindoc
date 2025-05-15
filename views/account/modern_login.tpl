<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="{{cdnimg "/static/favicon.ico"}}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="MinDoc" />
    <title>{{i18n .Lang "common.login"}} - Powered by 牧牛火链</title>
    <meta name="keywords" content="MinDoc,文档在线管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理">
    <meta name="description" content="MinDoc文档在线管理系统 {{.site_description}}">
    
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
    
    <!-- Modern Login Styles -->
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --border-radius: 8px;
            --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }
        
        body {
            background-color: #f5f7fb;
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
        }
        
        .login-container {
            max-width: 420px;
            margin: 80px auto;
            padding: 40px;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header h3 {
            color: var(--dark-color);
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-control {
            height: 48px;
            border-radius: var(--border-radius);
            border: 1px solid #e0e0e0;
            padding-left: 15px;
            transition: var(--transition);
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #adb5bd;
            z-index: 4;
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-with-icon input {
            padding-left: 40px;
        }
        
        .btn-login {
            background-color: var(--primary-color);
            border: none;
            height: 48px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: var(--transition);
        }
        
        .btn-login:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .btn-login:active {
            transform: translateY(0);
        }
        
        .login-footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }
        
        .login-footer a {
            color: var(--primary-color);
            font-weight: 500;
        }
        
        .third-party-login {
            margin-top: 30px;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
        }
        
        .divider::before, .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #e9ecef;
        }
        
        .divider-text {
            padding: 0 10px;
            color: #6c757d;
            font-size: 14px;
        }
        
        .social-login {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        
        .social-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: var(--transition);
        }
        
        .social-btn:hover {
            transform: translateY(-3px);
        }
        
        .social-btn.dingtalk {
            background-color: #0084ff;
        }
        
        .social-btn.wecom {
            background-color: #07c160;
        }
        
        .captcha-container {
            display: flex;
            gap: 10px;
        }
        
        .captcha-img {
            border-radius: var(--border-radius);
            cursor: pointer;
            border: 1px solid #e0e0e0;
        }
    </style>
    
    <!-- jQuery -->
    <script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}"></script>
</head>
<body>
<div class="container">
    <div class="login-container">
        <div class="login-header">
            <h3>{{i18n .Lang "common.login"}}</h3>
        </div>
        
        <form role="form" method="post">
            {{ .xsrfdata }}
            
            <div class="form-group input-with-icon">
                <i class="fa fa-user input-icon"></i>
                <input type="text" class="form-control" placeholder="{{i18n .Lang "common.email"}} / {{i18n .Lang "common.username"}}" name="account" id="account" autocomplete="off">
            </div>
            
            <div class="form-group input-with-icon">
                <i class="fa fa-lock input-icon"></i>
                <input type="password" class="form-control" placeholder="{{i18n .Lang "common.password"}}" name="password" id="password" autocomplete="off">
            </div>
            
            {{if .ENABLED_CAPTCHA }}
            {{if ne .ENABLED_CAPTCHA "false"}}
            <div class="form-group">
                <div class="captcha-container">
                    <div class="input-with-icon" style="flex: 1;">
                        <i class="fa fa-check-square input-icon"></i>
                        <input type="text" name="code" id="code" class="form-control" maxlength="5" placeholder="{{i18n .Lang "common.captcha"}}" autocomplete="off">
                    </div>
                    <img id="captcha-img" class="captcha-img" src="{{urlfor "AccountController.Captcha"}}" onclick="this.src='{{urlfor "AccountController.Captcha"}}?key=login&t='+(new Date()).getTime();" title="{{i18n .Lang "message.click_to_change"}}">
                </div>
            </div>
            {{end}}
            {{end}}
            
            <div class="form-group d-flex justify-content-between align-items-center">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="is_remember" id="is_remember" value="yes">
                    <label class="form-check-label" for="is_remember">{{i18n .Lang "common.keep_login"}}</label>
                </div>
                <a href="{{urlfor "AccountController.FindPassword" }}" class="text-muted">{{i18n .Lang "common.forgot_password"}}</a>
            </div>
            
            <button type="button" id="btn-login" class="btn btn-primary btn-block btn-login" data-loading-text="{{i18n .Lang "common.logging_in"}}" autocomplete="off">
                {{i18n .Lang "common.login"}}
            </button>
            
            {{if .ENABLED_REGISTER}}
            {{if ne .ENABLED_REGISTER "false"}}
            <div class="login-footer">
                {{i18n .Lang "message.no_account_yet"}} <a href="{{urlfor "AccountController.Register" }}">{{i18n .Lang "common.register"}}</a>
            </div>
            {{end}}
            {{end}}
            
            <div class="third-party-login">
                <div class="divider">
                    <span class="divider-text">{{i18n .Lang "common.third_party_login"}}</span>
                </div>
                <div class="social-login">
                    <div class="social-btn dingtalk {{ if .CanLoginDingTalk }}btn-success{{else}}disabled{{end}}" title="{{i18n .Lang "common.dingtalk_login"}}" data-url="{{ .dingtalk_login_url }}">
                        <i class="fa fa-comment"></i>
                    </div>
                    <div class="social-btn wecom {{ if .CanLoginWorkWeixin }}btn-success{{else}}disabled{{end}}" title="{{i18n .Lang "common.wecom_login"}}" data-url="{{ .workweixin_login_url }}">
                        <i class="fa fa-weixin"></i>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

{{template "widgets/footer.tpl" .}}

<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/layer/layer.js"}}" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#account,#password,#code").on('focus', function () {
            $(this).removeClass('is-invalid').parent().removeClass('has-error');
        });

        $(document).keydown(function (e) {
            var event = document.all ? window.event : e;
            if (event.keyCode === 13) {
                $("#btn-login").click();
            }
        });

        $(".social-btn").on('click', function (){
           if ($(this).hasClass("disabled")) {
               return;
           }
           window.location.href = $(this).data("url");
        });

        $("#btn-login").on('click', function () {
            var $btn = $(this).button('loading');
            var account = $.trim($("#account").val());
            var password = $.trim($("#password").val());
            var code = $("#code").val();

            if (account === "") {
                $("#account").addClass('is-invalid').parent().addClass('has-error');
                $btn.button('reset');
                return false;
            } else if (password === "") {
                $("#password").addClass('is-invalid').parent().addClass('has-error');
                $btn.button('reset');
                return false;
            } else if (code !== undefined && code === "") {
                $("#code").addClass('is-invalid').parent().addClass('has-error');
                $btn.button('reset');
                return false;
            } else {
                $.ajax({
                    url: "{{urlfor "AccountController.Login" "url" .url}}",
                    data: $("form").serializeArray(),
                    dataType: "json",
                    type: "POST",
                    success: function (res) {
                        if (res.errcode !== 0) {
                            $("#captcha-img").click();
                            $("#code").val('');
                            layer.msg(res.message);
                            $btn.button('reset');
                        } else {
                            turl = res.data;
                            if (turl === "") {
                                turl = "/";
                            }
                            window.location = turl;
                        }
                    },
                    error: function () {
                        $("#captcha-img").click();
                        $("#code").val('');
                        layer.msg('{{i18n .Lang "message.system_error"}}');
                        $btn.button('reset');
                    }
                });
            }

            return false;
        });
    });
</script>
</body>
</html>