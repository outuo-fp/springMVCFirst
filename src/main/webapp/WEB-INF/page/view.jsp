<%@page import="com.fp.ssm.common.PageParam"
	import="com.fp.ssm.po.TableIpShowVo" %>
<%@ include file="/WEB-INF/page/include/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

				<!-- content starts     iframe -->
				<div class="showView">
					<div class="bg text-muted">
						<a href="index.html ">首页</a>&nbsp;/&nbsp;项目查看
					</div>

					<div class="row">
					
						<div class="col-sm-2 text-danger">项目ID:</div>
						<div class="col-sm-3">${user.proId}</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">负责人:</div>
						<div class="">${user.userId}</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">项目名称:</div>
						<div class="col-sm-3">${user.proName }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">数量:</div>
						<div class="">${user.num}</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">金额:</div>
						<div class="col-sm-3">${user.totalFee }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">部门:</div>
						<div class="">${user.department }</div>

					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">客户/电话:</div>
						<div class="col-sm-3">${user.customer }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">剩余时间:</div>
						<div class="retime"></div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">需求文档</div>
						<div class="col-sm-3">${user.reqUrl }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">电气图纸</div>
						<div class="">${user.elcUrl }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">机械图纸</div>
						<div class="col-sm-3">${user.mechUrl }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">软件图纸</div>
						<div class="">${user.softUrl }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">开始时间</div>
						<div class="col-sm-3">${user.created }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">备注:</div>
						<div class="">${user.comment }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">交貨時間:</div>
						<div class="col-sm-3" id="protime"><fmt:formatDate value="${user.deadline}" pattern="yyyy/MM/dd"/></div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">状态:</div>
						<div class="">${user.status}</div>
					</div>
					<!-- task  -->
					<div style="width:100%;height:1;margin-top:6px;text-align:center;color:red;border-bottom:1px solid black;">任务派发--${user.comment }</div>
					<div class="row">
						<div class="col-sm-2 text-danger">任务ID</div>
						<div class="col-sm-3">${utask.taskId }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">任务名称</div>
						<div class="">${utask.taskName }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">项目ID</div>
						<div class="col-sm-3">${utask.proId }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">任务负责人</div>
						<div class="">${utask.userId }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">任务类型</div>
						<div class="col-sm-3">${utask.type }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">状态</div>
						<div class="">${utask.status }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">内容</div>
						<div class="col-sm-3">${utask.connent }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">计划完成时间</div>
						<div class="">${utask.deadline }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">开始时间</div>
						<div class="col-sm-3">${utask.created }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">实际完成时间</div>
						<div class="">${utask.actualDate }</div>
					</div>
					
					
					
					<div style="width:100%;height:1;margin-top:6px;text-align:center;color:red;border-bottom:1px solid black;">物料清单--${userItem.components}</div>
					<div class="row">
						<div class="col-sm-2 text-danger">物料ID:</div>
						<div class="col-sm-3">${userItem.bomId }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">项目ID</div>
						<div class="">${userItem.proId }</div>

					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">下单人id</div>
						<div class="col-sm-3">${userItem.userId }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">物料名称</div>
						<div class="">${userItem.components }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">型号</div>
						<div class="col-sm-3">${userItem.model }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">品牌</div>
						<div class="">${userItem.brand }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">单价</div>
						<div class="col-sm-3">${userItem.price }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">数量</div>
						<div class="">${userItem.num }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">链接</div>
						<div class="col-sm-3">${userItem.url }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">备注</div>
						<div class="">${userItem.comment }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">创建时间</div>
						<div class="col-sm-3">${userItem.created }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">计划完成时间</div>
						<div class="">${userItem.deadline }</div>
					</div>
					<div class="row">
						<div class="col-sm-2 text-danger">实际完成时间</div>
						<div class="col-sm-3">${userItem.actualDate }</div>
						<div class="col-sm-2 col-sm-offset-1 text-danger">状态</div>
						<div class="">${userItem.status }</div>
					</div>
				</div>
				<!-- content end -->
			</div>
		</div>
	</div>
	<!--/.fluid-container-->

	<!-- external javascript -->

	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	

	$(function() {
		/* var data = [ "a", "b", "c", "d" ];
		var html = '<td>${items.id }</td><td></td><td></td><td></td><td></td><td></td><td></td><td>进行中</td><td>完成</td>';
		/* for (var i = 0; i < data.length; i ++) {
		  html += "<td>" + data[i] + "</td>";
		} */
		/*$("#row").empty();
		$("#row").append(html); */
		
			var protime=$("#protime").text();
			
			function getOffsetDays(time1, time2) {
			    var offsetTime = Math.abs(time1 - time2);
			    return Math.floor(offsetTime / (3600 * 24 * 1e3));
			}
			var time =getOffsetDays((new Date(protime)).getTime(),Date.now());
			var html =time+"天";
			$(".retime").append(html);
	});
</script>

</body>

</html>