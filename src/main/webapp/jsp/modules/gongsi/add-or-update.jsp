<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑公司</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">公司管理</li>
                        <li class="breadcrumb-item active">编辑公司</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">公司信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 usernameDiv">
                                        <label>账户</label>
                                        <input style="width: 450px" id="username" name="username" class="form-control"
                                               placeholder="账户">
                                    </div>
                                    <div class="form-group col-md-6 gongsiNameDiv">
                                        <label>公司名称</label>
                                        <input style="width: 450px" id="gongsiName" name="gongsiName" class="form-control"
                                               placeholder="公司名称">
                                    </div>
                                    <div class="form-group col-md-6 hanyeTypesDiv">
                                        <label>所在行业</label>
                                        <select style="width: 450px" id="hanyeTypesSelect" name="hanyeTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 gongsiPhoneDiv">
                                        <label>联系方式</label>
                                        <input style="width: 450px" id="gongsiPhone" name="gongsiPhone" class="form-control"
                                               onchange="gongsiPhoneChickValue(this)"  placeholder="联系方式">
                                    </div>
                                    <div class="form-group col-md-6 gongsiEmailDiv">
                                        <label>邮箱</label>
                                        <input style="width: 450px" id="gongsiEmail" name="gongsiEmail" class="form-control"
                                               placeholder="邮箱">
                                    </div>
                                    <div class="form-group col-md-6 gongsiPhotoDiv">
                                        <label>营业执照展示</label>
                                        <img id="gongsiPhotoImg" src="" width="100" height="100">
                                        <input name="file" type="file" id="gongsiPhotoupload"
                                               class="form-control-file">
                                        <input name="gongsiPhoto" id="gongsiPhoto-input" type="hidden">
                                    </div>
                                    <div class="form-group  col-md-6 gongsiContentDiv">
                                        <label>公司简介</label>
                                        <input id="gongsiContentupload" name="file" type="file">
                                        <script id="gongsiContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var gongsiContentUe = UE.getEditor('gongsiContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="gongsiContent" id="gongsiContent-input">
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "gongsi";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var hanyeTypesOptions = [];
        <!-- 级联表的下拉框数组 -->

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->
        $('#gongsiPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= baseUrl + 'file/download?fileName=' + data.result.file;
                document.getElementById('gongsiPhotoImg').setAttribute('src',photoUrl);
                document.getElementById('gongsiPhoto-input').setAttribute('value',photoUrl);
            }
        });


        $('#gongsiContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('gongsiContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功,密码默认为123456';
            }
            httpJson("gongsi/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addgongsi');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                         window.location.href = "../../../index.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function hanyeTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=hanye_types", "GET", {}, (res) => {
                if(res.code == 0){
                    hanyeTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationHanyetypesSelect(){
            var hanyeTypesSelect = document.getElementById('hanyeTypesSelect');
            if(hanyeTypesSelect != null && hanyeTypesOptions != null  && hanyeTypesOptions.length > 0 ){
                for (var i = 0; i < hanyeTypesOptions.length; i++) {
                    hanyeTypesSelect.add(new Option(hanyeTypesOptions[i].indexName,hanyeTypesOptions[i].codeIndex));
                }
            }
        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var hanyeTypesSelect = document.getElementById("hanyeTypesSelect");
        if(hanyeTypesSelect != null && hanyeTypesOptions != null  && hanyeTypesOptions.length > 0 ) {
            for (var i = 0; i < hanyeTypesOptions.length; i++) {
                if (hanyeTypesOptions[i].codeIndex == ruleForm.hanyeTypes) {//下拉框value对比,如果一致就赋值汉字
                        hanyeTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.gongsiContent != null && ruleForm.gongsiContent != 'null' && ruleForm.gongsiContent != '' && $("#gongsiContentupload").length>0) {

            var gongsiContentUeditor = UE.getEditor('gongsiContentEditor');
            gongsiContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.gongsiContent != null){
                    mes = ''+ ruleForm.gongsiContent;
                    // mes = mes.replace(/\n/g, "<br>");
                }
                gongsiContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#gongsiContentupload").length>0) {
            var gongsiContentEditor = UE.getEditor('gongsiContentEditor');
            if (gongsiContentEditor.hasContents()) {
                $('#gongsiContent-input').attr('value', gongsiContentEditor.getContent());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function gongsiPhoneChickValue(e){
            var this_val = e.value || 0;
            var reg=/^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("手机号不正确");
                return false;
            }
        }
        function gongsiDeleteChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addgongsi');
    4
        window.location.href = "../../../index.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                username: "required",
                password: "required",
                gongsiName: "required",
                hanyeTypes: "required",
                gongsiPhone: "required",
                gongsiEmail: "required",
                gongsiPhoto: "required",
                gongsiContent: "required",
            },
            messages: {
                username: "账户不能为空",
                password: "密码不能为空",
                gongsiName: "公司名称不能为空",
                hanyeTypes: "所在行业不能为空",
                gongsiPhone: "联系方式不能为空",
                gongsiEmail: "邮箱不能为空",
                gongsiPhoto: "营业执照展示不能为空",
                gongsiContent: "公司简介不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addgongsi = window.sessionStorage.getItem("addgongsi");
        if (addgongsi != null && addgongsi != "" && addgongsi != "null") {
            //注册表单验证
            $(validform());

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("gongsi/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
    }


    function dataBind() {


    <!--  级联表的数据回显  -->


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#username").val(ruleForm.username);
        $("#password").val(ruleForm.password);
        $("#gongsiName").val(ruleForm.gongsiName);
        $("#gongsiPhone").val(ruleForm.gongsiPhone);
        $("#gongsiEmail").val(ruleForm.gongsiEmail);
        $("#gongsiContent").val(ruleForm.gongsiContent);

    }
    <!--  级联表的数据回显  -->

    //图片显示
    function showImg() {
        <!--  当前表的图片  -->
        $("#gongsiPhotoImg").attr("src",ruleForm.gongsiPhoto);

        <!--  级联表的图片  -->
    }


    <!--  级联表的图片  -->


    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
    }


    <!--  级联表的视频  -->



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            hanyeTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationHanyetypesSelect();
            <!--  初始化级联表的下拉框  -->

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addgongsi');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '学生') {
            // $(".aaaaaa").remove();
            $(".xuesheng").remove();//删除当前用户的信息
        }
		else if (window.sessionStorage.getItem('role') == '公司') {
            // $(".aaaaaa").remove();
            $(".gongsi").remove();//删除当前用户的信息
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
