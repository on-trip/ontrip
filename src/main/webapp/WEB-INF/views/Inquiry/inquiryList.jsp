<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<title>On:trip</title>
	<link rel="icon" href="/Image/header/logo2.png" type="image/png" />
	<link rel="stylesheet" href="/CSS/inquiryList.css">
	<link rel="stylesheet" href="/CSS/header.css">
	<script src="/JS/header.js"></script>
</head>
<body style="margin: 0; padding: 0;">
<%@ include file="../header.jsp" %>
<c:if test="${sessionScope.loginUser.userRole ne 'admin'}">

<div class="inquiry-list-container">
    <div style="display: flex; justify-content: space-between; align-items: center;">
        <h2>나의 문의 내역</h2>
        <a href="/inquiryWrite" class="write-button">문의 작성하기</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>제목</th>
                <th>상태</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiryList}">
                <tr>
                    <td>
                        <a href="/inquiryDetail?inquiryNum=${inquiry.inquiryNum}">
                            ${inquiry.inquiryTitle}
                        </a>
                    </td>
                    <td class="status">${inquiry.inquiryStatus}</td>
                    <td>${inquiry.inquiryTime.toString().substring(0,10)} ${inquiry.inquiryTime.toString().substring(11,16)}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</c:if>
</body>
</html>