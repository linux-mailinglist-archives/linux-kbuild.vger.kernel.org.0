Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714A17477AA
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jul 2023 19:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjGDRUY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jul 2023 13:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjGDRUX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jul 2023 13:20:23 -0400
Received: from domac.alu.hr (domac.alu.unizg.hr [161.53.235.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B28AE6B;
        Tue,  4 Jul 2023 10:20:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by domac.alu.hr (Postfix) with ESMTP id 0F87860173;
        Tue,  4 Jul 2023 19:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
        t=1688491219; bh=+6JdSu7BcDFK7ZOljaSFRxSZv0Eu5iA6op5oUrhlHyc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DmOehv+X7QPHhO9xb0CcvA+VFzxgVTu1rxP+oBUAdCUA8RofkAfGyErSXAG92PL6x
         ilP/PeA2rc4TdeJc9oHSqPCpNICj6Mm/5QLJpaBaWhMQunZuDDeO37G0PE2IvEr+su
         vh89aq1lM7KlAACW9fyOUPXXbOD3iobI3l+NoIOWAmv4qQ7Feg9PH8DQNesVbKTmcI
         vHl6DAVzrnEJPds/xtqzTV57LwsKfrKrhc5AEKdmd7UUEG4zWhS6AJbMLH7zC3OUZu
         32c6wfB06lzRkXF7xA4M5WuAig3teFFJq6VCo/nEe5092CvW76NkMsM9Fra0HK9GkT
         wXTeh1H9nQh+w==
X-Virus-Scanned: Debian amavisd-new at domac.alu.hr
Received: from domac.alu.hr ([127.0.0.1])
        by localhost (domac.alu.hr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cJTGGTi_coK5; Tue,  4 Jul 2023 19:20:16 +0200 (CEST)
Received: from [192.168.1.6] (unknown [94.250.191.183])
        by domac.alu.hr (Postfix) with ESMTPSA id DC54560133;
        Tue,  4 Jul 2023 19:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alu.unizg.hr; s=mail;
        t=1688491216; bh=+6JdSu7BcDFK7ZOljaSFRxSZv0Eu5iA6op5oUrhlHyc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ntv0B6rC/cKTyP5TqGSt61kbFILPKtNwfArfuz6bf+t4/OxTIFSogJ9G7jrcSEb3W
         bO0kw20NhQqNGcucsPev7wxyDZfQ3OJBFc5/7r10M9WxsWCJFSErNDihim4p4480ti
         50WrkC9FVIhVD6MRJkyzwMEhoL0Uyoyc1MM9iVvSVw5XTBcxacXtBcdiZPUOf9ucYp
         UShByqxyYaiq2BCrSyHWc5YauTOm0wOUp367Z2BrUQbOUyXKPzA7PrIHDPtcMhh9cr
         +zfVWW9NeCKfq2AQ5DGE7tYs3fAt4sQFYZ3cHm7SuX8vSw7Rcp0zw4l3r+M+DXhtQu
         Vta//ZuaTTjUQ==
Message-ID: <fbf4103b-6471-1f06-34a8-4aa227f5e091@alu.unizg.hr>
Date:   Tue, 4 Jul 2023 19:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LLVM <llvm@lists.linux.dev>,
        linux-kbuild@vger.kernel.org,
        Linux Regressions <regressions@lists.linux.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-hardening@vger.kernel.org
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me> <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
 <4fa56264-f188-46f9-cc77-117b469b3328@roeck-us.net>
 <2b1a4f49-ba18-0246-af09-4e4133814411@alu.unizg.hr>
 <202307022230.6121D6896@keescook>
 <ed3e4315-b149-2f9e-70d4-45d7f83b9922@alu.unizg.hr>
 <202307031149.823F9A3@keescook> <202307031606.3FD9D0D@keescook>
From:   Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
In-Reply-To: <202307031606.3FD9D0D@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

T24gNy80LzIzIDAxOjA5LCBLZWVzIENvb2sgd3JvdGU6PiBPbiBNb24sIEp1bCAwMywgMjAy
MyBhdCAxMjowMzoyM1BNIC0wNzAwLCBLZWVzIENvb2sgd3JvdGU6DQo+PiBDb29sLiB4aGNp
LWh1YiBpcyBpbiB5b3VyIGJhY2t0cmFjZSwgYW5kIHRoZSBhYm92ZSBwYXRjaCB3YXMgbWFk
ZSBmb3INCj4+IHNvbWV0aGluZyB2ZXJ5IHNpbWlsYXIgKHRob3VnaCwgYWdhaW4sIEkgZG9u
J3Qgc2VlIHdoeSB5b3UncmUgZ2V0dGluZyBhDQo+PiBfY3Jhc2hfLCBpdCBzaG91bGQgX3dh
cm5fIGFuZCBjb250aW51ZSBub3JtYWxseSkuIEFuZCwgYWN0dWFsbHksIGFsc28NCj4+IGlu
Y2x1ZGUgdGhpcyBwYXRjaDoNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
MzA2MTQxODEzMDcuZ29ubmEuMjU2LWtlZXNAa2VybmVsLm9yZy8NCj4gDQo+IFRoaXMgaXMg
bm93IGluIExpbnVzJ3MgdHJlZToNCj4gMDliNjlkZDQzNzhiICgidXNiOiBjaDk6IFJlcGxh
Y2UgMS1lbGVtZW50IGFycmF5IHdpdGggZmxleGlibGUgYXJyYXkiKQ0KPiANCj4gUGxlYXNl
IGFsc28gc3RpbGwgdHJ5IHdpdGggdGhlIGZpcnN0IHBhdGNoIEkgbWVudGlvbmVkLCB3aGlj
aCBpcyB2ZXJ5IHNpbWlsYXI6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
MzA2MjkxOTA5MDAubmV2ZXIuNzg3LWtlZXNAa2VybmVsLm9yZy8NCg0KSGksDQoNCkkgaGF2
ZSBmaW5hbGx5IGJ1aWx0IHcgYm90aCBwYXRjaGVzIChhbmQgcmVjb21tZW5kZWQgUFNUT1JF
IHNldHRpbmdzIHdlcmUNCmRlZmF1bHQgYWxyZWFkeSkuDQoNClRoaXMgc2Vjb25kIHBhdGNo
IGZpeGVzIHRoZSBib290aW5nIHByb2JsZW0sIGJ1dCBhbGFzIHRoZXJlIGlzIHN0aWxsIGEg
cHJvYmxlbSAtDQphbGwgV2F5bGFuZCBhbmQgWDExLm9yZyBHVUkgYXBwbGljYXRpb25zIGZh
aWwgdG8gc3RhcnQsIHdpdGggZXJyb3JzIGxpa2UgdGhpcyBvbmU6DQoNCkp1bCAgNCAxOTow
OTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTcxOV0gaW52YWxpZCBvcGNvZGU6IDAw
MDAgWyMxXSBQUkVFTVBUIFNNUCBOT1BUSQ0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2Vy
bmVsOiBbICAgNDAuNTI5NzIzXSBDUFU6IDAgUElEOiAzNDkyIENvbW06IHRodW5kZXJiaXJk
IE5vdCB0YWludGVkIDYuNC4wLXJjMi1jcmFzaDIta2VlczItMDAwMDEtZzJkNDdjNjk1NmFi
My1kaXJ0eSAjNQ0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVsOiBbICAgNDAuNTI5
NzI1XSBIYXJkd2FyZSBuYW1lOiBBU1JvY2sgWDY3MEUgUEcgTGlnaHRuaW5nL1g2NzBFIFBH
IExpZ2h0bmluZywgQklPUyAxLjIxIDA0LzI2LzIwMjMNCkp1bCAgNCAxOTowOTowNyBkZWZp
YW50IGtlcm5lbDogWyAgIDQwLjUyOTcyNl0gUklQOiAwMDEwOmFsbG9jX3BpZCsweDQ2Yy8w
eDQ4MA0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVsOiBbICAgNDAuNTI5NzMwXSBD
b2RlOiAwMCA5MiA0OSBjNyBjNCBmNCBmZiBmZiBmZiBlOCA1MCBiYyAxNSAwMSA0YyA4OSBm
ZiBlOCA2OCA1MCAxMyAwMCBlOSBlYyBmZCBmZiBmZiBiZSAwMiAwMCAwMCAwMCBlOCA4OSA1
ZiA3MSAwMCBlOSBmOCBmZSBmZiBmZiA8MGY+IDBiIDQ5IGM3IGM0IGY0IGZmIGZmIGZmIGU5
IGI5IGZiIGZmIGZmIDY2IDBmIDFmIDQ0IDAwIDAwIDkwIDkwDQpKdWwgIDQgMTk6MDk6MDcg
ZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3MzFdIFJTUDogMDAxODpmZmZmYWQ4YzQ1MzEz
YzQ4IEVGTEFHUzogMDAwMTAyMDINCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDog
WyAgIDQwLjUyOTczM10gUkFYOiAwMDAwMDAwMDgwMDAwMDAwIFJCWDogMDAwMDAwMDAwMDAw
MDAwMSBSQ1g6IDAwMDAwMDAwMDAwMDAwMDANCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtl
cm5lbDogWyAgIDQwLjUyOTczNF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAw
MDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDANCkp1bCAgNCAxOTowOTowNyBkZWZp
YW50IGtlcm5lbDogWyAgIDQwLjUyOTczNF0gUkJQOiBmZmZmYWQ4YzQ1MzEzYzk4IFIwODog
MDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCkp1bCAgNCAxOTowOTow
NyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTczNV0gUjEwOiAwMDAwMDAwMDAwMDAwMDAw
IFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZmZmY5Y2JkZmYxYzYzYTgNCkp1bCAgNCAx
OTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTczNV0gUjEzOiBmZmZmOWNiZGU5
YjA4NzUwIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6IGZmZmY5Y2JkZmYxYzYzYTgNCkp1
bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTczNl0gRlM6ICAwMDAw
N2Y1MGQ4NjNlNzgwKDAwMDApIEdTOmZmZmY5Y2NjOTdhMDAwMDAoMDAwMCkga25sR1M6MDAw
MDAwMDAwMDAwMDAwMA0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVsOiBbICAgNDAu
NTI5NzM3XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUw
MDMzDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3MzddIENS
MjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAxYjBhZTAwMDAgQ1I0OiAwMDAwMDAw
MDAwNzUwZWYwDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3
MzhdIFBLUlU6IDU1NTU1NTU0DQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsg
ICA0MC41Mjk3MzldIENhbGwgVHJhY2U6DQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJu
ZWw6IFsgICA0MC41Mjk3MzldICA8VEFTSz4NCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtl
cm5lbDogWyAgIDQwLjUyOTc0MV0gIGNvcHlfcHJvY2VzcysweDE2NWYvMHgyMTEwDQpKdWwg
IDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3NDRdICBrZXJuZWxfY2xv
bmUrMHg5ZC8weDNhMA0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVsOiBbICAgNDAu
NTI5NzQ1XSAgPyBmaW5kX2hlbGRfbG9jaysweDMxLzB4YTANCkp1bCAgNCAxOTowOTowNyBk
ZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTc0N10gID8gbW50cHV0X25vX2V4cGlyZSsweDg5
LzB4NGYwDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3NDld
ICA/IGxvY2tfcmVsZWFzZSsweGM0LzB4MjcwDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBr
ZXJuZWw6IFsgICA0MC41Mjk3NTFdICBfX2RvX3N5c19jbG9uZSsweDY2LzB4YTANCkp1bCAg
NCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTc1NF0gIF9feDY0X3N5c19j
bG9uZSsweDI1LzB4NDANCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQw
LjUyOTc1NV0gIGRvX3N5c2NhbGxfNjQrMHg1OS8weDkwDQpKdWwgIDQgMTk6MDk6MDcgZGVm
aWFudCBrZXJuZWw6IFsgICA0MC41Mjk3NThdICA/IHN5c2NhbGxfZXhpdF90b191c2VyX21v
ZGUrMHgzOS8weDYwDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC41
Mjk3NjBdICA/IGRvX3N5c2NhbGxfNjQrMHg2OS8weDkwDQpKdWwgIDQgMTk6MDk6MDcgZGVm
aWFudCBrZXJuZWw6IFsgICA0MC41Mjk3NjFdICA/IGlycWVudHJ5X2V4aXRfdG9fdXNlcl9t
b2RlKzB4MjcvMHg0MA0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVsOiBbICAgNDAu
NTI5NzYyXSAgPyBpcnFlbnRyeV9leGl0KzB4NzcvMHhiMA0KSnVsICA0IDE5OjA5OjA3IGRl
ZmlhbnQga2VybmVsOiBbICAgNDAuNTI5NzY0XSAgPyBleGNfcGFnZV9mYXVsdCsweGFlLzB4
MjQwDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3NjVdICBl
bnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Mi8weGRjDQpKdWwgIDQgMTk6MDk6
MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3NjddIFJJUDogMDAzMzoweDdmNTBkODEx
ZWEzZA0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVsOiBbICAgNDAuNTI5NzY5XSBD
b2RlOiA1YiA0MSA1YyBjMyA2NiAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCBmMyAwZiAxZSBm
YSA0OCA4OSBmOCA0OCA4OSBmNyA0OCA4OSBkNiA0OCA4OSBjYSA0ZCA4OSBjMiA0ZCA4OSBj
OCA0YyA4YiA0YyAyNCAwOCAwZiAwNSA8NDg+IDNkIDAxIGYwIGZmIGZmIDczIDAxIGMzIDQ4
IDhiIDBkIGMzIGEzIDBmIDAwIGY3IGQ4IDY0IDg5IDAxIDQ4DQpKdWwgIDQgMTk6MDk6MDcg
ZGVmaWFudCBrZXJuZWw6IFsgICA0MC41Mjk3NzBdIFJTUDogMDAyYjowMDAwN2ZmY2M0NDlj
ZTU4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMzgNCkp1bCAg
NCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTc3MV0gUkFYOiBmZmZmZmZm
ZmZmZmZmZmRhIFJCWDogMDAwMDAwMDAwMDAwMDA1MSBSQ1g6IDAwMDA3ZjUwZDgxMWVhM2QN
Ckp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTc3MV0gUkRYOiAw
MDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMzAw
MDAwMTENCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUyOTc3Ml0g
UkJQOiAwMDAwMDAwMDAwMDAwMDAxIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDA3
ZjUwZDgyYjk3YzANCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjUy
OTc3Ml0gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6
IDAwMDAwMDAwMDAwMDAwMTENCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAg
IDQwLjUyOTc3M10gUjEzOiAwMDAwN2Y1MGQ3ZTE2OTgwIFIxNDogMDAwMDdmNTBkODYzZTZj
MCBSMTU6IDAwMDA3ZjUwZDgyYmEzYzANCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5l
bDogWyAgIDQwLjUyOTc3NV0gIDwvVEFTSz4NCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtl
cm5lbDogWyAgIDQwLjUyOTc3Nl0gTW9kdWxlcyBsaW5rZWQgaW46IGJpbmZtdF9taXNjIGYy
ZnMgY3JjMzJfZ2VuZXJpYyBsejRoY19jb21wcmVzcyBsejRfY29tcHJlc3MgbmxzX2lzbzg4
NTlfMSBpbnRlbF9yYXBsX21zciBpbnRlbF9yYXBsX2NvbW1vbiBzbmRfaGRhX2NvZGVjX3Jl
YWx0ZWsgc25kX2hkYV9jb2RlY19nZW5lcmljIGxlZHRyaWdfYXVkaW8gc25kX2hkYV9jb2Rl
Y19oZG1pIGVkYWNfbWNlX2FtZCBjcmN0MTBkaWZfcGNsbXVsIHNuZF9oZGFfaW50ZWwgcG9s
eXZhbF9jbG11bG5pIHNuZF9pbnRlbF9kc3BjZmcgcG9seXZhbF9nZW5lcmljIGdoYXNoX2Ns
bXVsbmlfaW50ZWwgc25kX2ludGVsX3Nkd19hY3BpIHNuZF9zZXFfbWlkaSBzaGE1MTJfc3Nz
ZTMgc25kX3NlcV9taWRpX2V2ZW50IHNuZF9oZGFfY29kZWMgYWVzbmlfaW50ZWwgc25kX2hk
YV9jb3JlIGNyeXB0b19zaW1kIGNyeXB0ZCBzbmRfaHdkZXAgam95ZGV2IGlucHV0X2xlZHMg
c25kX3Jhd21pZGkgcmFwbCBhbWRncHUgc25kX3BjbSBjY3Agd21pX2Jtb2Ygc25kX3NlcSBr
MTB0ZW1wIHNuZF9zZXFfZGV2aWNlIGlvbW11X3YyIHNuZF90aW1lciBkcm1fYnVkZHkgZ3B1
X3NjaGVkIGRybV9zdWJhbGxvY19oZWxwZXIgZHJtX3R0bV9oZWxwZXIgdHRtIGRybV9kaXNw
bGF5X2hlbHBlciBjZWMgc25kIGRybV9rbXNfaGVscGVyIGkyY19hbGdvX2JpdCBzeXNjb3B5
YXJlYSBzeXNmaWxscmVjdCBzeXNpbWdibHQgc291bmRjb3JlIG1hY19oaWQgc2NoX2ZxX2Nv
ZGVsIG1zciBwYXJwb3J0X3BjIHBwZGV2IGxwIHBhcnBvcnQgcmFtb29wcyBwc3RvcmVfYmxr
IHJlZWRfc29sb21vbiBwc3RvcmVfem9uZSBmdXNlIGVmaV9wc3RvcmUgZHJtIGlwX3RhYmxl
cyB4X3RhYmxlcyBhdXRvZnM0IGJ0cmZzIGJsYWtlMmJfZ2VuZXJpYyB4b3IgcmFpZDZfcHEg
aGlkX2dlbmVyaWMgbnZtZSBudm1lX2NvcmUgYWhjaSB4aGNpX3BjaSBpMmNfcGlpeDQgY3Jj
MzJfcGNsbXVsIG52bWVfY29tbW9uIGxpYmFoY2kgeGhjaV9wY2lfcmVuZXNhcyByODE2OSBy
ZWFsdGVrIHZpZGVvIHdtaQ0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVsOiBbICAg
NDAuNTI5Nzk5XSAgZ3Bpb19hbWRwdA0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2VybmVs
OiBbICAgNDAuNTI5ODAxXSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0N
Ckp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjg2NTQ4OV0gUklQOiAw
MDEwOmFsbG9jX3BpZCsweDQ2Yy8weDQ4MA0KSnVsICA0IDE5OjA5OjA3IGRlZmlhbnQga2Vy
bmVsOiBbICAgNDAuODY1NDkxXSBDb2RlOiAwMCA5MiA0OSBjNyBjNCBmNCBmZiBmZiBmZiBl
OCA1MCBiYyAxNSAwMSA0YyA4OSBmZiBlOCA2OCA1MCAxMyAwMCBlOSBlYyBmZCBmZiBmZiBi
ZSAwMiAwMCAwMCAwMCBlOCA4OSA1ZiA3MSAwMCBlOSBmOCBmZSBmZiBmZiA8MGY+IDBiIDQ5
IGM3IGM0IGY0IGZmIGZmIGZmIGU5IGI5IGZiIGZmIGZmIDY2IDBmIDFmIDQ0IDAwIDAwIDkw
IDkwDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJuZWw6IFsgICA0MC44NjU0OTJdIFJT
UDogMDAxODpmZmZmYWQ4YzQ1MzEzYzQ4IEVGTEFHUzogMDAwMTAyMDINCkp1bCAgNCAxOTow
OTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjg2NTQ5NF0gUkFYOiAwMDAwMDAwMDgwMDAw
MDAwIFJCWDogMDAwMDAwMDAwMDAwMDAwMSBSQ1g6IDAwMDAwMDAwMDAwMDAwMDANCkp1bCAg
NCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjg2NTQ5NV0gUkRYOiAwMDAwMDAw
MDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IDAwMDAwMDAwMDAwMDAwMDAN
Ckp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjg2NTQ5NV0gUkJQOiBm
ZmZmYWQ4YzQ1MzEzYzk4IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAw
MDAwMDANCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjg2NTQ5Nl0g
UjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZmZmY5
Y2JkZmYxYzYzYTgNCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAgIDQwLjg2
NTQ5N10gUjEzOiBmZmZmOWNiZGU5YjA4NzUwIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6
IGZmZmY5Y2JkZmYxYzYzYTgNCkp1bCAgNCAxOTowOTowNyBkZWZpYW50IGtlcm5lbDogWyAg
IDQwLjg2NTQ5N10gRlM6ICAwMDAwN2Y1MGQ4NjNlNzgwKDAwMDApIEdTOmZmZmY5Y2NjOTdh
MDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KSnVsICA0IDE5OjA5OjA3IGRl
ZmlhbnQga2VybmVsOiBbICAgNDAuODY1NDk4XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFudCBrZXJu
ZWw6IFsgICA0MC44NjU0OTldIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAwMDAwMDAx
YjBhZTAwMDAgQ1I0OiAwMDAwMDAwMDAwNzUwZWYwDQpKdWwgIDQgMTk6MDk6MDcgZGVmaWFu
dCBrZXJuZWw6IFsgICA0MC44NjU1MDBdIFBLUlU6IDU1NTU1NTU0DQoNClRoZSBpbnRlcnBy
ZXRhdGlvbiBvZiB0aGVzZSBmaW5kaW5ncyBpcyBiZXlvbmQgdGhlIHNjb3BlIG9mIG15IGtu
b3dsZWRnZS4NCg0KSSBob3BlIHlvdSBjYW4gbWFrZSBhbnkgdXNlIG9mIHRoZW0uDQoNCkJl
c3QgcmVnYXJkcywNCk1pcnNhZCBUb2Rvcm92YWMNCg==
