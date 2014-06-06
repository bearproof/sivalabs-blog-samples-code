<!DOCTYPE html>
<%@page import="com.sivalabs.springapp.web.controllers.UserController"%>
<%@include file="taglib.jsp"%>
<html>
<head>
    <title>Dashboard</title>

    <link href="${rootURL}resources/bootstrap/css/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${rootURL}resources/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${rootURL}resources/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${rootURL}resources/js/app.js"></script>

</head>
<body>

<!-- Header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-toggle"></span>
        </button>
        <a class="navbar-brand" href="#"> <span class="glyphicon glyphicon-home"></span> Disrupt Startup</a>
    </div>
    <div class="navbar-collapse collapse">
        <ul class="nav navbar-nav pull-right">

            <li class="dropdown">
                <a class="dropdown-toggle" role="button" data-toggle="dropdown" href="#">
                    <strong><%=UserController.getCurrentUser().getName() %></strong> <span class="caret"></span></a>
                <ul id="g-account-menu" class="dropdown-menu" role="menu">
                    <li><a href="#">My Profile</a></li>
                </ul>
            </li>

            <li><a href="${rootUrl}logout">Log out</a></li>
        </ul>
    </div>
</div>
<!-- /Header -->

<!-- Main -->
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- Left -->
            <strong>Tools</strong>
            <hr>
            <ul class="nav nav-pills nav-stacked">
                <li class="nav-header"></li>
                <li class="active"><a href="http://bootply.com" title="The Bootstrap Playground" target="ext">Home</a></li>
                <li><a href="/tagged/bootstrap-3">Bootstrap 3</a></li>
                <li class="divider"></li>
                <li><a href="/61518" title="Bootstrap 3 Panel">Panels</a></li>
                <li><a href="/61521" title="Bootstrap 3 Icons">Glypicons</a></li>
                <li><a href="/61523" title="Bootstrap 3 ListGroup">List Groups</a></li>
                <li><a href="#">GitHub</a></li>
                <li><a href="/61518" title="Bootstrap 3 Slider">Carousel</a></li>
                <li><a href="/62603">Layout</a></li>
            </ul>
        </div><!-- /span-3 -->
        <div class="col-md-9">
            <!-- Right -->

            <a href="#"><strong><span class="glyphicon glyphicon-dashboard"></span> My Dashboard</strong></a>
            <a title="Add Widget" data-toggle="modal" href="#addWidgetModal" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-plus-sign"></span> Add Widget</a>

            <hr>

            <div class="row">
                <div class="col-md-6">
                    <div class="well">Inbox Messages <span class="badge pull-right">3</span></div>

                    <div class="panel">
                        <div class="panel-heading">
                            <i class="icon icon-chevron-up chevron"></i>
                            <i class="icon icon-wrench pull-right"></i> Quick Start
                        </div>
                        <div class="panel-content">

                            <div class="btn-group btn-group-justified">
                                <a href="#" class="btn btn-primary col-sm-3">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    <p>Service</p>
                                </a>
                                <a href="#" class="btn btn-primary col-sm-3">
                                    <i class="glyphicon glyphicon-cloud"></i>
                                    <p>Cloud</p>
                                </a>
                                <a href="#" class="btn btn-primary col-sm-3">
                                    <i class="glyphicon glyphicon-cog"></i>
                                    <p>Tools</p>
                                </a>
                                <a href="#" class="btn btn-primary col-sm-3">
                                    <i class="glyphicon glyphicon-question-sign"></i>
                                    <p>Help</p>
                                </a>
                            </div>
                        </div><!--/panel content-->
                    </div><!--/panel-->


                    <div class="panel panel-default">
                        <div class="panel-heading">Report</div>
                        <table class="table table-striped">
                            <thead>
                            <tr><th>Col 1</th><th>Col 2</th><th>Col 3</th></tr></thead>
                            <tbody>
                            <tr><td>45</td><td>2.45%</td><td>Direct</td></tr>
                            <tr><td>289</td><td>56.2%</td><td>Referral</td></tr>
                            <tr><td>98</td><td>25%</td><td>Type</td></tr>
                            <tr><td>..</td><td>..</td><td>..</td></tr>
                            <tr><td>..</td><td>..</td><td>..</td></tr>
                            </tbody>
                        </table>
                    </div><!--/panel-->


                    <div class="panel panel-default">
                        <div class="panel-heading">Charts</div>
                        <div class="panel-body"><img src="http://www.wired.com/playbook/wp-content/uploads/2012/08/data-tracking-run-chart.jpg" class="img-responsive"></div>
                    </div><!--/panel-->

                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">Bootstrap 3</div>
                        <div class="panel-body">
                            This is a dashboard-style layout that uses Bootstrap 3 RC. You can follow the ongoing pre-release discussions about Bootstrap 3.0 on this <a href="https://github.com/twitter/bootstrap/pull/6342">GitHub thread</a>.
                            <br><br>
                            This Bootstrap 3 dashboard layout is compliments of <a href="http://bootply.com">Bootply</a>.
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <i class="glyphicon glyphicon-chevron-up chevron"></i>
                                <i class="glyphicon glyphicon-wrench pull-right"></i>
                                Form
                            </div>
                        </div>
                        <div class="panel-body">

                            <form class="form form-vertical">

                                <div class="control-group">
                                    <label>Name</label>
                                    <div class="controls">
                                        <input type="text" class="form-control" placeholder="Enter Name">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label>Label</label>
                                    <div class="controls">
                                        <input type="password" class="form-control" placeholder="Password">

                                    </div>
                                </div>

                                <div class="control-group">
                                    <label>Text</label>
                                    <div class="controls">
                                        <textarea class="form-control"></textarea>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label>Select</label>
                                    <div class="controls">
                                        <select class="form-control"><option>options</option></select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <button type="submit" class="btn btn-primary">
                                            Post
                                        </button>
                                    </div>
                                </div>

                            </form>


                        </div><!--/panel content-->
                    </div><!--/panel-->

                    <div class="panel panel-default">
                        <div class="panel-heading"><div class="panel-title">Engagement</div></div>
                        <div class="panel-body pull-center">

                            <img src="http://placehold.it/90X90/CC2222/FFF" class="img-circle">

                            <img src="http://placehold.it/90X90/11CC22/FFF" class="img-circle">

                            <img src="http://placehold.it/90X90/EEEEEE/222" class="img-circle">

                        </div>
                    </div><!--/panel-->


                    <i class="icon-bar-chart icon-3x"></i>
                    <i class="icon-plus icon-3x"></i>
                    <i class="icon-facebook icon-3x"></i>
                    <i class="icon-beaker icon-3x"></i>
                    <i class="icon-twitter icon-3x"></i>


                </div><!--/col-span-6-->

            </div><!--/row-->
        </div><!--/col-span-9-->
    </div>
</div>
<!-- /Main -->

<footer>This Bootstrap 3 dashboard layout is compliments of Bootply.com | <a href="http://www.bootply.com/61526"><strong>Edit on Bootply</strong></a></footer>

<div class="modal" id="addWidgetModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Add Widget</h4>
            </div>
            <div class="modal-body">
                <p>Add a widget stuff here..</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">Close</a>
                <a href="#" class="btn btn-primary">Save changes</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dalog -->
</div><!-- /.modal -->

<h2>Welcome <%=UserController.getCurrentUser().getName() %> </h2>
<h3>Email: <sec:authentication property="name"/></h3>
<h3>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <a href="${rootUrl}admin">Administration</a>
    </sec:authorize>
</h3>
<p>	<a href="${rootUrl}logout">Logout</a></p>
</body>
</html>