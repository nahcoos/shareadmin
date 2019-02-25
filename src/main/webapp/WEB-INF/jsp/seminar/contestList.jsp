<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace('contents', {
			customConfig : '${pageContext.request.contextPath}/js/ckEditorConfig.js',
			height : '446px'
		});
	});
</script>
<!-- cont_bar -->
<div class="rightConBoxing">
	<div class="tab_wraping">
		<!-- tab1 -->
		<div id="tab1" class="tab-content current">
			<h5 class="cont_Title">
				공모전/경시대회 관리
				<div class="pg_location">
					<a>Go home</a> <span>&gt;</span>공모전/경시대회 관리
				</div>
			</h5>
			<div id="innTabContent">
				<!-- article list -->
				<div class="_articleContent" ng-show="$root.seminar.contest.pageViewType == 'list'">
                    <div class="_border _write mt10">
                        <div class="_inner">
                            <fieldset>
                            <legend>월별 접속통계 조회 </legend>
                            <form name="selYearForm" method="post">
                                <div class="_form _both">
                                    <div class="_insert tableWrap">
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
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <td><label for="cla_kind" class="pl10">분류</label></td>
                                                        <td>
                                                            <select name="cla_kind" id="sch_year" class="_selectBox _fL wx150"
																ng-model="$root.seminar.contest.searchSeminarType">
																<option value="">전체</option>
																<option value="contest">공모전</option>
																<option value="competition">경시대회</option>
															</select>
                                                        </td>
                                                        <td><label for="cla_state" class="pl20">노출여부</label></td>
                                                        <td>
															<select name="cla_visual" id="sch_kind" class="_selectBox _fL wx100" ng-model="$root.seminar.contest.searchDisplayYn">
																<option value="">전체</option>
																<option value="display">노출</option>
																<option value="none">비노출</option>
															</select>
														</td>
                                                        <td><label for="sch_search" class="pl20">검색</label></td>
                                                        <td colspan="3">
                                                            <select name="sch_search" id="sch_search" class="_selectBox _fL wx100"
                                                        		ng-model="$root.seminar.contest.searchEtcOption">
                                                                <option value="">전체</option>
                                                                <option value="title">제목</option>
                                                                <option value="place">장소</option>
                                                            </select>
                                                            <input type="text" placeholder="" class="wx180" ng-model="$root.seminar.contest.searchKeywords" kr-input>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="sch_kind" class="pl10">학교 구분</label></td>
                                                        <td>
                                                            <select name="mem_college" id="mem_college" class="_selectBox _fL wx150"
						                                    	ng-model="$root.seminar.contest.searchUnivArea" ng-change="getChildCdList('searchUnivArea', 'searchUniv')">
																<option value="{{code.code}}"
																	ng-repeat="code in $root.seminar.contest.searchUnivAreaList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
                                                        </td>
                                                        <td colspan="2">
                                                            <select name="mem_college" id="mem_college" class="_selectBox _fL w99"
																ng-model="$root.seminar.contest.searchUniv">
																<option value="{{code.code}}"
																	ng-repeat="code in $root.seminar.contest.searchUnivList | orderBy:codeIdx:false">{{code.codeName}}</option>
															</select>
                                                        </td>
                                                        <td><label for="" class="pl20"></label></td>
                                                        <td>
                                                            <label for="" class="pl20 wx100"></label>
                                                        </td>
                                                        <td><label for="" class="pl20 wx50"></label></td>
                                                        <td><label for="" class="pl20 wx80"></label></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="_areaButton innerBtn">
                                            <div class="_right">
                                                <span class="_button _small _active searchBtn">
													<input type="button" value="조회" ng-click="search(true);">
												</span>
												<span class="_button _small resetBtn mt2">
													<input type="button" value="초기화" ng-click="resetSearchFiled();">
												</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </fieldset>
                        </div>
                    </div>
                    <div class="_listHead">
                        <div class="_count">
                            총  <strong>{{$root.seminar.contest.totalCnt}}</strong>  건이 검색되었습니다.
                        </div>
                        <div class="_search pr0">
                            <div class="_btnSet pr0">
                                <span class="_button _large">
									<a  class="_blockUI mainBtn"  ng-click="goContestRegistView()">등록</a>
								</span>
								<span class="_large">
									<a  class="_blockUI downBtn"  ng-click="excelDown();">엑셀다운</a>
								</span>
                            </div>
                            <fieldset>
                                <legend>개수</legend>
                                <select name="findType" class="_selectBox wx70" ng-model="$root.seminar.contest.maxRowCnt" ng-change="changeMaxRowCnt()">
                                    <option value="10">10개 </option>
                                    <option value="20">20개 </option>
                                    <option value="30">30개 </option>
                                    <option value="40">40개 </option>
                                    <option value="50">50개 </option>
                                </select>
                            </fieldset>
                        </div>
                    </div>
                    <table class="_table _list w100 ">
                        <caption>표 제목</caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:60px;">
                            <col style="width:10%;"> 
                            <col style="width:10%;">
                            <col style="width:12%;">
                            <col style="width:80px;">
                            <col style="width:80px;">
                            <col style="width:80px;">
                            <col style="width:60px;">   
                            <col style="width:8%;">
                            <col style="width:80px;">   
                        </colgroup>
                        <thead>
                            <tr>
                            	<th>이미지</th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="seminarType" data-order="desc"><span>분류<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="univCode" data-order="desc"><span class="">학교구분<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="applyStartDay" data-order="desc"><span class="">접수기간<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="title" data-order="desc"><span class="">제목<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="place" data-order="desc"><span class="">장소<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="classDay" data-order="desc"><span class="">날짜<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="classStartTime" data-order="desc"><span class="">시간<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="displayYn" data-order="desc"><span class="">노출<br>여부<a class="down"></a></span></th>
								<th class="lineUp" ng-click="changeSortOrder($event)" data-sort="regDt" data-order="desc"><span class="">작성일<a class="down"></a></span></th>
								<th>수정</th>
                            </tr>
                        </thead>
                        <tbody ng-show="$root.seminar.contest.contestList.length == 0">
                            <!-- 등록된 공모전/경시대회가 없을 경우 문구 출력 style="display:lnline-block; -->
                            <tr class="nosearchData" style="display:lnline-block;">
                                <td colspan="11">
                                검색된 공모전/경시대회가 없습니다.
                                </td>
                            </tr>
                        </tbody>
                        <tbody ng-show="$root.seminar.contest.contestList.length > 0">
                            <tr ng-repeat="contestInfo in $root.seminar.contest.contestList">
                                <td><div class="imgfile"><img src="{{contestInfo.thumbnailUrl}}" style="width:76px;height:50px;"></div></td>
                                <td>{{getSeminarColStr($index, 'seminarType') }}</td>
								<td>{{contestInfo.univCodeName }}</td>
								<td>{{contestInfo.applyStartDay | getDateString:'yyyy.MM.dd' }}<br>~{{contestInfo.applyEndDay | getDateString:'yyyy.MM.dd' }}</td>
								<td>{{contestInfo.title }}</td>
								<td>{{contestInfo.place }}</td>
								<td>{{contestInfo.classDay | getDateString:'yyyy.MM.dd' }}</td>
								<td>{{contestInfo.classStartTime | formatTime }}~<br>{{contestInfo.classEndTime | formatTime }}</td>
								<td>{{getSeminarColStr($index, 'displayYn') }}</td>
								<td>{{contestInfo.regDt | getDateString:'yyyy.MM.dd' }}</td>
                                <td><span class="_button _minimum _green"><a  ng-click="goContestRegistView(contestInfo.seminarSeq, $index);">수정</a></span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="_paging" ng-show="$root.seminar.contest.contestList.length > 0" id="contestListPaging"></div>
                    <div class="_areaButton">
                        <div class="_search pr0 _right">
                            <div class="_btnSet pr0">
                                <span class="_button _large">
									<a  class="_blockUI mainBtn"  ng-click="goContestRegistView()">등록</a>
								</span>
                                <span class="_large">
									<a  class="_blockUI downBtn"  ng-click="excelDown();">엑셀다운</a>
								</span>
                            </div>
                            <fieldset>
                                <legend>개수</legend>
                                <select name="findType" class="_selectBox wx70" ng-model="$root.seminar.contest.maxRowCnt" ng-change="changeMaxRowCnt()">
                                    <option value="10">10개 </option>
                                    <option value="20">20개 </option>
                                    <option value="30">30개 </option>
                                    <option value="40">40개 </option>
                                    <option value="50">50개 </option>
                                </select>
                            </fieldset>
                        </div>
                    </div>
                </div>
				<!-- // article list -->
				<!-- article modify -->
				<div class="_articleContent" ng-show="$root.seminar.contest.pageViewType == 'modify'">
					<table class="_table _view w100">
						<caption>회원정보 수정 표</caption>
						<colgroup>
							<col style="width: 150px;">
							<col>
							<col style="width: 150px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>분류 <span class="mark"></span></th>
								<td>
									<div class="radioWrap">
										<div class="radio">
											<input type="radio" id="rad_Chek07" name="sch_conference" title="공모전" value="contest" ng-model="$root.seminar.contest.contestInfo.seminarType">
											<label for="rad_Chek07"><span></span>공모전</label>
										</div>
										<div class="radio">
											<input type="radio" id="rad_Chek08" name="sch_conference" title="경시대회" value="competition" ng-model="$root.seminar.contest.contestInfo.seminarType">
											<label for="rad_Chek08"><span></span>경시대회</label>
										</div>
									</div>
								</td>
								<th>학교구분 <span class="mark">*</span></th>
								<td>
									<select name="sch_kind" id="sch_kind" class="_selectBox _fL wx115" ng-model="$root.seminar.contest.contestInfo.univAreaCode" ng-change="getChildCdList('univAreaCode', 'univCode')">
										<option value="{{code.code}}" ng-repeat="code in $root.seminar.contest.univAreaCodeList | orderBy:codeIdx:false">{{code.codeName}}</option>
									</select>
									<select name="sch_kind2" id="sch_kind2" class="_selectBox _fL w70" ng-model="$root.seminar.contest.contestInfo.univCode">
										<option value="{{code.code}}" ng-repeat="code in $root.seminar.contest.univCodeList | orderBy:codeIdx:false">{{code.codeName}}</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>제목 <span class="mark">*</span></th>
								<td colspan="3"><input type="text" class="w100" ng-model="$root.seminar.contest.contestInfo.title" kr-input></td>
							</tr>
							<tr>
								<th>접수기간 <span class="mark">*</span></th>
								<td>
									<div class="cal_type">
                                        <p class="date"><span><input type="text" id="picker_before" ng-model="$root.seminar.contest.contestInfo.applyStartDay"></span><label class="pickerlabel" for="picker_before"></label></p>
                                        <p class="date"><span><input type="text" id="picker_after" ng-model="$root.seminar.contest.contestInfo.applyEndDay"></span><label class="pickerlabel" for="picker_after"></label></p>
                                    </div>
								</td>
								<th>날짜 <span class="mark"></span></th>
								<td>
									<div class="cal_type">
                                    	<p class="date"><span><input type="text" id="picker_classday" ng-model="$root.seminar.contest.contestInfo.classDay"></span><label class="pickerlabel" for="picker_classday"></label></p>
                                    </div>
								</td>
							</tr>
							<tr>
								<th>장소 <span class="mark"></span></th>
								<td><input type="text" id="" placeholder="" class="w100" ng-model="$root.seminar.contest.contestInfo.place" kr-input></td>
								<th>시간 <span class="mark"></span></th>
								<td>
									<select name="sch_timeH" id="sch_timeH" class="_selectBox _fL w15 mr05" ng-model="$root.seminar.contest.contestInfo.classStartHour">
										<option value="">선택</option>
                                        <option value="00">0</option>
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
									</select>
									<label for="time_hour" class="pr10">시</label>
									<select name="sch_timeM" id="sch_timeM" class="_selectBox _fL w15 mr05" ng-model="$root.seminar.contest.contestInfo.classStartMinute">
										<option value="">선택</option>
                                        <option value="00">00</option>
                                        <option value="05">05</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
                                        <option value="25">25</option>
                                        <option value="30">30</option>
                                        <option value="35">35</option>
                                        <option value="40">40</option>
                                        <option value="45">45</option>
                                        <option value="50">50</option>
                                        <option value="55">55</option>
									</select>
									<label for="time_minute" class="pr10">분</label>
									<select name="sch_timeH" id="sch_timeH" class="_selectBox _fL w15 ml20" ng-model="$root.seminar.contest.contestInfo.classEndHour">
										<option value="">선택</option>
                                        <option value="00">0</option>
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
									</select>
									<label for="time_hour" class="pr10">시</label>
									<select name="sch_timeM" id="sch_timeM" class="_selectBox _fL w15 mr05" ng-model="$root.seminar.contest.contestInfo.classEndMinute">
										<option value="">선택</option>
                                        <option value="00">00</option>
                                        <option value="05">05</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
                                        <option value="25">25</option>
                                        <option value="30">30</option>
                                        <option value="35">35</option>
                                        <option value="40">40</option>
                                        <option value="45">45</option>
                                        <option value="50">50</option>
                                        <option value="55">55</option>
									</select>
									<label for="time_minute" class="pr10">분</label>
								</td>
							</tr>
							<tr>
								<th>노출여부 <span class="mark"></span></th>
								<td>
									<div class="radioWrap">
										<div class="radio">
											<input type="radio"	id="rad_Chek05" name="visual" title="노출" value="display" ng-model="$root.seminar.contest.contestInfo.displayYn">
											<label for="rad_Chek05"><span></span>노출</label>
										</div>
										<div class="radio">
											<input type="radio" id="rad_Chek06" name="visual" title="비노출" value="none" ng-model="$root.seminar.contest.contestInfo.displayYn">
											<label for="rad_Chek06"><span></span>비노출</label>
										</div>
									</div>
								</td>
								<th>서울시교류여부 <span class="mark"></span></th>
								<td>
									<div class="radioWrap">
										<div class="radio">
											<input type="radio" id="rad_Chek03" name="city_exchange" title="교류" value="exchange" ng-model="$root.seminar.contest.contestInfo.exchangeYn">
											<label for="rad_Chek03"><span></span>교류</label>
										</div>
										<div class="radio">
											<input type="radio" id="rad_Chek04" name="city_exchange" title="비교류" value="unexchange" ng-model="$root.seminar.contest.contestInfo.exchangeYn">
											<label for="rad_Chek04"><span></span>비교류</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th ng-if="$root.seminar.contest.contestInfo.regUserName != null">작성자 <span class="mark"></span></th>
                            	<td ng-if="$root.seminar.contest.contestInfo.regUserName != null">{{$root.seminar.contest.contestInfo.regUserName }}</td>
                            	<th ng-if="$root.seminar.contest.contestInfo.regDt != null">작성일 <span class="mark"></span></th>
                            	<td ng-if="$root.seminar.contest.contestInfo.regDt != null">{{$root.seminar.contest.contestInfo.regDt }}</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td colspan="3" class="thumbnail">
									<ul>
                                        <li>
                                            <span class="_button _minimum _gray">
                                           		<label for="thumbnailImageFile" style="cursor: pointer;min-width: 65px;height:28px;line-height:28px;border: 1px solid #757575;border-radius: 4px;background-color: #fff;color: #757575;letter-spacing: -.01em;padding: 0 .5em;background: #fff;text-align: center;word-wrap: break-word;display: inline-block;zoom: 1;margin: 0;font-size: 100%;vertical-align: baseline;font-weight: bold;border-spacing: 0;">이미지 등록</label>
                                                <input id="thumbnailImageFile" type="file" ng-file-select="onFileSelect($files)" nv-file-select uploader="$root.seminar.contest.uploader" ng-model="$root.seminar.contest.contestInfo.imgSrc" style="display: none;" />
                                            </span>
                                            <span></span>
                                        </li>
                                        <li>
                                        	<div class="addThumbnail">
												<span></span>
												<span class=" file_close">
												</span>
											</div>
                                        </li>
                                        <li class="imgList">
                                            <div class="imgfile">
                                                <img id="thumb-img" ng-show="$root.seminar.contest.contestInfo.imgSrc != null" ng-src="{{$root.seminar.contest.contestInfo.imgSrc }}" style="width:190px;height:120px;" alt="">
                                            </div>
                                        </li>
                                        <li>
                                            <span class="caution">* 사이즈 000 x 000, 10mb 이내 이미지만 첨부 가능합니다.</span>
                                        </li>
                                    </ul>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<ul>
                                        <li>
                                            <span class="_button _minimum _gray ml10">
												<a  onclick="$(this).next().click();" class="tabInnBtn typeB">파일선택</a>
												<input type="file" id="mfiles" class="ng-hide" nv-file-select uploader="$root.seminar.contest.multiUploader" multiple/>
											</span>
                                        </li>
                                        <li>
                                            <div class="addFileList" ng-repeat="fileInfo in $root.seminar.contest.multiUploader.queue | orderBy:descRn:false">
												<span>{{fileInfo.file.name}}</span>
												<span class=" file_close">
													<a  class="" ng-click="$root.seminar.contest.multiUploader.queue.splice($index, 1);">삭제</a>
												</span>
											</div>
											<div class="addFileList" ng-repeat="fileInfo in $root.seminar.contest.contestInfo.fileList | orderBy:descRn:false">
												<span><a href="{{fileInfo.downloadUrl}}">{{fileInfo.oriFileName}}</a></span>
												<span class=" file_close">
													<a  class="" ng-click="removeAttachFile($index)">삭제</a>
													<input type="hidden" id="fileKey_{{$index}}" name="fileKey" value="{{fileInfo.fileKey}}"/>
												</span>
											</div>
                                        </li>
                                        <li>
                                            <span class="caution">* 10mb 이내 최대 5개의 문서만 첨부 가능합니다. (PDF, ppt, pptx, hwp, doc, docx)</span>
                                        </li>
                                    </ul>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="infoWrap">
                        <div class="infoTitle pl10">강좌 내용입력</div>
                        <div class="infoEditer">
                        	<textarea id="contents" name="contents" ng-model="$root.seminar.contest.contestInfo.contents"></textarea>
                        </div>
                    </div>
					<div class="_areaButton">
						<div class="_center">
							<span class="_button _large blackBtn"><a  class="_blockUI wx135"  ng-click="submit();">저장</a></span>
                            <span class="_button _large borderBtn"><a  class="_blockUI wx135"  ng-click="goContestListView();">취소</a></span>
                            <span class="_button _large borderBtn" ng-show="$root.seminar.contest.isModify"><a  class="_blockUI wx135"  ng-click="deleteContest();">삭제</a></span>
						</div>
					</div>
				</div>
				<!-- // article modify -->
			</div>
		</div>
		<!-- // tab1 -->
		<form id="excelForm" name="excelForm" method="post" action=""></form>
	</div>
</div>
<!-- // cont_right -->
