<!DOCTYPE html>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>码神学堂管理后台</title>
    <meta name="description" content="中小学题库大全">
    <meta name="keywords" content="中小学题库大全">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../plugins/elementui/index.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <style type="text/css">
    .el-main{
        position: absolute;
        top: 70px;
        bottom: 0px;
        left: 200px;
        right: 10px;
        padding: 0;
    }
    </style>
</head>
<body class="hold-transition skin-purple sidebar-mini">
    <div id="app">

        <el-container>

            <el-header  class="main-header" style="height:70px;">
                <nav class="navbar navbar-static-top" :class=''>
                    <!-- Logo -->
                    <a href="#" class="logo" style="text-align:center">
                        <span class="logo-lg">码神学堂管理后台</span>
                    </a>
                    <div class="right-menu">
                        <span class="help"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>帮助</span>
                        <el-dropdown class="avatar-container right-menu-item" trigger="click">
                            <div class="avatar-wrapper">
                                <img src="../img/head_img.png" class="user-avatar">
                                {{username}}
                            </div>
                            <el-dropdown-menu slot="dropdown">
                                <el-dropdown-item divided>
                                    <span style="display:block;">修改密码</span>
                                </el-dropdown-item>
                                <el-dropdown-item divided>
                                        <a href="/lzadmin/logout"><span style="display:block;">退出</span></a>
                                    </el-dropdown-item>
                            </el-dropdown-menu>
                        </el-dropdown>
                    </div>
                </nav>
            </el-header>

            <el-container>

                <el-aside width="200px">
                    <el-menu>
                        <!--vue的v-for循环-->
                        <el-submenu v-for="menu in menuList" :index="menu.path">
                            <template slot="title">
                                <i class="fa" :class="menu.icon"></i>
                                {{menu.title}}
                            </template>
                            <template v-for="child in menu.children">
                                <el-menu-item :index="child.path">
                                    <a :href="child.linkUrl" target="right">{{child.title}}</a>
                                </el-menu-item>
                            </template>
                        </el-submenu>
                    </el-menu>
                </el-aside>

                <el-container>
                    <iframe name="right" class="el-main" src="topic.html" width="100%" height="800px" frameborder="0"></iframe>
                </el-container>

            </el-container>

        </el-container>
    </div>
</body>
<!-- 引入组件库 -->
<script src="../js/vue.js"></script>
<script src="../plugins/elementui/index.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../js/axios-0.18.0.js"></script>
<script>
    new Vue({
            el: '#app',
            method:{

            },
        created:function () {
            axios.post("/lzadmin/user/userInfo").then((res)=>{
                this.username = res.data.result;
            });
            axios.post("/lzadmin/user/menu/userMenuList").then((res)=>{
                this.menuList = res.data.result;
            })
        },
        data:{
            username:"",
            menuList:[
                {
                    "path": "1",
                    "title": "内容管理",
                    "icon":"fa-user-md",
                    "children": [
                        {
                            "path": "/1-1",
                            "title": "题库管理",
                            "linkUrl":"topic.html",
                            "children":[]
                        },
                        {
                            "path": "/1-2",
                            "title": "学科管理",
                            "linkUrl":"subject.html",
                            "children":[]
                        },
                        {
                            "path": "/1-3",
                            "title": "课程管理",
                            "linkUrl":"course.html",
                            "children":[]
                        },
                    ]
                },
                {
                    "path": "2",
                    "title": "订单管理",
                    "icon":"fa-tty",
                    "children": [
                        {
                            "path": "/2-1",
                            "title": "订单管理",
                            "linkUrl":"order.html",
                            "children":[]
                        },
                        {
                            "path": "/2-2",
                            "title": "邀请信息",
                            "linkUrl":"invite.html",
                            "children":[]
                        },
                    ]
                },

                {
                    "path": "3",
                    "title": "网站管理",
                    "icon":"fa-tty",
                    "children": [
                        {
                            "path": "/3-2",
                            "title": "新闻管理",
                            "linkUrl":"news.html",
                            "children":[]
                        },
                        {
                            "path": "/3-3",
                            "title": "案例管理",
                            "linkUrl":"case.html",
                            "children":[]
                        },
                    ]
                },
                {
                    "path": "4",
                    "title": "营销管理",
                    "icon":"fa-tty",
                    "children": [
                        {
                            "path": "/4-1",
                            "title": "海报管理",
                            "linkUrl":"bill.html",
                            "children":[]
                        },
                        {
                            "path": "/4-2",
                            "title": "优惠券管理",
                            "linkUrl":"coupon.html",
                            "children":[]
                        },
                        {
                            "path": "/4-3",
                            "title": "用户管理",
                            "linkUrl":"user.html",
                            "children":[]
                        },
                    ]
                },
                {
                    "path": "5",
                    "title": "系统管理",
                    "icon":"fa-tty",
                    "children": [
                        {
                            "path": "/5-1",
                            "title": "角色管理",
                            "linkUrl":"role.html",
                            "children":[]
                        },
                        {
                            "path": "/5-2",
                            "title": "权限管理",
                            "linkUrl":"permission.html",
                            "children":[]
                        },
                        {
                            "path": "/5-3",
                            "title": "用户管理",
                            "linkUrl":"user.html",
                            "children":[]
                        },
                        {
                            "path": "/5-4",
                            "title": "菜单管理",
                            "linkUrl":"menu.html",
                            "children":[]
                        },
                    ]
                }
            ]
        }
    });
    $(function() {
            var wd = 200;
            $(".el-main").css('width', $('body').width() - wd + 'px');
    });
</script>
</html>
