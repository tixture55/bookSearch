//トップへ戻る
$(function() {
	    var topBtn = $('footer #btn_top');
			    var btnTop = topBtn.offset().top;
					    var btnHeight = topBtn.height();
							    topBtn.hide();
									    $(window).scroll(function () {
												        var footerTop = $('footer').offset().top;
																        if ($(this).scrollTop() > 100) {
																					            topBtn.fadeIn();
																											            if($(this).scrollTop() + btnTop + btnHeight > footerTop) {
																																		                topBtn.children('img').attr('src', '/assets/img/navi/base/btn_top2.png');
																																										            } else {
																																																	                topBtn.children('img').attr('src', '/assets/img/navi/base/btn_top.png');
																																																									            }
																																																															        } else {
																																																																				            topBtn.fadeOut();
																																																																										        }
																																																																														    });
});

$(function() {
	    $('#btn_top').click(function() {
				        $('body, html').animate({
									            scrollTop: 0
															        }, 500);
								        return false;
												    });
});

//モーダルウィンドウ表示
function modal(id) {

	    var target = '#' + id;
			    $("body").append('<div id="modal-overlay"></div>');
					    $("#modal-overlay").fadeIn("normal");

							    //コンテンツをセンタリングする
									    centeringModalSyncer();

											    //コンテンツをフェードインする
													    $(target).fadeIn("normal");

															    //[#modal-overlay]、または[#modal-close]をクリックしたら…
																	    $("#modal-overlay,.modal-close,#cansel_rakusen").unbind().click(function(){
																				            //[#modal-content]と[#modal-overlay]をフェードアウトした後に…
																										            $(target+",#modal-overlay").fadeOut("normal",function(){
																																	                    //[#modal-overlay]を削除する
																																											                    $('#modal-overlay').remove();
																																																					            });
																																    });

																			    //リサイズされたら、センタリングをする関数[centeringModalSyncer()]を実行する
																					    $(window).resize(centeringModalSyncer(target));

																							    function centeringModalSyncer(){
																										            //画面(ウィンドウ)の幅、高さを取得
																																            var w = $(window).width();
																																						            var h = $(window).height();

																																												            //コンテンツ(#modal-content)の幅、高さを取得
																																																		            var cw = $(target).outerWidth();
																																																								            var ch = $(target).outerHeight();

																																																														            //センタリングを実行する
																																																																				            $(target).css({"left": ((w - cw)/2) + "px","top": ((h - ch)/2) + "px"});
																																																																										    }
}

/*****@top page*****/
//企業検索モーダル表示
function show_search(index) {
	    var tabs = $('#modal_search');
			    tabs.find('li:nth-child('+index+') a').trigger('click');
					    modal('modal_search');
}

//説明会検索モーダル表示
function show_esearch(index) {
	    var tabs = $('#modal_search_e');
			    tabs.find('li:nth-child('+index+') a').trigger('click');
					    modal('modal_search_e');
}

//検索モーダル内、要素選択時タブの高さadjust
$(document).on('click', '#modal_search label, #modal_search_e label', function() {
	    var selected = $(this).text();
			    var tabIndex = $(this).parents('.tab-pane').attr('id');
					    var tab = $('a[href=#'+tabIndex+'] span').text(selected);
							    var tabHeight = tab.outerHeight();
									    $(this).parents('.modal-content').find('ul li a').height(tabHeight);
});


//企業検索モーダル閉じる際、選択要素を引き継ぎ
$(document).on('click', '#modal-overlay, #modal_search .modal-close', function() {
	    var textInd = $('#modal_search input[name="industories[]"]:checked + label').text();
			    var textJobc = $('#modal_search input[name="job_categories[]"]:checked + label').text();
					    var textPref = $('#modal_search input[name="prefectures[]"]:checked + label').text();

							    if(textInd != '') {
										        $('.top_search #tab_s1 .search-menu-list li:nth-child(1)').html('<span>【業種】</span>'+textInd);
														    }
																    if(textJobc != '') {
																			        $('.top_search #tab_s1 .search-menu-list li:nth-child(2)').html('<span>【職種】</span>'+textJobc);
																							    }
																									    if(textPref != '') {
																												        $('.top_search #tab_s1 .search-menu-list li:nth-child(3)').html('<span>【勤務地】</span>'+textPref);
																																    }
});

//説明会検索モーダル閉じる際、選択要素を引き継ぎ
$(document).on('click', '#modal-overlay, #modal_search_e .modal-close', function() {
	    var eventDate = $('#modal_search_e input[name="event_date"]').val();
			    var textInd = $('#modal_search_e input[name="industories[]"]:checked + label').text();
					    var textPref = $('#modal_search_e input[name="prefectures[]"]:checked + label').text();

							    if(eventDate != '') {
										        $('.top_search #tab_s2 .search-menu-list li:nth-child(1)').html('<span>【開催日】</span>'+eventDate);
														    }
																    if(textInd != '') {
																			        $('.top_search #tab_s2 .search-menu-list li:nth-child(2)').html('<span>【業種】</span>'+textInd);
																							    }
																									    if(textPref != '') {
																												        $('.top_search #tab_s2 .search-menu-list li:nth-child(3)').html('<span>【開催地】</span>'+textPref);
																																    }
});

//説明会検索、開催日時date picker
$(function() {
	    $('#event_date').datepicker({
				        todayHighlight: true,
								        language: 'ja'
												    });
			    $('#event_date').on('changeDate', function() {
						        $('#input_event_date').val(
										            $('#event_date').datepicker('getFormattedDate')
																        );
										        var tabIndex = $(this).parents('.tab-pane').attr('id');
														        var tab = $('a[href=#'+tabIndex+'] span').text($('#event_date').datepicker('getFormattedDate'));
																		        var tabHeight = tab.outerHeight();
																						        $(this).parents('.modal-content').find('ul li a').height(tabHeight);
																										    });
});

/*****list page*****/
$(document).on('click', '.nec_login', function() {
	    var urlFbLogin = $('#btn_fb_login').attr('href');
			    $('#btn_fb_login').attr('href', urlFbLogin+'?posi='+$(this).parents('li').attr('id'));
					    $('#modal_login input[name=position]').val(1);
							    modal('modal_login');
									    return false;
});

//新規タブで開く
$(document).on('click', '.list_event .btn_view_event a', function() {
	    var url = $(this).attr('href');
			    window.open(url, '_blank');
					    return false;
});

//ブックマーク
$(document).on('click', '.btn_bookmark:not(.nec_login)', function() {
	    var star = $(this);
			    var cid = $(this).children('input[type=hidden]').val();
					    $.ajax({
								        url: '/api/bookmarktoggle.json',
												        method: "POST",
																        data:{
																					                fuel_csrf_token: fuel_csrf_token(),
																													                company_id: cid
																																					        },
																																									        success: function(data){
																																														            if(data.success) {
																																																					                if(data.bkmk_status == 0) {
																																																														                    star.removeClass('active');
																																																																								                    var notice = '<div class="bookmarked">ブックマークを外しました。</div>';
																																																																																		                } else {
																																																																																											                    star.addClass('active');
																																																																																																					                    var notice = '<div class="bookmarked">ブックマークしました。</div>';
																																																																																																															                }
																																																																																																																							                $('.bookmarked').remove();
																																																																																																																															                $('body').append(notice);
																																																																																																																																							                $('.bookmarked').fadeOut(3000);
																																																																																																																																															            }
																																																																																																																																																					        },
																																																																																																																																																									        error: function(){
																																																																																																																																																														//            alert('ブックマークにはログインが必要です。');
																																																																																																																																																														        }
																																																																																																																																																																		    });
});

$(document).on('click', '.container_btn .nologin', function() {
	    var urlFbLogin = $('#btn_fb_login').attr('href');
			    $('#btn_fb_login').attr('href', urlFbLogin+'?ret_com=1');
					    $('#modal_login input[name=position]').val(2);
							    modal('modal_login');
});

//list全体をクリック領域とする
$(document).on('click', '.list_company > li > div:not(.btn-container), .list_rank > li > div:not(.btn-container)', function() {
	    var url = $(this).parent('li').find('h2 > a').attr('href');
			    window.open(url, '_blank');
					    return false;
});
$(document).on('click', '.list_event > li', function() {
	    var url = $(this).find('h2 > a').attr('href');
			    window.open(url, '_blank');
					    return false;
});

/*****company page*****/
//私の志望動機取得
$(document).on('click', '.letter_thumb', function() {
	    var lid = $(this).children('input[type=hidden]').val();
			    $.ajax({
						        url: '/api/get_letter.json',
										        method: "POST",
														        data:{
																			                fuel_csrf_token: fuel_csrf_token(),
																											                lid: lid
																																			        },
																																							        success: function(data){
																																												            var letter = $('#modal_letter');
																																																		            letter.find('.letter_staffname').html(data.staff_name);
																																																								            letter.find('.letter_staffposi').html(data.staff_position);
																																																														            letter.find('.letter_univhis').html(data.staff_univ_history);
																																																																				            letter.find('.letter_title').html(data.letter_title);
																																																																										            letter.find('.letter_content').html(data.letter_content);
																																																																																            letter.find('.letter_img').attr('src', data.letter_img);
																																																																																						            modal('modal_letter');
																																																																																												        },
																																																																																																        error: function(){
																																																																																																					            alert('エラー');
																																																																																																											        }
																																																																																																															    });
});

$(document).on('click', '.list_event_ic', function() {
	    var url = $(this).find('h3 a').attr('href');
			    window.open(url, '_blank');
					    return false;
});


/*****seach page*****/
$(document).on('click', '.js-open-search', function() {
	    $(this).siblings('form').toggleClass('disp_none');
});
$(document).on('change', 'input[name=pref_area]', function() {
	    if($(this).prop('checked') == true) {
				        $(this).parents(' .pref_area').next('.row').find('input[type=checkbox]').prop('checked', true);
								    } else {
											        $(this).parents(' .pref_area').next('.row').find('input[type=checkbox]').prop('checked', false);
															    }
});


/*****sign in*****/
$(document).on('change', '.signin-table input[name="industory[]"]', function() {
	    if($('input[name="industory[]"]:checked').length > 3) {
				        $('input[type=submit]').prop('disabled', true);
								        alert('志望業界の選択は3つまでです。');
												    } else {
															        $('input[type=submit]').prop('disabled', false);
																			    }
});

$(document).on('change', '.signin-table input[name="job_category[]"]', function() {
	    if($('input[name="job_category[]"]:checked').length > 3) {
				        $('input[type=submit]').prop('disabled', true);
								        alert('志望職種の選択は3つまでです。');
												    } else {
															        $('input[type=submit]').prop('disabled', false);
																			    }
});

$(function() {
	    var now_year = new Date().getFullYear();
			    $(".birth_month").change(function () {

						            var year  = $("[name='birth_year']   option:selected").val();
												            var month = $("[name='birth_month']  option:selected").val();
																		            var day   = new Date(year, month, 0).getDate();

																								            $(".birth_day").empty();

																														            for (var i = 1; i <= day ;i++) {
																																					            $(".birth_day").append("<option value='"+i+"'>"+i+"</option>");
																																											            }

																																																	    });
});

//address auto fill
$(window).load(function() {
	    $('#postal_code').jpostal({
				        postcode : [
								                '#current_postal_first',
																                '#current_postal_last'
																								        ],
																												        address : {
																																	                '#prefecture' : '%3',
																																									                '#address' : '%4%5'
																																																	        }
																																																					    });
});

//kana auto fill
$(function() {
	    $.fn.autoKana('#sei_kanji', '#sei_kana', {
				        katakana: true
								    });
			    $.fn.autoKana('#mei_kanji', '#mei_kana', {
						        katakana: true
										    });
});

//univ suggest
var start = function(){
	    $.ajax({
				        url: '/api/selectUni.json',
								        dataType: 'json',
												        success: function(resp) {
																	            new Suggest.Local("school_name", "suggest", resp, {highlight: true});
																							        }
																											    });
};
window.addEventListener ?
window.addEventListener('load', start, false) :
window.attachEvent('onload', start);

$(document).on('click', '#search_gakubu', function() {
	    $.ajax({
				        url: '/api/getGakubu.json',
								        dataType: 'json',
												        data: {
																	            school: $('#school_name').val()
																							        },
																											        success: function(res) {
																																            var buttons = '';
																																						            $.each(res, function(i, value) {
																																													                buttons += '<button class="btn_gakubu" type="button">'+value+'</button>';
																																																					            });
																																												            $('.btn_gakubu').remove();
																																																		            $('#gakubu').after(buttons);
																																																								        }
																																																												    });
});

$(document).on('click', '.btn_gakubu', function() {
	    $('#gakubu').val($(this).text());
});

$(document).on('click', '#search_gakka', function() {
	    $.ajax({
				        url: '/api/getGakka.json',
								        dataType: 'json',
												        data: {
																	            school: $('#school_name').val(),
																							            gakubu: $('#gakubu').val()
																													        },
																																	        success: function(res) {
																																						            var buttons = '';
																																												            $.each(res, function(i, value) {
																																																			                buttons += '<button class="btn_gakka" type="button">'+value+'</button>';
																																																											            });
																																																		            $('.btn_gakka').remove();
																																																								            $('#gakka').after(buttons);
																																																														        }
																																																																		    });
});

$(document).on('click', '.btn_gakka', function() {
	    $('#gakka').val($(this).text());
});

$(document).on('change', 'select[name=school_type]', function() {
	    if($('#school_name').val() != '') {
				        if(confirm('学校名等に入力された値はクリアされます。\nよろしいですか？')){
									            $('#school_name, #gakubu, #gakka').val('');
															            $('.btn_gakubu, .btn_gakka').remove();
																					        } else {
																										            return false;
																																        }
																																				    }
});

$(document).on('change', 'select[name="industory[]"]', function() {
	    $('select[name="industory[]"] option').prop('disabled', false);
			    $('select[name="industory[]"]').each(function() {
						        var selected = $(this).val();
										        $('select[name="industory[]"]').not($(this)).find('option[value='+selected+']').prop('disabled', true);
														    });
});

$(document).on('change', 'select[name="job_category[]"]', function() {
	    $('select[name="job_category[]"] option').prop('disabled', false);
			    $('select[name="job_category[]"]').each(function() {
						        var selected = $(this).val();
										        $('select[name="job_category[]"]').not($(this)).find('option[value='+selected+']').prop('disabled', true);
														    });
});

//$(document).on('focusout', 'input[name=mobile_number]', function() {
	//    var number = $(this).val();
	//    var replaced = number.slice(0, 3) + '-' + number.slice(3, 7) + '-' + number.slice(7, number.length);
	//    $(this).val(replaced);
	//});

