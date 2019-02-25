<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function removeSubjectTime(idx){
		$("#ngViewField").scope().$apply("removeSubjectTime("+idx+")");
	}
	$(document).on("keydown", "[numberOnly]",function(event){
		numberOnly(event);
	});
</script>
<div class="tab_wraping">
    <!-- tab1 -->
    <div id="tab1" class="tab-content current">
        <h5 class="cont_Title">학점교류 신청(IN)
            <div class="pg_location"><a>Go home</a>
                <span>&gt;</span> 학점교류 관리<span>&gt;</span> 학점교류 신청(IN)
            </div>
        </h5>
		<!-- innertab -->
		<div id="innTabContent">
			<!-- applyExchangeUserList -->
			<div class="_articleContent" ng-show="$root.exchange.confirmIn.pageViewType == 'list'">
				<div class="_border _write mt10">
					<div class="_inner">
						<fieldset>
							<legend>학기 등록/조회</legend>
							<form name="semesterSearchForm" method="post">
								<div class="_form _both">
									<div class="_insert tableWrap w1120">
										<div class="innTable">
											<table class="w80">
												<colgroup>
													<col style="width:5%">
													<col style="width:10%">
													<col style="width:5%">
													<col style="width:10%">
													<col style="width:5%">
													<col style="width:10%">
													<col style="width:5%">
													<col style="width:10%">
													<col style="width:5%">
													<col style="width:10%">
												</colgroup>
												<tbody>
													<tr>
														<td><label for="sch_kind" class="pl10">학교 구분</label></td>
														<td>
															<select id="sch_kind" ng-model="$root.exchange.confirmIn.searchUnivArea" ng-change="getChildCdList('searchUnivArea', 'searchUniv');" class="_selectBox _fL wx150">
																<option value="{{code.code}}" ng-repeat="code in $root.exchange.confirmIn.searchUnivAreaList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
														</td>
														<td colspan="2">
															<select id="sch_kind2" ng-model="$root.exchange.confirmIn.searchUniv" class="_selectBox _fL w99">
																<option value="{{code.code}}" ng-repeat="code in $root.exchange.confirmIn.searchUnivList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
														</td>
														<td><label for="mem_level" class="pl20">학년</label></td>
                                                        <td>
                                                            <select id="mem_level" ng-model="$root.exchange.confirmIn.searchStudentGradeCode" class="_selectBox _fL wx100">
                                                            	<option value="">전체</option>
                                                            	<option value="{{code.code}}" ng-repeat="code in $root.exchange.confirmIn.searchStudentGradeCodeList | orderBy:codeIdx:false">{{code.codeName}}</option>
                                                            </select>
                                                        </td>
                                                        <td><label for="sch_kind" class="pl10">소속대학</label></td>
														<td>
															<select id="sch_kind" ng-model="$root.exchange.confirmIn.searchUserUnivArea" ng-change="getChildCdList('searchUserUnivArea', 'searchUserUniv');" class="_selectBox _fL wx150">
																<option value="{{code.code}}" ng-repeat="code in $root.exchange.confirmIn.searchUserUnivAreaList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
														</td>
														<td colspan="2">
															<select id="sch_kind2" ng-model="$root.exchange.confirmIn.searchUserUniv" class="_selectBox _fL wx150">
																<option value="{{code.code}}" ng-repeat="code in $root.exchange.confirmIn.searchUserUnivList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
														</td>
													</tr>
													<tr>														
														<td><label for="sch_year" class="pl10">년도</label></td>
														<td>
															<select id="sch_year" ng-model="$root.exchange.confirmIn.searchYear" class="_selectBox _fL wx150">
																<option value="{{code.code}}" ng-repeat="code in $root.exchange.confirmIn.searchYearList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
														</td>
														<td><label for="sch_quarter" class="pl10">학기</label></td>
														<td>
															<select id="sch_quarter" ng-model="$root.exchange.confirmIn.searchSemesterCode" class="_selectBox _fR wx100">
																<option value="{{code.code}}" ng-repeat="code in $root.exchange.confirmIn.searchSemesterCodeList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
														</td>
														<td></td>
														<td></td>
														<td><label for="sch_search" class="pl20">검색</label></td>
                                                        <td colspan="3">
                                                            <select id="sch_search" ng-model="$root.exchange.confirmIn.searchType" class="_selectBox _fL wx100">
                                                                <option value="">전체</option>
                                                                <option value="userUnivCodeName">소속대학</option>
                                                                <option value="userDepartment">학과</option>
                                                                <option value="studentNumber">학번</option>
                                                                <option value="userName">성명</option>
                                                                <option value="subjectNum">교과번호</option>
                                                                <option value="subjectName">과목명</option>
                                                            </select>
                                                            <input kr-input type="text"  ng-model="$root.exchange.confirmIn.searchKey" placeholder="" class="w64">
                                                        </td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="_areaButton innerBtn">
											<div class="_right">
												<span class="_button _small _active searchBtn">
													<input type="button" value="조회" id="basicSearchBtn" ng-click="search(true)">
												</span>
												<span class="_button _small resetBtn">
													<input type="button" value="초기화" ng-click="resetSearchFiled()">
												</span>
											</div>
										</div>
									</div>
								</div>
							</form>
						</fieldset>
					</div>
				</div>
				<div class="_listHead mt40">
					<div class="_count">
						총 <strong>{{$root.exchange.confirmIn.totalCnt}}<!-- <em>/100</em> --></strong> 건이 검색되었습니다.
					</div>
					<div class="_search pr0">
						<div class="_btnSet pr0">
							<span class="_large"><a href="javascript:void(0);" class="_blockUI downBtn" ng-click="excelDown()">엑셀다운</a></span>
						</div>
						<fieldset>
							<legend>페이지별 목록개수</legend>
							<select name="findType" ng-model="$root.exchange.confirmIn.maxRowCnt" ng-change="changeMaxRowCnt()" class="_selectBox wx90">
								<option value="10">10개</option>
								<option value="20">20개</option>
								<option value="30">30개</option>
								<option value="40">40개</option>
								<option value="50">50개</option>
							</select>
						</fieldset>
					</div>
				</div>
				<table class="_table _list w100 ">
					<caption>표 제목</caption>
					<colgroup>
						<col style="width:40px;">
                        <col style="width:80px">
                        <col style="width:14%;">
                        <col style="width:14%;">
                        <col style="width:60px;">
                        <col style="width:80px;">
                        <col style="width:12%;">
                        <col style="width:14%;">
                        <col style="width:22%;">
                        <col style="width:40px;">
                        <col style="width:40px;">
                        <col style="width:80px;">
                        <col style="width:80px;">
                        <col style="width:80px;">
                        <col style="width:60px;">
                        <col style="width:22%;">    
					</colgroup>
					<thead>
                       	<tr>
							<th><input type="checkbox" id="itm_Allcheck" name="" ng-model="$root.exchange.confirmIn.isCheckedAll" ng-click="checkAllUserList()"><label for="itm_Allcheck"><span></span></label></th>
							<th ng-click="changeSortOrder($event)" data-sort="apCofmTransDt" data-order="desc"><span>이관일<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="userUnivCode" data-order="desc"><span>소속대학<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="userDepartment" data-order="desc"><span>학과<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="studentGradeCode" data-order="desc"><span>학년<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="studentNumber" data-order="desc"><span>학번<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="userName" data-order="desc"><span>성명<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="subjectNum" data-order="desc"><span>교과번호<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="subjectName" data-order="desc"><span>과목명<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="subjectPoint" data-order="desc"><span>학점<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th ng-click="changeSortOrder($event)" data-sort="classNum" data-order="desc"><span>분반<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th>상세</th>
							<th>승인/<br/>반려</th>
							<th>반려<br/>사유</th>
							<th ng-click="changeSortOrder($event)" data-sort="mInStNum" data-order="desc"><span>기존학번<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
							<th>발급학번</th>
                       	</tr>
					</thead>
					<tbody ng-show="$root.exchange.confirmIn.applyExchangeUserList.length > 0">
						<tr class="firTd" ng-repeat="exchangeInfo in $root.exchange.confirmIn.applyExchangeUserList | orderBy:descRn:false">
							<td><input type="checkbox" ng-if="exchangeInfo.applyStatus == 4" id="thisChk_{{$index}}" name="thisChk" ng-model="exchangeInfo.isChecked" ng-click="checkUserList()"><label for="thisChk_{{$index}}"><span></span></label></td>
							<td>{{exchangeInfo.apCofmTransDt}}</td>
							<td>{{exchangeInfo.userUnivCodeName}}</td>
							<td>{{exchangeInfo.userDepartment}}</td>
							<td>{{exchangeInfo.studentGradeCodeName}}</td>
							<td>{{exchangeInfo.studentNumber}}</td>
							<td>{{exchangeInfo.userName}}</td>
							<td>{{exchangeInfo.subjectNum}}</td>
							<td>{{exchangeInfo.subjectName}}</td>
							<td>{{exchangeInfo.subjectPoint}}</td>
							<td>{{exchangeInfo.classNum}}</td>
							<td><span class="_button _minimum" ng-click="applyExchangeInfoView($index)"><a href="javascript:void(0);">보기</a></span></td>
							<td>
								<select name="findType border0" class="_selectBox wx70" ng-model="$root.exchange.confirmIn.applyExchangeUserList[$index].confmRejectStatus" ng-change="changeApplyStatus($index, 'confirm')" ng-disabled="exchangeInfo.applyStatus > 4">
									<option value="{{applyStatus.code}}" ng-repeat="applyStatus in $root.exchange.confirmIn.applyStatusList | orderBy:descRn:false" 
										ng-selected="$root.exchange.confirmIn.applyExchangeUserList[$parent.$index].confmRejectStatus === applyStatus.code" >
										{{applyStatus.codeName}}
									</option>
								</select>
							</td>
							<td>
								<span class="_button _minimum _gray" ng-click="changeApplyStatus($index, 'confirm')"
									ng-if="exchangeInfo.rejectReason != null && exchangeInfo.rejectReason != ''">
									<a href="javascript:void(0);">사유</a>
								</span>
								<span ng-if="exchangeInfo.rejectReason == null || exchangeInfo.rejectReason == ''">-</span>
							</td>
							<td>{{exchangeInfo.mInStNum}}</td>
							<td ng-if="exchangeInfo.applyStatus == 5">
								<input kr-input type="text" ng-model="exchangeInfo.newMInStNum" id="newMInStNum_{{$index}}" placeholder="" class="wx60" ng-init="exchangeInfo.newMInStNum = exchangeInfo.mInStNum">
								<span class="_button _minimum _save pl10" ng-click="changeStudentNumber($index, 'studentNumber')">
									<a href="javascript:void(0);">저장</a>
								</span>
							</td>
							<td ng-if="exchangeInfo.applyStatus != 5">-</td>
						</tr>
					</tbody>
					<tbody ng-show="$root.exchange.confirmIn.applyExchangeUserList.length == 0">
						<tr>
							<td colspan="16">학점교류신청 대기중인 학생이 없습니다.</td>
						</tr>
					</tbody>
				</table>
				<div ng-show="$root.exchange.confirmIn.applyExchangeUserList.length > 0" id="applyExchangeUserInListPaging" class="_paging"></div>
				<div class="_areaButton">
					<div class="_left">
						<span class="_button _large ApprovalBtn"><a href="javascript:void(0);" ng-click="acceptApplyExchange()">승인</a></span>
						<span class="_button _large ApprovalBtn Aqu"><a href="javascript:void(0);" ng-click="rejectApplyExchange()">반려</a></span>
					</div>
					<div class="_search pr0 _right">
						<div class="_btnSet pr0">
							<span class="_large"><a href="javascript:void(0);" class="_blockUI downBtn" ng-click="excelDown()">엑셀다운</a></span>
						</div>
						<fieldset>
							<legend>홈페이지검색</legend>
							<select name="findType" ng-model="$root.exchange.confirmIn.maxRowCnt" ng-change="changeMaxRowCnt()" class="_selectBox wx90">
								<option value="10">10개</option>
								<option value="20">20개</option>
								<option value="30">30개</option>
								<option value="40">40개</option>
								<option value="50">50개</option>
							</select>
						</fieldset>
					</div>
				</div>
			</div>
			<!-- //applyExchangeUserList -->
		</div>
		<!-- //innertab -->
	</div>
	<!-- // tab1 -->
	<form id="excelForm" name="excelForm" method="post" action=""></form>
</div>