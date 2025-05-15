<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>首页 - Powered by 牧牛火链学习网</title>

    <!-- Bootstrap -->
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <link href="/static/css/main.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="/static/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .hero-section {
            background-color: #f8f9fa; /* Light background */
            padding: 100px 0; /* Increased padding */
            text-align: center;
            margin-bottom: 40px; /* Increased margin */
        }
        .hero-section h1 {
            color: #333;
            font-size: 3.5em; /* Larger font size */
            margin-bottom: 25px; /* Increased margin */
        }
        .hero-section p {
            color: #666;
            font-size: 1.3em; /* Larger font size */
            margin-bottom: 40px; /* Increased margin */
        }
        .feature-section {
            padding: 50px 0; /* Increased padding */
            text-align: center;
            background-color: #fff; /* White background */
        }
        .feature-item {
            margin-bottom: 40px; /* Increased margin */
        }
        .feature-item h3 {
            margin-top: 15px; /* Added margin */
            color: #333;
        }
        .recent-content-section {
            padding: 50px 0;
            background-color: #f1f1f1; /* Slightly darker background */
        }
        .recent-content-item {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: left;
            box-shadow: 0 2px 4px rgba(0,0,0,.05);
        }
        .recent-content-item h4 {
            margin-top: 0;
            color: #333;
        }
        .recent-content-item p {
            color: #666;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<div class="manual-reader">
    {{template "widgets/header.tpl" .}}
    <div class="container manual-body">
        <div class="hero-section">
            <div class="container">
                <h1>欢迎来到 牧牛火链 学习网站</h1>
                <p>一个简单易用的学习平台</p>
                <p>
                    <a href="/projects" class="btn btn-primary btn-lg">探索项目</a>
                    <a href="/blogs" class="btn btn-secondary btn-lg">阅读最新文章</a>
                </p>
            </div>
        </div>

        <div class="feature-section">
            <div class="container">
                <h2 class="text-center" style="margin-bottom: 40px;">核心功能</h2>
                <div class="row">
                    <div class="col-md-4 feature-item">
                        <i class="fa fa-book fa-5x" style="color: #007bff;"></i>
                        <h3>项目管理</h3>
                        <p>轻松创建、组织和管理您的文档项目，支持多种格式。</p>
                    </div>
                    <div class="col-md-4 feature-item">
                        <i class="fa fa-file-text-o fa-5x" style="color: #28a745;"></i>
                        <h3>文章发布</h3>
                        <p>发布技术文章、博客或知识分享，支持富文本和Markdown编辑器。</p>
                    </div>
                    <div class="col-md-4 feature-item">
                        <i class="fa fa-users fa-5x" style="color: #ffc107;"></i>
                        <h3>团队协作</h3>
                        <p>与团队成员共同编辑和维护文档，提升协作效率。</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="recent-content-section">
            <div class="container">
                <h2 class="text-center" style="margin-bottom: 40px;">最新内容</h2>
                <div class="row">
                    {{/* Placeholder for recent projects or articles */}}
                    <div class="col-md-6">
                        <div class="recent-content-item">
                            <h4><a href="#">最新项目标题</a></h4>
                            <p>项目简介或最新更新摘要...</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="recent-content-item">
                            <h4><a href="#">最新文章标题</a></h4>
                            <p>文章摘要或部分内容...</p>
                        </div>
                    </div>
                    {{/* Add more items as needed */}}
                </div>
            </div>
        </div>

        {{/* Assuming the base template or header includes the footer */}}

    </div>
</div>
<script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}"></script>
<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}"></script>
</body>
</html>