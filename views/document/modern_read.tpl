<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{.document.DocumentName}} - {{.book.BookName}} - {{.SITE_NAME}}</title>
    
    <!-- 核心样式 -->
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
            --sidebar-width: 280px;
        }
        
        body {
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
            color: #333;
            line-height: 1.6;
            background-color: #f9fafc;
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }
        
        .modern-navbar {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .modern-doc-container {
            display: flex;
            flex: 1;
        }
        
        .modern-sidebar {
            width: var(--sidebar-width);
            background: white;
            border-right: 1px solid #eee;
            height: calc(100vh - 60px);
            position: sticky;
            top: 60px;
            overflow-y: auto;
            padding: 20px 0;
        }
        
        .modern-content {
            flex: 1;
            padding: 40px;
            max-width: 900px;
            margin: 0 auto;
        }
        
        .modern-doc-title {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--dark-color);
        }
        
        .modern-doc-body {
            line-height: 1.8;
            font-size: 16px;
        }
        
        .modern-doc-body h2 {
            font-size: 1.5rem;
            margin-top: 40px;
            margin-bottom: 20px;
            font-weight: 600;
            color: var(--dark-color);
        }
        
        .modern-doc-body h3 {
            font-size: 1.3rem;
            margin-top: 30px;
            margin-bottom: 15px;
            font-weight: 500;
        }
        
        .modern-doc-body p {
            margin-bottom: 20px;
        }
        
        .modern-doc-body pre {
            background: #f6f8fa;
            border-radius: var(--border-radius);
            padding: 16px;
            overflow: auto;
            margin-bottom: 20px;
        }
        
        .modern-doc-body code {
            font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
            background: rgba(27,31,35,0.05);
            border-radius: 3px;
            padding: 0.2em 0.4em;
            font-size: 85%;
        }
        
        .modern-toc {
            position: sticky;
            top: 20px;
        }
        
        .modern-toc-title {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .modern-toc-list {
            list-style: none;
            padding-left: 0;
        }
        
        .modern-toc-item {
            margin-bottom: 8px;
        }
        
        .modern-toc-link {
            color: #666;
            text-decoration: none;
            transition: var(--transition);
            display: block;
            padding: 5px 0;
        }
        
        .modern-toc-link:hover {
            color: var(--primary-color);
        }
        
        .modern-toc-link.active {
            color: var(--primary-color);
            font-weight: 500;
        }
        
        .modern-doc-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .modern-doc-btn {
            padding: 10px 20px;
            border-radius: var(--border-radius);
            font-weight: 500;
            transition: var(--transition);
            border: 1px solid #ddd;
            background: white;
            color: #666;
        }
        
        .modern-doc-btn:hover {
            background: #f5f5f5;
            color: #333;
        }
        
        .modern-doc-btn-primary {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        
        .modern-doc-btn-primary:hover {
            background: var(--secondary-color);
            color: white;
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
                <a href="{{urlfor "AccountController.Logout"}}" class="modern-doc-btn">{{i18n .Lang "common.logout"}}</a>
                {{else}}
                <a href="{{urlfor "AccountController.Login"}}" class="mr-3">{{i18n .Lang "common.login"}}</a>
                <a href="{{urlfor "AccountController.Register"}}" class="modern-doc-btn modern-doc-btn-primary">{{i18n .Lang "common.register"}}</a>
                {{end}}
            </div>
        </div>
    </nav>

    <!-- 文档内容容器 -->
    <div class="modern-doc-container">
        <!-- 侧边栏 -->
        <aside class="modern-sidebar">
            <div class="modern-toc">
                <div class="modern-toc-title">文档目录</div>
                <ul class="modern-toc-list">
                    {{range $item := .books}}
                    <li class="modern-toc-item">
                        <a href="{{urlfor "DocumentController.Read" ":key" $item.Identify ":id" $item.DocumentId}}" 
                           class="modern-toc-link {{if eq $item.DocumentId $.document.DocumentId}}active{{end}}">
                            {{$item.DocumentName}}
                        </a>
                    </li>
                    {{end}}
                </ul>
            </div>
        </aside>

        <!-- 主内容区 -->
        <main class="modern-content">
            <article class="modern-doc-body">
                <h1 class="modern-doc-title">{{.document.DocumentName}}</h1>
                <div id="page-content">
                    {{.document.Release}}
                </div>
            </article>

            <div class="modern-doc-actions">
                {{if .document.Prev}}
                <a href="{{urlfor "DocumentController.Read" ":key" .book.Identify ":id" .document.Prev.DocumentId}}" 
                   class="modern-doc-btn">
                    <i class="fa fa-arrow-left"></i> 上一篇
                </a>
                {{else}}
                <span class="modern-doc-btn disabled"><i class="fa fa-arrow-left"></i> 上一篇</span>
                {{end}}
                
                {{if .document.Next}}
                <a href="{{urlfor "DocumentController.Read" ":key" .book.Identify ":id" .document.Next.DocumentId}}" 
                   class="modern-doc-btn">
                    下一篇 <i class="fa fa-arrow-right"></i>
                </a>
                {{else}}
                <span class="modern-doc-btn disabled">下一篇 <i class="fa fa-arrow-right"></i></span>
                {{end}}
            </div>
        </main>
    </div>

    {{template "widgets/footer.tpl" .}}
</body>
</html>