<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>账户设置 - {{.SITE_NAME}}</title>
    
    <!-- 核心样式 -->
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --warning-color: #f8961e;
            --danger-color: #f94144;
            --border-radius: 8px;
            --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
            color: #333;
            line-height: 1.6;
            background-color: #f9fafc;
        }
        
        .modern-navbar {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 15px 0;
        }
        
        .modern-setting-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
        }
        
        .modern-setting-header {
            padding: 25px 30px;
            border-bottom: 1px solid #eee;
        }
        
        .modern-setting-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
        }
        
        .modern-setting-body {
            padding: 30px;
        }
        
        .modern-setting-form-group {
            margin-bottom: 25px;
        }
        
        .modern-setting-label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
        }
        
        .modern-setting-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
        }
        
        .modern-setting-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
            outline: none;
        }
        
        .modern-setting-btn {
            padding: 12px 25px;
            border-radius: var(--border-radius);
            font-weight: 500;
            transition: var(--transition);
            border: none;
            cursor: pointer;
        }
        
        .modern-setting-btn-primary {
            background: var(--primary-color);
            color: white;
        }
        
        .modern-setting-btn-primary:hover {
            background: var(--secondary-color);
        }
        
        .modern-setting-tabs {
            display: flex;
            border-bottom: 1px solid #eee;
        }
        
        .modern-setting-tab {
            padding: 15px 25px;
            font-weight: 500;
            color: #666;
            text-decoration: none;
            border-bottom: 2px solid transparent;
            transition: var(--transition);
        }
        
        .modern-setting-tab:hover {
            color: var(--primary-color);
        }
        
        .modern-setting-tab.active {
            color: var(--primary-color);
            border-bottom-color: var(--primary-color);
        }
        
        .modern-setting-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 3px solid white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .modern-setting-help-text {
            font-size: 0.85rem;
            color: #666;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <!-- 现代化导航栏 -->
    <nav class="modern-navbar navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="{{.BaseUrl}}">
                <h3 style="color: var(--primary-color); margin: 0;">{{.SITE_NAME}}</h3>
            </a>
            <div class="ml-auto d-flex align-items-center">
                {{if .Member}}
                <a href="{{urlfor "BookController.Index"}}" class="mr-3">{{i18n .Lang "common.my_space"}}</a>
                <a href="{{urlfor "AccountController.Logout"}}" class="modern-setting-btn">{{i18n .Lang "common.logout"}}</a>
                {{else}}
                <a href="{{urlfor "AccountController.Login"}}" class="mr-3">{{i18n .Lang "common.login"}}</a>
                <a href="{{urlfor "AccountController.Register"}}" class="modern-setting-btn modern-setting-btn-primary">{{i18n .Lang "common.register"}}</a>
                {{end}}
            </div>
        </div>
    </nav>

    <!-- 设置内容 -->
    <div class="container">
        <div class="modern-setting-container">
            <!-- 设置头部 -->
            <div class="modern-setting-header">
                <h1 class="modern-setting-title">账户设置</h1>
            </div>
            
            <!-- 设置标签页 -->
            <div class="modern-setting-tabs">
                <a href="{{urlfor "SettingController.Index"}}" class="modern-setting-tab {{if eq .controllerName "SettingController"}}active{{end}}">
                    基本设置
                </a>
                <a href="{{urlfor "SettingController.Password"}}" class="modern-setting-tab {{if eq .actionName "Password"}}active{{end}}">
                    修改密码
                </a>
            </div>
            
            <!-- 设置表单 -->
            <div class="modern-setting-body">
                <form method="post" action="{{urlfor "SettingController.Index"}}" id="settingForm">
                    <div class="text-center mb-4">
                        <img src="{{.member.Avatar}}" class="modern-setting-avatar" id="avatarPreview">
                        <div>
                            <a href="javascript:;" class="modern-setting-btn" onclick="document.getElementById('avatar').click()">更换头像</a>
                            <input type="file" id="avatar" name="avatar" style="display: none;" accept="image/*">
                        </div>
                    </div>
                    
                    <div class="modern-setting-form-group">
                        <label class="modern-setting-label">用户名</label>
                        <input type="text" class="modern-setting-input" value="{{.member.Account}}" readonly>
                        <p class="modern-setting-help-text">用户名创建后不可修改</p>
                    </div>
                    
                    <div class="modern-setting-form-group">
                        <label class="modern-setting-label">邮箱</label>
                        <input type="email" name="email" class="modern-setting-input" value="{{.member.Email}}">
                    </div>
                    
                    <div class="modern-setting-form-group">
                        <label class="modern-setting-label">昵称</label>
                        <input type="text" name="nickname" class="modern-setting-input" value="{{.member.Nickname}}">
                    </div>
                    
                    <div class="modern-setting-form-group">
                        <label class="modern-setting-label">个人简介</label>
                        <textarea name="description" class="modern-setting-input" rows="4">{{.member.Description}}</textarea>
                    </div>
                    
                    <div class="text-right">
                        <button type="submit" class="modern-setting-btn modern-setting-btn-primary">保存设置</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // 头像预览
        document.getElementById('avatar').addEventListener('change', function(e) {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('avatarPreview').src = e.target.result;
                }
                reader.readAsDataURL(this.files[0]);
            }
        });
    </script>

    {{template "widgets/footer.tpl" .}}
</body>
</html>