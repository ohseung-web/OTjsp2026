<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="style/section.css" />
<section>
    <div id="section_wrap">
        <div class="word">HOME</div>
        <div class="content">
            <div class="carList">
                <c:forEach var="car" items="${call}">
                    <div class="carItem">
                        <!-- 자동차 이미지 출력 -->
                        <img src="img/${car.img}" alt="${car.carName}">
                        
                        <!-- 자동차 이름 출력 -->
                        <div class="carName">${car.carName}</div>
                        
                        <!-- 자동차 가격 출력 (천단위 콤마 및 '원' 문자열 결합) -->
                        <div class="carPrice">
                            <fmt:formatNumber value="${car.price}" pattern="#,###" />원
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

