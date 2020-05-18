<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/tag.jsp" %>
<!DOCTYPE html>
<html lang="en－zh" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="shu">
    <meta name="Description" content="高温合金机器学习平台"/>

    <script type="text/javascript" src="${ctx}/static/static/js/jquery-2.1.4.js"></script><!-- 你必须先引入jQuery1.8或以上版本 -->
    <script type="text/javascript" src="pdfobject.js"></script>
    <%--<script type="text/javascript" src="${ctx}/static/static/layui/layui.js"></script>--%>
    <%@include file="/WEB-INF/common/head.jsp" %>
    <title>高温合金机器学习平台</title>

    <%@include file="/WEB-INF/common/dataUploadJsScript.jsp" %>
    <script type="text/javascript" src="${ctx}/layer/layer.js"></script>

    <style>
        nav {
            height: 33px
        }

        .my-nav > ul > li.current > a {
            font-weight: 600;
            width: 139px;
            background-image: url(${ctx}/pic/navIn.png);
            background-size: 139px 34px;
            background-repeat: no-repeat
        }

        .my-nav > ul > li > a {
            font-weight: 600;
            width: 139px;
            background-image: url(${ctx}/pic/navUnin.png);
            background-size: 139px 34px;
            background-repeat: no-repeat
        }
    </style>

    <!-- 开发环境版本，包含了有帮助的命令行警告 -->
    <script src="vue.js"></script>
    <script src="axios.min.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="index.css">
    <!-- 引入组件库 -->
    <script src="index.js"></script>

</head>
<!-- hijacking: on/off - animation: none/scaleDown/rotate/gallery/catch/opacity/fixed/parallax -->

<body data-hijacking="off" data-animation="rotate" style="background-color: rgb(242,242,242)">


<header class="navbar-wrapper navbar-fixed-top">
    <div class="navbar navbar-black " style="background-image:  url(${ctx}/pic/head.jpg); ">
        <div class="container cl" style="height:120px;">
            <div class="col-sm-5" style="text-align: center;">
                <img src="${ctx}/pic/logo_03.png"
                     style="width: 100%; height: auto;max-width: 100%; display: block;padding-top: 10px">
            </div>
            <div class="col-sm-7">
                <div style="height: 87px"></div>
                <nav class="nav navbar-nav nav-collapse my-nav" role="navigation" id="Hui-navbar">
                    <ul class="cl" style="margin: 0px;padding: 0px">
                        <li><a href="${ctx}/page/index" style=";color: rgb(117,117,117)">首页</a></li>
                        <%--<shiro:user>--%>
                        <li class="current"><a>机器学习</a></li>
                        <%--<li><a href="${ctx}/page/attributeCalc">属性计算</a></li>--%>
                        <%--</shiro:user>--%>
                        <li><a href="${ctx}/page/data_Relation" style="color: rgb(117,117,117);">数据关联图</a></li>
                        <li><a href="#" style=";color: rgb(117,117,117)">关于我们</a></li>
                    </ul>
                </nav>
                <nav class="nav navbar-nav nav-collapse f-r" role="navigation">
                    <shiro:user>
                        <ul class="cl" style="margin: 0px;padding: 0px">
                            <li><span class="logo navbar-slogan f-l mr-10 hidden-xs">账号 : <shiro:principal
                                    type="java.lang.String"/></span></li>
                            <li><a href="${ctx}/admin/logout">注销</a></li>
                        </ul>
                    </shiro:user>
                    <shiro:guest>
                        <ul class="cl" style="margin: 0px;padding: 0px">
                            <li><a href="${ctx}/page/loginPage">登录</a></li>
                            <li><a href="${ctx}/page/registerPage">注册</a></li>
                        </ul>
                    </shiro:guest>


                </nav>
            </div>

        </div>
    </div>
    <style>
        .w100 .th-inner {
            width: 100px;
        }

        .panel-title > p {
            margin: 0px;
        }
    </style>
</header>
<shiro:hasRole name="common">

    <section class="cd-section visible" style="padding-top: 100px">

        <div style="padding-top: 40px">
            <div class="container" style="margin-top: 20px;">

                <div class="panel-group" id="accordion">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <p data-toggle="collapse" data-parent="#accordion" style="color: white">
                                        <%--href="#collapseTwo">--%>数据上传</p>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul id="myTab" class="nav nav-tabs">
                                        <%--<li class="active"> 根据这个active属性，设置默认选中的内容--%>
                                    <li class="active">
                                        <a href="#data" data-toggle="tab">
                                            数据
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#calc" data-toggle="tab">
                                            计算方法
                                        </a>
                                    </li>
                                    <li><a href="#literature" data-toggle="tab" id="dianji">文献</a></li>
                                        <%--                                    <li>--%>
                                        <%--                                        <a href="#patent" data-toggle="tab">专利</a>--%>
                                        <%--                                    </li>--%>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="data">
                                        <div class="row clearfix">

                                            <div class="col-sm-2">
                                                <ul class="nav nav-pills nav-stacked">
                                                    <li id="dataContentLi" class="active"><a>数据集内容信息</a></li>
                                                    <li id="dataUserLi"><a>数据用户信息</a></li>
                                                    <li id="dataContactLi"><a>数据来源信息</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-10">
                                                <ul id="data_tab" class="nav nav-tabs" style="display:none;">
                                                    <li class="active">
                                                        <a id="dataContentA" href="#dataContent" data-toggle="tab">
                                                            数据集内容信息
                                                        </a>
                                                    </li>
                                                    <li><a id="dataUserA" href="#dataUser" data-toggle="tab">数据用户信息</a>
                                                    </li>
                                                    <li><a id="dataContactA" href="#dataContact" data-toggle="tab">数据来源信息</a>
                                                    </li>

                                                </ul>
                                                <div id="data_tab_content" class="tab-content">
                                                    <div class="tab-pane fade in active" id="dataContent">
                                                        <div class="row clearfix">
                                                            <form id="data_form1">
                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">数据摘要</label>
                                                                    <div class="form-group col-md-8">
                                                                        <input type="text"
                                                                               class="form-control validate[maxSize[255]] "
                                                                               placeholder="数据摘要" id="dAbstract">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">样本数</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input type="text" value="5"
                                                                               class="form-control validate[required] validate[custom[number]] validate[maxSize[10]]"
                                                                               placeholder="m" id="dSizeM">
                                                                    </div>
                                                                    <label class="col-sm-2 control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">维度</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input value="5" type="text"
                                                                               class="form-control validate[required] validate[custom[number]] validate[maxSize[10]]"
                                                                               placeholder="n" id="dSizeN">
                                                                    </div>

                                                                </div>
                                                                <div class="row">

                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">关键词</label>
                                                                    <div class="form-group col-md-8">
                                                                        <input value="高温合金" type="text"
                                                                               class="form-control validate[required] validate[maxSize[255]] 	"
                                                                               placeholder="关键词(多条用';'分隔)"
                                                                               id="dkeywords">
                                                                    </div>

                                                                </div>

                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">数据领域类型</label>
                                                                    <div class="form-group col-md-3">
                                                                        <span class="select-box radius mt-20"
                                                                              style="margin: 0px">
                                                                            <select id="domainType" class="select"
                                                                                    size="1" name="demo2">
                                                                                <option id="sa" value="sa" selected>高温合金数据</option>
                                                                                <option id="li-lon"
                                                                                        value="li-lon">锂电池数据</option>
                                                                                <option id="gw"
                                                                                        value="gw">引力波数据</option>
                                                                                <option id="domainOther" value="other">其他数据</option>

                                                                            </select>
                                                                        </span>
                                                                    </div>
                                                                    <label class="col-sm-2 control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">方向类型</label>
                                                                    <div class="form-group col-md-3">
                                                                          <span class="select-box radius mt-20"
                                                                                style="margin: 0px">
                                                                            <select id="areaType" class="select"
                                                                                    size="1" name="demo2">
                                                                                <option id="cp1" value="cp1"
                                                                                        selected>蠕变</option>
                                                                                <option id="d2" value="d2">扩散</option>
                                                                                <option id="tdp3"
                                                                                        value="tdp3">热力学性能</option>
                                                                                <option id="mp4"
                                                                                        value="mp4">力学(弹性)性能</option>
                                                                                <option id="areaOther"
                                                                                        value="other">其他</option>

                                                                            </select>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">文件上传</label>
                                                                    <div class="formControls col-md-8">
                                                                        <span class="btn-upload form-group"
                                                                              style="margin: 0px;">

                                                                            <input class="input-text upload-url radius validate[required] validate[custom[originDataUpload]]"
                                                                                   data-prompt-position="inline"
                                                                                   type="text" id="uploadfile-2"
                                                                            >
                                                                                    <a href=""
                                                                                       class="btn btn-success radius upload-btn"
                                                                                       style="color: white; padding: 0px;border: 0px">
                                                                                    <div style="width: 120px;height: 31px;
                                                                                            ;background-image:  url(${ctx}/pic/search_04.png);background-size:120px 31px ;background-repeat: no-repeat"></div>
                                                                                </a>
                                                                            <input type="file" multiple
                                                                                   name="duploadfile" class="input-file"
                                                                                   name="duploadfile" id="duploadfile">

                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <label class="col-sm-offset-2 control-label"
                                                                           style="text-align: center; padding-left: 10px">（仅支持.xls、.xlsx、.cif、.vasp文件）</label>

                                                                </div>

                                                            </form>
                                                            <div class="row ">
                                                                <div class="formControls col-sm-offset-2 col-sm-2">

                                                                </div>

                                                                <div class="formControls  col-sm-2"
                                                                     style="padding-left: 15px">

                                                                    <button type="button" class="btn btn-success "
                                                                            id="dataNextButton1"
                                                                            style="height: 45px;text-align: center;padding-top: 10px">
                                                                        下一步 >
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="dataUser">
                                                        <div class="row clearfix">
                                                            <form id="data_form2">
                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">提交者</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input type="text"
                                                                               class="form-control validate[required] validate[maxSize[255]]"
                                                                               placeholder="提交者" id="dSubmissionName">
                                                                    </div>
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">所在单位</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input type="text"
                                                                               class="form-control validate[required] validate[maxSize[255]]"
                                                                               placeholder="所在单位" id="dSubmissionUnit">
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">校对者</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input type="text"
                                                                               class="form-control validate[maxSize[255]]"
                                                                               placeholder="校对者" id="dProofreader">
                                                                    </div>

                                                                </div>

                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">邮箱</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input value="528241661@qq.com" type="text"
                                                                               class="form-control validate[required] validate[maxSize[255]] validate[custom[email]]"
                                                                               placeholder="邮箱" id="email">
                                                                    </div>
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">电话</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input value="18321322337" type="text"
                                                                               class="form-control validate[required] validate[maxSize[255]] validate[custom[phone]]"
                                                                               placeholder="电话" id="telephone">
                                                                    </div>

                                                                </div>

                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">通讯地址</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input type="text"
                                                                               class="form-control validate[required] validate[maxSize[255]]"
                                                                               placeholder="通讯地址" id="contactAddress">
                                                                    </div>
                                                                        <%--<label class="col-sm-2 control-label" style="text-align: center">来源信息</label>--%>
                                                                        <%--<div class="form-group col-md-3">--%>
                                                                        <%--<input type="text" class="form-control" placeholder="来源信息">--%>
                                                                        <%--</div>--%>


                                                                </div>

                                                            </form>

                                                            <div class="row ">
                                                                <div class="formControls col-sm-offset-2 col-sm-2"
                                                                     style="padding-left: 15px">
                                                                    <button type="button" class="btn btn-success "
                                                                            id="dataPreviousButton2"
                                                                            style="height: 45px;text-align: center;padding-top: 10px">
                                                                        < 上一步
                                                                    </button>
                                                                </div>
                                                                <div class="formControls  col-sm-2"
                                                                     style="padding-left: 15px">

                                                                    <button type="button" class="btn btn-success "
                                                                            id="dataNextButton2"
                                                                            style="height: 45px;text-align: center;padding-top: 10px">
                                                                        下一步 >
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="tab-pane fade" id="dataContact">
                                                        <div class="row clearfix">
                                                            <form id="data_form3">
                                                                <div class="row">
                                                                    <label class="col-sm-2  control-label"
                                                                           style="text-align: right; margin-left: 8px;dispaly: inline-block; height:35px; line-height: 35px">数据分类</label>
                                                                    <div class="form-group col-md-3"
                                                                         style="margin-left: 1px;">
                                                                        <span class="select-box radius mt-20"
                                                                              style="margin: 0px">
                                                                            <select id="div_select" class="select"
                                                                                    size="1" name="demo2">
                                                                                <option id="exper_opt" value="1"
                                                                                        selected>实验数据</option>
                                                                                <option id="calc_opt"
                                                                                        value="2">计算数据</option>
                                                                                <option id="pred_opt"
                                                                                        value="3">预测数据</option>
                                                                            </select>
                                                                        </span>
                                                                    </div>
                                                                    <label class="col-sm-2 control-label"
                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">决策属性</label>
                                                                    <div class="form-group col-md-3">
                                                                        <input type="text"
                                                                               class="form-control validate[maxSize[255]] "
                                                                               placeholder="决策属性" id="eKeyElemColumn">
                                                                    </div>
                                                                </div>
                                                            </form>

                                                            <ul id="Huifold1" class="Huifold" style="margin:0px;">
                                                                <li class="item">
                                                                    <h4 id="exper_div" style="display: none">
                                                                        实验数据<b>+</b></h4>
                                                                    <div class="info"
                                                                         style="padding: 0px; margin-left:10px">
                                                                        <form id="exp_form">
                                                                            <div class="row">
                                                                                <label class="col-sm-2 control-label"
                                                                                       style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">牌号</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]] "
                                                                                           placeholder="牌号"
                                                                                           id="eMaterialTrademark">
                                                                                </div>
                                                                                <label class="col-sm-2  control-label"
                                                                                       style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">材料名称</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="材料名称"
                                                                                           id="eMName">
                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <label class="col-sm-2 control-label"
                                                                                       style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">实验条件名称</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="实验条件名称"
                                                                                           id="expconName">
                                                                                </div>
                                                                                <label class="col-sm-2  control-label"
                                                                                       style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">实验参数设置</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="实验参数设置"
                                                                                           id="expParasetting">
                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <label class="col-sm-2 control-label"
                                                                                       style="text-align: right;padding-left: 4px; dispaly: inline-block; height:35px; line-height: 35px">实验设备名称与型号</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="实验设备名称与型号"
                                                                                           id="expDeviceName">
                                                                                </div>
                                                                                <label class="col-sm-2  control-label"
                                                                                       style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">数据来源</label>
                                                                                <div class="form-group col-md-3"
                                                                                     style="margin-left: 1px;">
                                                                        <span class="select-box radius mt-20"
                                                                              style="margin: 0px">
                                                                            <select id="div_select1" class="select"
                                                                                    size="1" name="demo2">
                                                                                <option id="exper_opt1" value="1"
                                                                                        selected>文献</option>
                                                                                <option id="calc_opt1"
                                                                                        value="2">专利</option>
                                                                                <option id="pred_opt1"
                                                                                        value="3">其他</option>
                                                                            </select>
                                                                        </span>
                                                                                </div>

                                                                            </div>
                                                                            <div class="modal fade" id="" tabindex="-1"
                                                                                 role="dialog"
                                                                                 aria-labelledby="myModalLabel"
                                                                                 aria-hidden="true">
                                                                                <div class="modal-dialog"
                                                                                     style="width: 650px">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header">
                                                                                            <button type="button"
                                                                                                    class="close"
                                                                                                    data-dismiss="modal"
                                                                                                    aria-hidden="true">
                                                                                                &times;
                                                                                            </button>
                                                                                            <h4 class="modal-title"
                                                                                                id="zuozhetitle">
                                                                                                文献关联网络</h4>
                                                                                            <button type="button"
                                                                                                    class="btn btn-default"
                                                                                                    onclick="function1()">
                                                                                                方法关联信息
                                                                                            </button>
                                                                                            <button type="button"
                                                                                                    class="btn btn-default"
                                                                                                    onclick="function2()">
                                                                                                作者关联信息
                                                                                            </button>
                                                                                            <button type="button"
                                                                                                    class="btn btn-default"
                                                                                                    onclick="function3()">
                                                                                                数据关联信息
                                                                                            </button>
                                                                                            <p><span
                                                                                                    style="color: #0e9aef">●</span>&ensp;作者&emsp;<span
                                                                                                    style="color: #e59729">●</span>&ensp;文献&emsp;
                                                                                            <p>
                                                                                                该网络涵盖的内容是：核心作者的关联文献，合作者。</p>
                                                                                        </div>
                                                                                        <div class="modal-body"
                                                                                             id="zuozheneirong">
                                                                                            <div id="zuozhe"
                                                                                                 style="width:600px;height:400px">
                                                                                                11111
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button"
                                                                                                    class="btn btn-default"
                                                                                                    data-dismiss="modal">
                                                                                                关闭
                                                                                            </button>
                                                                                        </div>
                                                                                    </div><!-- /.modal-content -->
                                                                                </div><!-- /.modal -->
                                                                            </div>
                                                                        </form>
                                                                        <div class="row ">

                                                                            <div class="formControls col-sm-offset-2 col-sm-2"
                                                                                 style="padding-left: 15px">
                                                                                <button type="button"
                                                                                        class="btn btn-success "
                                                                                        onclick="$('#dataUserA').click();$('#dataContactLi').removeClass('active');$('#dataUserLi').addClass('active')"
                                                                                        style="height: 45px;text-align: center;padding-top: 10px">
                                                                                    < 上一步
                                                                                </button>
                                                                            </div>
                                                                            <div class="formControls col-sm-2"
                                                                                 style="padding-left: 15px">

                                                                                <button type="button"
                                                                                        class="btn btn-success "
                                                                                        id="expSubmitButton"
                                                                                        style="height: 45px;text-align: center;padding-top: 10px">
                                                                                    提交 <%--$('#collapseTwo').collapse('hide');$('#collapseThree').collapse('show');--%>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="item">
                                                                    <h4 id="calc_div" style="display: none">计算数据<b>+</b>
                                                                    </h4>
                                                                    <div class="info" style="padding: 0px">
                                                                        <form id="calc_form">

                                                                            <div class="row">
                                                                                <label class="col-sm-2 control-label"
                                                                                       style="text-align: center">牌号</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]  "
                                                                                           placeholder="牌号"
                                                                                           id="cMaterialTrademark">
                                                                                </div>
                                                                                <label class="col-sm-2  control-label"
                                                                                       style="text-align: center">材料名称</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="材料名称"
                                                                                           id="cMName">
                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <label class="col-sm-2 control-label"
                                                                                       style="text-align: center">计算软件名称</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="计算软件名称"
                                                                                           id="calSoftwareName">
                                                                                </div>
                                                                                <label class="col-sm-2  control-label"
                                                                                       style="text-align: center">软件版本号</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="软件版本号"
                                                                                           id="softwareVersion">
                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <label class="col-sm-2 control-label"
                                                                                       style="text-align: center">计算公式名称</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="计算公式名称"
                                                                                           id="calFormulaName">
                                                                                </div>
                                                                                <label class="col-sm-2  control-label"
                                                                                       style="text-align: center">计算公式出处</label>
                                                                                <div class="form-group col-md-3">
                                                                                    <input type="text"
                                                                                           class="form-control validate[maxSize[255]]"
                                                                                           placeholder="计算公式出处"
                                                                                           id="calFormulaSource">
                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <label class="col-sm-2  control-label"
                                                                                       style="text-align: center">计算结果文件</label>
                                                                                <div class="formControls col-md-8">
                                                                                <span class="btn-upload form-group"
                                                                                      style="margin: 0px">

                                                                                    <input class="input-text upload-url radius validate[custom[originDataUpload]]"
                                                                                           type="text"
                                                                                           data-prompt-position="inline"
                                                                                           readonly>
                                                                                    <a href=""
                                                                                       class="btn btn-success radius upload-btn"
                                                                                       style="color: white; padding: 0px;border: 0px">
                                                                                    <div style="width: 120px;height: 31px;
                                                                                            ;background-image:  url(${ctx}/pic/search_04.png);background-size:120px 31px ;background-repeat: no-repeat"></div>
                                                                                </a>
                                                                                    <input type="file" multiple
                                                                                           name="file-1"
                                                                                           class="input-file"
                                                                                           name="uploadfile-2"
                                                                                           id="calResultFile">

                                                                                </span>

                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <label class="col-sm-offset-2 control-label"
                                                                                       style="text-align: center; padding-left: 10px">（仅支持.xls、.xlsx、.csv、.cif、.vasp文件）</label>

                                                                            </div>
                                                                        </form>

                                                                        <div class="row ">
                                                                            <div class="formControls col-sm-offset-2 col-sm-2"
                                                                                 style="padding-left: 15px">
                                                                                <button type="button"
                                                                                        class="btn btn-success "
                                                                                        id="dataPreviousButton3"
                                                                                        style="height: 45px;text-align: center;padding-top: 10px"
                                                                                >
                                                                                    < 上一步
                                                                                </button>
                                                                            </div>
                                                                            <div class="formControls col-sm-2">

                                                                                <button type="button"
                                                                                        class="btn btn-success "
                                                                                        id="calcSubmitButton"
                                                                                        style="height: 45px;text-align: center;padding-top: 10px"
                                                                                >
                                                                                    提交 <%--$('#collapseTwo').collapse('hide');$('#collapseThree').collapse('show');--%>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="item">
                                                                    <h4 id="pred_div" style="display: none">预测数据<b>+</b>
                                                                    </h4>
                                                                    <div class="info" style="padding: 0px">
                                                                        <label class="col-sm-2  control-label"
                                                                               style="text-align: right;dispaly: inline-block; height:35px; line-height: 35px">模型选择</label>
                                                                        <form id="pred_form">
                                                                            <div class="form-group col-md-8"
                                                                                 style="margin-left: 1px;">
                                                                                <span class="select-box radius mt-20"
                                                                                      style="margin: 0px">
                                                                                    <select id="model_select"
                                                                                            class="select" size="1">
                                                                                    </select>
                                                                                </span>
                                                                            </div>
                                                                        </form>

                                                                        <div class="row ">
                                                                            <div class="formControls col-sm-offset-2 col-sm-2"
                                                                                 style="padding-left: 15px">
                                                                                <button type="button"
                                                                                        class="btn btn-success "
                                                                                        id="dataPreviousButton4"
                                                                                        style="height: 45px;text-align: center;padding-top: 10px"
                                                                                >
                                                                                    < 上一步
                                                                                </button>
                                                                            </div>
                                                                            <div class="formControls col-sm-2">

                                                                                <button type="button"
                                                                                        class="btn btn-success "
                                                                                        id="predSubmitButton"
                                                                                        style="height: 45px;text-align: center;padding-top: 10px"
                                                                                >
                                                                                    提交 <%--$('#collapseTwo').collapse('hide');$('#collapseThree').collapse('show');--%>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>


                                                        </div>

                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="calc">
                                        <div class="row clearfix">
                                            <form id="algo_form">
                                                <div class="row">
                                                    <label class="col-sm-2  control-label"
                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">算法名</label>
                                                    <div class="form-group col-md-3">
                                                        <input type="text"
                                                               class="form-control  validate[required] validate[maxSize[255]] "
                                                               placeholder="算法名" id="algoName">
                                                    </div>
                                                    <label class="col-sm-2  control-label"
                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">算法领域</label>
                                                    <div class="form-group col-md-3">
                                                        <span class="select-box radius mt-20" style="margin: 0px">
                                                            <select id="cal_field" class="select" size="1" name="demo2">
                                                                <option id="ml" value="ml" selected>机器学习算法</option>
                                                                <option id="mc" value="mc">材料计算方法</option>
                                                            </select>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-2  control-label"
                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">算法描述</label>
                                                    <div class="form-group col-md-8">
                                                        <input type="text"
                                                               class="form-control validate[required] validate[maxSize[255]]"
                                                               placeholder="算法描述" id="algoAbstract">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-2  control-label"
                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">上传人</label>
                                                    <div class="form-group col-md-3">
                                                        <input type="text" class="form-control validate[maxSize[255]]"
                                                               placeholder="上传人" id="algoSubmission_name">
                                                    </div>
                                                    <label class="col-sm-2  control-label"
                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">算法类型</label>
                                                    <div class="form-group col-md-3">
                                                        <span class="select-box radius mt-20" style="margin: 0px">
                                                            <select id="algoType" class="select" size="1" name="demo2">
                                                                <option id="class" value="class" selected>分类</option>
                                                                <option id="cluster" value="cluster">聚类</option>
                                                                <option id="return" value="return">回归</option>
                                                                <option id="relation" value="relation">关联规则</option>
                                                                <option id="optimization"
                                                                        value="optimization">最优化</option>

                                                            </select>
                                                        </span>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <label class="col-sm-2  control-label"
                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">文件上传</label>
                                                    <div class="formControls col-md-8">
                                                                        <span class="btn-upload form-group"
                                                                              style="margin: 0px;">

                                                                            <input class="input-text upload-url radius validate[required]"
                                                                                   data-prompt-position="inline"
                                                                                   type="text" id="algoLocationText"
                                                                            >
                                                                                <a href=""
                                                                                   class="btn btn-success radius upload-btn"
                                                                                   style="color: white; padding: 0px;border: 0px">
                                                                                    <div style="width: 120px;height: 31px;
                                                                                            ;background-image:  url(${ctx}/pic/search_04.png);background-size:120px 31px ;background-repeat: no-repeat"></div>
                                                                                </a>
                                                                            <input type="file" multiple
                                                                                   name="duploadfile" class="input-file"
                                                                                   name="duploadfile" id="algoLocation">

                                                                        </span>
                                                    </div>
                                                </div>

                                            </form>
                                            <div class="row " style="margin-top: 20px">
                                                <div class="formControls col-sm-offset-2 col-sm-2">

                                                </div>

                                                <div class="formControls  col-sm-2" style="padding-left: 15px">

                                                    <button type="button" class="btn btn-success " id="algoSubmitButton"
                                                            style="height: 45px;text-align: center;padding-top: 10px">
                                                        提交
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="literature">
                                        <div class="row clearfix">
                                            <div class="col-sm-2">
                                                <ul class="nav nav-pills nav-stacked">
                                                    <li id="literatureContentLi" class="active"><a>文献概要信息</a></li>
                                                    <li id="literatureAttriLi"><a>文献属性信息</a></li>
                                                    <li id="literatureUpLi"><a>确认信息并上传</a></li>
                                                    <li id="literatureAnaLi"><a>文献分析</a></li>

                                                </ul>
                                            </div>
                                            <div class="col-sm-10">
                                                <ul id="literature_tab" class="nav nav-tabs" style="display: none">
                                                    <li class="active">
                                                        <a id="literatureContentA" href="#literatureContent"
                                                           data-toggle="tab">
                                                            文献内容信息
                                                        </a>
                                                    </li>
                                                    <li><a id="literatureAttriA" href="#literatureAttri"
                                                           data-toggle="tab">文献属性信息</a></li>
                                                    <li><a id="literatureUpA" href="#literatureUp" data-toggle="tab">确认信息并上传</a>
                                                    </li>
                                                    <li><a id="literatureAnaA" href="#literview"
                                                           data-toggle="tab">文献分析</a>
                                                    </li>

                                                </ul>

                                                <div id="dliterature_tab_content" class="tab-content">
                                                    <div class="tab-pane fade in active" id="literatureContent">
                                                        <div id="pdftab1" class="tab-content">
                                                            <ul id="pdftab" class="nav nav-tabs">
                                                                <li class="active">
                                                                    <a href="#literature_form1" data-toggle="tab">
                                                                        中文文献
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#literature_form11" data-toggle="tab">
                                                                        英文文献
                                                                    </a>
                                                                </li>
                                                            </ul>

                                                            <div class="tab-pane fade in active" id="literature_form1">
                                                                <div class="row clearfix">
                                                                    <form id="literature_formid1" name="literature_form"
                                                                          class="literature_form">
                                                                        <div class="row" style="margin-top: 15px;">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">标题</label>
                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" id="title"
                                                                                       class="validate[required] validate[maxSize[255]]	 form-control "
                                                                                       placeholder="标题" name="title">
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; display: inline-block; height:35px; line-height: 35px">作者/发明者</label>

                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" id="author"
                                                                                       onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"
                                                                                       class="form-control validate[required] validate[maxSize[255]]"
                                                                                       placeholder="作者(';'分隔)"
                                                                                       name="author">
                                                                            </div>

                                                                        </div>
                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; display: inline-block; height:35px; line-height: 35px">摘要</label>
                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" name="Abstract"
                                                                                       placeholder="摘要" id="lAbstract"
                                                                                       class="form-control validate[maxSize[255]]">
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">关键词</label>
                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" name="keywords"
                                                                                       class="form-control validate[maxSize[255]]"
                                                                                       placeholder="关键词(';'分隔)"
                                                                                       id="lkeywords">
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                    <div class="row ">
                                                                        <div class="formControls col-sm-offset-2 col-sm-2"></div>
                                                                        <div class="formControls  col-sm-2"
                                                                             style="padding-left: 15px">
                                                                            <button type="button"
                                                                                    class="btn btn-success "
                                                                                    id="liteNextButton1"
                                                                                    style="height: 45px;text-align: center;padding-top: 10px"
                                                                            >
                                                                                下一步 >
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="tab-pane fade" id="literature_form11">
                                                                <div class="row clearfix">
                                                                    <form id="literature_formid11"
                                                                          name="literature_form"
                                                                          class="literature_form">
                                                                        <div class="row" style="margin-top: 15px;">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; display: inline-block; height:35px; line-height: 35px">English
                                                                                Title</label>
                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" id="title1"
                                                                                       name="title"
                                                                                       onKeyUp="value=value.replace(/[\W]/g,'')"
                                                                                       class="form-control validate[required] validate[maxSize[255]]"
                                                                                       placeholder="Title">
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; display: inline-block; height:35px; line-height: 35px">Author/Inventor</label>

                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" id="author1"
                                                                                       name="author"
                                                                                       onKeyUp="value=value.replace(/[\W]/g,'')"
                                                                                       class="form-control validate[required] validate[maxSize[255]]"
                                                                                       placeholder="Author(use';'to sepseparate)">
                                                                            </div>

                                                                        </div>
                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; display: inline-block; height:35px; line-height: 35px">Summary</label>
                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" name="Abstract"
                                                                                       placeholder="Summary"
                                                                                       id="lAbstract1"
                                                                                       class="form-control validate[maxSize[255]]">
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">Keywords</label>
                                                                            <div class="form-group col-md-8">
                                                                                <input type="text" name="keywords"
                                                                                       class="form-control validate[maxSize[255]]"
                                                                                       placeholder="Keywords(use';'to sepseparate)"
                                                                                       id="lkeywords1">
                                                                            </div>
                                                                        </div>
                                                                    </form>
                                                                    <div class="row ">
                                                                        <div class="formControls col-sm-offset-2 col-sm-2"></div>
                                                                        <div class="formControls  col-sm-2"
                                                                             style="padding-left: 15px">
                                                                            <button type="button"
                                                                                    class="btn btn-success "
                                                                                    id="liteNextButton11"
                                                                                    style="height: 45px;text-align: center;padding-top: 10px"
                                                                            >
                                                                                下一步 >
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane fade" id="literatureAttri">
                                                        <div id="Attrtab" class="tab-content">
                                                            <ul id="Attrtab1" class="nav nav-tabs">
                                                                    <%--  从数据库中取出   --%>
                                                            </ul>


                                                            <div class="tab-pane fade in active" id="essay">
                                                                <div class="row clearfix">
                                                                    <form id="literature_form2"
                                                                          name="literature_form"
                                                                          class="literature_form">
                                                                            <%--                                                                                选日期--%>
                                                                        <div class="row" style="margin-top: 12px;">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; display: inline-block; height:35px; line-height: 35px">发表时间</label>
                                                                            <div class=" col-md-10">
                                                                                <input type="date" value="" name="date"
                                                                                       id="publishDate"
                                                                                       class="col-md-5"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">卷</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" name="juan"
                                                                                       class="validate[maxSize[10]]"
                                                                                       id="volume"
                                                                                       placeholder="卷">
                                                                            </div>
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">期</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" name="qi"
                                                                                       class="validate[maxSize[10]]"
                                                                                       id="issue"
                                                                                       placeholder="期">
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">DOI</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" name="DOI"
                                                                                       class="form-control validate[maxSize[255]]"
                                                                                       placeholder="DOI" id="doi">
                                                                            </div>
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: center">文献链接</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" class="form-control"
                                                                                       name="link"
                                                                                       placeholder="文献链接">
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">材料学计算方法</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" name="materialMethod"
                                                                                       class="form-control validate[maxSize[255]]"
                                                                                       placeholder="材料学计算方法"
                                                                                       id="materialMethod">
                                                                            </div>
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">机器学习计算方法</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" name="mlMethod"
                                                                                       class="form-control validate[maxSize[255]]"
                                                                                       placeholder="机器学习计算方法"
                                                                                       id="mlMethod">
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">起始页</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" name="startPage"
                                                                                       class="validate[maxSize[10]]"
                                                                                       id="startPage"
                                                                                       placeholder="起始页">
                                                                            </div>
                                                                            <label class="col-sm-2 control-label"
                                                                                   style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">终止页</label>
                                                                            <div class="form-group col-md-3">
                                                                                <input type="text" name="endPage"
                                                                                       class="fvalidate[maxSize[10]]"
                                                                                       id="endPage"
                                                                                       placeholder="终止页">
                                                                            </div>
                                                                        </div>
                                                                    </form>

                                                                    <div class="row ">
                                                                        <div class="formControls col-sm-offset-2 col-sm-2"
                                                                             style="padding-left: 15px">
                                                                            <button type="button"
                                                                                    class="btn btn-success "
                                                                                    id="litePreviousButton2"
                                                                                    style="height: 45px;text-align: center;padding-top: 10px">
                                                                                < 上一步
                                                                            </button>
                                                                        </div>
                                                                        <div class="formControls  col-sm-2"
                                                                             style="padding-left: 15px">

                                                                            <button type="button"
                                                                                    class="btn btn-success "
                                                                                    id="liteNextButton2"
                                                                                    style="height: 45px;text-align: center;padding-top: 10px">
                                                                                下一步 >
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="tab-pane fade" id="literatureUp">
                                                        <div id="Literuptab" class="tab-content">
                                                            <div class="row clearfix">
                                                                <form id="Overview1" name="Overview1"
                                                                      class="literature_form">
                                                                    <div style="margin-left: 40px">
                                                                        <dt>
                                                                            文献概要信息
                                                                        </dt>
                                                                        
                                                                        <label>
                                                                            标题：  
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovtitle" name="ovtitle">
                                                                            标题
                                                                        </label>
                                                                        <br>
                                                                        <label>
                                                                            作者/发明者：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovauthor" name="ovauthor">
                                                                            作者/发明者
                                                                        </label>
                                                                        <br>
                                                                        <label>
                                                                            摘要：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovsummary" name="ovsummary">
                                                                            摘要
                                                                        </label>
                                                                        <br>
                                                                        <label>
                                                                            关键词：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovkeywords" name="ovkeywords">
                                                                            关键词
                                                                        </label>
                                                                        <dt>
                                                                            文献属性信息
                                                                        </dt>
                                                                        <label>
                                                                            发表时间
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovdate" name="ovdate">
                                                                            发表时间
                                                                        </label>
                                                                        <br>
                                                                        <label>
                                                                            卷：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovjuan" name="ovjuan">
                                                                            卷
                                                                        </label>
                                                                        <label style="margin-left: 30px;">
                                                                            期：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovqi" name="ovqi">
                                                                            期
                                                                        </label>
                                                                        <label style="margin-left: 30px;">
                                                                            DOI：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovdoi" name="ovdoi">
                                                                            DOI
                                                                        </label>
                                                                        <br>
                                                                        <label>
                                                                            文献链接：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovlink" name="ovlink">
                                                                            文献链接
                                                                        </label>
                                                                        <br>
                                                                        <label>
                                                                            材料学计算方法：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovmaterial" name="ovmaterial">
                                                                            材料学计算方法
                                                                        </label>
                                                                        <label style="margin-left: 30px;">
                                                                            机器学习计算方法：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovmachine" name="ovmachine">
                                                                            机器学习计算方法
                                                                        </label>
                                                                        <br>
                                                                        <label>
                                                                            起始页：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovstart" name="ovstart">
                                                                            起始页
                                                                        </label>
                                                                        <label style="margin-left: 30px;">
                                                                            终止页：
                                                                        </label>
                                                                        <label ondblclick="ShowElement(this)" id="ovend" name="ovend">
                                                                            终止页
                                                                        </label>

                                                                        </div>
                                                                </form>
                                                                <button id="ovupdate" class="btn btn-success "
                                                                     style="margin-left: 40px;height: 45px;text-align: center;padding-top: 10px">更新</button>
                                                                <br>
                                                                <br>
                                                                <form id="literature_form3"
                                                                      name="literature_form"
                                                                      class="literature_form">
                                                                    <div class="row">
                                                                        <label class="col-sm-2 control-label"
                                                                               style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px"
                                                                               ·>附件上传</label>
                                                                        <div class="formControls col-md-8">
                                                                            <span class="btn-upload form-group"
                                                                                  style="margin: 0px">
    
                                                                                <input class="input-text upload-url radius validate[required] validate[custom[liteUpload]]"
                                                                                       type="text"
                                                                                       data-prompt-position="inline"
                                                                                >
                                                                                  <a href=""
                                                                                     class="btn btn-success radius upload-btn"
                                                                                     style="color: white; padding: 0px;border: 0px">
                                                                                        <div style="width: 120px;height: 31px;
                                                                                                ;background-image:  url(${ctx}/pic/search_04.png);background-size:120px 31px ;background-repeat: no-repeat"></div>
                                                                                    </a>
                                                                                <input type="file" name="literfile"
                                                                                       class="input-file "
                                                                                       id="lfile">
                                                                             </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <label class="col-sm-offset-2 control-label"
                                                                               style="text-align: center; padding-left: 10px">（仅支持.pdf、.doc、.docx文件）</label>
                                                                    </div>
                                                                </form>

                                                                <div class="row ">
                                                                    <div class="formControls col-sm-offset-2 col-sm-2"
                                                                         style="padding-left: 15px">
                                                                        <button type="button"
                                                                                class="btn btn-success "
                                                                                id="litePreviousButton3"
                                                                                style="height: 45px;text-align: center;padding-top: 10px"
                                                                        >
                                                                            < 上一步
                                                                        </button>
                                                                    </div>
                                                                    <div class="formControls col-sm-2"
                                                                         style="padding-left: 15px">

                                                                        <button type="button"
                                                                                class="btn btn-success "
                                                                                id="liteSubmitButton"
                                                                                style="height: 45px;text-align: center;padding-top: 10px">
                                                                            提交
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="tab-pane fade" id="literview">
                                                        <div id="Literview1" class="tab-content">
                                                            <div class="row clearfix">
                                                                <div class="row">
                                                                    <div class="formControls col-sm-offset-2 col-sm-2"
                                                                         style="padding-left: 15px">
                                                                        <button type="button"
                                                                                class="btn btn-success "
                                                                                id="litePreviousButton4"
                                                                                style="height: 45px;text-align: center;padding-top: 10px">
                                                                            < 上一步
                                                                        </button>
                                                                    </div>
                                                                    <div class="formControls  col-sm-2"
                                                                         style="padding-left: 15px">

                                                                        <button type="button"
                                                                                class="btn btn-success "
                                                                                id="liteNextButton4"
                                                                                style="height: 45px;text-align: center;padding-top: 10px">
                                                                            对上传文件进行分析
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <label class="col-sm-2 control-label"
                                                                           style="text-align: right; display: inline-block; height:35px; line-height: 35px">文献词云分析</label>
                                                                </div>
                                                                <br>
                                                                <div class="row" id="wordcloud">
                                                                        <%--                                                                    词云图片地址--%>
                                                                </div>

                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                                <br>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                        <%--专利的选项--%>
                                        <%--                                    <div class="tab-pane fade" id="patent">--%>
                                        <%--                                        <div class="row clearfix">--%>

                                        <%--                                            <div class="col-sm-2">--%>
                                        <%--                                                <ul class="nav nav-pills nav-stacked">--%>
                                        <%--                                                    <li id="patentContentInfo" class="active"><a>专利内容信息</a>--%>
                                        <%--                                                    </li>--%>
                                        <%--                                                    <li id="patentAttriInfo"><a>专利属性信息</a></li>--%>
                                        <%--                                                    <li id="patentUpLoad"><a>专利上传</a></li>--%>
                                        <%--                                                </ul>--%>
                                        <%--                                            </div>--%>
                                        <%--                                            <div class="col-sm-10">--%>
                                        <%--                                                <ul id="patent_tab" class="nav nav-tabs"--%>
                                        <%--                                                    style="display: none">--%>
                                        <%--                                                    <li class="active">--%>
                                        <%--                                                        <a id="patentContentA" href="#patentContent"--%>
                                        <%--                                                           data-toggle="tab">--%>
                                        <%--                                                            专利内容信息--%>
                                        <%--                                                        </a>--%>
                                        <%--                                                    </li>--%>
                                        <%--                                                    <li><a id="patentAttriA" href="#patentAttri"--%>
                                        <%--                                                           data-toggle="tab">专利属性信息</a></li>--%>
                                        <%--                                                    <li><a id="patentUpA" href="#patentUp"--%>
                                        <%--                                                           data-toggle="tab">专利上传</a>--%>
                                        <%--                                                    </li>--%>

                                        <%--                                                </ul>--%>
                                        <%--                                                <div id="dpatent_tab_content" class="tab-content">--%>
                                        <%--                                                    <div class="tab-pane fade in active" id="patentContent">--%>
                                        <%--                                                        <div class="row clearfix">--%>
                                        <%--                                                            <form id="patent_form1" name="patent_form"--%>
                                        <%--                                                                  class="patent_form">--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">标题(中文)</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"--%>
                                        <%--                                                                               class="validate[required] validate[maxSize[255]]	 form-control "--%>
                                        <%--                                                                               id="titleP"--%>
                                        <%--                                                                               placeholder="标题">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">标题(英文)</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onKeyUp="value=value.replace(/[\W]/g,'')"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               id="titleEP"--%>
                                        <%--                                                                               placeholder="title">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">发明人(中文)</label>--%>

                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               id="authorP"--%>
                                        <%--                                                                               placeholder="发明人(';'分隔)">--%>
                                        <%--                                                                    </div>--%>

                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">发明人(英文)</label>--%>

                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onKeyUp="value=value.replace(/[\W]/g,'')"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               id="authorEP"--%>
                                        <%--                                                                               placeholder="author(divide with';')">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>

                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">摘要(中文)</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[800]]"--%>
                                        <%--                                                                               placeholder="摘要"--%>
                                        <%--                                                                               id="lAbstractP">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">摘要(英文)</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onKeyUp="value=value.replace(/[\W]/g,'')"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[800]]"--%>
                                        <%--                                                                               placeholder="abstract"--%>
                                        <%--                                                                               id="lAbstractEP">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">关键词(中文)</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               placeholder="关键词(';'分隔)"--%>
                                        <%--                                                                               id="lkeywordsP">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>

                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">关键词(英文)</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>

                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               onKeyUp="value=value.replace(/[\W]/g,'')"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               placeholder="keyword(divide with';')"--%>
                                        <%--                                                                               id="lkeywordsEP">--%>
                                        <%--                                                                    </div>--%>

                                        <%--                                                                </div>--%>

                                        <%--                                                            </form>--%>

                                        <%--                                                            <div class="row ">--%>
                                        <%--                                                                <div class="formControls col-sm-offset-2 col-sm-2">--%>

                                        <%--                                                                </div>--%>

                                        <%--                                                                <div class="formControls  col-sm-2"--%>
                                        <%--                                                                     style="padding-left: 15px">--%>

                                        <%--                                                                    <button type="button"--%>
                                        <%--                                                                            class="btn btn-success "--%>
                                        <%--                                                                            id="patentNextButton1"--%>
                                        <%--                                                                            style="height: 45px;text-align: center;padding-top: 10px"--%>
                                        <%--                                                                    >--%>
                                        <%--                                                                        下一步 >--%>
                                        <%--                                                                    </button>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                    <div class="tab-pane fade" id="patentAttri">--%>
                                        <%--                                                        <div class="row clearfix">--%>
                                        <%--                                                            <form id="patent_form2" name="patent_form"--%>
                                        <%--                                                                  class="patent_form">--%>

                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">发表时间</label>--%>
                                        <%--                                                                    <div class=" col-md-10">--%>
                                        <%--                                                                        <div class="input-group date form_date col-md-5"--%>
                                        <%--                                                                             data-date=""--%>
                                        <%--                                                                             data-date-format="dd MM yyyy"--%>
                                        <%--                                                                             data-link-field="dtp_input2"--%>
                                        <%--                                                                             data-link-format="yyyy-mm-dd">--%>
                                        <%--                                                                            <input class="form-control validate[required]"--%>
                                        <%--                                                                                   size="16" type="text"--%>
                                        <%--                                                                                   value=""--%>
                                        <%--                                                                                   readonly--%>
                                        <%--                                                                                   id="publishDateP"--%>
                                        <%--                                                                                   name="patent.publishDate">--%>
                                        <%--                                                                            <span class="input-group-addon"><span--%>
                                        <%--                                                                                    class="glyphicon glyphicon-remove"></span></span>--%>
                                        <%--                                                                        </div>--%>
                                        <%--                                                                        <input type="hidden"--%>
                                        <%--                                                                               id="dtpatent_input2"--%>
                                        <%--                                                                               value=""/><br/>--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>

                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">专利编号</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               id="patentNumber"--%>
                                        <%--                                                                               placeholder="专利编号">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">专利种类</label>--%>

                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               id="patentType"--%>
                                        <%--                                                                               placeholder="专利种类">--%>
                                        <%--                                                                    </div>--%>

                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">专利拥有机构</label>--%>

                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[255]]"--%>
                                        <%--                                                                               id="patentInstitute"--%>
                                        <%--                                                                               placeholder="专利拥有机构">--%>
                                        <%--                                                                    </div>--%>

                                        <%--                                                                </div>--%>

                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">申请地区</label>--%>
                                        <%--                                                                    <div class="form-group col-md-8">--%>
                                        <%--                                                                        <input type="text"--%>
                                        <%--                                                                               class="form-control validate[required] validate[maxSize[800]]"--%>
                                        <%--                                                                               placeholder="申请地区"--%>
                                        <%--                                                                               id="patentRegion">--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                            </form>--%>

                                        <%--                                                            <div class="row ">--%>
                                        <%--                                                                <div class="formControls col-sm-offset-2 col-sm-2"--%>
                                        <%--                                                                     style="padding-left: 15px">--%>
                                        <%--                                                                    <button type="button"--%>
                                        <%--                                                                            class="btn btn-success "--%>
                                        <%--                                                                            id="patentPreviousButton2"--%>
                                        <%--                                                                            style="height: 45px;text-align: center;padding-top: 10px">--%>
                                        <%--                                                                        < 上一步--%>
                                        <%--                                                                    </button>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="formControls  col-sm-2"--%>
                                        <%--                                                                     style="padding-left: 15px">--%>

                                        <%--                                                                    <button type="button"--%>
                                        <%--                                                                            class="btn btn-success "--%>
                                        <%--                                                                            id="patentNextButton2"--%>
                                        <%--                                                                            style="height: 45px;text-align: center;padding-top: 10px">--%>
                                        <%--                                                                        下一步 >--%>
                                        <%--                                                                    </button>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                        </div>--%>

                                        <%--                                                    </div>--%>
                                        <%--                                                    <div class="tab-pane fade" id="patentUp">--%>
                                        <%--                                                        <div class="row clearfix">--%>

                                        <%--                                                            <form id="patent_form3" name="patent_form"--%>
                                        <%--                                                                  class="patent_form">--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-2 control-label"--%>
                                        <%--                                                                           style="text-align: right; dispaly: inline-block; height:35px; line-height: 35px">附件上传</label>--%>
                                        <%--                                                                    <div class="formControls col-md-8">--%>
                                        <%--                                                                        <span class="btn-upload form-group"--%>
                                        <%--                                                                              style="margin: 0px">--%>

                                        <%--                                                                            <input class="input-text upload-url radius validate[required] validate[custom[liteUpload]]"--%>
                                        <%--                                                                                   type="text"--%>
                                        <%--                                                                                   data-prompt-position="inline"--%>
                                        <%--                                                                            >--%>
                                        <%--                                                                              <a href=""--%>
                                        <%--                                                                                 class="btn btn-success radius upload-btn"--%>
                                        <%--                                                                                 style="color: white; padding: 0px;border: 0px">--%>
                                        <%--                                                                                    <div style="width: 120px;height: 31px;--%>
                                        <%--                                                                                            ;background-image:  url(${ctx}/pic/search_04.png);background-size:120px 31px ;background-repeat: no-repeat"></div>--%>
                                        <%--                                                                                </a>--%>
                                        <%--                                                                            <input type="file" multiple name="file-1"--%>
                                        <%--                                                                                   class="input-file "--%>
                                        <%--                                                                                   id="lfileP">--%>
                                        <%--                                                                         </span>--%>
                                        <%--                                                                    </div>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="row">--%>
                                        <%--                                                                    <label class="col-sm-offset-2 control-label"--%>
                                        <%--                                                                           style="text-align: center; padding-left: 10px">（仅支持.pdf、.doc、.docx文件）</label>--%>

                                        <%--                                                                </div>--%>
                                        <%--                                                            </form>--%>

                                        <%--                                                            <div class="row ">--%>
                                        <%--                                                                <div class="formControls col-sm-offset-2 col-sm-2"--%>
                                        <%--                                                                     style="padding-left: 15px">--%>
                                        <%--                                                                    <button type="button"--%>
                                        <%--                                                                            class="btn btn-success "--%>
                                        <%--                                                                            id="patentPreviousButton3"--%>
                                        <%--                                                                            style="height: 45px;text-align: center;padding-top: 10px"--%>
                                        <%--                                                                    >--%>
                                        <%--                                                                        < 上一步--%>
                                        <%--                                                                    </button>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                                <div class="formControls col-sm-2"--%>
                                        <%--                                                                     style="padding-left: 15px">--%>

                                        <%--                                                                    <button type="button"--%>
                                        <%--                                                                            class="btn btn-success "--%>
                                        <%--                                                                            id="patentSubmitButton"--%>
                                        <%--                                                                            style="height: 45px;text-align: center;padding-top: 10px">--%>
                                        <%--                                                                        提交--%>
                                        <%--                                                                    </button>--%>
                                        <%--                                                                </div>--%>
                                        <%--                                                            </div>--%>
                                        <%--                                                        </div>--%>
                                        <%--                                                    </div>--%>
                                        <%--                                                </div>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <%--                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <p data-toggle="collapse" data-parent="#accordion" style="color: white">
                                        <%--href="#collapseThree">--%>
                                    上传展示
                                </p>
                            </h4>
                        </div>

                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">

                                <ul id="dataShowTab" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#originData" data-toggle="tab">
                                            原始数据
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#dataQuality" data-toggle="tab">
                                            质量检测
                                        </a>
                                    </li>
                                </ul>
                                <div id="dataShowTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="originData">
                                        <div class="row">
                                            <div class="col-sm-12" class="table-responsive"
                                                 style="overflow:auto;">
                                                <table id="originDataTable"
                                                       class="table-responsive"></table>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-offset-8 col-sm-1"><%--${ctx}/page/machineLearning"--%>
                                                <button id="beginMLButton" type="button"
                                                        class="btn btn-primary"
                                                        onclick=' window.location.href="${ctx}/page/machineLearningItems"'
                                                        disabled="disabled">机器学习
                                                </button>
                                            </div>
                                            <div class="col-sm-1">
                                                <button id="beginFeatureButton" type="button"
                                                        class="btn btn-primary"
                                                        onclick=' window.location.href="${ctx}/page/dataShow"'
                                                        disabled="disabled">特征选择
                                                </button>
                                            </div>
                                            <div class="col-sm-1">
                                                <button id="beginPredictButton" type="button"
                                                        class="btn btn-primary"
                                                        style="display:none" disabled="disabled">开始预测
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="dataQuality">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table id="dataQualityTable"
                                                       style="overflow-x:auto;"></table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</shiro:hasRole>


<script src="${ctx}/static/static/js/velocity.min.js"></script>
<script src="${ctx}/static/static/js/velocity.ui.min.js"></script>
<script src="${ctx}/static/static/js/main.js"></script> <!-- Resource jQuery -->

</body>

<script type="text/javascript">
    $(function () {
        $('#collapseTwo').collapse('show')
        // $('#collapseThree').collapse('show')
    });

</script>

<script>
    function ShowElement(element) {
        var oldhtml = element.innerHTML;
        var newobj = document.createElement('input');
//创建新的input元素
        newobj.type = 'text';
//为新增元素添加类型
        newobj.onblur = function () {
            element.innerHTML = this.value ? this.value : oldhtml;
//当触发时判断新增元素值是否为空，为空则不修改，并返回原有值 
        }
        element.innerHTML = '';
        element.appendChild(newobj);
        newobj.focus();
    }
    
    function ajaxFileUpload() {

        //执行上传文件操作的函数
        $.ajaxFileUpload({
            type: "post",
            url: '${pageContext.request.contextPath}/data/excel',
            secureuri: false,                           //是否启用安全提交,默认为false
            fileElementId: 'excelUpload',               //文件选择框的id属性
            dataType: "text",
            //服务器返回的格式,选择json或者xml貌似有问题
            success: function (data) {            //服务器响应成功时的处理函数
                if (typeof (data.error) != 'undefined') {
                    if (data.error != '') {
                        alert(data.error);
                    } else {
                        alert(data.msg);
                    }
                } else {
                    console.log(data);
                    alert("上传成功！");
                    updateUploadTable(data);
                }
            },
            error: function (data, status, e) { //服务器响应失败时的处理函数
                alert(e);
            }
        });
    }
</script>

<script>
    $(function () {


        // $("#patentNextButton1").click(function () {
        //     if ($('#patent_form1').validationEngine('validate')) {
        //         $('#patentAttriA').click();
        //         $('#patentContentInfo').removeClass('active');
        //         $('#patentAttriInfo').addClass('active')
        //     }
        // });
        // $("#patentNextButton2").click(function () {
        //     if ($('#patent_form2').validationEngine('validate')) {
        //         $('#patentUpA').click();
        //         $('#patentAttriInfo').removeClass('active');
        //         $('#patentUpLoad').addClass('active')
        //     }
        // });
        // $("#patentPreviousButton2").click(function () {
        //     $('#patentContentA').click();
        //     $('#patentAttriInfo').removeClass('active');
        //     $('#patentContentInfo').addClass('active')
        // });
        //
        // $("#patentPreviousButton3").click(function () {
        //     $('#patentAttriA').click();
        //     $('#patentUpLoad').removeClass('active');
        //     $('#patentAttriInfo').addClass('active')
        // });
        // $("#patentSubmitButton").click(function () {
        //     if ($('#patent_form3').validationEngine('validate')) {
        //         updateUploadPatent();
        //     }
        // });

        $("#liteNextButton1").click(function () {
            // if ($('#literature_formid1').validationEngine('validate')) {
            $('#literatureAttriA').click();
            $('#literatureContentLi').removeClass('active');
            $('#literatureAttriLi').addClass('active')
            // }
        });
        $("#liteNextButton11").click(function () {
            if ($('#literature_formid11').validationEngine('validate')) {
                $('#literatureAttriA').click();
                $('#literatureContentLi').removeClass('active');
                $('#literatureAttriLi').addClass('active')
            }
        });
        $("#liteNextButton2").click(function () {
            if ($('#literature_form2').validationEngine('validate')) {
                OverviewGenerate();
                $('#literatureUpA').click();
                $('#literatureAttriLi').removeClass('active');
                $('#literatureUpLi').addClass('active')
            }
        });
        $("#litePreviousButton2").click(function () {
            $('#literatureContentA').click();
            $('#literatureAttriLi').removeClass('active');
            $('#literatureContentLi').addClass('active')
        });

        $("#litePreviousButton3").click(function () {
            $('#literatureAttriA').click();
            $('#literatureUpLi').removeClass('active');
            $('#literatureAttriLi').addClass('active')
        });
        $("#litePreviousButton4").click(function () {
            $('#literatureUpA').click();
            $('#literatureAnaLi').removeClass('active');
            $('#literatureUpLi').addClass('active')
        });
        $("#liteNextButton4").click(function () {
            dataanalyze();
        });
        $("#liteSubmitButton").click(function () {
            // if ($('#literature_form3').validationEngine('validate')) {
            // updateUploadLiterature();
            $('#literatureAnaA').click();
            $('#literatureUpLi').removeClass('active');
            $('#literatureAnaLi').addClass('active')
            // }
        });
        $("#ovupdate").click(function(){
            // if ($('#literature_form3').validationEngine('validate')) {
            // ovupdate();
            // }
        })
        $("#dataNextButton1").click(function () {
            if ($('#data_form1').validationEngine('validate')) {
                $('#dataUserA').click();
                $('#dataContentLi').removeClass('active');
                $('#dataUserLi').addClass('active')
            }
        });
        $("#dataNextButton2").click(function () {
            if ($('#data_form2').validationEngine('validate')) {
                $('#dataContactA').click();
                $('#dataUserLi').removeClass('active');
                $('#dataContactLi').addClass('active')
            }
        });
        $("#dataPreviousButton2").click(function () {
            $('#dataContentA').click();
            $('#dataUserLi').removeClass('active');
            $('#dataContentLi').addClass('active')

        });
        $("#dataPreviousButton3").click(function () {
            $('#dataUserA').click();
            $('#dataContactLi').removeClass('active');
            $('#dataUserLi').addClass('active')

        });
        $("#expSubmitButton").click(function () {
            if ($('#exp_form').validationEngine('validate')) {
                updateUploadExp();
            }
        });
        $("#calcSubmitButton").click(function () {
            if ($('#calc_form').validationEngine('validate')) {
                updateUploadCalc();
            }
        });

        $("#algoSubmitButton").click(function () {
            if ($('#algo_form').validationEngine('validate')) {
                updateUploadAlgo();
            }
        });

        $("#predSubmitButton").click(function () {
            if ($('#pred_form').validationEngine('validate')) {
                updateUploadExp();//先上传需要预测的数据集
                hideButton();//隐藏机器学习和特征选择按钮
            }
        });

        jQuery('form').validationEngine({
            maxErrorsPerField: 1
        });

        $(document).on("change", ".input-file", function () {
            var uploadVal = $(this).val();
            $(this).parent().find(".upload-url").val(uploadVal).focus().blur();
        });


        $("#dianji").click(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/liter/essl",
                dataType: "json",
                success: function (data) {
                    // var element = document.createElement("li");
                    // var textnode = document.createTextNode("Water");
                    // element.appendChild(textnode);
                    // $("#Attrtab1").appendChild(textnode);
                    console.log(data);
                    var t = "";
                    t += '<li class=\"active\">' + '<a href=\"#essay\" data-toggle=\"tab\" >' + data[0].essayp + '</a>' + '</li>';

                    for (var i = 1; i < data.length; i++) {
                        t += '<li>' + '<a href=\"#essay\" data-toggle=\"tab\">' + data[i].essayp + '</a>' + '</li>';
                    }
                    $("#Attrtab1").html(t);
                }
            })
        })


        function isEmpty(obj) {
            for (var key in obj) {
                return false;
            }
            return true;
        }

        function dataanalyze() {
            alert("处理中，请稍等");
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/analyze",
                success: function (data) {
                    alert("处理完毕");
                    var path = "${pageContext.request.contextPath}/词云/" + data + ".png";
                    html = "<img src=\"" + path + "\">";
                    console.log(html);
                    $("#wordcloud").html(html).css({
                        "width": "35px",
                        "margin-left": "35px",
                        "height": "35px",
                        "margin": "10px auto",
                        // "vertical-align": "middle",
                        // "style":"text-align: right",
                        // "display": "inline-block",
                        "position": "absolute",
                        "left": "20%",
                    })
                },
                error: function (data) {
                    console.log(data);
                }
            });
        }

        //在这处理上传文献
        function OverviewGenerate() {
            var form1 = document.getElementById("literature_formid1");
            var form11 = document.getElementById("literature_formid11");
            var form2 = document.getElementById("literature_form2");

            var fd1 = new FormData(form1);
            var fd11 = new FormData(form11);
            var fd2 = new FormData(form2);

            var jsonData1 = {};
            fd1.forEach((value, key) => jsonData1[key] = value);
            var jsonData11 = {};
            fd11.forEach((value, key) => jsonData11[key] = value);
            var jsonData2 = {};
            fd2.forEach((value, key) => jsonData2[key] = value);

            // var choseValue = $('#Attrtab1 li.active').text().trim();
            // var essayp = {
            //     essayp: choseValue
            // }
            var json1 = {};
            if (jsonData1["title"] != "") {
                // json1 = $.extend({}, jsonData1, essayp);
                // json1 = $.extend({}, json, jsonData2);
                json1 = $.extend({}, jsonData1, jsonData2);
            } else {
                // json1 = $.extend({}, jsonData11, essayp);
                // json1 = $.extend({}, json1, jsonData2);
                json1 = $.extend({}, jsonData11, jsonData2);
            }
            console.log(json1);
            $.ajax({
                success: function () {
                    if (jsonData1["title"] != "") {
                        $("#ovtitle").html(json1["title"]);
                        $("#ovauthor").html(json1["author"]);
                        $("#ovsummary").html(json1["Abstart"]);
                        $("#ovkeywords").html(json1["keywords"]);
                    } else {
                        $("#ovtitle").html(json1["title1"]);
                        $("#ovauthor").html(json1["author1"]);
                        $("#ovsummary").html(json1["lAbstart1"]);
                        $("#ovkeywords").html(json1["lkeywords1"]);
                    }
                    $("#ovdate").html(json1["publishdate"]);
                    $("#ovjuan").html(json1["juan"]);
                    $("#ovqi").html(json1["qi"]);
                    $("#ovdoi").html(json1["doi"]);
                    $("#ovlink").html(json1["link"]);
                    $("#ovmaterial").html(json1["materialMethod"]);
                    $("#ovmachine").html(json1["mlMethod"]);
                    $("#ovstart").html(json1["startPage"]);
                    $("#end").html(json1["endPage"]);
                }
            });
        }
        function OverviewUpload() {
            var form1 = document.getElementById("Overview1");
        }


            <%--    console.log(json1);--%>
            <%--    $.ajax({--%>
            <%--        type: "post",--%>
            <%--        url: "${pageContext.request.contextPath}/upload",--%>
            <%--        data: JSON.stringify(json1),--%>
            <%--        contentType: "application/json",--%>
            <%--        success: function (data) {--%>
            <%--            console.log(data);--%>
            <%--            // alert("上传成功");--%>
            <%--        },--%>
            <%--        error: function (data) {--%>
            <%--            alert("上传失败");--%>
            <%--        }--%>

            <%--    });--%>

            <%--    var upfd = new FormData();--%>
            <%--    upfd.append("literfile", document.getElementById("lfile").files[0]);--%>
            <%--    $.ajax({--%>
            <%--        type: "post",--%>
            <%--        url: "${pageContext.request.contextPath}/fileupload",--%>
            <%--        data: upfd,--%>
            <%--        async: false,--%>
            <%--        processData: false,  // 告诉jQuery不要去处理发送的数据--%>
            <%--        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头--%>
            <%--        success: function (data) {--%>
            <%--            console.log(data);--%>
            <%--        }--%>


            <%--    });--%>
            <%--}--%>
        })
        // function updateUploadPatent() {
        //     var form = document.getElementById("patent_form");
        //     var fd = new FormData(form);
        //     console.log(fd);
        //     fd.append("lfile", document.getElementById("lfileP").files[0]);
        //     fd.append("title", $('#titleP').val());
        //     fd.append("titleE", $('#titleEP').val());
        //     fd.append("author", $('#authorP').val());
        //     fd.append("authorE", $('#authorEP').val());
        //     fd.append("publishDate", $('#publishDateP').val());
        //     fd.append("lAbstract", $('#lAbstractP').val());
        //     fd.append("lAbstractE", $('#lAbstractEP').val());
        //     fd.append("keywords", $('#lkeywordsP').val());
        //     fd.append("keywordsE", $('#lkeywordsEP').val());
        //     fd.append("patentNumber", $('#patentNumber').val());
        //     fd.append("patentType", $('#patentType').val());
        //     fd.append("patentInstitute", $('#patentInstitute').val());
        //     fd.append("patentRegion", $('#patentRegion').val());
        //
        //     $.ajax({
        //         type: "post",
        //         //contentType:"application/json",
        //         url: "https://127.0.0.1:3306/superalloy/data_literature/patent_data",
        //         data: fd,//JSON.stringify(allData),
        //         processData: false,  // 告诉jQuery不要去处理发送的数据
        //         contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
        //         success: function (data) {
        //             console.log(data);
        //
        //             if (data == "success") {
        //                 // layer.msg("上传成功",{time:5*1000},function() {
        //                 //     location.reload();
        //                 // })
        //                 // layer.confirm('上传成功', function(index){
        //                 //     //do something
        //                 //     location.reload();
        //                 //     layer.close(index);
        //                 // });
        //                 layer.open({
        //                     title: '提示', content: '文件上传成功', btn: ['确定'],
        //                     yes: function (index, layero) {
        //                         location.reload();
        //                     }
        //                 });
        //
        //
        //                 // layer.alert("上传成功",{time:})
        //
        //                 // alert("上传成功");
        //                 // location.reload();
        //             } else {
        //                 layer.open({
        //                     title: '警告'
        //                     , content: '文件上传失败'
        //                 });
        //                 // alert("上传失败");
        //             }
        //         }
        //     })
        // }
    // })
</script>
<script>
    function updateUploadAlgo() {
        var form = document.getElementById("algo_form");
        var fd = new FormData(form);
        console.log(fd);
        fd.append("lfile", document.getElementById("algoLocation").files[0]);
        fd.append("calField", $('#cal_field').val());
        fd.append("algoName", $('#algoName').val());
        fd.append("algoAbstract", $('#algoAbstract').val());
        fd.append("algoSubmissionName", $('#algoSubmission_name').val());
        fd.append("algoType", $('#algoType').val());

        $.ajax({
            type: "post",
            //contentType:"application/json",
            url: "${pageContext.request.contextPath}/upload/dataAlgo",
            data: fd,//JSON.stringify(allData),
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
            success: function (data) {
                console.log(data);

                if (data == "success") {
                    alert("上传成功");
                    location.reload();
                } else {
                    alert("上传失败");
                }
            }
        })

    }
</script>
<script>
    function updateUploadExp() {
        //点击了提交按钮以后的后续操作
        if ($('#data_form').validationEngine('validate')) {

            var fd = new FormData();

            fd.append("lfile", document.getElementById("duploadfile").files[0]);
            fd.append("dAbstract", $('#dAbstract').val());
            fd.append("dSubmissionName", $('#dSubmissionName').val());
            fd.append("dSubmissionUnit", $('#dSubmissionUnit').val());
            fd.append("dProofreader", $('#dProofreader').val());
            fd.append("dSizeM", $('#dSizeM').val());
            fd.append("dSizeN", $('#dSizeN').val());
            fd.append("email", $('#email').val());
            fd.append("telephoneNumber", $('#telephone').val());

            fd.append("keywords", $('#dkeywords').val());
            fd.append("contactAddress", $('#contactAddress').val());
            fd.append("domainType", $('#domainType').val());
            fd.append("areaType", $('#areaType').val());

            fd.append("materialTrademark", $('#eMaterialTrademark').val());
            fd.append("mName", $('#eMName').val());
            fd.append("expconName", $('#expconName').val());
            fd.append("expParasetting", $('#expParasetting').val());
            fd.append("expDeviceName", $('#expDeviceName').val());
            fd.append("remark", $('#remark').val());
            $('#dataQualityTable').bootstrapTable('destroy');
            $('#originDataTable').bootstrapTable('destroy');
            $('#dataQualityTable').bootstrapTable();
            $('#originDataTable').bootstrapTable();
            $('#dataQualityTable').bootstrapTable('showLoading');
            $('#originDataTable').bootstrapTable('showLoading');
            $('#collapseTwo').collapse('hide');
            $('#collapseThree').collapse('show');
            $.ajax({
                type: "post",
                //contentType:"application/json",
                url: "${pageContext.request.contextPath}/upload/dataExperiment",
                data: fd,//JSON.stringify(allData),
                processData: false,  // 告诉jQuery不要去处理发送的数据
                contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
                traditional: true,
                dataType: "json",
                success: function (result) {
                    var dataQuality = eval('(' + unescape(result.dataQuality.replace(/\\u/g, '%u')) + ')');
                    var dataResult = eval('(' + result.dataResult + ')');

                    console.log(dataQuality);
                    console.log(dataResult);

                    if (result.dataQuality !== "null") {//判断返回的质量检测数据是否为空，为空的话说明数据集存在字符串无法进行质量检测
                        var uplimit = {};
                        var lowlimit = {};
                        for (var i = 0; i < dataQuality[0].length; i++) {
                            uplimit[dataQuality[0][i]] = dataQuality[13][i + 1];
                            lowlimit[dataQuality[0][i]] = dataQuality[14][i + 1];

                        }
                        var editable = {type: "text"};
                        var qualityTitle = [];
                        qualityTitle[0] = {
                            title: "",
                            class: 'w100',
                            field: "dataQualityField"
                        };
                        var qualityData = [];

                        for (var i = 0; i < dataQuality[0].length; i++) {
                            qualityTitle[i + 1] = {
                                field: dataQuality[0][i],
                                class: 'w100',
                                title: $('<div/>').text(dataQuality[0][i]).html(),
                            };
                        }
                        for (var i = 1; i < dataQuality.length; i++) {
                            var temp = {};
                            temp["dataQualityField"] = dataQuality[i][0];
                            for (var j = 0; j < dataQuality[0].length; j++) {
                                temp[dataQuality[0][j]] = $('<div/>').text(dataQuality[i][j + 1]).html();
                            }
                            qualityData[i - 1] = temp;
                        }
                    }

                    var dataTitle = [];
                    var data = [];

                    for (var i = 0; i < dataResult[0].length; i++) {
                        dataTitle[i] = {
                            field: dataResult[0][i],
                            title: $('<div/>').text(dataResult[0][i]).html(),
                            editable: editable,
                            class: 'w100',

                            cellStyle: function (value, row, index, field) {
                                if (value === '' || value === undefined) {
                                    return {classes: "danger"};
                                } else if (!isNaN(Number("M")) && (Number(value) < Number(lowlimit[field]) || Number(value) > Number(uplimit[field]))) {
                                    return {classes: "warning"};
                                } else {
                                    return {};
                                }
                            }
                        };
                    }
                    dataTitle[dataTitle.length - 1].visible = false;
                    for (var i = 1; i < dataResult.length; i++) {
                        var temp = {};
                        for (var j = 0; j < dataResult[0].length; j++) {
                            temp[dataResult[0][j]] = $('<div/>').text(dataResult[i][j]).html();
                        }
                        data[i - 1] = temp;
                    }
                    $('#dataQualityTable').bootstrapTable('destroy');
                    $('#originDataTable').bootstrapTable('destroy');
                    $('#originDataTable').bootstrapTable({
                        pagination: true,
                        pageSize: "15",
                        columns: dataTitle,
                        data: data,
                        onEditableSave: function (field, row, oldValue, $el) {
                            var query = {field: field, value: row[field], id: row._id};
                            $.ajax({
                                type: "post",
                                contentType: "application/json",
                                url: "${pageContext.request.contextPath}/upload/dataModify",
                                data: JSON.stringify(query),
                                // processData: false,  // 告诉jQuery不要去处理发送的数据
                                // contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
                                traditional: true,
                                dataType: "json",
                                success: function (result) {
                                }
                            })
                        },
                    });
                    if (result.dataQuality !== "null") {//判断返回的质量检测数据是否为空，为空的话说明数据集存在字符串无法进行质量检测
                        $("#dataQualityTable").bootstrapTable({
                            pagination: true,
                            pageSize: "15",
                            columns: qualityTitle,
                            data: qualityData
                        });
                    } else {
                        $("#dataQualityTable").bootstrapTable({
                            columns: [{title: "数据集中含有非法字符，无法进行质量检测"}]
                        });
                    }
                    setECode(result.eCode);
                    enableButton();
                }
            })
        }


    }
</script>
<script>
    function updateUploadCalc() {

        if ($('#data_form').validationEngine('validate')) {
            var fd = new FormData();
            fd.append("lfile", document.getElementById("duploadfile").files[0]);
            fd.append("cFile", document.getElementById("calResultFile").files[0]);

            fd.append("dAbstract", $('#dAbstract').val());
            fd.append("dSubmissionName", $('#dSubmissionName').val());
            fd.append("dSubmissionUnit", $('#dSubmissionUnit').val());
            fd.append("dProofreader", $('#dProofreader').val());
            fd.append("dSizeM", $('#dSizeM').val());
            fd.append("dSizeN", $('#dSizeN').val());
            fd.append("email", $('#email').val());
            fd.append("telephoneNumber", $('#telephone').val());
            fd.append("keywords", $('#dkeywords').val());
            fd.append("contactAddress", $('#contactAddress').val());
            fd.append("domainType", $('#domainType').val());
            fd.append("areaType", $('#areaType').val());

            fd.append("materialTrademark", $('#cMaterialTrademark').val());
            fd.append("mName", $('#cMName').val());
            fd.append("calSoftwareName", $('#calSoftwareName').val());
            fd.append("softwareVersion", $('#softwareVersion').val());
            fd.append("calFormulaName", $('#calFormulaName').val());
            fd.append("calFormulaSource", $('#calFormulaSource').val());
            fd.append("calResultFile", $('#calResultFile').val());
            $('#dataQualityTable').bootstrapTable('destroy');
            $('#originDataTable').bootstrapTable('destroy');
            $('#dataQualityTable').bootstrapTable();
            $('#originDataTable').bootstrapTable();
            $('#dataQualityTable').bootstrapTable('showLoading');
            $('#originDataTable').bootstrapTable('showLoading');
            $('#collapseTwo').collapse('hide');
            $('#collapseThree').collapse('show');
            $.ajax({
                type: "post",
                //contentType:"application/json",
                url: "${pageContext.request.contextPath}/upload/dataCalc",
                data: fd,//JSON.stringify(allData),
                processData: false,  // 告诉jQuery不要去处理发送的数据
                contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
                traditional: true,
                dataType: "json",
                success: function (result) {
                    var dataQuality = eval('(' + unescape(result.dataQuality.replace(/\\u/g, '%u')) + ')');
                    var dataResult = eval('(' + result.dataResult + ')');

                    console.log(dataQuality);
                    console.log(dataResult);
                    var uplimit = {};
                    var lowlimit = {};
                    for (var i = 0; i < dataQuality[0].length; i++) {
                        uplimit[dataQuality[0][i]] = dataQuality[13][i + 1];
                        lowlimit[dataQuality[0][i]] = dataQuality[14][i + 1];

                    }
                    var editable = {type: "text"};
                    var qualityTitle = [];
                    qualityTitle[0] = {
                        title: "",
                        class: 'w100',
                        field: "dataQualityField"
                    };
                    var qualityData = [];

                    for (var i = 0; i < dataQuality[0].length; i++) {
                        qualityTitle[i + 1] = {
                            field: dataQuality[0][i],
                            class: 'w100',
                            title: $('<div/>').text(dataQuality[0][i]).html(),
                        };
                    }
                    for (var i = 1; i < dataQuality.length; i++) {
                        var temp = {};
                        temp["dataQualityField"] = dataQuality[i][0];
                        for (var j = 0; j < dataQuality[0].length; j++) {
                            temp[dataQuality[0][j]] = $('<div/>').text(dataQuality[i][j + 1]).html();
                        }
                        qualityData[i - 1] = temp;
                    }

                    var dataTitle = [];
                    var data = [];

                    for (var i = 0; i < dataResult[0].length; i++) {
                        dataTitle[i] = {
                            field: dataResult[0][i],
                            title: $('<div/>').text(dataResult[0][i]).html(),
                            editable: editable,
                            class: 'w100',

                            cellStyle: function (value, row, index, field) {
                                if (value == '' || value == undefined) {
                                    return {classes: "danger"};
                                } else if (Number(value) < Number(lowlimit[field]) || Number(value) > Number(uplimit[field])) {
                                    return {classes: "warning"};
                                } else {
                                    return {};
                                }
                            }
                        };
                    }
                    for (var i = 1; i < dataResult.length; i++) {
                        var temp = {};
                        for (var j = 0; j < dataResult[0].length; j++) {
                            temp[dataResult[0][j]] = $('<div/>').text(dataResult[i][j]).html();
                        }
                        data[i - 1] = temp;
                    }
                    $('#dataQualityTable').bootstrapTable('destroy');
                    $('#originDataTable').bootstrapTable('destroy');
                    $('#originDataTable').bootstrapTable({
                        pagination: true,
                        pageSize: "15",
                        columns: dataTitle,
                        data: data,
                        onEditableSave: function (field, row, oldValue, $el) {
                            console.log("row:" + row + "field:" + field);
                        },
                    });
                    $("#dataQualityTable").bootstrapTable({
                        pagination: true,
                        pageSize: "15",
                        columns: qualityTitle,
                        data: qualityData,
                    });
                    setECode(result.eCode);
                    enableButton();
                }
            })
        }


    }
</script>
<script>
    function updateUploadTable(record) {
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/data/getData",
            data: {record: record},

            dataType: "json",
            success: function (data) {
                console.log(data);
                for (var i = 0; i < data.title.length; i++) {
                    $('#upload-thead').append(" <th>" + data.title[i] + "</th>");
//                    $('#attr-container').append(" <label class='checkbox-inline'> <input type='checkbox' name='attrInput' value='"+data.title[i]+"'>"+data.title[i]+ "</label>");
                }
                $('#upload-thead').append("<th>ERROR</th>");
                for (var i = 0; i < data.data.length; i++) {
                    var s = "<tr>";
                    for (var j = 0; j < data.title.length; j++) {
                        var json = eval('(' + data.data[i] + ')');
                        s += "<td>" + json['' + data.title[j] + ''] + "</td>";
                    }
                    s += "<td></td>";
                    s += "</tr>";
                    $('#upload-tbody').append(s);
                }
                initUploadPage(Math.ceil(data.data.length / 5));
            }
        })
    }
</script>
<script>
    $(function () {
        $.Huifold("#Huifold1 .item h4", "#Huifold1 .item .info", "fast", 1, "click"); /*5个参数顺序不可打乱，分别是：相应区,隐藏显示的内容,速度,类型,事件*/
    });

    jQuery.Huifold = function (obj, obj_c, speed, obj_type, Event) {
        if (obj_type == 2) {
            $(obj + ":first").find("b").html("-");
            $(obj_c + ":first").show()
        }
        $(obj).bind(Event, function () {
            if ($(this).next().is(":visible")) {
                if (obj_type == 2) {
                    return false
                } else {
                    $(this).next().slideUp(speed).end().removeClass("selected");
                    $(this).find("b").html("+")
                }
            } else {
                if (obj_type == 3) {
                    $(this).next().slideDown(speed).end().addClass("selected");
                    $(this).find("b").html("-")
                } else {
                    $(obj_c).slideUp(speed);
                    $(obj).removeClass("selected");
                    $(obj).find("b").html("+");
                    $(this).next().slideDown(speed).end().addClass("selected");
                    $(this).find("b").html("-")
                }
            }
        })
    }
</script>
<script>
    $('.form_date').datetimepicker({
        language: 'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: "yyyy-mm-dd"
    });


</script>
<script>


    $("select#div_select").change(function () {
        var value = $(this).val();
        if (value == 1) {
            $('#exper_div').click();

        } else if (value == 2) {
            $('#calc_div').click();

        } else if (value == 3) {
            $('#pred_div').click();
        }
    });


    $(function () {
        $('#exper_div').click();
    });
</script>
<script>
    $(function () {

        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/admin/getUser",
            data: {},
            dataType: "json",
            success: function (data) {
                $("#dSubmissionName").val(data.username);
                $("#algoSubmission_name").val(data.username);
                $("#dSubmissionUnit").val(data.unit);
                $("#contact").val(data.email);
                $("#tele").val(data.contact);
                $("#contactAddress").val(data.address);

            }
        })
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/admin/getModel",
            data: {username: "piki"},
            dataType: "json",
            success: function (data) {
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    if (data[i].algorithm_name !== 'Predict') {
                        var modelname = data[i].file_name.split('.')[0] + "_" + data[i].algorithm_name + "_model.m";
                        $("#model_select").append("<option value='" + modelname + "'>" + modelname + "</option>");
                    }
                }
            }
        })
    });
</script>

<%--window.location.href='${ctx}/page/machineLearning?eCode='+eCode;--%>
<script>
    function setECode(eCode) {
        $("#beginFeatureButton").click(function () {
            window.location.href = '${ctx}/page/dataShow?eCode=' + eCode;
        });
        $("#beginMLButton").click(function () {
            window.location.href = '${ctx}/page/machineLearningItems?eCode=' + eCode;
        });
        $("#beginPredictButton").click(function () {//开始预测后直接跳到预测结果页面
            var ALG_model = $('#model_select option:selected').val();
            window.location.href = '${ctx}/page/machineLearningResult?eCode=' + eCode + '&Cluster_ALG=Predict&ALG_model=' + ALG_model;
        });
    }


    function enableButton() {//异步执行，在上传完数据后让机器学习和特征选择和开始预测按钮解除disabled属性
        $("#beginFeatureButton").removeAttr("disabled");
        $("#beginMLButton").removeAttr("disabled");
        $("#beginPredictButton").removeAttr("disabled");
    }

    function hideButton() {//同步执行，在进行预测的时候隐藏机器学习和特征选择按钮
        $("#beginFeatureButton").css("display", "none");
        $("#beginMLButton").css("display", "none");
        $("#beginPredictButton").css("display", "");
    }
</script>


