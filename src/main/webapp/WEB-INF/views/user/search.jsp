<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 조회</title>
    <link rel="stylesheet" href="../resources/css/search.css">
</head>
<body>
    <h1>회원 조회</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>이름</th>
                <th>가입일</th>                    
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${nList}" var="user" varStatus="i">
                <tr>
                    <td>${i.count}</td>
                    <td>${user.userId}</td>
                    <td>${user.userNick}</td>
                    <td>${user.userName}</td>
                    <td>${user.userDate}</td>                    
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 검색 폼 -->
    <form action="/user/search.oc" method="get">
        <table>
            <tr>
                <td colspan="2">
                    <select name="searchCondition">
                        <option value="all" selected>전체</option>
                        <option value="userId">아이디</option>
                        <option value="userName">이름</option>
                        <option value="userPhone">휴대폰번호</option>
                    </select>
                    <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
                    <input type="submit" value="검색">
                </td>
            </tr>
        </table>
    </form>

   <!-- 페이지네이션 -->
<tfoot>
    <tr align="center">
        <td colspan="5">
            <c:if test="${pInfo.startNavi > 1}">
                <a href="/user/search.oc?page=${pInfo.startNavi - 1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}">[이전]</a>
            </c:if>
            <c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="p">
                <c:if test="${p eq currentPage}">
                    <strong>${p}</strong>
                </c:if>
                <c:if test="${p ne currentPage}">
                    <a href="/user/search.oc?page=${p}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}">${p}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pInfo.endNavi < pInfo.naviTotalCount}">
                <a href="/user/search.oc?page=${pInfo.endNavi + 1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}">[다음]</a>
            </c:if>
        </td>
    </tr>
</tfoot>
</body>
</html>