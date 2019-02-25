<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="tab_wraping">
	<!-- tab1 -->
	<div id="tab1" class="tab-content current">
		<h5 class="cont_Title">
			학생별 이력 조회(OUT)
			<div class="pg_location">
				<a>Go home</a> <!-- <span>&gt;</span> ADMIN --><span>&gt;</span>
				학점교류 관리<span>&gt;</span> 학생별 이력 조회(OUT)
			</div>
		</h5>
		<div id="innTabContent">
			<div class="_articleContent">
				<div class="_border _write mt10">
					<div class="_inner">
						<fieldset>
							<legend>월별 접속통계 조회 </legend>
							<form name="selYearForm" method="post">
								<div class="_form _both">
									<div class="_insert tableWrap w1120">
										<div class="innTable">
											<table class="w80">
												<colgroup>
													<col style="width: 5%">
													<col style="width: 10%">
													<col style="width: 5%">
													<col style="width: 10%">
													<col style="width: 5%">
													<col style="width: 10%">
													<col style="width: 5%">
													<col style="width: 10%">
													<col style="width: 5%">
													<col style="width: 10%">
												</colgroup>
												<tbody>
													<tr>
                                                        <td><label for="sch_kind2" class="pl10">학교구분</label></td>
                                                        <td>
                                                            <select id="sch_kind2" ng-model="$root.exchange.studentOut.searchUserUnivArea" ng-change="getChildCdList('searchUserUnivArea', 'searchUserUniv')" class="_selectBox _fL wx150">
                                                                <option value="{{code.code}}" ng-repeat="code in $root.exchange.studentOut.searchUserUnivAreaList | orderBy:codeIdx:false">{{code.codeName}}</option>
                                                            </select>
                                                        </td>
                                                        <td colspan="2">
                                                            <select ng-model="$root.exchange.studentOut.searchUserUniv" class="_selectBox _fL w99">
                                                                <option value="{{code.code}}" ng-repeat="code in $root.exchange.studentOut.searchUserUnivList | orderBy:codeIdx:false">{{code.codeName}}</option>
                                                            </select>
                                                        </td>
														<td><label for="mem_level" class="pl20">학년</label></td>
														<td><select id="mem_level"
															ng-model="$root.exchange.studentOut.searchStudentGradeCode"
															class="_selectBox _fL wx100">
																<option value="{{code.code}}"
																	ng-repeat="code in $root.exchange.studentOut.searchStudentGradeCodeList | orderBy:codeIdx:false">{{code.codeName}}</option>
														</select></td>
                                                        <td><label for="sch_kind" class="pl20">교류대학</label></td>
                                                        <td>
                                                            <select id="sch_kind" ng-model="$root.exchange.studentOut.searchUnivArea" ng-change="getChildCdList('searchUnivArea', 'searchUniv')" class="_selectBox _fL wx150">
                                                                <option value="{{code.code}}" ng-repeat="code in $root.exchange.studentOut.searchUnivAreaList | orderBy:codeIdx:false">{{code.codeName}}</option>
                                                            </select>
                                                        </td>
                                                        <td colspan="2">
                                                            <select ng-model="$root.exchange.studentOut.searchUniv" class="_selectBox _fL wx150">
                                                                <option value="{{code.code}}" ng-repeat="code in $root.exchange.studentOut.searchUnivList | orderBy:codeIdx:false">{{code.codeName}}</option>
                                                            </select>
                                                        </td>
													</tr>
													<tr>
														<td><label for="sch_year" class="pl10">년도</label></td>
														<td><select id="sch_year"
															ng-model="$root.exchange.studentOut.searchYear"
															class="_selectBox _fL wx150">
																<option value="{{code.code}}"
																	ng-repeat="code in $root.exchange.studentOut.searchYearList | orderBy:codeIdx:false">{{code.codeName}}년도</option>
														</select></td>
														<td><label for="sch_quarter" class="pl10">학기</label></td>
														<td><select id="sch_quarter"
															ng-model="$root.exchange.studentOut.searchSemesterCode"
															class="_selectBox _fR wx100">
																<option value="{{code.code}}"
																	ng-repeat="code in $root.exchange.studentOut.searchSemesterCodeList | orderBy:codeIdx:false">{{code.codeName}}</option>
														</select></td>
														<td></td>
														<td></td>
														<td><label for="sch_search" class="pl20">검색</label></td>
														<td colspan="3"><select
															ng-model="$root.exchange.studentOut.searchType"
															class="_selectBox _fL wx100">
																<option value="">전체</option>
																<option value="userUniv">소속대학</option>
																<option value="userDepartment">학과</option>
																<option value="studentNumber">학번</option>
																<option value="userName">성명</option>
																<option value="subjectNum">교과번호</option>
																<option value="subjectName">과목명</option>
														</select> <input kr-input type="text"
															ng-model="$root.exchange.studentOut.searchKey"
															placeholder="" class="w64"></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="_areaButton innerBtn">
											<div class="_right">
												<span class="_button _small _active searchBtn"> <input
													type="button" value="조회" id="basicSearchBtn"
													ng-click="search(true)">
												</span> <span class="_button _small resetBtn"> <input
													type="button" value="초기화" ng-click="resetSearchFiled()">
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
						총 <strong>{{$root.exchange.studentOut.totalCnt}}</strong> 건이 검색되었습니다.
					</div>

					<div class="_search pr0">
						<div class="_btnSet pr0">
							<span class="_large"><a href="javascript:void(0);" class="downBtn" ng-click="excelDown()">엑셀다운</a></span>
						</div>
						<fieldset>
							<legend>개수</legend>
							<select name="findType" class="_selectBox wx70" ng-model="$root.exchange.studentOut.maxRowCnt" ng-change="changeMaxRowCnt()">
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
						 <col style="width:80px;">
                         <%-- <col style="width:12%;"> --%>
                         <col style="width:12%;">
                         <col style="width:120px;">
                         <col style="width:60px;">
                         <col style="width:100px;">
                         <col style="width:10%;">
                         <col style="width:10%;">
                         <col style="width:15%;"> 
                         <col style="width:40px;">
                         <col style="width:40px;">
                         <col style="width:120px;">
                         <%-- <col style="width:80px;"> --%> 
                         <col style="width:80px;">
					</colgroup>
					<thead>
						<tr>
                            <th ng-click="changeSortOrder($event)" data-sort="userName" data-order="desc"><span>성명<a href="javascript:void(0);" style="display:none;" class="down" ></a></span></th>
                            <!-- <th>소속대학</th> -->
                            <th ng-click="changeSortOrder($event)" data-sort="year" data-order="desc"><span>년도/학기<a href="javascript:void(0);" style="display:none;" class="down" ></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="userDepartment" data-order="desc"><span>학과<a href="javascript:void(0);" style="display:none;" class="down" ></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="studentGradeCode" data-order="desc"><span>학년<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="studentNumber" data-order="desc"><span>학번<a href="javascript:void(0);" style="display:none;" class="down" ></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="univCode" data-order="desc"><span>교류대학<a href="javascript:void(0);" style="display:none;" class="down" ></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="subjectNum" data-order="desc"><span>교과번호<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="subjectName" data-order="desc"><span>과목명<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="subjectPoint" data-order="desc"><span>학점<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="classNum" data-order="desc"><span>분반<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
                            <th ng-click="changeSortOrder($event)" data-sort="mouStudentNumber" data-order="desc"><span>발급<br>학번<a href="javascript:void(0);" style="display:none;" class="down"></a></span></th>
                            <!-- <th>접수일</th> -->
                            <th ng-click="changeSortOrder($event)" data-sort="resultRegDt" data-order="desc"><span>결과 등록일<a href="javascript:void(0);" style="display:none;" class="down" ></a></span></th>
						</tr>
					</thead>
					<tbody ng-show="$root.exchange.studentOut.studentOutList.length == 0">
						<!-- 등록된 학기가 없을 경우 문구 출력 style="display:lnline-block;"  있을경우 style="display:none;"-->
						<tr class="nosearchData" style="display: lnline-block;">
							<td colspan="12">검색된 학생 이력이 없습니다.</td>
						</tr>
					</tbody>
					<tbody ng-show="$root.exchange.studentOut.studentOutList.length > 0">
						<tr ng-repeat="studentOutInfo in $root.exchange.studentOut.studentOutList | orderBy:descRn:false">
							<td>{{studentOutInfo.userName}}</td>
							<!-- <td>{{studentOutInfo.userUnivCodeName}}</td> -->
							<td class="_aL">{{studentOutInfo.year}}년도 {{studentOutInfo.semesterCodeName}}</td>
							<td>{{studentOutInfo.userDepartment}}</td>
							<td>{{studentOutInfo.studentGradeCodeName}}</td>
							<td>{{studentOutInfo.studentNumber}}</td>
							<td>{{studentOutInfo.univCodeName}}</td>
							<td>{{studentOutInfo.subjectNum}}</td>
							<td class="_aL">{{studentOutInfo.subjectName}}</td>
							<td>{{studentOutInfo.subjectPoint}}</td>
							<td>{{studentOutInfo.classNum}}</td>
							<td>{{studentOutInfo.mouStudentNumber}}</td>
							<!-- <td>{{studentOutInfo.regDt}}</td> -->
							<td>{{studentOutInfo.resultRegDt}}</td>
						</tr>
					</tbody>
				</table>
				<div ng-show="$root.exchange.studentOut.studentOutList.length > 0" id="studentOutListPaging" class="_paging"></div>
				<div class="_areaButton">
					<div class="_search pr0 _right">
						<div class="_btnSet pr0">
							<span class="_large"><a href="javascript:void(0);" class="downBtn" ng-click="excelDown()">엑셀다운</a></span>
						</div>
						<fieldset>
							<legend>개수</legend>
							<select name="findType" class="_selectBox wx70" ng-model="$root.exchange.studentOut.maxRowCnt" ng-change="changeMaxRowCnt()">
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
		</div>
	</div>
	<form id="excelForm" name="excelForm" method="post" action=""></form>
</div>
