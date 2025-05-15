<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="{{cdnimg "/static/favicon.ico"}}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="MinDoc" />
    <title>{{i18n .Lang "common.new_account"}} - Powered by 牧牛火链</title>
    
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
    
    <!-- Modern Register Styles -->
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
        
        .register-container {
            max-width: 420px;
            margin: 80px auto;
            padding: 40px;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }
        
        .register-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .register-header h3 {
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
        
        .btn-register {
            background-color: var(--primary-color);
            border: none;
            height: 48px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: var(--transition);
        }
        
        .btn-register:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .btn-register:active {
            transform: translateY(0);
        }
        
        .register-footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }
        
        .register-footer a {
            color: var(--primary-color);
            font-weight: 500;
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
        
        .password-strength {
            height: 4px;
            background: #e9ecef;
            border-radius: 2px;
            margin-top: 8px;
            overflow: hidden;
        }
        
        .strength-bar {
            height: 100%;
            width: 0;
            background: #dc3545;
            transition: var(--transition);
        }
    </style>
    
    <!-- jQuery -->
    <script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}"></script>
</head>
<body>
<div class="container">
    <div class="register-container">
        <div class="register-header">
            <h3>{{i18n .Lang "common.new_account"}}</h3>
            <p class="text-muted">创建您的账户</p>
        </div>
        
        <form role="form" method="post" id="registerForm">
            {{ .xsrfdata }}
            
            <div class="form-group input-with-icon">
                <i class="fa fa-user input-icon"></i>
                <input type="text" class="form-control" placeholder="{{i18n .Lang "common.username"}}" name="account" id="account" autocomplete="off">
            </div>
            
            <div class="form-group input-with-icon">
                <i class="fa fa-envelope input-icon"></i>
                <input type="email" class="form-control" placeholder="{{i18n .Lang "common.email"}}" name="email" id="email" autocomplete="off">
            </div>
            
            <div class="form-group input-with-icon">
                <i class="fa fa-lock input-icon"></i>
                <input type="password" class="form-control" placeholder="{{i18n .Lang "common.password"}}" name="password1" id="password1" autocomplete="off">
                <div class="password-strength">
                    <div class="strength-bar" id="strengthBar"></div>
                </div>
            </div>
            
            <div class="form-group input-with-icon">
                <i class="fa fa-lock input-icon"></i>
                <input type="password" class="form-control" placeholder="{{i18n .Lang "common.confirm_password"}}" name="password2" id="password2" autocomplete="off">
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
            
            <button type="submit" id="btnRegister" class="btn btn-primary btn-block btn-register" data-loading-text="{{i18n .Lang "message.processing"}}" autocomplete="off">
                {{i18n .Lang "common.register"}}
            </button>
            
            {{if ne .ENABLED_REGISTER "false"}}
            <div class="register-footer">
                {{i18n .Lang "message.has_account"}} <a href="{{urlfor "AccountController.Login" }}">{{i18n .Lang "common.login"}}</a>
            </div>
            {{end}}
        </form>
    </div>
</div>

{{template "widgets/footer.tpl" .}}

<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/layer/layer.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/js/jquery.form.js"}}" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {
        // Password strength indicator
        $("#password1").on('input', function() {
            var password = $(this).val();
            var strength = 0;
            
            if (password.length > 0) strength += 1;
            if (password.length > 6) strength += 1;
            if (password.match(/[a-z]/) strength += 1;
            if (password.match(/[A-Z]/)) strength += 1;
            if (password.match(/[0-9]/)) strength += 1;
            if (password.match(/[^a-zA-Z0-9]/)) strength += 1;
            
            var width = (strength / 6) * 100;
            var color = '#dc3545'; // red
            if (strength > 3) color = '#fd7e14'; // orange
            if (strength > 4) color = '#28a745'; // green
            
            $("#strengthBar").css({
                'width': width + '%',
                'background-color': color
            });
        });

        $("#account,#password1,#password2,#email,#code").on('focus', function () {
            $(this).removeClass('is-invalid').parent().removeClass('has-error');
        });

        $(document).keyup(function (e) {
            var event = document.all ? window.event : e;
            if(event.keyCode === 13){
                $("#btnRegister").trigger("click");
            }
        });

        $("#registerForm").ajaxForm({
            beforeSubmit: function () {
                var account = $.trim($("#account").val());
                var password = $.trim($("#password1").val());
                var confirmPassword = $.trim($("#password2").val());
                var code = $.trim($("#code").val());
                var email = $.trim($("#email").val());

                if(account === ""){
                    $("#account").addClass('is-invalid').parent().addClass('has-error');
                    return false;
                } else if(password === ""){
                    $("#password1").addClass('is-invalid').parent().addClass('has-error');
                    return false;
                } else if(confirmPassword !== password){
                    $("#password2").addClass('is-invalid').parent().addClass('has-error');
                    return false;
                } else if(email === ""){
                    $("#email").addClass('is-invalid').parent().addClass('has-error');
                    return false;
                } else if(code !== undefined && code === ""){
                    $("#code").addClass('is-invalid').parent().addClass('has-error');
                    return false;
                } else {
                    $("button[type='submit']").button('loading');
                }
            },
            success: function (res) {
                $("button[type='submit']").button('reset');
                if(res.errcode === 0){
                    window.location = "{{urlfor "AccountController.Login"}}";
                } else {
                    $("#captcha-img").click();
                    $("#code").val('');
                    layer.msg(res.message);
                }
            }
        });
    });
</script>
</body>
</html>