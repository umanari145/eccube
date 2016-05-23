<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->

<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/products.js"></script>
<script type="text/javascript">//<![CDATA[
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
    // 並び順を変更
    function fnChangeOrderby(orderby) {
        fnSetVal('orderby', orderby);
        fnSetVal('pageno', 1);
        fnSubmit();
    }
    // 表示件数を変更
    function fnChangeDispNumber(dispNumber) {
        fnSetVal('disp_number', dispNumber);
        fnSetVal('pageno', 1);
        fnSubmit();
    }
//]]></script>

<div id="undercolumn">
    <form name="form1" id="form1" method="get" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="<!--{$mode|h}-->" />
        <!--{* ▼検索条件 *}-->
        <input type="hidden" name="category_id" value="<!--{$arrSearchData.category_id|h}-->" />
        <input type="hidden" name="maker_id" value="<!--{$arrSearchData.maker_id|h}-->" />
        <input type="hidden" name="name" value="<!--{$arrSearchData.name|h}-->" />
        <!--{* ▲検索条件 *}-->
        <!--{* ▼ページナビ関連 *}-->
        <input type="hidden" name="orderby" value="<!--{$orderby|h}-->" />
        <input type="hidden" name="disp_number" value="<!--{$disp_number|h}-->" />
        <input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->" />
        <!--{* ▲ページナビ関連 *}-->
        <input type="hidden" name="rnd" value="<!--{$tpl_rnd|h}-->" />
    </form>

    <!--★タイトル★-->
    <h2 class="title"><!--{$tpl_subtitle|h}--></h2>

    <!--▼検索条件-->
    <!--{if $tpl_subtitle == "検索結果"}-->
        <ul class="pagecond_area">
            <li><strong>カテゴリ：</strong><!--{$arrSearch.category|h}--></li>
        <!--{if $arrSearch.maker|strlen >= 1}--><li><strong>メーカー：</strong><!--{$arrSearch.maker|h}--></li><!--{/if}-->
            <li><strong>動画名：</strong><!--{$arrSearch.name|h}--></li>
        </ul>
    <!--{/if}-->
    <!--▲検索条件-->

    <!--▼ページナビ(本文)-->
    <!--{capture name=page_navi_body}-->
        <div class="pagenumber_area clearfix">
            <div class="change">
                表示件数
                <select name="disp_number" onchange="javascript:fnChangeDispNumber(this.value);">
                    <!--{foreach from=$arrPRODUCTLISTMAX item="dispnum" key="num"}-->
                        <!--{if $num == $disp_number}-->
                            <option value="<!--{$num}-->" selected="selected" ><!--{$dispnum}--></option>
                        <!--{else}-->
                            <option value="<!--{$num}-->" ><!--{$dispnum}--></option>
                        <!--{/if}-->
                    <!--{/foreach}-->
                </select>
            </div>
            <div class="navi"><!--{$tpl_strnavi}--></div>
        </div>
    <!--{/capture}-->
    <!--▲ページナビ(本文)-->

    <!--{foreach from=$arrProducts item=arrProduct name=arrProducts}-->

        <!--{if $smarty.foreach.arrProducts.first}-->
            <!--▼件数-->
            <div>
                <span class="attention"><!--{$tpl_linemax}-->件</span>
            </div>
            <!--▲件数-->

            <!--▼ページナビ(上部)-->
            <form name="page_navi_top" id="page_navi_top" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <!--{if $tpl_linemax > 0}--><!--{$smarty.capture.page_navi_body|smarty:nodefaults}--><!--{/if}-->
            </form>
            <!--▲ページナビ(上部)-->
        <!--{/if}-->

        <!--{assign var=id value=$arrProduct.product_id}-->
        <!--{assign var=arrErr value=$arrProduct.arrErr}-->
        <!--▼商品-->
        <form name="product_form<!--{$id|h}-->" action="?" onsubmit="return false;">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <div class="list_area clearfix">

            <div class="listphoto">
                <!--★画像★-->
                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->">
                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_list_image|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" class="picture" /></a>
            </div>
            <!--★商品名★-->
            <h3>
                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->"><!--{$arrProduct.name|h}--></a>
            </h3>
        </div>
        </form>
        <!--▲商品-->

        <!--{if $smarty.foreach.arrProducts.last}-->
            <!--▼ページナビ(下部)-->
            <form name="page_navi_bottom" id="page_navi_bottom" action="?">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <!--{if $tpl_linemax > 0}--><!--{$smarty.capture.page_navi_body|smarty:nodefaults}--><!--{/if}-->
            </form>
            <!--▲ページナビ(下部)-->
        <!--{/if}-->

    <!--{foreachelse}-->
        <!--{include file="frontparts/search_zero.tpl"}-->
    <!--{/foreach}-->

</div>
