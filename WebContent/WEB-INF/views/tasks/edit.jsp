<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<c:choose>
			<c:when test="${task != null}">
				<h2>id : ${task.id } のタスク編集ページ</h2>

				<form method="POST" action="<c:url value='/update' />">
					<c:import url="../layout/_form.jsp" />
				<button type="submit">更新</button>
				</form>
                <br />

				<a href="#" onclick="confirmDestroy();">このタスクを削除する</a>
				<form method="POST" action="<c:url value='/destroy' />">
					<input type="hidden" name="_token" value="${_token}" />
				</form>
				<script>
					function confirmDestroy() {
						if (confirm("タスクを削除しますか？")) {
							document.forms[1].submit();
						}
					}
				</script>

				<p><a href="<c:url value='/index' />">タスク一覧に戻る</a></p>
			</c:when>
			<c:otherwise>
				<h2>お探しのデータは見つかりませんでした。</h2>
			</c:otherwise>
		</c:choose>
	</c:param>
</c:import>