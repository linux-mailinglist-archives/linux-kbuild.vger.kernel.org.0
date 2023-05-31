Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAEF7179AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 May 2023 10:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234869AbjEaILg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 May 2023 04:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234370AbjEaILf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 May 2023 04:11:35 -0400
Received: from cstnet.cn (smtp83.cstnet.cn [159.226.251.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C010EC5
        for <linux-kbuild@vger.kernel.org>; Wed, 31 May 2023 01:11:32 -0700 (PDT)
Received: from sunying$nj.iscas.ac.cn ( [180.111.102.60] ) by
 ajax-webmail-APP-09 (Coremail) ; Wed, 31 May 2023 16:11:29 +0800
 (GMT+08:00)
X-Originating-IP: [180.111.102.60]
Date:   Wed, 31 May 2023 16:11:29 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   sunying@nj.iscas.ac.cn
To:     "Masahiro Yamada" <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Subject: Re: Re: Suggestion: Improve the dependency information during
 Kconfig compilation
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230321(1bf45b10)
 Copyright (c) 2002-2023 www.mailtech.cn cnic.cn
In-Reply-To: <CAK7LNARtpBkT-SL5kGqnrSQQT+SRsU8xfqrC5iqZCwoQs=QnzQ@mail.gmail.com>
References: <729c71ad.51ce3.1882daddff7.Coremail.sunying@nj.iscas.ac.cn>
 <CAK7LNARtpBkT-SL5kGqnrSQQT+SRsU8xfqrC5iqZCwoQs=QnzQ@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3865ca44.2742b.18870dca8df.Coremail.sunying@nj.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: swCowAAH_1UxAXdkcbMeAA--.11496W
X-CM-SenderInfo: 5vxq5xdqj60y4olvutnvoduhdfq/1tbiCgcIAWR28ZY7zAABsH
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

T24gU2F0LCBNYXkgMjAsIDIwMjMgYXQgMToyMeKAr1BNIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4g
d3JvdGU6CiZndDsgCiZndDsgT24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgNDoxM+KAr1BNIDxzdW55
aW5nQG5qLmlzY2FzLmFjLmNuPiB3cm90ZToKJmd0OyAmZ3Q7CiZndDsgJmd0OyBIaSwKJmd0OyAm
Z3Q7CiZndDsgJmd0OwomZ3Q7ICZndDsgV2UgZm91bmQgdGhhdCB0aGUgS2NvbmZpZyBidWlsZCBz
eXN0ZW0gc2lsZW50bHkgY2hhbmdlcyBpbnZhbGlkIHZhbHVlcyBpbiB0aGUuIGNvbmZpZyBmaWxl
LAomZ3Q7ICZndDsgd2hpY2ggbWF5IHByZXZlbnQgdXNlcnMgZnJvbSBnZXR0aW5nIHRoZWlyIGRl
c2lyZWQga2VybmVsLCBhbmQgYWxzbyBtYWtlIGl0IGhhcmQgdG8ga25vdwomZ3Q7ICZndDsgd2hp
Y2ggY29uZmlndXJhdGlvbiBvcHRpb24gY2F1c2VkIHRoZSBmb3JjZWQgY2hhbmdlIGJhc2VkIG9u
IHRoZSBjb21waWxhdGlvbiBpbmZvcm1hdGlvbi4KJmd0OyAmZ3Q7CiZndDsgJmd0OyBUaGVyZSBh
cmUgc2ltaWxhciBxdWVzdGlvbnMgb24gc3RhY2sgb3ZlcmZsb3csIHdoZXJlIHBlb3BsZSBmaW5k
IGl0IGRpZmZpY3VsdCB0byBnZXQKJmd0OyAmZ3Q7IHRoZSBjb21wbGV0ZSBkZXBlbmRlbmN5IGNo
YWluIGFuZCBvdGhlciBpbmZvcm1hdGlvbu+8mgomZ3Q7ICZndDsKJmd0OyAmZ3Q7ICAgZXgxLiBI
b3cgY2FuIEkgZGlzYWJsZSBDT05GSUdfUE0gd2hlbiBidWlsZGluZyBMaW51eCBrZXJuZWwgZm9y
IHg4Nl82NCAtIFN0YWNrIE92ZXJmbG93CiZndDsgJmd0OyAgIGh0dHBzOi8vc3RhY2tvdmVyZmxv
dy5jb20vcXVlc3Rpb25zLzY0NDk5MjIxL2hvdy1jYW4taS1kaXNhYmxlLWNvbmZpZy1wbS13aGVu
LWJ1aWxkaW5nLWxpbnV4LWtlcm5lbC1mb3IteDg2LTY0LzY0NTAxNjQ3IzY0NTAxNjQ3CiZndDsg
Jmd0OwomZ3Q7ICZndDsgICBleDIuIGMgLSBrZXJuZWwgc3ltYm9sIGVuYWJsZWQgYnV0IGRvZXNu
J3Qgc2hvd3MgdXAgaW4gLmNvbmZpZyAtIFN0YWNrIE92ZXJmbG93CiZndDsgJmd0OyAgIGh0dHBz
Oi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzI0MDc0MTE2L2tlcm5lbC1zeW1ib2wtZW5h
YmxlZC1idXQtZG9lc250LXNob3dzLXVwLWluLWNvbmZpZykKJmd0OyAmZ3Q7CiZndDsgJmd0OyAg
IGV4My4gbWFrZWZpbGUgLSB1cGRhdGUgbWVudWNvbmZpZyBlbnRyaWVzIHdpdGhvdXQgcmVjb21w
aWxpbmcgYWxsIHRoZSBrZXJuZWwgLSBTdGFjayBPdmVyZmxvdwomZ3Q7ICZndDsgICBodHRwczov
L3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy83MTA3NTExMy91cGRhdGUtbWVudWNvbmZpZy1l
bnRyaWVzLXdpdGhvdXQtcmVjb21waWxpbmctYWxsLXRoZS1rZXJuZWwKJmd0OyAmZ3Q7CiZndDsg
Jmd0OyAgIGV4NC4gbGludXggLSBkaXNhYmxpbmcgQ09ORklHX05FVF9ETUEgLSBTdGFjayBPdmVy
ZmxvdwomZ3Q7ICZndDsgICBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy8zMDc5
NDU3Ni9kaXNhYmxpbmctY29uZmlnLW5ldC1kbWEvMzA3OTY4MjAjMzA3OTY4MjAKJmd0OyAmZ3Q7
CiZndDsgJmd0OyBXZSBwbGFuIHRvIG9wdGltaXplIHRoZSBjb25mX3JlYWQoKSBmdW5jdGlvbiBp
biAvc2NyaXB0cy9rY29uZmlnL2NvbmZkYXRhLmMsCiZndDsgJmd0OyBhbmQgYWRkIGluZm9ybWF0
aW9uIGZvciB0aGUgbWlzbWF0Y2hlZCBjb25maWd1cmF0aW9uIG9wdGlvbnMgdG8gaGVscCB1c2Vy
cyBnZXQgdGhlIGRlc2lyZWQgTGludXgga2VybmVsLgomZ3Q7ICZndDsgRG8geW91IHRoaW5rIGl0
J3MgbmVjZXNzYXJ5PyBBbnkgc3VnZ2VzdGlvbnM/CiZndDsgJmd0OwomZ3Q7IAomZ3Q7IAomZ3Q7
IEl0IG1heSBiZSBoZWxwZnVsLgomZ3Q7IEkgZG8gbm90IGtub3cgaWYgc3VjaCB3YXJuaW5ncyBz
aG91bGQgYmUgdHVybmVkIG9uIGJ5IGRlZmF1bHQsCiZndDsgb3IgdW5kZXIgc29tZSB2ZXJib3Nl
IG1vZGUsIHRob3VnaC4KJmd0OyAKCgpDYW4gd2UgcmV1c2UgIktCVUlMRF9WRVJCT1NFIiBzd2l0
Y2ggdG8gcHJpbnQgbW9yZSB3YXJuaW5nPwoKQnkgZGVmYXVsdCwgYSBtZXNzYWdlIGlzIGFkZGVk
IGFzIGZvbGxvd3Mgb25seSB3aGVuIGludmFsaWQgdmFsdWVzIGluIC5jb25maWcgYXJlIGRldGVj
dGVkOgogICAgIndhcm5pbmc6IHZhbHVlcyBpbiAuY29uZmlnIGFyZSBmb3JjaWJseSBtb2RpZmll
ZCB0byBtZWV0IHRoZSBrY29uZmlnIGRlcGVuZGVuY3kgY29uc3RyYWludHMuCkZvciBtb3JlIGlu
Zm9ybWF0aW9uLCBlbmFibGUgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlICdleHBvcnQgS0JVSUxE
X1ZFUkJPU0U9MScuIgoKSW4gdmVyYm9zZSBtb2RlLCBwcmludCBpbnZhbGlkIGNvbmZpZ3VyYXRp
b24gb3B0aW9ucyBvbmUgYnkgb25lLCBpbmNsdWRpbmcgZXJyb3IgY2F1c2VzIGFuZCBjdXJyZW50
IHZhbHVlcywgCnRvIGhlbHAgdXNlcnMgY29ycmVjdCB0aGVtLiBGb3IgZXhhbXBsZSwgaW4gdGhl
IGNhc2Ugb2YgZXgxLiBhYm92ZSwgd2UgY2FuIHByb21wdCB3aXRoIHRoZSBmb2xsb3dpbmcgbWVz
c2FnZToKICAgICJmaWxlOmxpbmU6IHdhcm5pbmc6ICdDT05GSUdfUE0nIHJldmVyc2Ugc2VsZWN0
IGVycm9yLCBkdWUgdG8gJ0NPTkZJR19QTV9TTEVFTycgaXMgc2V0IHRvICd5Jy4iCgpEbyB5b3Ug
dGhpbmsgdGhpcyB3b3VsZCB3b3JrPyBDYW4gd2UgbW9kaWZ5IGl0IGluIHRoaXMgd2F5PwoKCgom
Z3Q7ICZndDsgQmVzdCByZWdhcmRzLAomZ3Q7ICZndDsgU2l5dWFuIEd1bwomZ3Q7ICZndDsgWWlu
ZyBTdW4KJmd0OyAmZ3Q7CiZndDsgJmd0OwomZ3Q7IAomZ3Q7IAomZ3Q7IC0tIAomZ3Q7IEJlc3Qg
UmVnYXJkcwomZ3Q7IE1hc2FoaXJvIFlhbWFkYQoKCi0tCkJlc3QgcmVnYXJkcywKU2l5dWFuIEd1
bwpZaW5nIFN1bgo8L3N1bnlpbmdAbmouaXNjYXMuYWMuY24+PC9tYXNhaGlyb3lAa2VybmVsLm9y
Zz4=
