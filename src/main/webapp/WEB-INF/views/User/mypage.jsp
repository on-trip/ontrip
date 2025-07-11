<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>On:trip</title>
    <link rel="icon" href="/Image/header/logo2.png" type="image/png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="/CSS/mypage.css"/>
    <link rel="stylesheet" href="/CSS/header.css">
	<script src="/JS/header.js"></script>
</head>
<body style="margin: 0; padding: 0;">
<%@ include file="../header.jsp" %>

<!-- 프로필 정보 영역 -->
<div class="profile-info">
    <div class="profile-avatar d-inline-flex justify-content-center align-items-center">
        <i class="bi bi-person-fill"></i>
    </div>
    <div>${sessionScope.loginUser.userNickname}님</div>
    <div>
        <a href="/user/profileSettings" class="text-primary text-decoration-none">
            프로필 관리 <i class="bi bi-gear-fill"></i>
        </a>
    </div>
</div>

<!-- 📝 작성 중인 일정 섹션 -->
<div class="table-container">
    <h4 class="mb-3">📝 작성 중인 여행 일정</h4>
    <table class="table table-hover">
        <thead class="table-light">
        <tr>
            <th>여행 지역</th>
            <th>여행 시작</th>
            <th>여행 종료</th>
            <th>작성일</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="schedule" items="${draftList}">
            <tr>
                <td>${schedule.destinationName}</td>
                <td>${schedule.scheduleStart}</td>
                <td>${schedule.scheduleEnd}</td>
                <td><fmt:formatDate value="${schedule.scheduleCreated}" pattern="yyyy.MM.dd HH:mm"/></td>
                <td>
                    <a href="/user/continueSchedule?scheduleNum=${schedule.scheduleNum}&userNum=${schedule.userNum}&destinationNum=${schedule.destinationNum}" class="btn btn-primary btn-sm">이어쓰기</a>
                    <form action="/user/deleteSchedule" method="post" style="display:inline;" onsubmit="return confirm('삭제하시겠습니까?');">
                        <input type="hidden" name="scheduleNum" value="${schedule.scheduleNum}">
                        <button class="btn btn-danger btn-sm" type="submit">삭제</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- ✅ 구분선 -->
<div class="section-divider"></div>

<!-- ✅ 완성된 일정 섹션 -->
<div class="table-container">
    <h4 class="mb-3">✅ 완료된 여행 일정</h4>
    <table class="table table-hover">
        <thead class="table-light">
        <tr>
            <th>여행 지역</th>
            <th>여행 시작</th>
            <th>여행 종료</th>
            <th>작성일</th>
            <th>미리보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="schedule" items="${completedList}">
            <tr>
                <td>${schedule.destinationName}</td>
                <td>${schedule.scheduleStart}</td>
                <td>${schedule.scheduleEnd}</td>
                <td><fmt:formatDate value="${schedule.scheduleCreated}" pattern="yyyy.MM.dd HH:mm"/></td>
                <td>
				    <a href="/aiPreview?scheduleNum=${schedule.scheduleNum}" class="btn btn-outline-info btn-sm">보기</a>
				    <form action="/user/deleteSchedule" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
				        <input type="hidden" name="scheduleNum" value="${schedule.scheduleNum}">
				        <button type="submit" class="btn btn-outline-danger btn-sm ms-1">삭제</button>
				    </form>
				</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
