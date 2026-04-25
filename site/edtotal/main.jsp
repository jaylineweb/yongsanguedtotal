<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored='false' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://com.jeen/taglibs" prefix="jeen"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/string-1.1" prefix="str" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.icross.common.api.bundle.PopupDao" %>
<%@ page import="com.icross.common.model.bean.PopupBean" %>
<%@ page import="com.icross.site.util.SessionManager" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.icross.site.util.SessionManager"%>
<%@ page import="com.icross.common.api.bundle.PopupDao"%>
<%@ page import="com.icross.common.model.bean.PopupBean"%>
<%@ page import="com.icross.common.util.StringUtil"%>
<%@ page import="com.icross.common.util.CommonProjectInfo"%>
<%@ page import="com.icross.site.model.bean.EdtotalLessonBean"%>

<%-- <%@ page import="com.icross.common.util.WeekSearchList2"%> --%>
<%!
	String getToday(String strFmt){
		java.util.Date date = new java.util.Date();
		SimpleDateFormat dateFormatter = new SimpleDateFormat(strFmt, Locale.getDefault());
		return(dateFormatter.format(date));
	}

%>
<%
	//6월 30일 20시 ~ 24시 에러페이지이동
	Date now = new Date();
	String start = "202206302000";
	String end = "202207010000";

	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
	Date start_time = dateFormat.parse(start);
	Date end_time = dateFormat.parse(end);

	String requestURL = request.getRequestURL().toString();
	String ip = request.getRemoteAddr();

	if(now.getTime() >= start_time.getTime() && now.getTime() < end_time.getTime()) {
		if(!("203.142.217.230".equals(ip)) && !("203.142.217.231".equals(ip)) && !("203.142.217.240".equals(ip)) &&
		   !("203.142.217.241".equals(ip)) && !("211.253.60.18".equals(ip))   && !("211.253.60.34".equals(ip)) &&
		   !("211.253.60.49".equals(ip))   && !("211.253.60.65".equals(ip))   && !("202.14.90.168".equals(ip)) && !("112.220.85.26".equals(ip))){
			response.sendRedirect("https://www.yongsan.go.kr/cmmn/comming.html");
		}
		else{
			if(requestURL.contains("yedu.yongsan.go.kr")){
				response.sendRedirect("https://www.yongsan.go.kr/cmmn/comming.html");
			}
		}

	}

	String sitecdv = "S0000500";	// 교육종합포털 사이트 코드
	SessionManager sm = new SessionManager(session);
	int loginStatus = sm.getMemberLoginStatus();

	String strTITLE="용산구교육종합포털";

	java.util.Calendar cal = java.util.Calendar.getInstance();
	int year = cal.get(cal.YEAR);
	int month = cal.get(cal.MONTH) + 1;
	int day = cal.get(cal.DATE);
	String monthStr = "";
	String dayStr = "";

	if (month < 10){
		monthStr = "0" + Integer.toString(month);
	}else{
		monthStr = Integer.toString(month);
	}

	if (day < 10){
		dayStr = "0" + Integer.toString(day);
	}else{
		dayStr = Integer.toString(day);
	}

	String endDay = year+"-"+monthStr+"-"+dayStr;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes"/>
    <meta name="keywords" content="@@{siteInfo.siteKwrd}"/>
    <meta name="description" content="@@{siteInfo.siteDc}"/>
    <link rel="stylesheet" href="/site/edtotal/css/main.css?v0414">
    <script src="/site/edtotal/js/jquery-1.12.4.min.js?v0414"></script>
    <script src="/site/edtotal/js/plugins.js?v0414"></script>
    <script src="/site/edtotal/js/common.js?v0414"></script>
    <script src="/site/edtotal/js/main.js?v0414"></script>

	<title>용산구교육종합포털</title>
	<script>
		if (navigator.userAgent.indexOf('Trident') > -1) {
			$('html').addClass('ie');
		}
	</script>
</head>

<body id="${siteInfo.tmplatId}">
<div id="wrapper">

    <header id="header" class="header">
        <div class="accessibility">
            <a href="#contents">본문 바로가기</a>
        </div>

        <div class="gnb">
            <div class="wrap">
                <div class="site">
                    <ul class="site_list">
                        <li class="site_item n1">
                            <a href="https://www.yongsan.go.kr/portal/main/main.do" class="site_anchor">용산구청</a>
                            <div class="layer">
                                <ul class="mo_list">
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/portal/main/contents.do?menuNo=200003" class="mo_anchor">종합민원</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/portal/main/contents.do?menuNo=200054" class="mo_anchor">참여소통</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000022/list.do?menuNo=200107" class="mo_anchor">행정정보</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/portal/member/user/orgcht.do?menuNo=200203" class="mo_anchor">용산소개</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/portal/main/contents.do?menuNo=200272" class="mo_anchor">분야별 정보</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="site_item n2">
                            <a href="https://www.yongsan.go.kr/health/main/main.do" class="site_anchor">보건소</a>
                            <div class="layer">
                                <ul class="mo_list">
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300002" class="mo_anchor">보건소 소개</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/health/bbs/B0000111/list.do?menuNo=300011" class="mo_anchor">민원안내</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300030" class="mo_anchor">진료안내</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300045" class="mo_anchor">보건사업안내</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300111" class="mo_anchor">식품•공중위생</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/health/bbs/B0000114/list.do?menuNo=300132" class="mo_anchor">정보마당</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="site_item n3">
                            <a href="https://www.yongsan.go.kr/mayor/main/main.do" class="site_anchor">열린구청장실</a>
                            <div class="layer">
                                <ul class="mo_list">
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/mayor/main/contents.do?menuNo=400105" class="mo_anchor">박희영입니다</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/mayor/cvpl/cvplReqst/selectList.do?menuNo=400043" class="mo_anchor">소통과 참여</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/mayor/main/contents.do?menuNo=400099" class="mo_anchor">약속과 실천</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="site_item n4">
                            <a href="#n" class="site_anchor">부서동</a>
                            <div class="layer">
                                <div class="mo_list half">
                                    <div class="half_box left">
                                        <ul>
                                            <li>
                                                <p class="list_title">담당관</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020061" class="mo_anchor">감사담당관</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_title">기획조정실</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020196" class="mo_anchor">기획예산담당관</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020197" class="mo_anchor">미래전략담당관</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020198" class="mo_anchor">홍보담당관</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020199" class="mo_anchor">일자리정책담당관</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_title">행정지원국</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020170" class="mo_anchor">행정지원과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020131" class="mo_anchor">자치행정과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020200" class="mo_anchor">교육지원과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020190" class="mo_anchor">스마트정보과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020134" class="mo_anchor">민원여권과</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_title">문화경제국</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020201" class="mo_anchor">문화진흥과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020202" class="mo_anchor">관광체육과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020203" class="mo_anchor">지역경제과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020204" class="mo_anchor">재무과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020205" class="mo_anchor">세무관리과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020206" class="mo_anchor">세무1과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020207" class="mo_anchor">세무2과</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_title">생활지원국</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020208" class="mo_anchor">복지정책과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020209" class="mo_anchor">청소행정과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020210" class="mo_anchor">사회복지과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020211" class="mo_anchor">어르신청소년과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020212" class="mo_anchor">여성가족과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020213" class="mo_anchor">복지조사과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020214" class="mo_anchor">맑은환경과</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_title">도시관리국</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020076" class="mo_anchor">주택과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020116" class="mo_anchor">도시계획과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020154" class="mo_anchor">재정비사업과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020171" class="mo_anchor">건축과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020079" class="mo_anchor">공원녹지과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020215" class="mo_anchor">부동산정보과</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_title">안전건설교통국</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020157" class="mo_anchor">안전재난과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020140" class="mo_anchor">건설관리과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020141" class="mo_anchor">교통행정과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020158" class="mo_anchor">주차관리과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020172" class="mo_anchor">도로과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020159" class="mo_anchor">치수과</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <p class="list_title">보건소</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020173" class="mo_anchor">보건행정과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020085" class="mo_anchor">보건위생과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020174" class="mo_anchor">건강관리과</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020175" class="mo_anchor">보건의료과</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="half_box right">
                                        <ul>
                                            <li>
                                                <p class="list_title">동주민센터</p>
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=01" class="mo_anchor">후암동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=02" class="mo_anchor">용산2가동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=03" class="mo_anchor">남영동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=04" class="mo_anchor">청파동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=05" class="mo_anchor">원효로1동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=06" class="mo_anchor">원효로2동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=07" class="mo_anchor">효창동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=08" class="mo_anchor">용문동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=09" class="mo_anchor">한강로동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=10" class="mo_anchor">이촌1동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=11" class="mo_anchor">이촌2동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=12" class="mo_anchor">이태원1동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=13" class="mo_anchor">이태원2동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=14" class="mo_anchor">한남동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=15" class="mo_anchor">서빙고동</a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=16" class="mo_anchor">보광동</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="site_item n5"><a href="https://yedu.yongsan.go.kr/site/edtotal/index.jsp" class="site_anchor">교육포털</a></li>
                        <li class="site_item n6">
                            <a href="https://www.yongsan.go.kr/jachi/main/main.do" class="site_anchor">자치회관</a>
                            <div class="layer">
                                <ul class="mo_list">
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/jachi/main/contents.do?menuNo=500003" class="mo_anchor">자치회관 소개</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/jachi/main/contents.do?menuNo=500010" class="mo_anchor">주민자치위원회</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/jachi/pgm/pgmJachi/list.do?menuNo=500013" class="mo_anchor">프로그램 안내</a>
                                    </li>
                                    <li class="mo_list_item">
                                        <a href="https://www.yongsan.go.kr/jachi/bbs/B0000110/list.do?menuNo=500016" class="mo_anchor">공지사항</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="link">
                    <ul class="link_list">
                    <%if(loginStatus == SessionManager.USERIS_NOLOGIN) { %>
                         <li class="link_item login"><a href="javascript:void(0)" onclick="gotoUserLogin();" id="id_userLogin" class="link_anchor">로그인</a></li>
                      <%}else{%>
                         <li class="link_item login"><a href="/site/kr/member/logout.do?siteGubun=ED" id="id_userLogout" class="link_anchor">로그아웃</a></li>
                         <li class="link_item login"><a href="https://www.yongsan.go.kr/portal/cvpl/cvplReqst/myList.do?menuNo=200858" class="link_anchor">마이페이지</a></li>
                      <%}%>
                      <%if (loginStatus != SessionManager.USERIS_MEMBER) {%>
                         <li class="link_item join"><a href="https://www.yongsan.go.kr/portal/member/user/joinSelect.do?menuNo=200819" class="link_anchor">회원가입</a></li>
                      <%}%>
                    </ul>
                </div>
                <div class="group">
                    <div class="logo">
                        <a href="https://yedu.yongsan.go.kr/site/edtotal/index.jsp" class="logo_anchor">
                            <img src="/site/edtotal/images/common/logo.png" alt="로고">
                            <span class="logo_text">용산구교육종합포털 <em>글로벌 평생학습도시 용산</em></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="lnb">
            <div class="menu_show">
                <button type="button" class="menu_btn">주메뉴 열기</button>
            </div>
            <nav class="menu after eachdown">
                <h2 class="skip">주메뉴</h2>
                <div class="menu_header">
                    <div class="link">
                    <ul class="link_list">
                    <%if(loginStatus == SessionManager.USERIS_NOLOGIN) { %>
                         <li class="link_item login"><a href="javascript:void(0)" onclick="gotoUserLogin();" id="id_userLogin" class="link_anchor">로그인</a></li>
                      <%}else{%>
                         <li class="link_item login"><a href="/site/kr/member/logout.do?siteGubun=ED" id="id_userLogout" class="link_anchor">로그아웃</a></li>
                         <li class="link_item login"><a href="https://www.yongsan.go.kr/portal/cvpl/cvplReqst/myList.do?menuNo=200858" class="link_anchor">마이페이지</a></li>
                      <%}%>
                      <%if (loginStatus != SessionManager.USERIS_MEMBER) {%>
                         <li class="link_item join"><a href="https://www.yongsan.go.kr/portal/member/user/joinSelect.do?menuNo=200819" class="link_anchor">회원가입</a></li>
                      <%}%>
                    </ul>
                    </div>
                    <div class="top_sns">
                        <ul class="sns_list">
                            <li class="sns_item n1"><a href="https://www.facebook.com/yongsanFB" class="sns_anchor">페이스북</a></li>
                            <li class="sns_item n2"><a href="https://www.twitter.com/yongsangu" class="sns_anchor">엑스</a></li>
                            <li class="sns_item n3"><a href="http://blog.naver.com/ysnblog" class="sns_anchor">블로그</a></li>
                        </ul>
                    </div>
                </div>

                <div class="mobile_tab">
                    <ul class="tab_list">
                        <li class="tab_btn_item active">
                            <button class="tab_btn" title="선택됨">메뉴<i class="xi xi-check"></i></button>
                        </li>
                        <li class="tab_btn_item">
                            <button class="tab_btn">패밀리사이트<i class="xi xi-check"></i></button>
                        </li>
                    </ul>
                </div>
                <div class="tab_panel_wrap">
                    <div class="tab_item n1 wrap active">
                        <div class="depth depth1"><!-- 차수에 맞는 숫자와 조합하여 클래스를 넣어주세요 (예 : depth#, depth#_#) -->
                            <ul class="depth_list depth1_list cut">
                                <li class="depth_item depth1_item active"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                    <a href="/pms/contents/contents.do?contseqn=2069&sitecdv=S0000500&menucdv=01070000&decorator=user27EdTotal" target="_self" class="depth_text depth1_text">평생학습 사업소개</a>
                                    <div class="depth depth2">
                                        <div class="depth2_content">
                                            <ul class="depth_list depth2_list cut">
                                                <li class="depth_item depth2_item active"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                                    <a href="/pms/contents/contents.do?contseqn=2069&sitecdv=S0000500&menucdv=01070000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">비전/주요사업</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=1916&sitecdv=S0000500&menucdv=01020000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">용산구 평생교육진흥 조례</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=2193&sitecdv=S0000500&menucdv=01090000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">용산구평생학습관 소개</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=1520&sitecdv=S0000500&menucdv=01050000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">찾아오시는길</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li class="depth_item depth1_item">
                                    <a href="/pms/contents/contents.do?contseqn=1521&sitecdv=S0000500&decorator=user27EdTotal&menucdv=02010000" target="_self" class="depth_text depth1_text">수강신청</a>
                                    <div class="depth depth2">
                                        <div class="depth2_content">
                                            <ul class="depth_list depth2_list cut">
                                                <li class="depth_item depth2_item active"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                                    <a href="/pms/contents/contents.do?contseqn=1521&sitecdv=S0000500&menucdv=02010000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">수강신청안내</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">수강신청</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/site/edtotal/lifeStudy/userlist.do?sitecdv=S0000500&menucdv=02070000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">용산구평생학습관 수강신청</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/site/edtotal/eachOther/userlist.do?sitecdv=S0000500&menucdv=02040000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">서로서로학교 수강신청</a>
                                                    <div class="depth depth3">
                                                        <ul class="depth_list depth3_list">
                                                            <li class="depth_item depth3_item">
                                                                <a href="/site/edtotal/eachOther/userlist.do?sitecdv=S0000500&menucdv=02040100&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">수강신청</a>
                                                            </li>
                                                            <li class="depth_item depth3_item">
                                                                <a href="/pms/contents/contents.do?contseqn=2156&sitecdv=S0000500&menucdv=02040200&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">MOVE 신청</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/site/edtotal/happyStudy/userlist.do?sitecdv=S0000500&menucdv=02060000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">용산형 동네배움터 수강신청</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/site/edtotal/member/list.do?sitecdv=S0000500&menucdv=02030000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">나의 신청강좌</a>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li class="depth_item depth1_item">
                                    <a href="/pms/contents/contents.do?contseqn=1524&sitecdv=S0000500&decorator=user27EdTotal&menucdv=03010000" target="_self" class="depth_text depth1_text">평생학습네트워크</a>
                                    <div class="depth depth2">
                                        <div class="depth2_content">
                                            <ul class="depth_list depth2_list cut">
                                                <li class="depth_item depth2_item active"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                                    <a href="/pms/contents/contents.do?contseqn=1524&sitecdv=S0000500&menucdv=03010000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">학습동아리</a>
                                                    <div class="depth depth3">
                                                        <ul class="depth_list depth3_list">
                                                            <li class="depth_item depth3_item active"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                                                <a href="/pms/contents/contents.do?contseqn=1524&sitecdv=S0000500&menucdv=03010100&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">학습동아리란</a>
                                                            </li>
                                                            <li class="depth_item depth3_item">
                                                                <a href="/site/edtotal/club/list.do?sitecdv=S0000500&menucdv=03010200&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">학습동아리 현황</a>
                                                            </li>
                                                            <li class="depth_item depth3_item">
                                                                <a href="/site/edtotal/club/form.do?sitecdv=S0000500&menucdv=03010300&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">학습동아리 등록</a>
                                                            </li>
                                                            <li class="depth_item depth3_item">
                                                                <a href="/site/edtotal/clubRoom/form.do?sitecdv=S0000500&menucdv=03010500&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">용산구평생학습관<br>학습동아리실 사용신청</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=1884&sitecdv=S0000500&menucdv=03020000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">서로서로학교 재능기부</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=2244&sitecdv=S0000500&menucdv=03110000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">배달강좌안내</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=1527&sitecdv=S0000500&menucdv=03040000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">강사은행</a>
                                                    <div class="depth depth3">
                                                        <ul class="depth_list depth3_list">
                                                            <li class="depth_item depth3_item active"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                                                <a href="/pms/contents/contents.do?contseqn=1527&sitecdv=S0000500&menucdv=03040100&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">강사은행이란</a>
                                                            </li>
                                                            <li class="depth_item depth3_item">
                                                                <a href="/site/edtotal/instructor/list.do?sitecdv=S0000500&menucdv=03040200&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">강사정보</a>
                                                            </li>
                                                            <li class="depth_item depth3_item">
                                                                <a href="/site/edtotal/instructor/form.do?sitecdv=S0000500&menucdv=03040300&decorator=user27EdTotal" target="_self" class="depth_text depth3_text">강사등록신청</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=2097&sitecdv=S0000500&menucdv=03050000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">평생학습 홍보단 평생온 신청</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/contents/contents.do?contseqn=2249&sitecdv=S0000500&menucdv=03120000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">용산형 동네배움터</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/site/edtotal/institution/list.do?keyGubun=1&sitecdv=S0000500&menucdv=03100000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">평생학습기관 현황</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="https://www.yslibrary.or.kr/intro/index.do" target="_blank" title="새창" class="depth_text depth2_text">도서관현황</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/site/edtotal/institution/list.do?keyGubun=2&sitecdv=S0000500&menucdv=03090000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">학교교육 현황</a>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li class="depth_item depth1_item">
                                    <a href="/pms/board/list.do?boardidn=1024&sitecdv=S0000500&decorator=user27EdTotal&menucdv=04010000" target="_self" class="depth_text depth1_text">알림마당</a>
                                    <div class="depth depth2">
                                        <div class="depth2_content">
                                            <ul class="depth_list depth2_list cut">
                                                <li class="depth_item depth2_item active"> <!-- 선택된 메뉴에 active 클래스 넣어주세요-->
                                                    <a href="/pms/board/list.do?boardidn=1024&sitecdv=S0000500&menucdv=04010000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">공지사항</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/board/list.do?boardidn=1061&sitecdv=S0000500&menucdv=04080000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">타기관소식</a>
                                                </li>
                                                <li class="depth_item depth2_item">
                                                    <a href="/pms/board/list.do?boardidn=1067&sitecdv=S0000500&menucdv=04100000&decorator=user27EdTotal" target="_self" class="depth_text depth2_text">평생학습 생생 소식</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div> 
                    </div>
                    <div class="tab_item n2 wrap">
                        <ul class="m_goto">
                            <li class="goto_item">
                                <button type="button" class="goto_btn" title="목록닫기">용산구청</button>
                                <div class="layer">
                                    <ul class="mo_list">
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/portal/main/main.do" class="mo_anchor depth2"><em>용산구청</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/portal/main/contents.do?menuNo=200003" class="mo_anchor depth2"><em>종합민원</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/portal/main/contents.do?menuNo=200054" class="mo_anchor depth2"><em>참여소통</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/portal/bbs/B0000022/list.do?menuNo=200107" class="mo_anchor depth2"><em>행정정보</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/portal/member/user/orgcht.do?menuNo=200203" class="mo_anchor depth2"><em>용산소개</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/portal/main/contents.do?menuNo=200272" class="mo_anchor depth2"><em>분야별 정보</em></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="goto_item">
                                <button type="button" class="goto_btn" title="목록열기">보건소</button>
                                <div class="layer">
                                    <ul class="mo_list">
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/health/main/main.do" class="mo_anchor depth2"><em>보건소</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300002" class="mo_anchor depth2"><em>보건소 소개</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/health/bbs/B0000111/list.do?menuNo=300011" class="mo_anchor depth2"><em>민원안내</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300030" class="mo_anchor depth2"><em>진료안내</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300045" class="mo_anchor depth2"><em>보건사업안내</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/health/main/contents.do?menuNo=300111" class="mo_anchor depth2"><em>식품•공중위생</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/health/bbs/B0000114/list.do?menuNo=300132" class="mo_anchor depth2"><em>정보마당</em></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="goto_item">
                                <button type="button" class="goto_btn" title="목록열기">열린구청장실</button>
                                <div class="layer">
                                    <ul class="mo_list">
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/mayor/main/main.do" class="mo_anchor depth2"><em>열린구청장실</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/mayor/main/contents.do?menuNo=400061" class="mo_anchor depth2"><em>박희영입니다</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/mayor/cvpl/cvplReqst/selectList.do?menuNo=400043" class="mo_anchor depth2"><em>소통과 참여</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/mayor/main/contents.do?menuNo=400020" class="mo_anchor depth2"><em>약속과 실천</em></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="goto_item">
                                <button type="button" class="goto_btn" title="목록열기">부서동</button>
                                <div class="layer">
                                    <ul>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>담당관</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020061" class="mo_anchor"><em>감사담당관</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>기획조정실</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020196" class="mo_anchor"><em>기획예산담당관</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020197" class="mo_anchor"><em>미래전략담당관</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020198" class="mo_anchor"><em>홍보담당관</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020199" class="mo_anchor"><em>일자리정책담당관</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>행정지원국</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020170" class="mo_anchor"><em>행정지원과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020131" class="mo_anchor"><em>자치행정과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020200" class="mo_anchor"><em>교육지원과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020190" class="mo_anchor"><em>스마트정보과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020134" class="mo_anchor"><em>민원여권과</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>문화경제국</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020201" class="mo_anchor"><em>문화진흥과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020202" class="mo_anchor"><em>관광체육과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020203" class="mo_anchor"><em>지역경제과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020204" class="mo_anchor"><em>재무과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020205" class="mo_anchor"><em>세무관리과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020206" class="mo_anchor"><em>세무1과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020207" class="mo_anchor"><em>세무2과</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>생활지원국</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020208" class="mo_anchor"><em>복지정책과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020209" class="mo_anchor"><em>청소행정과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020210" class="mo_anchor"><em>사회복지과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020211" class="mo_anchor"><em>어르신청소년과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020212" class="mo_anchor"><em>여성가족과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020213" class="mo_anchor"><em>복지조사과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020214" class="mo_anchor"><em>맑은환경과</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>도시관리국</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020076" class="mo_anchor"><em>주택과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020116" class="mo_anchor"><em>도시계획과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020154" class="mo_anchor"><em>재정비사업과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020171" class="mo_anchor"><em>건축과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020079" class="mo_anchor"><em>공원녹지과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020215" class="mo_anchor"><em>부동산정보과</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>안전건설교통국</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020157" class="mo_anchor"><em>안전재난과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020140" class="mo_anchor"><em>건설관리과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020141" class="mo_anchor"><em>교통행정과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020158" class="mo_anchor"><em>주차관리과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020172" class="mo_anchor"><em>도로과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020159" class="mo_anchor"><em>치수과</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>보건소</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020173" class="mo_anchor"><em>보건행정과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020085" class="mo_anchor"><em>보건위생과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020174" class="mo_anchor"><em>건강관리과</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/portal/bbs/B0000186/deptGdc.do?menuNo=200844&amp;deptId=3020175" class="mo_anchor"><em>보건의료과</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="goto_item_depth2">
                                            <button type="button" class="goto_btn_2" title="목록열기"><em>동주민센터</em></button>
                                            <div class="layer">
                                                <ul class="mo_depth3_list">
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=01" class="mo_anchor"><em>후암동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=02" class="mo_anchor"><em>용산2가동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=03" class="mo_anchor"><em>남영동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=04" class="mo_anchor"><em>청파동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=05" class="mo_anchor"><em>원효로1동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=06" class="mo_anchor"><em>원효로2동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=07" class="mo_anchor"><em>효창동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=08" class="mo_anchor"><em>용문동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=09" class="mo_anchor"><em>한강로동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=10" class="mo_anchor"><em>이촌1동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=11" class="mo_anchor"><em>이촌2동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=12" class="mo_anchor"><em>이태원1동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=13" class="mo_anchor"><em>이태원2동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=14" class="mo_anchor"><em>한남동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=15" class="mo_anchor"><em>서빙고동</em></a>
                                                    </li>
                                                    <li class="mo_list_item depth3">
                                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=16" class="mo_anchor"><em>보광동</em></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="goto_item">
                                <button type="button" class="goto_btn" title="목록열기">자치회관</button>
                                <div class="layer">
                                    <ul class="mo_list">
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/jachi/main/main.do" class="mo_anchor"><em>자치회관</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/jachi/main/contents.do?menuNo=500003" class="mo_anchor"><em>자치회관 소개</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/jachi/main/contents.do?menuNo=500010" class="mo_anchor"><em>주민자치위원회</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/jachi/pgm/pgmJachi/list.do?menuNo=500013" class="mo_anchor"><em>프로그램 안내</em></a>
                                        </li>
                                        <li class="mo_list_item">
                                            <a href="https://www.yongsan.go.kr/jachi/bbs/B0000110/list.do?menuNo=500016" class="mo_anchor"><em>공지사항</em></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="menu_hide">
                    <button type="button" class="menu_btn">주메뉴 닫기</button>
                </div>
            </nav>
        </div>

        <div class="shortcut">
            <div class="wrap">
                <div class="shrotcut_wrap">
                    <div class="shortcut_item mypage"><a href="/site/edtotal/member/list.do?sitecdv=S0000500&amp;menucdv=02030000&amp;decorator=user27EdTotal" class="shortcut_anchor">나의 신청강좌</a></div>
                    <div class="shortcut_item sitemap">
                        <button type="button" class="shortcut_anchor sitemap_open" title="사이트맵 열기">사이트맵</button>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="sitemap_wrap">
        <div class="sitemap_box">
            <div class="sitemap_title">전체메뉴</div>
            <div class="sitemap_list">
                <div class="inner_box">
                    <div class="sitemap1_item">
                        <a href="/pms/contents/contents.do?contseqn=2069&sitecdv=S0000500&menucdv=01070000&decorator=user27EdTotal" class="sitemap1_anchor">평생학습 사업 소개</a>
                        <ul class="sitemap2_list">
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=2069&sitecdv=S0000500&menucdv=01070000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">비전/주요사업</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=1916&sitecdv=S0000500&menucdv=01020000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">용산구 평생교육진흥 조례</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=2193&sitecdv=S0000500&menucdv=01090000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">용산구평생학습관 소개</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=1520&sitecdv=S0000500&menucdv=01050000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">찾아오시는길</a>
                            </li>
                        </ul>
                    </div>
                    <div class="sitemap1_item">
                        <a href="/pms/contents/contents.do?contseqn=1521&sitecdv=S0000500&decorator=user27EdTotal&menucdv=02010000" class="sitemap1_anchor">수강신청</a>
                        <ul class="sitemap2_list">
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=1521&sitecdv=S0000500&menucdv=02010000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">수강신청안내</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">수강신청</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/site/edtotal/lifeStudy/userlist.do?sitecdv=S0000500&menucdv=02070000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">용산구평생학습관 수강신청</a>
                            </li>
                            <li class="sitemap2_item has">
                                <a href="/site/edtotal/eachOther/userlist.do?sitecdv=S0000500&menucdv=02040000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">서로서로학교 수강신청</a>
                                <ul class="sitemap3_list">
                                    <li class="sitemap3_item">
                                        <a href="/site/edtotal/eachOther/userlist.do?sitecdv=S0000500&menucdv=02040100&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">수강신청</a>
                                    </li>
                                    <li class="sitemap3_item">
                                        <a href="/pms/contents/contents.do?contseqn=2156&sitecdv=S0000500&menucdv=02040200&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">MOVE 신청</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/site/edtotal/happyStudy/userlist.do?sitecdv=S0000500&menucdv=02060000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">용산형 동네배움터 수강신청</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/site/edtotal/member/list.do?sitecdv=S0000500&menucdv=02030000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">나의 신청강좌</a>
                            </li>
                        </ul>
                    </div>
                    <div class="sitemap1_item">
                        <a href="/pms/contents/contents.do?contseqn=1524&sitecdv=S0000500&decorator=user27EdTotal&menucdv=03010000" class="sitemap1_anchor">평생학습 네트워크</a>
                        <ul class="sitemap2_list">
                            <li class="sitemap2_item has">
                                <a href="/pms/contents/contents.do?contseqn=1524&sitecdv=S0000500&menucdv=03010000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">학습동아리</a>
                                <ul class="sitemap3_list">
                                    <li class="sitemap3_item">
                                        <a href="/pms/contents/contents.do?contseqn=1524&sitecdv=S0000500&menucdv=03010100&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">학습동아리란</a>
                                    </li>
                                    <li class="sitemap3_item">
                                        <a href="/site/edtotal/club/list.do?sitecdv=S0000500&menucdv=03010200&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">학습동아리 현황</a>
                                    </li>
                                    <li class="sitemap3_item">
                                        <a href="/site/edtotal/club/form.do?sitecdv=S0000500&menucdv=03010300&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">학습동아리 등록</a>
                                    </li>
                                    <li class="sitemap3_item">
                                        <a href="/site/edtotal/clubRoom/form.do?sitecdv=S0000500&menucdv=03010500&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">용산구평생학습관 학습동아리실 사용신청</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=1884&sitecdv=S0000500&menucdv=03020000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">서로서로학교 재능기부</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=2244&sitecdv=S0000500&menucdv=03110000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">배달강좌안내</a>
                            </li>
                            <li class="sitemap2_item has">
                                <a href="/pms/contents/contents.do?contseqn=1527&sitecdv=S0000500&menucdv=03040000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">강사은행</a>
                                <ul class="sitemap3_list">
                                    <li>
                                        <a href="/pms/contents/contents.do?contseqn=1527&sitecdv=S0000500&menucdv=03040100&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">강사은행이란</a>
                                    </li>
                                    <li>
                                        <a href="/site/edtotal/instructor/list.do?sitecdv=S0000500&menucdv=03040200&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">강사정보</a>
                                    </li>
                                    <li>
                                        <a href="/site/edtotal/instructor/form.do?sitecdv=S0000500&menucdv=03040300&decorator=user27EdTotal" target="_self" class="sitemap3_anchor">강사등록신청</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=2097&sitecdv=S0000500&menucdv=03050000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">평생학습 홍보단 평생온 신청</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/contents/contents.do?contseqn=2249&sitecdv=S0000500&menucdv=03120000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">용산형 동네배움터</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/site/edtotal/institution/list.do?keyGubun=1&sitecdv=S0000500&menucdv=03100000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">평생학습기관 현황</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="https://www.yslibrary.or.kr/intro/index.do" target="_blank" title="새창" class="sitemap2_anchor"><span>도서관현황</span></a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/site/edtotal/institution/list.do?keyGubun=2&sitecdv=S0000500&menucdv=03090000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">학교교육 현황</a>
                            </li>
                        </ul>
                    </div>
                    <div class="sitemap1_item">
                        <a href="/pms/board/list.do?boardidn=1024&sitecdv=S0000500&decorator=user27EdTotal&menucdv=04010000" class="sitemap1_anchor">알림마당</a>
                        <ul class="sitemap2_list">
                            <li class="sitemap2_item">
                                <a href="/pms/board/list.do?boardidn=1024&sitecdv=S0000500&menucdv=04010000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">공지사항</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/board/list.do?boardidn=1061&sitecdv=S0000500&menucdv=04080000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">타기관소식</a>
                            </li>
                            <li class="sitemap2_item">
                                <a href="/pms/board/list.do?boardidn=1067&sitecdv=S0000500&menucdv=04100000&decorator=user27EdTotal" target="_self" class="sitemap2_anchor">평생학습 생생 소식</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <button type="button" class="sitemap_close"><span><em>주요사이트 레이어 닫기</em></span></button>
        </div>
    </div>

    <div id="container">
        <main>
            <div class="rowgroup1">
                <div class="wrap">
                    <section class="visual">
                        <h2 class="skip">메인비주얼</h2>
                        <div class="visual_list">

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260402.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/happyStudy/userlist.do?sitecdv=S0000500&menucdv=02060000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260402.jpg" alt="동네에서 만나는 배움의 기쁨 「2026년 용산형 동네배움터 3기」수강생 모집
                                    모집기간 : 2026.4. 8.(수) 9시 ~ 4. 17.(금) 18시까지
                                    교육일정 : 2026.5. 6.(수) ~ 6. 29.(월)
                                    프로그램 : 시니어보드게임지도사 자격과정, 약선&꽃차, 감정 스피치, 마음 챙김 명상
                                    수강료 : 무료(재료비 별도)
                                    교육장소 : 프로그램별 상이
                                    모집인원 : 용산구민 8~15명
                                    선발방법 : 동 주민· 신규 수강생 우선 선발
                                    상세내용은 신청 페이지에서 확인해 주세요.
                                    접수문의 : 02-2199-649">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260330_01.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260330_01.jpg" alt="김세중미술관 문화예술특강 『한국　여성　조각의　흐름－Artist Talk』 수강신청 안내
                                    - 일시 : ４.1６.(목)／ ４.２３.(목)／ ４.2８.(화) 14:00~16:00（총3회, 강좌별 각각 신청）
                                    - 장소 : 김세중미술관 1층 예술의 기쁨 홀(용산구 효창원로 70길 35)
                                    - 대상 : 강좌별 각 용산구민 ４0명
                                    - 수강료 : 무료
                                    - 접수기간 : 202６. ３. ２３(월) ~ ４. １０.(금) 18:00 까지">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260406_01.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260406_01.jpg" alt="『원데이 달빛 베이킹』수강신청 안내
                                    - 기 간 : 2026. 5. 7./ 5. 28. (목 18:30~21:30, 원데이클래스)
                                    - 장 소 : 용산구 여성플라자 요리교실 (이태원로224-19, 3층)
                                    - 대 상 : 용산구민 16명 내외
                                    - 내 용 : 인기있는 디저트를 배우는 시간
                                    - 수강료 : 5천원 (재료비: 회차별 상이)
                                    - 접수방법 : 인터넷 접수(용산구교육종합포털 - 수강신청)
                                    - 접수기간
                                    - 치즈케이크 : 2026. 4. 20.(월) ~ 4. 27.(월) 18:00 까지
                                    - 에그타르트 : 2026. 5. 11.(월) ~ 5. 18.(월) 18:00 까지
                                    수강신청 바로가기">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260406_02.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260406_02.jpg" alt="『나만의 굿즈 만들기 : 도자기 키링 클래스』
                                    수강신청 안내
                                    - 기 간 : 2026. 5. 19. (화 19:00~21:00, 원데이 클래스)
                                    - 장 소 : 용산50플러스센터 손땀공방 (이태원로224-19, 2층)
                                    - 대 상 : 용산구민 16명 내외
                                    - 내 용 : 세상에 하나뿐인 도자기 키링 만들기 체험 프로그램
                                    - 수강료 : 5천원 (재료비: 15,000원 별도)
                                    - 접수방법 : 인터넷 접수(용산구교육종합포털 - 수강신청)
                                    - 접수기간 : 2025. 4. 24.(금) ~ 5. 5.(화) 18:00 까지
                                    수강신청 바로가기">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260406_03.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260406_03.jpg" alt="『건강한 먹거리: 비건 베이킹』수강신청 안내
                                    - 기 간 : 2026. 5. 14.~ 6. 4. (목 14:30~17:30, 주1회/ 총4회)
                                    - 장 소 : 용산구 여성플라자 요리교실 (이태원로224-19, 3층)
                                    - 대 상 : 용산구민 16명 내외
                                    - 내 용 : 식물성 재료로 만드는 담백, 고소한 비건 베이킹
                                    - 수강료 : 1만원 (재료비: 48,000원 별도)
                                    - 접수방법 : 인터넷 접수(용산구교육종합포털 - 수강신청)
                                    - 접수기간 : 2025. 4. 24.(금) ~ 5. 5.(화) 18:00 까지
                                    수강신청 바로가기">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260407.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260407.jpg" alt="전달력있는 스피치 화법 수강신청 안내
                                    - 기 간 : 2026. 5. 11.~ 7. 6. (월 14:00~16:00, 주1회/ 총8회)
                                    - 장 소 : 용산구평생학습관 배움1실 (이태원로224-19, 2층)
                                    - 대 상 : 용산구민 16명 내외
                                    - 내 용 : 수강생 개개인의 스피치 스타일을 파악해 전달력있는 스피치 화법 배우기
                                    - 수강료 : 1만원
                                    - 접수방법 : 인터넷 접수(용산구교육종합포털 - 수강신청)
                                    - 접수기간 : 2026. 4. 24.(금) ~ 5. 5.(화) 18:00 까지
                                    수강신청 바로가기">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260410.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260410.jpg" alt="『하루 완성, 코바늘 원데이 클래스』수강신청 안내
                                    - 기 간 : 2026. 5. 13./ 5. 20./ 5. 27.
                                    (수 10:00~12:00, 원데이 클래스)
                                    - 장 소 : 용산50플러스센터 손땀공방 (이태원로224-19, 2층)
                                    - 대 상 : 용산구민 12명 내외
                                    - 내 용 : 실생활에 활용도 높은 코바늘 작품 원데이 클래스
                                    - 수강료 : 5천원 (재료비: 10,000원 별도/ 회차별 납부)
                                    - 접수방법 : 인터넷 접수(용산구교육종합포털 - 수강신청)
                                    - 접수기간 : 2025. 4. 24.(금) ~ 5. 5.(화) 18:00 까지
                                    수강신청 바로가기">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260304.jpg')">
                                <a href="https://50plus.or.kr/ysc" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260304.jpg" alt="배움으로 다시 채우고, 내일의 나를 만나다
                                    용산50플러스센터 수강신청 안내
                                    - 운영 장소: 용산50플러스센터(용산구 이태원로 224-19, 한남동 공영주차장 2층)
                                    - 접수강좌: 인생설계, 일활동 프로그램 등 ">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_260223.jpg')">
                                <a href="https://yedu.yongsan.go.kr/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_260223.jpg" alt="용산구평생학습관 재개관 안내
                                    재개관일 : 2026. 3. 3.(화) 오전 9시
                                    용산구평생학습관을 아끼고 사랑해 주시는 구민 여러분께 감사드립니다.
                                    보다 안전하고 쾌적한 학습 환경 조성을 위해 실시한 시설 리모델링 공사를 마치고 용산구평생학습관이 재개관합니다. 리모델링 기간 동안 보내주신 구민 여러분의 이해와 협조에 깊이 감사드리며, 앞으로 더 많은 관심과 참여를 부탁드립니다.
                                    감사합니다.
                                    문의 : 용산구평생학습관 02-2199-6490">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets04/images/main/banner_img195.png')">
                                <a href="https://www.yongsan.go.kr/portal/sms/smsRunnReqst/smsApplyReg.do?menuNo=201272" class="visual_anchor">
                                    <img src="/site/edtotal/assets04/images/main/banner_img195.png" alt="용산구 교육정보가 궁금하다면?
                                      용산구 교육정보를 편하고 빠르게 받아볼 수 있는 용산 러닝톡을 신청하세요!
                                      용산 러닝톡
                                      Learning
                                      talk
                                      용산 러닝톡
                                      용산 러닝톡 도착
                                      용산구 교육 일정
                                      수강신청 일정 안내
                                      용산구 교육 프로그램
                                      진로·진학, 평생학습, 멘토링, 방학중 프로그램 등 교육 소개
                                      용산구
                                      교육기관
                                      평생학습관, 도서관 등
                                      교육기관 정보 제공
                                      신청방법
                                      QR코드 스캔(온라인 신청) 또는
                                      용산구청 홈페이지 접속
                                      ▶용산 소개 구정홍보 용산 러닝톡 신청
                                      문의
                                      교육지원과 02-2199-6470">
                                </a>
                            </div>

                            <div class="visual_item" style="background-image:url('/site/edtotal/assets2024/img/banner_img02.png')">
                                <a target="_blank" rel="noreferrer" title="새창" class="visual_anchor">
                                    <img src="/site/edtotal/assets2024/img/banner_img02.png" alt="용산구교육종합포털에 방문하신 것을 환영합니다">
                                </a>
                            </div>
                            <div class="visual_item" style="background-image:url('/site/edtotal/assets2024/img/banner_img03.png')">
                                <a href="/site/edtotal/club/form.do?sitecdv=S0000500&menucdv=03010300&decorator=user27EdTotal" class="visual_anchor">
                                    <img src="/site/edtotal/assets2024/img/banner_img03.png" alt="『용산구 학습동아리』 등록 안내
                                    용산구민의 주체적인 평생학습 문화 조성을 위해 학습동아리 등록을 받고 있습니다.
                                    □ 학습동아리란 : 자발적으로 모인 7명 이상의 용산구 성인학습자들이 정기1적으로 만나  토론과 학습을 진행하는 공동체 (사교, 친목, 영리 목적 불가)
                                    □ 학습동아리 등록
                                    - 등록대상 : 용산구에서 활동하고 있는 학습동아리 (용산구민 7명 필수)
                                    - 등록내용 : 동아리명, 활동분야, 모임장소, 설립목적, 동아리소개, 활동사진 등
                                    - 등록방법 : 용산구교육종합포털 → 학습네트워크 → 동아리 등록하기
                                    □ 학습동아리 지원
                                    - 용산구교육종합포털에 등록된 학습동아리 대상으로 공모 후 선정지원
                                    - 학습동아리 활동 공간(용산구평생학습관 동아리실) 지원">
                                </a>
                            </div>
                        </div>
                        <div class="visual_control">
                            <span class="visual_num">
                                <span class="visual_current"></span>
                                <span class="slash">/</span>
                                <span class="visual_total"></span>
                            </span>
                            <button type="button" class="visual_btn visual_prev">이전보기</button>
                            <button type="button" class="visual_btn visual_auto">정지</button>
                            <button type="button" class="visual_btn visual_next">다음보기</button>
                        </div>
                    </section>
                    <section class="goto">
                        <div class="service goto_item">
                            <p class="goto_title">자주 찾는 서비스</p>
                            <ul class="service_list">
                                <li class="service_item">
                                <%if(loginStatus == SessionManager.USERIS_NOLOGIN) { %>
                                     <a href="javascript:void(0)" onclick="gotoUserLogin();" id="id_userLogin" class="service_anchor">로그인</a>
                                  <%}else{%>
                                     <a href="/site/kr/member/logout.do?siteGubun=ED" id="id_userLogout" target="_blank" rel="noreferrer" title="새창" class="service_anchor">로그아웃</a>
                                  <%}%>
                                </li>
                                <li class="service_item">
                                    <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal" target="_blank" title="새창" class="service_anchor">수강신청</a>
                                </li>
                                <li class="service_item">
                                    <a href="/pms/contents/contents.do?contseqn=1521&sitecdv=S0000500&menucdv=02010000&decorator=user27EdTotal" target="_blank" title="새창" class="service_anchor">수강신청안내</a>
                                </li>
                                <li class="service_item">
                                    <a href="https://www.yslibrary.or.kr/intro/index.do" target="_blank" title="새창" class="service_anchor">용산구립도서관</a>
                                </li>
                                <li class="service_item">
                                    <a href="/pms/contents/contents.do?contseqn=2244&sitecdv=S0000500&menucdv=03110000&decorator=user27EdTotal" target="_blank" title="새창" class="service_anchor">용산배달강좌</a>
                                </li>
                                <li class="service_item">
                                    <a href="/pms/contents/contents.do?contseqn=1524&sitecdv=S0000500&menucdv=03010100&decorator=user27EdTotal" target="_blank" title="새창" class="service_anchor">학습동아리 안내</a>
                                </li>
                                <li class="service_item">
                                    <a href="/site/edtotal/ebook/202603/index.html" target="_blank" title="새창" class="service_anchor">평생학습 프로그램 <br> e-book</a>
                                </li>
                                <li class="service_item">
                                    <a href="https://www.yongsan.go.kr/portal/sms/smsRunnReqst/smsApplyReg.do?menuNo=201272" target="_blank" title="새창" class="service_anchor">러닝톡 신청 바로가기</a>
                                </li>
                            </ul>
                        </div>
                        <div class="search_wrap goto_item">
                            <ul class="search_list">
                                <li class="search_btn_item active">
                                    <button class="search_btn" title="선택됨">강좌 찾기</button>
                                </li>
                                <li class="search_btn_item">
                                    <button type="button">교육기관 찾기</button>
                                </li>
                            </ul>

                            <div class="search_panel_wrap">
                                <div class="search_item n1 active" data-index="1" title="강좌 찾기 선택됨">
                                    <div class="search_panel">
                                        <form action="">
                                            <fieldset>
                                                <legend>강좌 검색</legend>
                                                <div class="search_form">
                                                    <div class="search_box s_top">
                                                        <div class="search_select_box">
                                                            <select name="searchEdutypecdv" id="searchEdutypecdv" class="skip" title="전체">
                                                                <option value="">전체</option>
                                                                <option value="F0810101">구민정보화교육</option>
                                                                <option value="F0810102">여성교실</option>
                                                                <option value="F0810103">건강/보건교육</option>
                                                                <option value="F0810104">생활체육교실</option>
                                                                <option value="F0810111">청소년교육</option>
                                                                <option value="F0810114">원어민 외국어교실</option>
                                                                <option value="F0810115">서로서로학교</option>
                                                                <option value="F0810116">어린이 영어캠프</option>
                                                                <option value="F0810117">행복학습센터</option>
                                                                <option value="F0810118">용산서당</option>
                                                                <option value="F0810119">용산구IT창의교육센터</option>
                                                                <option value="F0810120">꿈나무서실</option>
                                                                <option value="F0810122">북스타트</option>
                                                                <option value="F0810123">원어민 도서관 영어교실</option>
                                                                <option value="F0810126">대학생 재능봉사 캠프</option>
                                                                <option value="F0810127">대학입시 및 진학</option>
                                                                <option value="F0810128">어린이 환경교실</option>
                                                                <option value="F0810129">꿈드림공작소</option>
                                                                <option value="F0810130">용산구 평생학습 축제</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="search_box s_bottom">
                                                        <input type="text" name="searchWord" id="searchWord" class="search_input" title="검색어 입력" placeholder="강좌명을 입력하세요" onkeydown="javascript:if (event.keyCode == 13) { doSearch2(1); }"/>
                                                        <button type="button" class="search_submit" title="강좌 검색" onclick="doSearch2(1);">검색</button>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                                <div class="search_item n2" data-index="2">
                                    <div class="search_panel">
                                        <form action="">
                                            <fieldset>
                                                <legend>교육기관 검색</legend>
                                                <div class="search_form">
                                                    <div class="search_box s_top">
                                                        <div class="search_select_box half">
                                                            <select name="searchEdutypedongv2" id="searchEdutypedongv2" class="skip" title="동 선택">
                                                                <option value="">동 선택</option>
                                                                <option value="이촌1동">이촌1동</option>
                                                                <option value="이촌2동">이촌2동</option>
                                                                <option value="용문동">용문동</option>
                                                                <option value="청파동">청파동</option>
                                                                <option value="후암동">후암동</option>
                                                                <option value="보광동">보광동</option>
                                                                <option value="서빙고동">서빙고동</option>
                                                                <option value="이태원1동">이태원1동</option>
                                                                <option value="이태원2동">이태원2동</option>
                                                                <option value="원효로1동">원효로1동</option>
                                                                <option value="원효로2동">원효로2동</option>
                                                                <option value="효창동">효창동</option>
                                                                <option value="한강로동">한강로동</option>
                                                                <option value="용산2가동">용산2가동</option>
                                                                <option value="한남동">한남동</option>
                                                                <option value="남영동">남영동</option>
                                                            </select>
                                                        </div>
                                                        <div class="search_select_box half">
                                                            <select name="searchEdutypecdv2" id="searchEdutypecdv2" class="skip" title="구분 선택">
                                                                <option value="">구분 선택</option>
                                                                <option value="01">동자치회관</option>
                                                                <option value="02">도서관</option>
                                                                <option value="03">글로벌 빌리지센터</option>
                                                                <option value="04">복지시설</option>
                                                                <option value="05">공공기관</option>
                                                                <option value="06">초등학교</option>
                                                                <option value="07">중학교</option>
                                                                <option value="08">고등학교</option>
                                                                <option value="09">대학교</option>
                                                                <option value="10">시립유치원</option>
                                                                <option value="11">민간시설</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="search_box s_bottom">
                                                        <input type="text" name="searchWord2" id="searchWord2" class="search_input" title="검색어 입력" placeholder="기관명을 입력하세요" onkeydown="javascript:if (event.keyCode == 13) { doSearch3(); }"/>
                                                        <button type="button" class="search_submit" title="교육기관 검색" onclick="doSearch3();">검색</button>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="rowgroup2">
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></c:set>
                <div class="wrap">
                    <section class="class padding_left_box">
                        <h2 class="main_title">수강신청</h2>
                        <div class="class_wrap">
                            <div class="class_tab left_box">
                            <ul class="tab_list">
                                <li class="tab_item active">
                                    <button type="button" data-type="all">수강신청</button>
                                </li>
                                <li class="tab_item">
                                    <button type="button" data-type="n1">용산구 평생학습관</button>
                                </li>
                                <li class="tab_item">
                                    <button type="button" data-type="n2">서로서로 학교</button>
                                </li>
                                <li class="tab_item">
                                    <button type="button" data-type="n3">용산형 동네배움터</button>
                                </li>
                            </ul>
                            </div>
                            <div class="class_panel right_box">
                                <div class="skip">목록</div>
                                <div class="class_content">
                                    <ul class="class_list">
                                        <!--  n1 : 용산구 평생학습관, n2 : 서로서로 학교, n3 : 용산형 동네배움터, 각 카테고리별로 최대 4개까지 불러와주세요. / 날짜순 정렬 -->
                                        <c:forEach var="list" items="${dto.page18}"  varStatus="status" begin="0" end="3">
                                            <li class="class_item grey_box">
                                                <a href="javascript:goWrite(<c:out value='${list.lesseqn}'/>,'<c:out value='${list.edutypecdv}'/>','02020000')" class="c_anchor">
                                                    <c:choose>
                                                        <c:when test="${sysYear lt list.recstad and list.statecdv eq 'E0820110'}">
                                                            <span class="category type2">접수예정</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${list.statenmv eq '접수중'}">
                                                                <span class="category type1">접수중</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                            <c:if test="${list.statenmv eq '마감'}">
                                                                <span class="category type3">마감</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <span class="class_place">${list.placenmv2}</span>
                                                    <span class="c_title">${list.lecnmv}</span>
                                                    <ul class="bu dl">
                                                        <li>
                                                            <span class="dt">접수기간</span>
                                                            <span class="dd"><c:out value='${fn:substring(list.recstad,5, 10)}'/> ~ <c:out value='${fn:substring(list.recendd, 5, 10)}'/></span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">정원</span>
                                                            <span class="dd">${list.lescntn}명</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">교육장소</span>
                                                            <span class="dd">${list.placenmv}</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">수강료</span>
                                                            <span class="dd">
                                                                <c:choose>
                                                                    <c:when test="${list.lespricen > 0}">
                                                                        <fmt:formatNumber value='${list.lespricen}'/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        무료
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </a>
                                            </li>
                                        </c:forEach>
                                        <c:forEach var="list" items="${dto.page19}"  varStatus="status" begin="0" end="3">
                                            <li class="class_item grey_box n1">
                                                <a href="javascript:goWrite(<c:out value='${list.lesseqn}'/>,'<c:out value='${list.edutypecdv}'/>','02020000')" class="c_anchor">
                                                    <c:choose>
                                                        <c:when test="${sysYear lt list.recstad and list.statecdv eq 'E0820110'}">
                                                            <span class="category type2">접수예정</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${list.statenmv eq '접수중'}">
                                                                <span class="category type1">접수중</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                            <c:if test="${list.statenmv eq '마감'}">
                                                                <span class="category type3">마감</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <span class="class_place">${list.placenmv2}</span>
                                                    <span class="c_title">${list.lecnmv}</span>
                                                    <ul class="bu dl">
                                                        <li>
                                                            <span class="dt">접수기간</span>
                                                            <span class="dd"><c:out value='${fn:substring(list.recstad,5, 10)}'/> ~ <c:out value='${fn:substring(list.recendd, 5, 10)}'/></span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">정원</span>
                                                            <span class="dd">${list.lescntn}명</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">교육장소</span>
                                                            <span class="dd">${list.placenmv}</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">수강료</span>
                                                            <span class="dd">
                                                                <c:choose>
                                                                    <c:when test="${list.lespricen > 0}">
                                                                        <fmt:formatNumber value='${list.lespricen}'/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        무료
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </a>
                                            </li>
                                        </c:forEach>
                                        <c:forEach var="list" items="${dto.page20}"  varStatus="status" begin="0" end="3">
                                            <li class="class_item grey_box n2">
                                                <a href="javascript:goWrite(<c:out value='${list.lesseqn}'/>,'<c:out value='${list.edutypecdv}'/>','02020000')" class="c_anchor">
                                                    <c:choose>
                                                        <c:when test="${sysYear lt list.recstad and list.statecdv eq 'E0820110'}">
                                                            <span class="category type2">접수예정</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${list.statenmv eq '접수중'}">
                                                                <span class="category type1">접수중</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                            <c:if test="${list.statenmv eq '마감'}">
                                                                <span class="category type3">마감</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <span class="class_place">${list.placenmv2}</span>
                                                    <span class="c_title">${list.lecnmv}</span>
                                                    <ul class="bu dl">
                                                        <li>
                                                            <span class="dt">접수기간</span>
                                                            <span class="dd"><c:out value='${fn:substring(list.recstad,5, 10)}'/> ~ <c:out value='${fn:substring(list.recendd, 5, 10)}'/></span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">정원</span>
                                                            <span class="dd">${list.lescntn}명</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">교육장소</span>
                                                            <span class="dd">${list.placenmv}</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">수강료</span>
                                                            <span class="dd">
                                                                <c:choose>
                                                                    <c:when test="${list.lespricen > 0}">
                                                                        <fmt:formatNumber value='${list.lespricen}'/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        무료
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </a>
                                            </li>
                                        </c:forEach>
                                        <c:forEach var="list" items="${dto.page21}"  varStatus="status" begin="0" end="3">
                                            <li class="class_item grey_box n3">
                                                <a href="javascript:goWrite(<c:out value='${list.lesseqn}'/>,'<c:out value='${list.edutypecdv}'/>','02020000')" class="c_anchor">
                                                    <c:choose>
                                                        <c:when test="${sysYear lt list.recstad and list.statecdv eq 'E0820110'}">
                                                            <span class="category type2">접수예정</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${list.statenmv eq '접수중'}">
                                                                <span class="category type1">접수중</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                            <c:if test="${list.statenmv eq '마감'}">
                                                                <span class="category type3">마감</span>  <!--  type1 : 접수중, type2 : 접수예정, type3 : 마감, type4 : 접수대기 // 타입 맞춰서 넣어주세요 -->
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <span class="class_place">${list.placenmv2}</span>
                                                    <span class="c_title">${list.lecnmv}</span>
                                                    <ul class="bu dl">
                                                        <li>
                                                            <span class="dt">접수기간</span>
                                                            <span class="dd"><c:out value='${fn:substring(list.recstad,5, 10)}'/> ~ <c:out value='${fn:substring(list.recendd, 5, 10)}'/></span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">정원</span>
                                                            <span class="dd">${list.lescntn}명</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">교육장소</span>
                                                            <span class="dd">${list.placenmv}</span>
                                                        </li>
                                                        <li>
                                                            <span class="dt">수강료</span>
                                                            <span class="dd">
                                                                <c:choose>
                                                                    <c:when test="${list.lespricen > 0}">
                                                                        <fmt:formatNumber value='${list.lespricen}'/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        무료
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <a href="" class="class_more main_more">더보기</a>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="rowgroup3">
                <div class="wrap">
                    <section class="quick">
                        <ul class="quick_list">
                            <li class="quick_item">
                                <a href="/pms/contents/contents.do?contseqn=2193&sitecdv=S0000500&menucdv=01090000&decorator=user27EdTotal" class="quick_anchor"><i></i>평생학습관</a>
                            </li>
                            <li class="quick_item">
                                <a href="/pms/contents/contents.do?contseqn=2249&sitecdv=S0000500&menucdv=03120000&decorator=user27EdTotal" class="quick_anchor"><i></i>동네배움터</a>
                            </li>
                            <li class="quick_item">
                                <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&amp;menucdv=02020000&amp;decorator=user27EdTotal&amp;searchWord=%EC%83%9D%ED%99%9C%EA%B3%BC%ED%95%99" class="quick_anchor"><i></i>생활과학교실</a>
                            </li>
                            <li class="quick_item">
                                <a href="/pms/contents/contents.do?contseqn=2454&sitecdv=S0000500&menucdv=02010000&decorator=user27EdTotal" class="quick_anchor"><i></i>원어민 외국어교실 </a>
                            </li>
                            <li class="quick_item">
                                <a href="https://www.yongsan.go.kr/jachi/main/main.do" class="quick_anchor"><i></i>자치회관</a>
                            </li>
                            <li class="quick_item">
                                <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&amp;decorator=user27EdTotal&amp;menucdv=02020000&amp;searchEdutypecdv=F0810101" class="quick_anchor"><i></i>구민정보화교육</a>
                            </li>
                            <li class="quick_item">
                                <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&amp;menucdv=02020000&amp;decorator=user27EdTotal&amp;searchEdutypecdv=F0810102" class="quick_anchor"><i></i>여성교실</a>
                            </li>
                            <li class="quick_item">
                                <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&amp;menucdv=02020000&amp;decorator=user27EdTotal&amp;searchEdutypecdv=F0810104" class="quick_anchor"><i></i>생활체육교실</a>
                            </li>
                            <li class="quick_item">
                                <a href="/site/edtotal/lesson/userlist.do?sitecdv=S0000500&amp;decorator=user27EdTotal&amp;menucdv=02020000&amp;searchEdutypecdv=F0810118" class="quick_anchor"><i></i>용산서당</a>
                            </li>
                        </ul>
                    </section>
                </div>
            </div>
            <div class="rowgroup4">
                <div class="wrap">
                    <section class="board padding_left_box">
                        <h2 class="main_title">새소식</h2>
                        <div class="board_wrap">
                            <ul class="board_tab left_box">
                                <li class="tab_item active">
                                    <button type="button" title="선택됨">공지사항</button>
                                </li>
                                <li class="tab_item">
                                    <button type="button">타기관소식</button>
                                </li>
                            </ul>

                            <div class="board_panel right_box">
                                <div class="board_item n1 active" data-index="1" title="공지사항 선택됨">
                                    <c:forEach var="boardBean" items="${dto.page2}" varStatus="status" begin="0" end="3">
                                        <div class="grey_box">
                                            <fmt:parseDate var="regD" pattern="yyyy.MM.dd" value="${boardBean.regd}"/>
                                            <fmt:formatDate var="yearMonth" pattern="yyyy.MM" value="${regD}"/>
                                            <fmt:formatDate var="date" pattern="dd" value="${regD}"/>
                                            <a href="/pms/board/detail.do?boardidn=<c:out value='${boardBean.boardidn}'/>&amp;boardseqn=<c:out value='${boardBean.boardseqn}'/>&amp;sitecdv=S0000500&amp;decorator=user27EdTotal&amp;menucdv=04010000" class="c_anchor">
                                                <!-- <span class="board_new"><span class="skip">최신글</span>New</span> 최신글일때 넣어주세요 -->
                                                <div class="c_title">${boardBean.subjectv}</div>
                                                <div class="board_date"><c:out value='${yearMonth}' />.<c:out value='${date}' /></div>
                                            </a>
                                         </div>
                                    </c:forEach>
                                    <a href="/pms/board/list.do?boardidn=1024&amp;sitecdv=S0000500&amp;decorator=user27EdTotal&amp;menucdv=04010000" class="board_more main_more"><span class="skip">공지사항</span> 더보기</a>
                                </div>
                                <div class="board_item n2" data-index="2">
                                    <c:forEach var="boardBean" items="${dto.page9}" varStatus="status" begin="0" end="3">
                                        <div class="grey_box">
                                            <fmt:parseDate var="regD" pattern="yyyy.MM.dd" value="${boardBean.regd}"/>
                                            <fmt:formatDate var="yearMonth" pattern="yyyy.MM" value="${regD}"/>
                                            <fmt:formatDate var="date" pattern="dd" value="${regD}"/>
                                            <a href="/pms/board/detail.do?boardidn=<c:out value='${boardBean.boardidn}'/>&amp;boardseqn=<c:out value='${boardBean.boardseqn}'/>&amp;sitecdv=S0000500&amp;decorator=user27EdTotal&amp;menucdv=04010000" class="c_anchor">
                                                <!-- <span class="board_new"><span class="skip">최신글</span>New</span> 최신글일때 넣어주세요 -->
                                                <div class="c_title">${boardBean.subjectv}</div>
                                                <div class="board_date"><c:out value='${yearMonth}' />.<c:out value='${date}' /></div>
                                            </a>
                                         </div>
                                    </c:forEach>
                                    <a href="/pms/board/list.do?boardidn=1061&amp;sitecdv=S0000500&amp;decorator=user27EdTotal&amp;menucdv=04080000" class="board_more main_more"><span class="skip">공지사항</span> 더보기</a>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div class="rowgroup5">
                <div class="wrap">
                    <section class="news padding_left_box">
                        <h2 class="main_title">평생학습 <br> 생생 소식</h2>
                        <div class="news_wrap">
                            <div class="news_sub left_box">
                                미래를 여는 <br> 스마트 그린학습도시 용산
                            </div>
                            <div class="news_panel right_box">
                                <ul class="news_list">
                                <c:forEach var="boardBean" items="${dto.page11}" varStatus="status" begin="0" end="3">
                                    <li class="news_item">
                                        <a href="/pms/board/detail.do?boardidn=1067&sitecdv=S0000500&decorator=user27EdTotal&menucdv=04100000&boardseqn=<c:out value='${boardBean.boardseqn}'/>&mode=detail1&currentPage=0" class="news_anchor">
                                            <div class="news_img">
                                                <img src="http://yedu.yongsan.go.kr/upload/board/1067/<c:out value='${boardBean.savefilenmv}'/>" alt="<c:out value='${boardBean.filealt}' />" />
                                            </div>
                                            <div class="news_text">${boardBean.subjectv}</div>
                                        </a>
                                    </li>
                                </c:forEach>
                                </ul>
                            </div>
                            <div class="news_control">
                                <button type="button" class="news_btn news_prev">이전보기</button>
                                <button type="button" class="news_btn news_next">다음보기</button>
                            </div>
                            <a href="/pms/board/list.do?boardidn=1067&sitecdv=S0000500&decorator=user27EdTotal&menucdv=04100000" class="news_more main_more">더보기</a>
                        </div>
                    </section>
                </div>
            </div>


        </main>
    </div>


    <footer id="footer" class="footer">
        <div class="wrap">

            <div class="footer_box clearfix">
                <div class="link">
                    <h2 class="skip">바로가기</h2>
                    <ul class="link_list">
                        <li class="link_item n1"><a href="#n" class="link_anchor">개인정보처리방침</a></li>
                        <li class="link_item n2"><a href="#n" class="link_anchor">소개</a></li>
                        <li class="link_item n3"><a href="#n" class="link_anchor">찾아오시는 길</a></li>
                        <li class="link_item n4"><a href="#n" class="link_anchor">사이트맵</a></li>
                    </ul>
                </div>

                <div class="site">
                    <h2 class="skip">관련사이트</h2>
                    <ul class="site_list">
                        <li class="site_item">
                            <button type="button" class="site_show"><span>교육기관</span></button>
                            <div class="site_panel">
                                <ul class="site_ul">
                                    <li class="site_li"><a href="http://www.ilminkids.com" class="site_anchor">일민유치원</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://kids.choongshin.or.kr/" class="site_anchor">충신유치원</a></li>
                                    <li class="site_li">
                                        <a href="http://www.yusungkids.org/" class="site_anchor">유성유치원</a></li>
                                    <li class="site_li">
                                        <a href="http://www.sung-kids.com/" class="site_anchor">성심유치원</a></li>
                                    <li class="site_li"><a href="http://www.bokja.co.kr/" class="site_anchor">복자유치원</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.daegeon.kg.kr/" class="site_anchor">대건유치원</a></li>
                                    <li class="site_li"><a href="http://www.huam.es.kr" class="site_anchor">후암초등학교</a>
                                    </li>
                                    <li class="site_li"><a href="http://www.hannam.es.kr" class="site_anchor">한남초등학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.hangang.es.kr" class="site_anchor">한강초등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.s-cheongpa.es.kr" class="site_anchor">청파초등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.itaewon.es.kr" class="site_anchor">이태원초등학교</a></li>
                                    <li class="site_li"><a href="http://wonhyo.es.kr" class="site_anchor">원효초등학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://yongamcho.seoul.kr" class="site_anchor">용암초등학교</a></li>
                                    <li class="site_li"><a href="http://www.sys.es.kr" class="site_anchor">용산초등학교</a>
                                    </li>
                                    <li class="site_li"><a href="http://www.sys-e.es.kr" class="site_anchor">신용산초등학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.shinkwang.es.kr" class="site_anchor">신광초등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.seobinggo.es.kr" class="site_anchor">서빙고초등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.seoulsamkwang.es.kr" class="site_anchor">삼광초등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.keumyang.es.kr" class="site_anchor">금양초등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.seoul-nj.es.kr" class="site_anchor">남정초등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.bogwang.es.kr" class="site_anchor">보광초등학교</a></li>
                                    <li class="site_li"><a href="http://www.hangang.ms.kr" class="site_anchor">한강중학교</a>
                                    </li>
                                    <li class="site_li"><a href="http://yong-san.ms.kr" class="site_anchor">용산중학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.yonggang.ms.kr" class="site_anchor">용강중학교</a></li>
                                    <li class="site_li"><a href="http://os.ms.kr" class="site_anchor">오산중학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.shinkwang.ms.kr" class="site_anchor">신광여자중학교</a></li>
                                    <li class="site_li">
                                        <a href="http://sacredheart.ms.kr" class="site_anchor">성심여자중학교</a></li>
                                    <li class="site_li"><a href="http://www.sunrin.ms.kr" class="site_anchor">선린중학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.bosung-g.ms.kr" class="site_anchor">보성여자중학교</a></li>
                                    <li class="site_li"><a href="http://www.baemoon.ms.kr" class="site_anchor">배문중학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.jungkyung.hs.kr" class="site_anchor">중경고등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.yongsan-th.hs.kr" class="site_anchor">용산공업고등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.yongsan.hs.kr" class="site_anchor">용산고등학교</a></li>
                                    <li class="site_li"><a href="http://www.osan.hs.kr" class="site_anchor">오산고등학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.shinkwang.hs.kr" class="site_anchor">신광여자고등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://sacredheart.hs.kr" class="site_anchor">성심여자고등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.sunrint.hs.kr" class="site_anchor">선린인터넷고등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.seoulauto.hs.kr" class="site_anchor">서울자동차고등학교</a></li>
                                    <li class="site_li"><a href="http://www.sdh.hs.kr" class="site_anchor">서울디지텍고등학교</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.bosung.hs.kr" class="site_anchor">보성여자고등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.baemoon.hs.kr" class="site_anchor">배문고등학교</a></li>
                                    <li class="site_li">
                                        <a href="http://www.kopo.ac.kr/index.asp" class="site_anchor">폴리텍대학</a></li>
                                    <li class="site_li">
                                        <a href="http://www.sookmyung.ac.kr/index.jsp" class="site_anchor">숙명여자대학교</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="site_item">
                            <button type="button" class="site_show"><span>동주민센터</span></button>
                            <div class="site_panel">
                                <ul class="site_ul">
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=01" class="site_anchor">후암동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=02" class="site_anchor">용산2가동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=03" class="site_anchor">남영동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=04" class="site_anchor">청파동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=05" class="site_anchor">원효로1동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=06" class="site_anchor">원효로2동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=07" class="site_anchor">효창동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=08" class="site_anchor">용문동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=09" class="site_anchor">한강로동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=10" class="site_anchor">이촌1동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=11" class="site_anchor">이촌2동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=12" class="site_anchor">이태원1동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=13" class="site_anchor">이태원2동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=14" class="site_anchor">한남동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=15" class="site_anchor">서빙고동</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yongsan.go.kr/dong/main/main.do?dongCd=16" class="site_anchor">보광동</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="site_item">
                            <button type="button" class="site_show"><span>평생교육기관</span></button>
                            <div class="site_panel">
                                <ul class="site_ul">
                                    <li class="site_li">
                                        <a href="http://www.galwol.or.kr/" class="site_anchor">갈월종합사회복지관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.hyochang.or.kr/" class="site_anchor">효창종합사회복지관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.ysnoin.or.kr/" class="site_anchor">용산노인종합복지관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.cpnoin.or.kr/" class="site_anchor">청파노인복지센터</a></li>
                                    <li class="site_li">
                                        <a href="http://www.ysrehab.or.kr/" class="site_anchor">용산장애인복지관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.museum.go.kr/" class="site_anchor">국립중앙박물관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.yongsan.familynet.or.kr" class="site_anchor">용산구건강가정지원센터</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://yongsan.seoulwomanup.or.kr/yongsan/main/main.do" class="site_anchor">용산여성인력개발센터</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.yong-san.or.kr/sc/main/?load_popup=1" class="site_anchor">용산문화체육센터</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://yongsan.kccf.or.kr/" class="site_anchor">용산문화원</a></li>
                                    <li class="site_li">
                                        <a href="https://www.yong-san.or.kr/youthpool/main/?load_popup=1" class="site_anchor">용산청소년수련관</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="https://www.warmemo.or.kr/" class="site_anchor">전쟁기념관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.kimkoomuseum.org/" class="site_anchor">백범기념관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.jbedu.or.kr/" class="site_anchor">서울특별시중부기술교육원</a></li>
                                    <li class="site_li">
                                        <a href="http://open.sookmyung.ac.kr/" class="site_anchor">숙명여자대학교 평생교육원</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://leeum.samsungfoundation.org" class="site_anchor">리움박물관</a></li>
                                    <li class="site_li">
                                        <a href="http://www.iparkculture.com/" class="site_anchor">현대아이파크백화점문화센터</a>
                                    </li>
                                    <li class="site_li">
                                        <a href="http://www.samilacademy.com/" class="site_anchor">삼일아카데미</a></li>

                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="footer_content">
                <div class="footer_right">
                    <div class="footer_sns">
                        <ul class="clearfix">
                            <li>
                                <a href="https://www.facebook.com/yongsanFB" class="footer_sns_anchor" title="페이스북 바로가기"></a>
                            </li>
                            <li>
                                <a href="https://www.twitter.com/yongsangu" class="footer_sns_anchor" title="엑스 바로가기"></a>
                            </li>
                            <li>
                                <a href="http://blog.naver.com/ysnblog" class="footer_sns_anchor" title="네이버 블로그 바로가기"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="banner">
                        <h2 class="skip">배너모음</h2>
                        <div class="banner_list">
                            <div class="banner_item">
                                <a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">
                                    <img src="/site/edtotal/images/common/banner_img01.png" alt="서울런4050 서울시평생학습포털">
                                </a>
                            </div>
                            <div class="banner_item">
                                <a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">
                                    <img src="/site/edtotal/images/common/banner_img02.png" alt="서울배움e 서울시평생학습포털">
                                </a>
                            </div>
                            <div class="banner_item">
                                <a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">
                                    <img src="/site/edtotal/images/common/banner_img03.png" alt="용마루어린이도서관">
                                </a>
                            </div>
                            <div class="banner_item">
                                <a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">
                                    <img src="/site/edtotal/images/common/banner_img04.png" alt="미래야">
                                </a>
                            </div>
                            <div class="banner_item">
                                <a href="#n" target="_blank" title="새창" rel="noopener noreferrer" class="banner_anchor">
                                    <img src="/site/edtotal/images/common/banner_img05.png" alt="EBSi">
                                </a>
                            </div>

                        </div>
                        <div class="banner_control">
                            <button type="button" class="banner_prev">이전</button>
                            <button type="button" class="banner_auto"></button>
                            <button type="button" class="banner_next">다음</button>
                        </div>
                    </div>
                </div>

                <div class="info">
                    <address>
                        <span class="info_address"><span class="skip">주소</span> 서울특별시 용산구 녹사평대로 150(이태원동)</span>
                        <span class="info_tel">대표전화 : 02-2199-6114</span>
                    </address>
                    <p class="info_copyright">ⓒ 2025 youngsan gu office all rights reserced.</p>
                </div>
            </div>
        </div>
    </footer>
</div>
</body>

<form name='form2' id='form2' method='post' action='userlist.do'>
    <input type='hidden' name='sitecdv' id='sitecdv' value='S0000500' />
    <input type='hidden' name='decorator' id='decorator' value='user27EdTotal' />
    <input type='hidden' name='menucdv' id='menucdv' value='' />
    <input type='hidden' name='currentPage' id='currentPage' value='0' />
    <input type='hidden' name='edutypecdv' id='edutypecdv' value=''/>
    <input type='hidden' name='lesseqn' id='lesseqn' value=''/>
</form>

<form name='searchForm' id='searchForm' method='post' action='/site/edtotal/lesson/userlist.do?sitecdv=S0000500&menucdv=02020000&decorator=user27EdTotal'>
    <input type='hidden' name='searchEdutypecdv' id='sEtVal' value='' />
    <input type='hidden' name='searchWord' id='swVal' value='' />
</form>

<form name='searchForm2' id='searchForm2' method='post' action='/site/edtotal/institution/list.do?keyGubun=1&sitecdv=S0000500&menucdv=03100000&decorator=user27EdTotal'>
    <input type='hidden' name='keyDong' id='sEtDVal2' value='' />
    <input type='hidden' name='keyType' id='sEtVal2' value='' />
    <input type='hidden' name='searchWord' id='swVal2' value='' />
</form>


<form name='_paramForm' id='_paramForm' method='post' action="/site/kr/member/logout.do?siteGubun=ED">
<input type="hidden" name="sitecdv" value="S0000500" />
<input type="hidden" name="menucdv" value="" />
<input type="hidden" name="decorator" value="" />
<label for="paramSubmit" style="display:none;">확인</label>
<input type="image" id="paramSubmit" src="/site/images/01_kor/common/unify_search_btn.gif" alt="확인" title="확인" style="display:none;"/>

</form>


<form name="_loginForm" id="_loginForm" method="post" action="https://www.yongsan.go.kr/portal/member/user/forLogin.do?menuNo=200818">
<input type="hidden" name="sitecdv" value="S0000100" />
<input type="hidden" name="menucdv" value="05020000" />
<input type="hidden" name="decorator" value="pmsweb" />
<input type='hidden' name='log_sitecdv' value='S0000500'/>
<input type='hidden' name='log_returnURL' value='/site/edtotal/main.jsp'/>

<label for="_loginSubmit" style="display:none;">확인</label>
<input type="image" id="_loginSubmit" src="/site/images/01_kor/common/unify_search_btn.gif" alt="확인" title="확인" style="display:none;"/>
</form>


<script>
	function doSearch3() {
	    var searchEdutypedongv = $('#searchEdutypedongv2').val();
	    var searchEdutypecdv = $('#searchEdutypecdv2').val();
	    var searchWord = $('#searchWord2').val();

	    $('#sEtDVal2').val(searchEdutypedongv);
	    $('#sEtVal2').val(searchEdutypecdv);
	    $('#swVal2').val(searchWord);
	    $('#searchForm2').submit();
	}

	function doSearch2(type) {
	    var searchEdutypecdv = $('#searchEdutypecdv').val();
	    var searchWord = $('#searchWord').val();

	    if(type == 2){
		    searchWord = '진학';
	    }

	    //평생 학습관을 선택시 조건없이 키워드로만 검색 함
	    if(searchEdutypecdv == 'F091'){
	        $('#sEtVal').val('');
	        $("#searchForm").attr("action","/site/edtotal/lifeStudy/userlist.do?sitecdv=S0000500&menucdv=02070000&decorator=user27EdTotal")
	    }else{
	        $('#sEtVal').val(searchEdutypecdv);
	    }

	    if(searchEdutypecdv == 'F0810115'){
	        $('#sEtVal').val('');
	        $("#searchForm").attr("action","/site/edtotal/eachOther/userlist.do?sitecdv=S0000500&menucdv=02040100&decorator=user27EdTotal")
	    }else{
	        $('#sEtVal').val(searchEdutypecdv);
	    }

	    if(searchEdutypecdv == 'F0810117'){
	        $('#sEtVal').val('');
	        $("#searchForm").attr("action","/site/edtotal/happyStudy/userlist.do?sitecdv=S0000500&menucdv=02060000&decorator=user27EdTotal")
	    }else{
	        $('#sEtVal').val(searchEdutypecdv);
	    }

	    $('#swVal').val(searchWord);
	    $('#searchForm').submit();
	}

    $(function(){

        var cookie_user_id = getLogin();
        if(cookie_user_id != '') {
            $('#log-id').val(cookie_user_id);
            $('#saveId').attr('checked', true);
        }

        $('#saveId').on('click', function(){
            var _this = this;
            var isRemember;

            if($(_this).is(':checked')) {
                isRemember = confirm('이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.');
                if(!isRemember) $(_this).attr('checked', false);
            }
        });

        $('#btn_login').on('click', function(){
            if($('#saveId').is(':checked')){
                saveLogin($('#log-id').val());
            }else{
                saveLogin('');
            }
        });
    });

    function saveLogin(id) {
        if(id != '') {
            setSave('userid', id, 7);
        }else{
            setSave("userid", id, -1);
        }
    }

    function setSave(name, value, expiredays) {
        var today = new Date();
        today.setDate( today.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
    }

    function getLogin() {
        var cook = document.cookie + ";";
        var idx = cook.indexOf("userid", 0);
        var val = '';

        if(idx != -1) {
            cook = cook.substring(idx, cook.length);
            begin = cook.indexOf("=", 0) + 1;
            end = cook.indexOf(";", begin);
            val = unescape(cook.substring(begin, end));
        }
        return val;
    }

    function doLogin() {

        if (!jq.trim(jq('#log-id').val()).length) {
            alert('아이디를 입력하세요');
            jq('#log-id').focus();
            return false;
        }

        if (!jq.trim(jq('#log-pwd').val()).length) {
            alert('비밀번호를 입력하세요');
            jq('#log-pwd').focus();
            return false;
        }
        var form1 = document.form1;
        MemberService.loginCheck({memidv:jq('#log-id').val(), passwordv:jq('#log-pwd').val()}, function(mbean) {
            if(mbean == null) {
                alert("아이디 또는 비밀번호가 올바르지 않습니다.");
                jq('#log-id').focus();
                return false;
            }
            if(mbean.confirmync != "Y") {	// 중복가입확인번호 받지 않은 경우 인증페이지로, 받은경우 로그인처리
                alert("개편된 용산구청 홈페이지를 이용하기 위해서 최초 로그인시 실명인증이 필요합니다.");
                form1.action = "/site/kr/member/memberAuth.do";
                form1.submit();
            } else {
                form1.action='/site/kr/member/loginok.do'; //https://yongsan.go.kr
                form1.submit();
            return false;
            }
        });
        return false;
    }

    $('#id_userLogin2').click(gotoUserLogin);
    $('#id_userLogout').click(gotoUserLogout);
    $('#id_userLogin').keypress(function(event) {
        if(event.keyCode == 13)
            gotoUserLogin();
    });
    $('#id_userLogout').keypress(function(event) {
        if(event.keyCode == 13)
            gotoUserLogout();
    });

    $.each($('ul#topmenu > li'),function(i){
        $(this).addClass("menu_"+(i+1));
        $('.menu_'+(i+1)).children().eq(0).on('focus',function(){
            $('.menu_1 a:first, .menu_2 a:first, .menu_3 a:first, .menu_4 a:first, .menu_5 a:first').removeClass('on');
            $(this).eq(0).addClass('on');
            $('.inner').show();
            $('.header-menu nav').append('<div class="nav_bg"><span></span></div>');
        });
        $('ul#topmenu > li > div > ul > li > a').on('focus',function(){
            $('ul#topmenu > li > div > ul').css('background','none');
            $(this).parent().parent().css('background','#f5f5f5');
        });

        $('#topmenu li a:last').on('blur', function(){
            $('#topmenu .inner').hide();
            $('.nav_bg').hide();
            $('.menu_1 a:first, .menu_2 a:first, .menu_3 a:first, .menu_4 a:first, .menu_5 a:first').removeClass('on');
            $('ul#topmenu > li > div > ul').css('background','');
        });
    });

    function gotoUserLogin() {
        alert("교육포털 홈페이지는 회원만 이용 가능 합니다. 회원으로 로그인  바랍니다.");
        $('#_loginForm').submit();
    }

    function gotoJuminAuth() {
        $('#_loginForm').action = "/site/kr/member/loginAuth.do";
        $('#_loginForm').submit();

    }

    function gotoUserLogout() {
        $('#_paramForm').submit();
    }

    function window_newpop(nObj,name){
        var url=$("select[name=topnewmenu"+nObj+"]").val();
        var pName=name;
        var w="1100";
        var h="900";
        var t="100";
        var l="300";
        winPopup=window.open(url,pName,"width="+w+",height="+h+",top="+t+",left="+l+",status=no,scrollbars=yes,location=no,resizable=no");
        winPopup.focus();
    }

    function notice_getcookie( name ){
        var nameOfcookie = name + "=";
        var x = 0;
        while ( x <= document.cookie.length )
        {
                var y = (x+nameOfcookie.length);
                if ( document.cookie.substring( x, y ) == nameOfcookie ) {
                        if ( (endOfcookie=document.cookie.indexOf( ";", y )) == -1 )
                                endOfcookie = document.cookie.length;
                        return unescape( document.cookie.substring( y, endOfcookie ) );
                }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )
                        break;
        }
        return "";
    }

    var oForm;
    function doSearch(currentPage) {
        oForm = document.form2;
        if (currentPage != null) {
            oForm.currentPage.value=currentPage;
        }

        if(jQuery('#searchRecsta').val() != '' && jQuery('#searchRecend').val() == ''){
            jQuery('#searchRecend').val('2022-02-24');
        }
        oForm.submit();
    }


    function goWrite(seq,edutypecdv,menucdv) {
        oForm = document.form2;
        oForm.action = "/site/edtotal/lesson/form.do";
        jQuery('#edutypecdv').val(edutypecdv);
        jQuery('#lesseqn').val(seq);
        jQuery('#menucdv').val(menucdv);

        doSearch(null);
    }


</script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-64485143-9"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-64485143-9');
</script>

</html>