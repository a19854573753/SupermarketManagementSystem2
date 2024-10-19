<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="<%=basePath %>/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=basePath %>/admin/css/style.css"/>       
        <link href="<%=basePath %>/admin/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=basePath %>/admin/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=basePath %>/admin/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
			<script src="<%=basePath %>/admin/assets/js/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=basePath %>/admin/assets/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>/admin/assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="<%=basePath %>/admin/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=basePath %>/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="<%=basePath %>/admin/js/H-ui.js"></script> 
        <script type="text/javascript" src="<%=basePath %>/admin/js/H-ui.admin.js"></script> 
        <script src="<%=basePath %>/admin/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="<%=basePath %>/admin/assets/laydate/laydate.js" type="text/javascript"></script>
<title>商品列表</title>
</head>
<script type="text/javascript"> 
$(function(){ 
$(".add").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())+1) 
setTotal(); 
}) 
$(".min").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())-1) 
if(parseInt(t.val())<0){ 
t.val(0); 
} 
setTotal(); 
}) 
function setTotal(){ 
var s=0,s1=0; 
$("#shop-xx #num22").each(function(){ 
s+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text()); 
s1+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=hprice]').text());
});
document.getElementById("total").value=s.toFixed(2);
document.getElementById("total1").value=s1.toFixed(2);
//("input[id=total]").html(s.toFixed(2)); 
} 
setTotal(); 


}) 
</script>
<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
      <div class="d_Confirm_Order_style">
      <form method="post" action="vagueGoodsList_shouYing.do" >
    <div class="search_style">
      <ul class="search_content clearfix">
       <li>
        <li><label class="l_f">商品条形码：</label><input name="gno" type="text"  class="text_add" placeholder="请输入搜索商品条形码"  style=" width:200px"/></li>
        <li><label class="l_f">商品名</label><input name="name" type="text"  class="text_add" placeholder="请输入搜索商品名"  style=" width:200px"/></li>
        <li><select name="fid"class="text_add" style="width:180px;" >
          <option value="">请选择商品类别...</option>
         <c:forEach items="${adlist }" var="ad">
          <option value="${ad.id }">${ad.name }</option>
          </c:forEach>
        </select>
        </li>
       <li style="width:90px;"><button type="submit" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div>
    </form>
     <!---->
     <div class="border clearfix">
       <span class="l_f">
       <!-- <a href="doAddGoods.do" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加商品</a> -->
       </span>
     </div>
     <div class="table_menu_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<%-- <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th> --%>
				<th>商品条形码</th>
				<th>商品名</th>
				<th>图片</th>
		        <th>所属类型</th>
		        <th>零售价</th>
		       <!--  <th>进货价</th> -->
		        <th>库存量</th>
		        <th>目前状态</th>
				<th width="250">操作</th>
			</tr>
		</thead>
	<tbody>
	     <c:forEach items="${list }" var="jz">
		<tr>
          <td>${jz.gno}</td>
          <td>${jz.name}</td>
          <td><img src="../upload/${jz.img}" width="50" height="50"></td>
          <td><c:forEach items="${adlist }" var="ad">
          <c:if test="${jz.fid==ad.id }">
          ${ad.name}
          </c:if>
          </c:forEach></td>
          <td>${jz.price}</td>
          <%-- <td>${jz.hprice}</td> --%>
          <td>${jz.kcnum }</td>
          <td>${jz.status }</td>
          <td class="td-manage">
          <c:if test="${jz.status!='已过期' }">
          <a title="加入购物车" href="addShop.do?fid=${jz.id }"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120">加入购物车</i></a>
          </c:if>
          <c:if test="${jz.status=='已过期' }">
        已过期
          </c:if>
         <%--  <a title="删除" href="deleteGoods.do?id=${jz.id }"  onclick="return del(1,1,1)" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120">删除</i></a> --%>
          </td>
        </tr>
        </c:forEach>
      <tr>
      	<c:if test="${sessionScope.p==1 }">
		<td colspan="8"> <c:if test="${page.page>1}">
              <a href="GoodsList_shouYing.do?page=1" >首页</a>
             <a href="GoodsList_shouYing.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="GoodsList_shouYing.do?page=${page.page+1 }">下一页</a>
			<a href="GoodsList_shouYing.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
	</c:if>
	<c:if test="${sessionScope.p==2 }">
	<td colspan="8"> <c:if test="${page.page>1}">
    <a href="vagueGoodsList_shouYing.do?page=1" >首页</a>
    <a href="vagueGoodsList_shouYing.do?page=${page.page-1 }"> 上一页</a> 
    </c:if>
    	<c:if test="${page.page<page.totalPage}">
			<a href="vagueGoodsList_shouYing.do?page=${page.page+1 }">下一页</a>
			<a href="vagueGoodsList_shouYing.do?page=${page.totalPage }">末页</a>
		</c:if> 
		</td>
		</c:if>
		</tr>
		<tr>
		<th>名称</th><th>图片</th><th colspan="4">零售单价/数量/库存</th><th>修改</th><th>操作</th>
		</tr>
		<c:forEach items="${slist }" var="s">
						 <form action="updateShopNum.do" method="post">
						<tr id="shop-xx">
						<td><c:forEach items="${glist }" var="g">
			                <c:if test="${g.id==s.fid }">
			                ${g.name }
			                </c:if>
			                </c:forEach>
			            </td>
						<td>
						 	<c:forEach items="${glist }" var="g">
		                	<c:if test="${g.id==s.fid }">
		                	<img src="../upload/${g.img }" width="87" height="58"  />
		                	</c:if>
		                	</c:forEach>
		                </td>
						<td id="num22" colspan="4" >
							零售单价:￥<span class="price">
					       	<c:forEach items="${glist }" var="g">
					        <c:if test="${g.id==s.fid }">
					            ${g.price }
					         </c:if>
					         </c:forEach>
					         </span><%-- （进货价<span class="hprice">
					       	<c:forEach items="${glist }" var="g">
					        <c:if test="${g.id==s.fid }">
					            ${g.hprice }
					         </c:if>
					         </c:forEach>
					         </span>）元 --%>/
		                    <input class="min" type="button" class="btn btn-xs btn-info"  value="-" /> 
		                    <input class="text_box" size="2" name="num" type="text" value="${s.num }" /> /
		                    <c:forEach items="${glist }" var="g">
		          			<c:if test="${g.id==s.fid }">
		           			<input type="text" value="${g.kcnum }" id="kcnum" size="2" readonly="readonly"> 
		         			 </c:if>
		           			</c:forEach>
		                    <input class="add"  type="button" class="btn btn-xs btn-info" value="+" /> 
		                    <input   type="hidden" name="id"  value="${s.id }" />
                     	</td>
						<td><input type="submit" class="btn btn-info" value="确认修改"/></td>
						<td> <a href="deleteShop.do?id=${s.id }"  class="btn btn-warning">删除</a></td>
						</tr>
						 </form>
						</c:forEach>
						<tr>
						<td colspan="3">
						<img alt="" src="../skin/images/zhifu.png" width="600px;" height="300px;">
						</td>
						<td colspan="5">
						<form action="addOrder.do" method="post">
						<div id="js">
						<ul>
						<li style="    margin-top: 10px;">应付金额：<label ><input type="text" name="zprice" id="total" readonly="readonly"/>元 </label>
						<!-- <li style="    margin-top: 10px;">会员应付金额：<label ><input type="text" name="zprice" id="total1" readonly="readonly"/>元 </label> -->
						<li style="    margin-top: 10px;"><label>会员：</label><select name="uid">
						<!-- <option value="0">非会员</option> -->
						<c:forEach items="${ulist }" var="u">
						<option value="${u.id }">${u.uname }（${u.idcard }）(余额：${u.money })</option>
						</c:forEach>
						</select>
						</li>
						<li style="    margin-top: 10px;">
						<input name="id" type="hidden"  value="${sessionScope.user.id }"  />
						</li>
						<li style="margin-top: 10px;"> 
						<input name="button" type="submit" id="button" class="btn btn-warning" value="确认支付"  /></li><!-- src="images/js.jpg" -->
						</ul>
						</div>
						</form>
						</td>
						</tr>
      </tbody>
      
      
	</table>
   </div>
  </div>
 </div>
</div>

 <script>
jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			})
/*商品-添加*/
 $('#member_add').on('click', function(){
    layer.open({
        type: 1,
        title: '添加商品',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		//btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
        	  return true;
			  /* layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  }); */
			   layer.close(index);	
		  }		  		     				
		}
    });
});
/*商品-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*商品-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*商品-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*商品-编辑*/
function member_edit(id){
	  layer.open({
        type: 1,
        title: '修改商品信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  		     				
		}
    });
}
/*商品-删除*/
 //单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		return true;
	}else{
		return false;
	}
}
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
laydate({
    elem: '#start',
    event: 'focus' 
});

</script>
</body>
</html>
