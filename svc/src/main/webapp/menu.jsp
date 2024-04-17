<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionName = (String) session.getAttribute("sessionName");
	
%>
	<script type="text/javascript">
		function checkBoardForm() {
			if (${sessionId==null}) {
				alert("로그인 해주세요.");
				return false;
			}
			location.href = "<c:url value="/BoardListAction.do?pageNum=1"/>"
		}
	</script>
		<div>
				<h1 id="namep"><a href="<c:url value="/welcome.jsp"/>">SVC</a></h1>
      			<input id="searchmain" type="text" placeholder="Search">
      			<button id="button2" type="submit">Search</button>
    		
			<nav id="menuall">
			
				<ul class="dr1">
					<c:choose>
						<c:when test="${empty sessionId}">
							<li><a href="<c:url value="/member/loginMember.jsp"/>">로그인</a></li>
						</c:when>
						<c:when test="${sessionId eq 'svc_rnd'}">
							<li>
								<a href="#">[<%=sessionName%>]&nbsp;님</a>
								<ul class="dr2">
									<li><a href="<c:url value="/member/loginMember.jsp"/>">회원관리</a></li>
									<li><a href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="#">[<%=sessionName%>]&nbsp;님</a>
								<ul class="dr2">
									<li><a href="<c:url value="/member/updateMember.jsp"/>">정보수정</a></li>
									<li><a href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
					
					<li>
						<a href="#">기업소개</a>
						<ul class="dr2">
							<li><a href="<c:url value="/company.jsp"/>">기업소개</a></li>
							<li><a href="<c:url value="/follow.jsp"/>">오시는길</a></li>
						</ul>
					</li>
					<li><a href="<c:url value="/movie.jsp"/>">사업소개</a></li>
					<li><a href="<c:url value="/products.jsp"/>">제품소개</a></li>
					<li>
						<a href="#">고객센터</a>
						<ul class="dr2">
							<li><a href="<c:url value="/board/comboard.jsp"/>">공지사항</a></li>
							<li><a href="#" onclick="checkBoardForm(); return false;">문의게시판</a></li>
						</ul>
					</li>
					
				</ul>
			</nav>
	</div>
