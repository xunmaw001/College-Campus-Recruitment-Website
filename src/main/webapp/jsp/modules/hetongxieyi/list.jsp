<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <!-- layui -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<style>

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
                        <h3 class="block-title">合同协议管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">合同协议管理</li>
                            <li class="breadcrumb-item active">合同协议列表</li>
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
                            <h3 class="widget-title">合同协议列表</h3>
                            <div class="table-responsive mb-3">
                                <div class="col-sm-12">
                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        协议编号
                                        <div class="layui-input-inline">
                                            <input type="text" id="hetongxieyiUuidNumberSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="协议编号" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                             
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        协议标题
                                        <div class="layui-input-inline">
                                            <input type="text" id="hetongxieyiBiaotiSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="协议标题" aria-controls="tableId">
                                        </div>
                                    </div>
                                     
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        协议类型
                                        <div class="layui-input-inline">
                                            <select name="hetongxieyiTypesSelectSearch"  style="width: 150px;" id="hetongxieyiTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </div>
                                    </div>
                                                                                                                                                                                    
                                                                                                         
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        学生姓名
                                        <div class="layui-input-inline">
                                            <input type="text" id="xueshengNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="学生姓名" aria-controls="tableId">
                                        </div>
                                    </div>
                                                                                                                                                                                                                 
                                                     
                                                                                                                                                                                                                 
                                    <div class="layui-inline" style="margin-bottom: 10px;">
                                        公司名称
                                        <div class="layui-input-inline">
                                            <input type="text" id="gongsiNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="公司名称" aria-controls="tableId">
                                        </div>
                                    </div>
                                                     
                                                                                                                                                                                                                                                                                                                        
                                    <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                                        <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="graph()" type="button" class="btn btn-primary 报表">报表</button>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                    </div>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th >学生姓名</th>
                                        <th >学生手机号</th>
                                        <th >学生头像</th>
                                        <th >公司名称</th>
                                        <th >联系方式</th>
                                        <th >营业执照展示</th>
                                        <th>协议编号</th>
                                        <th>协议标题</th>
                                        <th>协议类型</th>
                                        <th>协议文件</th>
                                        <th>协议签订时间</th>
                                        <th>记录时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3">
                                    <div class="dataTables_length" id="tableId_length">

                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                                onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        条 每页

                                    </div>
                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                                        </li>

                                        <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                            <a class="page-link" href="#">下一页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
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
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var tableName = "hetongxieyi";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = '';
        var sortOrder = '';
        var ids = [];
        var checkAll = false;

        <!-- 级联表的级联字典表 -->
        var jiuyeTypesOptions = [];
        var xueyuanTypesOptions = [];
        var hanyeTypesOptions = [];

        <!-- 本表的级联字段表 -->
        var hetongxieyiTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //学生姓名
            var xueshengNameSearchInput = $('#xueshengNameSearch');
            if( xueshengNameSearchInput != null){
                if (xueshengNameSearchInput.val() != null && xueshengNameSearchInput.val() != '') {
                    searchForm.xueshengName = $('#xueshengNameSearch').val();
                }
            }
                                                                                 
            var jiuyeTypesSelectSearchInput = document.getElementById("jiuyeTypesSelectSearch");
            if(jiuyeTypesSelectSearchInput != null){
                var jiuyeTypesIndex = jiuyeTypesSelectSearchInput.selectedIndex;
                if( jiuyeTypesIndex  != 0){
                    searchForm.jiuyeTypes = document.getElementById("jiuyeTypesSelectSearch").options[jiuyeTypesIndex].value;
                }
            }
                     
            var xueyuanTypesSelectSearchInput = document.getElementById("xueyuanTypesSelectSearch");
            if(xueyuanTypesSelectSearchInput != null){
                var xueyuanTypesIndex = xueyuanTypesSelectSearchInput.selectedIndex;
                if( xueyuanTypesIndex  != 0){
                    searchForm.xueyuanTypes = document.getElementById("xueyuanTypesSelectSearch").options[xueyuanTypesIndex].value;
                }
            }
                                                                                 
                            //公司名称
            var gongsiNameSearchInput = $('#gongsiNameSearch');
            if( gongsiNameSearchInput != null){
                if (gongsiNameSearchInput.val() != null && gongsiNameSearchInput.val() != '') {
                    searchForm.gongsiName = $('#gongsiNameSearch').val();
                }
            }
                     
            var hanyeTypesSelectSearchInput = document.getElementById("hanyeTypesSelectSearch");
            if(hanyeTypesSelectSearchInput != null){
                var hanyeTypesIndex = hanyeTypesSelectSearchInput.selectedIndex;
                if( hanyeTypesIndex  != 0){
                    searchForm.hanyeTypes = document.getElementById("hanyeTypesSelectSearch").options[hanyeTypesIndex].value;
                }
            }
                                                                                                                            <!-- 本表的查询条件 -->

         
            //协议编号
            var hetongxieyiUuidNumberSearchInput = $('#hetongxieyiUuidNumberSearch');
            if( hetongxieyiUuidNumberSearchInput != null){
                if (hetongxieyiUuidNumberSearchInput.val() != null && hetongxieyiUuidNumberSearchInput.val() != '') {
                    searchForm.hetongxieyiUuidNumber = $('#hetongxieyiUuidNumberSearch').val();
                }
            }
             
            //协议标题
            var hetongxieyiBiaotiSearchInput = $('#hetongxieyiBiaotiSearch');
            if( hetongxieyiBiaotiSearchInput != null){
                if (hetongxieyiBiaotiSearchInput.val() != null && hetongxieyiBiaotiSearchInput.val() != '') {
                    searchForm.hetongxieyiBiaoti = $('#hetongxieyiBiaotiSearch').val();
                }
            }
     
                //协议类型
            var hetongxieyiTypesSelectSearchInput = document.getElementById("hetongxieyiTypesSelectSearch");
            if(hetongxieyiTypesSelectSearchInput != null){
                var hetongxieyiTypesIndex = hetongxieyiTypesSelectSearchInput.selectedIndex;
                if( hetongxieyiTypesIndex  != 0){
                    searchForm.hetongxieyiTypes= document.getElementById("hetongxieyiTypesSelectSearch").options[hetongxieyiTypesIndex].value;
                }
            }
                                getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("hetongxieyi/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,
                order: sortOrder,
                hetongxieyiDelete: 1,
                //本表的
                hetongxieyiUuidNumber: searchForm.hetongxieyiUuidNumber,
                hetongxieyiBiaoti: searchForm.hetongxieyiBiaoti,
                hetongxieyiTypes: searchForm.hetongxieyiTypes,
            //级联表的
                xueshengName: searchForm.xueshengName,
                jiuyeTypes: searchForm.jiuyeTypes,
                xueyuanTypes: searchForm.xueyuanTypes,

                gongsiName: searchForm.gongsiName,
                hanyeTypes: searchForm.hanyeTypes,


            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行 
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


                    //学生姓名
            var xueshengNameCell = document.createElement('td');
            xueshengNameCell.innerHTML = item.xueshengName;
            row.appendChild(xueshengNameCell);


                    //学生手机号
            var xueshengPhoneCell = document.createElement('td');
            xueshengPhoneCell.innerHTML = item.xueshengPhone;
            row.appendChild(xueshengPhoneCell);


                //学生头像
            var xueshengPhotoCell = document.createElement('td');
            var xueshengPhotoImg = document.createElement('img');
            var xueshengPhotoImgValue = item.xueshengPhoto;
            if(xueshengPhotoImgValue !=null && xueshengPhotoImgValue !='' && xueshengPhotoImgValue !='null'){
                    xueshengPhotoImg.setAttribute('src', xueshengPhotoImgValue);
                    xueshengPhotoImg.setAttribute('height', 100);
                    xueshengPhotoImg.setAttribute('width', 100);
                    xueshengPhotoCell.appendChild(xueshengPhotoImg);
            }else{
                    xueshengPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(xueshengPhotoCell);


                    //公司名称
            var gongsiNameCell = document.createElement('td');
            gongsiNameCell.innerHTML = item.gongsiName;
            row.appendChild(gongsiNameCell);


                    //联系方式
            var gongsiPhoneCell = document.createElement('td');
            gongsiPhoneCell.innerHTML = item.gongsiPhone;
            row.appendChild(gongsiPhoneCell);


                //营业执照展示
            var gongsiPhotoCell = document.createElement('td');
            var gongsiPhotoImg = document.createElement('img');
            var gongsiPhotoImgValue = item.gongsiPhoto;
            if(gongsiPhotoImgValue !=null && gongsiPhotoImgValue !='' && gongsiPhotoImgValue !='null'){
                    gongsiPhotoImg.setAttribute('src', gongsiPhotoImgValue);
                    gongsiPhotoImg.setAttribute('height', 100);
                    gongsiPhotoImg.setAttribute('width', 100);
                    gongsiPhotoCell.appendChild(gongsiPhotoImg);
            }else{
                    gongsiPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(gongsiPhotoCell);


            //协议编号
            var hetongxieyiUuidNumberCell = document.createElement('td');
            hetongxieyiUuidNumberCell.innerHTML = item.hetongxieyiUuidNumber;
            row.appendChild(hetongxieyiUuidNumberCell);


            //协议标题
            var hetongxieyiBiaotiCell = document.createElement('td');
            hetongxieyiBiaotiCell.innerHTML = item.hetongxieyiBiaoti;
            row.appendChild(hetongxieyiBiaotiCell);


            //协议类型
            var hetongxieyiTypesCell = document.createElement('td');
            hetongxieyiTypesCell.innerHTML = item.hetongxieyiValue;
            row.appendChild(hetongxieyiTypesCell);


                //协议文件
            var hetongxieyiFileCell = document.createElement('td');
            if(item.hetongxieyiFile ==null || item.hetongxieyiFile == '' || item.hetongxieyiFile == 'null'){
                    hetongxieyiFileCell.innerHTML = '没有下载文件';
            }else {
                var hetongxieyiFileFile = document.createElement('button');
                    hetongxieyiFileFile.innerHTML = '下载';
                var hetongxieyiFileFileAttr = "download('" + item.hetongxieyiFile + "')"
                    hetongxieyiFileFile.setAttribute('onclick',hetongxieyiFileFileAttr);
                    hetongxieyiFileCell.appendChild(hetongxieyiFileFile);
            }
            row.appendChild(hetongxieyiFileCell);


            //协议签订时间
            var qiandingTimeCell = document.createElement('td');
            qiandingTimeCell.innerHTML = item.qiandingTime;
            row.appendChild(qiandingTimeCell);


            //记录时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);


            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }


        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(url);
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                alert('请输入正确的页码');
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                alert('请勾选要删除的记录');
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("hetongxieyi/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        alert('删除成功');
                    }
                });
            } else {
                alert("已取消操作");
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addhetongxieyi", "addhetongxieyi");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'hetongxieyi.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框
                                         
                                                                                 
        function jiuyeTypesSelectSearch() {
            var jiuyeTypesSelectSearch = document.getElementById('jiuyeTypesSelectSearch');
            if(jiuyeTypesSelectSearch != null) {
                jiuyeTypesSelectSearch.add(new Option('-请选择-',''));
                if (jiuyeTypesOptions != null && jiuyeTypesOptions.length > 0){
                    for (var i = 0; i < jiuyeTypesOptions.length; i++) {
                            jiuyeTypesSelectSearch.add(new Option(jiuyeTypesOptions[i].indexName, jiuyeTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
        function xueyuanTypesSelectSearch() {
            var xueyuanTypesSelectSearch = document.getElementById('xueyuanTypesSelectSearch');
            if(xueyuanTypesSelectSearch != null) {
                xueyuanTypesSelectSearch.add(new Option('-请选择-',''));
                if (xueyuanTypesOptions != null && xueyuanTypesOptions.length > 0){
                    for (var i = 0; i < xueyuanTypesOptions.length; i++) {
                            xueyuanTypesSelectSearch.add(new Option(xueyuanTypesOptions[i].indexName, xueyuanTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                                                                                 
                     
        function hanyeTypesSelectSearch() {
            var hanyeTypesSelectSearch = document.getElementById('hanyeTypesSelectSearch');
            if(hanyeTypesSelectSearch != null) {
                hanyeTypesSelectSearch.add(new Option('-请选择-',''));
                if (hanyeTypesOptions != null && hanyeTypesOptions.length > 0){
                    for (var i = 0; i < hanyeTypesOptions.length; i++) {
                            hanyeTypesSelectSearch.add(new Option(hanyeTypesOptions[i].indexName, hanyeTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                                                                                                                        
    //填充本表搜索下拉框
         
             
     
        function hetongxieyiTypesSelectSearch() {
            var hetongxieyiTypesSelectSearch = document.getElementById('hetongxieyiTypesSelectSearch');
            if(hetongxieyiTypesSelectSearch != null) {
                hetongxieyiTypesSelectSearch.add(new Option('-请选择-',''));
                if (hetongxieyiTypesOptions != null && hetongxieyiTypesOptions.length > 0){
                    for (var i = 0; i < hetongxieyiTypesOptions.length; i++) {
                            hetongxieyiTypesSelectSearch.add(new Option(hetongxieyiTypesOptions[i].indexName,hetongxieyiTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                    
    //查询级联表搜索条件所有列表
            function jiuyeTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=jiuye_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        jiuyeTypesOptions = res.data.list;
                    }
                });
            }
            function xueyuanTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=xueyuan_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        xueyuanTypesOptions = res.data.list;
                    }
                });
            }
            function hanyeTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=hanye_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        hanyeTypesOptions = res.data.list;
                    }
                });
            }

    //查询当前表搜索条件所有列表
            function hetongxieyiTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=hetongxieyi_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        hetongxieyiTypesOptions = res.data.list;
                    }
                });
            }












        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            //查询级联表的搜索下拉框
            jiuyeTypesSelect();
            xueyuanTypesSelect();
            hanyeTypesSelect();

            //查询当前表的搜索下拉框
            hetongxieyiTypesSelect();
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                                                                 
            jiuyeTypesSelectSearch();
                         
            xueyuanTypesSelectSearch();
                                                                                                 
                         
            hanyeTypesSelectSearch();
                                                                                                                                                
        //当前表的下拉框赋值
                         
                                     
             
            hetongxieyiTypesSelectSearch();
                                                            
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
