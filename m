Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456E378BFA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Aug 2023 09:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjH2HuF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Aug 2023 03:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233901AbjH2Ht5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Aug 2023 03:49:57 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDBF4BA;
        Tue, 29 Aug 2023 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=buaa.edu.cn; s=buaa; h=Received:Date:From:To:Cc:Subject:
        In-Reply-To:References:Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID; bh=ReCQlXmslUYa/pHyBYXye6Ch9GqFx8eVg4La
        gEuvpAo=; b=mWrZdCljZY6gbfXdNU62SiHZ6Nb9+amhKtDxEuNdfUWpfVyBFLth
        nbKAwf7+c4sec/QLrgqjY8i0lGyCY1BCmmmZuhq+VcJhzQKrf/V+9j9ASAEPvM8x
        wolyjA6aWf6H5ArpBrdQuUDacdrcRabHg2pcCRdRZ3ZkHIN+DYVl+5k=
Received: from guosy$buaa.edu.cn ( [10.192.161.153] ) by
 ajax-webmail-coremail-app1 (Coremail) ; Tue, 29 Aug 2023 15:49:41 +0800
 (GMT+08:00)
X-Originating-IP: [10.192.161.153]
Date:   Tue, 29 Aug 2023 15:49:41 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?6YOt5oCd6L+c?= <guosy@buaa.edu.cn>
To:     "Jesse T" <mr.bossman075@gmail.com>
Cc:     "Masahiro Yamada" <masahiroy@kernel.org>, sunying@nj.iscas.ac.cn,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Sergey Senozhatsky" <senozhatsky@chromium.org>,
        "Randy Dunlap" <rdunlap@infradead.org>, pengpeng@iscas.ac.cn
Subject: Re: Re: [PATCH] kconfig: add dependency warning print about invalid
 values in verbose mode
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.2-cmXT5 build
 20230714(eb2b3919) Copyright (c) 2002-2023 www.mailtech.cn
 mispb-63b7ebb9-fa87-40c1-9aec-818ec5a006d9-buaa.edu.cn
In-Reply-To: <CAJFTR8SajdzT2kKscEpPon9faUa8tHrvYPC_+awG3VeHVS8sSg@mail.gmail.com>
References: <CAJFTR8SajdzT2kKscEpPon9faUa8tHrvYPC_+awG3VeHVS8sSg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7e1d99fd.3806.18a40450dee.Coremail.guosy@buaa.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: OCz+CgB3vZwWo+1ks8JRAA--.6639W
X-CM-SenderInfo: l21sivbirqlqpexdthxhgxhubq/1tbiAQISBmTsurI10AABsz
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SSBhcG9sb2dpemUgZm9yIHRoaXMsIGJ1dCBJIGNhbm5vdCByZXByb2R1Y2UgdGhpcyBpc3N1ZSBp
biBteSBlbnZpcm9ubWVudC4gCgpJIGhhdmUgdHJpZWQgcmVtb3ZpbmcgQ09ORklHX1NNUCBvciBj
aGFuZ2luZyBpdCB0byBuIGluIHRoZSAKYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVmY29uZmln
IGZpbGUsYW5kIG5vbmUgb2YgdGhlbSByZXN1bHRlZCBpbiBzZWdmYXVsdC4gCkkgYW0gdXNpbmcg
dGhlIGxhdGVzdCBMaW51eCBrZXJuZWwgdmVyc2lvbiBhbmQgY29tcGlsYXRpb24gdG9vbGNoYWlu
LgoKSW4gb3JkZXIgdG8gYmV0dGVyIGxvY2F0ZSBhbmQgc29sdmUgdGhpcyBpc3N1ZSwgY291bGQg
eW91IHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbu+8nwoKCj4gT24gU3VuLCBBdWcgMjAsIDIwMjMg
YXQgMTA6NDBBTSBKZXNzZSBUIDxtci5ib3NzbWFuMDc1QGdtYWlsLmNvbT53cm90ZToKPiAKPiBP
biBTYXQsIEF1ZyAxOSwgMjAyMyBhdCA4OjU54oCvUE0gTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGly
b3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBBdWcgOSwgMjAyMyBhdCA5OjMy
4oCvQU0gPHN1bnlpbmdAbmouaXNjYXMuYWMuY24+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBZ
aW5nIFN1biA8c3VueWluZ0Buai5pc2Nhcy5hYy5jbj4KPiA+ID4KPiA+ID4gQWRkIHdhcm5pbmcg
YWJvdXQgdGhlIGNvbmZpZ3VyYXRpb24gb3B0aW9uJ3MgaW52YWxpZCB2YWx1ZSBpbiB2ZXJib3Nl
IG1vZGUsCj4gPiA+ICBpbmNsdWRpbmcgZXJyb3IgY2F1c2VzLCBtaXNtYXRjaCBkZXBlbmRlbmN5
LCBvbGQgYW5kIG5ldyB2YWx1ZXMsCj4gPiA+ICB0byBoZWxwIHVzZXJzIGNvcnJlY3QgdGhlbS4K
PiAKPiBJdCBzaG91bGQgYWxzbyB3YXJuIGFib3V0IGludmFsaWQgb3B0aW9ucyB3aGljaCB3ZXJl
IGJlaW5nIHRhbGtlZAo+IGFib3V0IGluIG90aGVyIHBsYWNlcy4KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyMzA4MTcwMTIwMDcuMTMxODY4LTEtc2Vub3poYXRza3lAY2hyb21pdW0u
b3JnL1QvI3UKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBTXVITWRXRjBMc2VTR0s2
PWFvZFhhb0s5RDE2bXhvazRERFJzPWdLb0dveDhrNnpqZ0BtYWlsLmdtYWlsLmNvbS9ULyNtYjVi
NzM1MzIxNjYwMTRjZTBhNjZiMGU3ZTExZGJlMDY1MjhkODYzYwo+IAo+IEkgY2FuIGFsc28gY2F1
c2UgYSBzZWdmYXVsdCBieSByZW1vdmluZyBvcHRpb25zIHN1Y2ggYXMgcmVtb3ZpbmcKPiBgQ09O
RklHX1NNUD15YCAgZnJvbSB4ODZfNjRfZGVmY29uZmlnCj4gCj4gPiA+Cj4gPiA+IERldGFpbGVk
IGVycm9yIG1lc3NhZ2VzIGFyZSBwcmludGVkIG9ubHkgd2hlbiB0aGUgZW52aXJvbm1lbnQgdmFy
aWFibGUKPiA+ID4gIGlzIHNldCBsaWtlICJLQ09ORklHX1ZFUkJPU0U9MSIuCj4gPiA+IEJ5IGRl
ZmF1bHQsIHRoZSBjdXJyZW50IGJlaGF2aW9yIGlzIG5vdCBjaGFuZ2VkLgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBTaXl1YW4gR3VvIDx6eTIxZGYxMDZAYnVhYS5lZHUuY24+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFlpbmcgU3VuIDxzdW55aW5nQG5qLmlzY2FzLmFjLmNuPgo+ID4KPiA+Cj4g
PiBUaGlzIHBhdGNoIGlzIG11Y2ggYmlnZ2VyIHRoYW4gSSBoYWQgZXhwZWN0ZWQuCj4gPgo+ID4g
SSBkaWQgbm90IGdvIHRocm91Z2ggYWxsIHRoZSBsaW5lcywgYnV0Cj4gPiBJIHRoaW5rIHRoZSBi
ZWhhdmlvciBzaG91bGQgYmUgaW1wcm92ZWQuCj4gPgo+ID4KPiA+Cj4gPiBbMV0gQSBkb3duZ3Jh
ZGUgZnJvbSAneScgdG8gJ20nIHNob3VsZCBiZSB3YXJuZWQuCj4gPgo+ID4KPiA+IFlvdSBvbmx5
IGNoZWNrIChzeW0tPmRpcl9kZXAudHJpID09IG5vICYmIHN5bS0+ZGVmW1NfREVGX1VTRVJdLnRy
aSAhPSBubykKPiA+Cj4gPiBidXQgKHN5bS0+ZGlyX2RlcC50cmkgPT0gbW9kICYmIHN5bS0+ZGVm
W1NfREVGX1VTRVJdLnRyaSA9PSB5ZXMpCj4gPiB3aWxsIGNhdXNlID15IHRvIGJlIGRvd25ncmFk
ZWQgdG8gPW0uCj4gPiBUaGlzIG11c3QgYmUgd2FybmVkLgo+ID4KPiA+Cj4gPgo+ID4KPiA+IFsy
XSBBIG5ldyBDT05GSUcgb3B0aW9uIHNob3VsZCBub3QgYmUgd2FybmVkLgo+ID4KPiA+ICQgbWFr
ZSBkZWZjb25maWcKPiA+Cj4gPiBBZGQgdGhlIGZvbGxvd2luZyB0d28gbGluZXMgdG8gYSBLY29u
ZmlnIGZpbGUuCj4gPgo+ID4gY29uZmlnIFRISVNfSVNfQV9ORVdfT1BUSU9OCj4gPiAgICAgICAg
ZGVmX2Jvb2wgeQo+ID4KPiA+Cj4gPiAkIG1ha2UgS0NPTkZJR19WRVJCT1NFPTEgb2xkY29uZmln
Cj4gPgo+ID4gRVJST1IgOiBUSElTX0lTX0FfTkVXX09QVElPTltuID0+IHldIHZhbHVlIGlzIGlu
dmFsaWQKPiA+ICBkdWUgdG8gaXQgaGFzIGRlZmF1bHQgdmFsdWUKPiA+ICMKPiA+ICMgY29uZmln
dXJhdGlvbiB3cml0dGVuIHRvIC5jb25maWcKPiA+ICMKPiA+Cj4gPgo+ID4KPiA+Cj4gPiBUaGlz
IGlzIHRvdGFsbHkgaGFybWxlc3MuCj4gPiBJIGRvIG5vdCB1bmRlcnN0YW5kIHdoeSBpdCBpcyB3
YXJuZWQuCj4gPgo+ID4KPiA+Cj4gPgo+ID4KPiA+IEJUVywgeW91ciBwYXRjaCBzdWJqZWN0IHNh
eXMKPiA+ICJhZGQgZGVwZW5kZW5jeSB3YXJuaW5nIiwgYnV0IHlvdXIgYWN0dWFsbHkgY29kZSBw
cmludHMgIkVSUk9SIi4KPiA+Cj4gPiBBbHNvLCBjaGVjayB0aGUgY29kaW5nIHN0eWxlLgo+ID4K
PiA+Cj4gPgo+ID4KPiA+Cj4gPgo+ID4KPiA+ID4gLS0tCj4gPiA+ICBzY3JpcHRzL2tjb25maWcv
Y29uZmRhdGEuYyB8IDEyMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4g
PiA+ICBzY3JpcHRzL2tjb25maWcvbGtjLmggICAgICB8ICAgMyArCj4gPiA+ICBzY3JpcHRzL2tj
b25maWcvc3ltYm9sLmMgICB8ICA4MiArKysrKysrKysrKysrKysrKysrKysrKy0tCj4gPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDE5NSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9jb25mZGF0YS5jIGIvc2NyaXB0cy9r
Y29uZmlnL2NvbmZkYXRhLmMKPiA+ID4gaW5kZXggOTkyNTc1ZjFlOTc2Li5mYTJhZTZmNjMzNTIg
MTAwNjQ0Cj4gPiA+IC0tLSBhL3NjcmlwdHMva2NvbmZpZy9jb25mZGF0YS5jCj4gPiA+ICsrKyBi
L3NjcmlwdHMva2NvbmZpZy9jb25mZGF0YS5jCj4gPiA+IEBAIC0xNTQsNiArMTU0LDcgQEAgc3Rh
dGljIHZvaWQgY29uZl9tZXNzYWdlKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+ID4gPgo+ID4gPiAg
c3RhdGljIGNvbnN0IGNoYXIgKmNvbmZfZmlsZW5hbWU7Cj4gPiA+ICBzdGF0aWMgaW50IGNvbmZf
bGluZW5vLCBjb25mX3dhcm5pbmdzOwo+ID4gPiArY29uc3QgY2hhciAqdmVyYm9zZTsKPiA+ID4K
PiA+ID4gIHN0YXRpYyB2b2lkIGNvbmZfd2FybmluZyhjb25zdCBjaGFyICpmbXQsIC4uLikKPiA+
ID4gIHsKPiA+ID4gQEAgLTIyNiw3ICsyMjcsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqY29uZl9n
ZXRfcnVzdGNjZmdfbmFtZSh2b2lkKQo+ID4gPiAgc3RhdGljIGludCBjb25mX3NldF9zeW1fdmFs
KHN0cnVjdCBzeW1ib2wgKnN5bSwgaW50IGRlZiwgaW50IGRlZl9mbGFncywgY2hhciAqcCkKPiA+
ID4gIHsKPiA+ID4gICAgICAgICBjaGFyICpwMjsKPiA+ID4gLQo+ID4gPiArICAgICAgIHN0YXRp
YyBjb25zdCBjaGFyICogY29uc3QgdHlwZVtdID0geyJ1bmtub3duIiwgImJvb2wiLCAidHJpc3Rh
dGUiLCAiaW50IiwgImhleCIsICJzdHJpbmcifTsKPiAKPiBBZGQgYSBuZXcgbGluZSBhZnRlciB0
aGUgZGVjbGFyYXRpb24uCj4gTm90IHN1cmUgd2h5IGNoZWNrcGF0Y2ggZGlkbid0IGdldCB0aGlz
Lgo+IAo+ID4gPiAgICAgICAgIHN3aXRjaCAoc3ltLT50eXBlKSB7Cj4gPiA+ICAgICAgICAgY2Fz
ZSBTX1RSSVNUQVRFOgo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKHBbMF0gPT0gJ20nKSB7Cj4g
PiA+IEBAIC0yNDYsOSArMjQ3LDE0IEBAIHN0YXRpYyBpbnQgY29uZl9zZXRfc3ltX3ZhbChzdHJ1
Y3Qgc3ltYm9sICpzeW0sIGludCBkZWYsIGludCBkZWZfZmxhZ3MsIGNoYXIgKnApCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHN5bS0+ZmxhZ3MgfD0gZGVmX2ZsYWdzOwo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4g
LSAgICAgICAgICAgICAgIGlmIChkZWYgIT0gU19ERUZfQVVUTykKPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgY29uZl93YXJuaW5nKCJzeW1ib2wgdmFsdWUgJyVzJyBpbnZhbGlkIGZvciAl
cyIsCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoZGVmICE9IFNfREVGX0FVVE8pIHsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHZlcmJvc2UpCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uZl93YXJuaW5nKCJzeW1ib2wgdmFsdWUgJyVzJyBpbnZhbGlk
IGZvciAlc1xuIGR1ZSB0byBpdHMgdHlwZSBpcyAlcyIsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwLCBzeW0tPm5hbWUsIHR5cGVbc3ltLT50eXBlXSk7Cj4gCj4g
bm9ybWFsbHkgaW5kZW50ZWQgdG8gdGhlIG9wZW5pbmcgcGFyZW50aGVzaXMsIHNhbWUgd2l0aCB0
aGUgcmVzdC4KPiAKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZfd2FybmluZygic3ltYm9sIHZhbHVlICcl
cycgaW52YWxpZCBmb3IgJXMiLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcCwgc3ltLT5uYW1lKTsKPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiAxOwo+ID4gPiAgICAgICAgIGNhc2UgU19TVFJJTkc6Cj4gPiA+ICAg
ICAgICAgICAgICAgICAvKiBObyBlc2NhcGluZyBmb3IgU19ERUZfQVVUTyAoaW5jbHVkZS9jb25m
aWcvYXV0by5jb25mKSAqLwo+ID4gPiBAQCAtMjc0LDkgKzI4MCwxNCBAQCBzdGF0aWMgaW50IGNv
bmZfc2V0X3N5bV92YWwoc3RydWN0IHN5bWJvbCAqc3ltLCBpbnQgZGVmLCBpbnQgZGVmX2ZsYWdz
LCBjaGFyICpwKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzeW0tPmRlZltkZWZdLnZh
bCA9IHhzdHJkdXAocCk7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN5bS0+ZmxhZ3Mg
fD0gZGVmX2ZsYWdzOwo+ID4gPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGRlZiAhPSBTX0RFRl9BVVRPKQo+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbmZfd2FybmluZygic3ltYm9sIHZhbHVlICclcycgaW52
YWxpZCBmb3IgJXMiLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwLCBzeW0tPm5hbWUpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
ZGVmICE9IFNfREVGX0FVVE8pIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAodmVyYm9zZSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbmZfd2FybmluZygic3ltYm9sIHZhbHVlICclcycgaW52YWxpZCBmb3IgJXNcbiBkdWUg
dG8gaXRzIHR5cGUgaXMgJXMiLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwLCBzeW0tPm5hbWUsIHR5cGVbc3ltLT50eXBlXSk7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uZl93YXJuaW5nKCJzeW1ib2wgdmFsdWUgJyVzJyBp
bnZhbGlkIGZvciAlcyIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHAsIHN5bS0+bmFtZSk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IH0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPiA+ICAgICAgICAg
ICAgICAgICB9Cj4gPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gQEAgLTUyOCw2ICs1
MzksNyBAQCBpbnQgY29uZl9yZWFkKGNvbnN0IGNoYXIgKm5hbWUpCj4gPiA+ICAgICAgICAgaW50
IGNvbmZfdW5zYXZlZCA9IDA7Cj4gPiA+ICAgICAgICAgaW50IGk7Cj4gPiA+Cj4gPiA+ICsgICAg
ICAgdmVyYm9zZSA9IGdldGVudigiS0NPTkZJR19WRVJCT1NFIik7Cj4gPiA+ICAgICAgICAgY29u
Zl9zZXRfY2hhbmdlZChmYWxzZSk7Cj4gPiA+Cj4gPiA+ICAgICAgICAgaWYgKGNvbmZfcmVhZF9z
aW1wbGUobmFtZSwgU19ERUZfVVNFUikpIHsKPiA+ID4gQEAgLTU1OSw2ICs1NzEsMTAzIEBAIGlu
dCBjb25mX3JlYWQoY29uc3QgY2hhciAqbmFtZSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gPiA+ICAgICAgICAgICAgICAgICBjb25mX3Vuc2F2ZWQrKzsKPiA+ID4g
ICAgICAgICAgICAgICAgIC8qIG1heWJlIHByaW50IHZhbHVlIGluIHZlcmJvc2UgbW9kZS4uLiAq
Lwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKHZlcmJvc2UpIHsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHN5bV9pc19jaG9pY2VfdmFsdWUoc3ltKSkgewo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwcm9wZXJ0eSAqcHJvcCA9IHN5bV9nZXRf
Y2hvaWNlX3Byb3Aoc3ltKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qgc3ltYm9sICpkZWZzeW0gPSBwcm9wX2dldF9zeW1ib2wocHJvcCktPmN1cnIudmFsOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGRlZnN5bSAm
JiBkZWZzeW0gIT0gc3ltKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZ3N0ciBncyA9IHN0cl9uZXcoKTsKPiA+ID4gKwo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyX3ByaW50ZigmZ3MsCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJcbkVSUk9SIDog
JXNbJWMgPT4gJWNdIHZhbHVlIGlzIGludmFsaWRcbiIsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN5bS0+bmFtZSwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJpc3RhdGUyY2hhcltzeW0t
PmRlZltTX0RFRl9VU0VSXS50cmldLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB0cmlzdGF0ZTJjaGFyW3N5bS0+Y3Vyci50cmldKTsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cl9wcmludGYoJmdzLAo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiIGR1
ZSB0byBpdHMgbm90IHRoZSBjaG9pY2UgZGVmYXVsdCBzeW1ib2xcbiIpOwo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyX3ByaW50ZigmZ3MsCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgdGhlIGRlZmF1
bHQgc3ltYm9sIGlzICVzXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkZWZzeW0tPm5hbWUpOwo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZnB1dHMoc3RyX2dldCgmZ3MpLCBzdGRlcnIpOwo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgfSBlbHNlIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzd2l0
Y2ggKHN5bS0+dHlwZSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNh
c2UgU19CT09MRUFOOgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2Ug
U19UUklTVEFURToKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlmIChzeW0tPmRpcl9kZXAudHJpID09IG5vICYmCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN5bS0+ZGVmW1NfREVGX1VTRVJdLnRyaSAhPSBu
bykgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZ3N0ciBncyA9IHN0cl9uZXcoKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJfcHJpbnRmKCZncywKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
XG5FUlJPUjogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgJXNbJWMgPT4g
JWNdXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN5bS0+bmFtZSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmlzdGF0ZTJjaGFyW3N5bS0+ZGVmW1NfREVG
X1VTRVJdLnRyaV0sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdHJpc3RhdGUyY2hhcltzeW0tPmN1cnIudHJpXSk7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cl9wcmludGYo
JmdzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICIgIERlcGVuZHMgb24gWyVjXTogIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzeW0tPmRpcl9kZXAudHJpID09
IG1vZCA/ICdtJyA6ICduJyk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGV4cHJfZ3N0cl9wcmludChzeW0tPmRpcl9kZXAuZXhwciwgJmdzKTsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
X3ByaW50ZigmZ3MsICJcbiIpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmcHV0cyhzdHJfZ2V0KCZncyksIHN0ZGVycik7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKHN5bS0+cmV2X2Rl
cC50cmkgIT0gbm8pIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGdzdHIgZ3MgPSBzdHJfbmV3KCk7Cj4gPiA+ICsKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyX3ByaW50Zigm
Z3MsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIlxuRVJST1IgOiAlc1slYyA9PiAlY10gdmFsdWUgaXMgaW52YWxpZFxuIiwKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzeW0tPm5hbWUsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdHJpc3RhdGUyY2hhcltzeW0tPmRlZltTX0RFRl9VU0VSXS50cmld
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRyaXN0YXRlMmNoYXJbc3ltLT5jdXJyLnRyaV0pOwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJfcHJpbnRmKCZncywKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
IGR1ZSB0byBpdHMgaW52aXNpYmxlIGFuZCBpdCBpcyBzZWxlY3RlZFxuIik7Cj4gCj4gQXMgTWFz
YWhpcm8gc2FpZCB0aGlzIGlzIHVubmVjZXNzYXJ5Lgo+IE1heWJlIGFkZCBhIHZlcmJvc2l0eSBs
ZXZlbCBmb3IgdGhpcy4KPiAKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZXhwcl9nc3RyX3ByaW50X3JldmRlcChzeW0tPnJldl9kZXAuZXhwciwg
JmdzLCB5ZXMsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgIFNlbGVjdGVkIGJ5IFt5XTpcbiIpOwo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleHBy
X2dzdHJfcHJpbnRfcmV2ZGVwKHN5bS0+cmV2X2RlcC5leHByLCAmZ3MsIG1vZCwKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIiAgU2VsZWN0ZWQgYnkgW21dOlxuIik7Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZwdXRzKHN0cl9nZXQoJmdzKSwgc3Rk
ZXJyKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0gZWxz
ZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN5bV92YWxpZGF0ZV9kZWZhdWx0KHN5bSk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYXNl
IFNfSU5UOgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgU19IRVg6
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoc3ltLT5k
aXJfZGVwLnRyaSA9PSBubyAmJgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RyY21wKChjaGFyICopKHN5bS0+ZGVmW1NfREVGX1VTRVJdLnZhbCksICIiKSAh
PSAwKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBnc3RyIGdzID0gc3RyX25ldygpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cl9wcmludGYoJmdzLAo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJcbkVSUk9SOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciAlc1xuIiwK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzeW0tPm5hbWUpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJfcHJpbnRmKCZncywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiICBEZXBlbmRzIG9uIFslY106ICIs
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3ltLT5kaXJfZGVwLnRyaSA9PSBtb2QgPyAnbScgOiAnbicpOwo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBleHByX2dzdHJfcHJpbnQo
c3ltLT5kaXJfZGVwLmV4cHIsICZncyk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cl9wcmludGYoJmdzLCAiXG4iKTsKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnB1dHMoc3RyX2dldCgm
Z3MpLCBzdGRlcnIpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfSBlbHNlIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3ltX3ZhbGlkYXRlX2RlZmF1bHQoc3ltKTsKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNhc2UgU19TVFJJTkc6Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoc3ltLT5kaXJfZGVwLnRyaSA9PSBubyAmJgo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyY21wKChjaGFyICopKHN5bS0+ZGVmW1NfREVG
X1VTRVJdLnZhbCksICIiKSAhPSAwKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBnc3RyIGdzID0gc3RyX25ldygpOwo+ID4gPiAr
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cl9wcmludGYoJmdzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJcbkVSUk9SOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRl
dGVjdGVkIGZvciAlc1xuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzeW0tPm5hbWUpOwo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJfcHJpbnRmKCZncywKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiICBE
ZXBlbmRzIG9uIFslY106ICIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3ltLT5kaXJfZGVwLnRyaSA9PSBtb2QgPyAnbScgOiAn
bicpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBleHByX2dzdHJfcHJpbnQoc3ltLT5kaXJfZGVwLmV4cHIsICZncyk7Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cl9wcmludGYoJmdzLCAi
XG4iKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZnB1dHMoc3RyX2dldCgmZ3MpLCBzdGRlcnIpOwo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRlZmF1bHQ6Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gICAg
ICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgICAgZm9yX2FsbF9zeW1ib2xzKGksIHN5bSkgewo+ID4g
PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9rY29uZmlnL2xrYy5oIGIvc2NyaXB0cy9rY29uZmlnL2xr
Yy5oCj4gPiA+IGluZGV4IDQ3MWE1OWFjZWNlYy4uODIwYTQ3ZmI0OTY4IDEwMDY0NAo+ID4gPiAt
LS0gYS9zY3JpcHRzL2tjb25maWcvbGtjLmgKPiA+ID4gKysrIGIvc2NyaXB0cy9rY29uZmlnL2xr
Yy5oCj4gPiA+IEBAIC0zOCw2ICszOCw4IEBAIHZvaWQgemNvbmZfaW5pdHNjYW4oY29uc3QgY2hh
ciAqbmFtZSk7Cj4gPiA+ICB2b2lkIHpjb25mX25leHRmaWxlKGNvbnN0IGNoYXIgKm5hbWUpOwo+
ID4gPiAgaW50IHpjb25mX2xpbmVubyh2b2lkKTsKPiA+ID4gIGNvbnN0IGNoYXIgKnpjb25mX2N1
cm5hbWUodm9pZCk7Cj4gPiA+ICtleHRlcm4gY29uc3QgY2hhciAqdmVyYm9zZTsKPiA+ID4gK3N0
YXRpYyBjb25zdCBjaGFyIHRyaXN0YXRlMmNoYXJbM10gPSB7J24nLCAnbScsICd5J307Cj4gCj4g
VGhpcyBzZWVtcyBub24taWRlYWwKPiAKPiA+ID4KPiA+ID4gIC8qIGNvbmZkYXRhLmMgKi8KPiA+
ID4gIGNvbnN0IGNoYXIgKmNvbmZfZ2V0X2NvbmZpZ25hbWUodm9pZCk7Cj4gPiA+IEBAIC0xMTIs
NiArMTE0LDcgQEAgc3RydWN0IHByb3BlcnR5ICpzeW1fZ2V0X3JhbmdlX3Byb3Aoc3RydWN0IHN5
bWJvbCAqc3ltKTsKPiA+ID4gIGNvbnN0IGNoYXIgKnN5bV9nZXRfc3RyaW5nX2RlZmF1bHQoc3Ry
dWN0IHN5bWJvbCAqc3ltKTsKPiA+ID4gIHN0cnVjdCBzeW1ib2wgKnN5bV9jaGVja19kZXBzKHN0
cnVjdCBzeW1ib2wgKnN5bSk7Cj4gPiA+ICBzdHJ1Y3Qgc3ltYm9sICpwcm9wX2dldF9zeW1ib2wo
c3RydWN0IHByb3BlcnR5ICpwcm9wKTsKPiA+ID4gK3ZvaWQgc3ltX3ZhbGlkYXRlX2RlZmF1bHQo
c3RydWN0IHN5bWJvbCAqc3ltKTsKPiA+ID4KPiA+ID4gIHN0YXRpYyBpbmxpbmUgdHJpc3RhdGUg
c3ltX2dldF90cmlzdGF0ZV92YWx1ZShzdHJ1Y3Qgc3ltYm9sICpzeW0pCj4gPiA+ICB7Cj4gPiA+
IGRpZmYgLS1naXQgYS9zY3JpcHRzL2tjb25maWcvc3ltYm9sLmMgYi9zY3JpcHRzL2tjb25maWcv
c3ltYm9sLmMKPiA+ID4gaW5kZXggMDU3MjMzMGJmOGE3Li44YjExZDZlYTFkMzAgMTAwNjQ0Cj4g
PiA+IC0tLSBhL3NjcmlwdHMva2NvbmZpZy9zeW1ib2wuYwo+ID4gPiArKysgYi9zY3JpcHRzL2tj
b25maWcvc3ltYm9sLmMKPiA+ID4gQEAgLTkxLDYgKzkxLDUzIEBAIHN0YXRpYyBzdHJ1Y3QgcHJv
cGVydHkgKnN5bV9nZXRfZGVmYXVsdF9wcm9wKHN0cnVjdCBzeW1ib2wgKnN5bSkKPiA+ID4gICAg
ICAgICByZXR1cm4gTlVMTDsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gK3ZvaWQgc3ltX3ZhbGlkYXRl
X2RlZmF1bHQoc3RydWN0IHN5bWJvbCAqc3ltKQo+ID4gPiArewo+ID4gPiArICAgICAgIGlmIChz
eW0tPnZpc2libGUgPT0gbm8pIHsKPiA+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBnc3RyIGdz
ID0gc3RyX25ldygpOwo+ID4gPiArICAgICAgICAgICAgICAgY29uc3QgY2hhciAqdmFsdWUgPSBz
eW1fZ2V0X3N0cmluZ19kZWZhdWx0KHN5bSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAg
IHN3aXRjaCAoc3ltLT50eXBlKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBjYXNlIFNfQk9PTEVB
TjoKPiA+ID4gKyAgICAgICAgICAgICAgIGNhc2UgU19UUklTVEFURToKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKHN0cmNtcCh2YWx1ZSwgIm4iKSAhPSAwKSB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyX3ByaW50ZigmZ3MsCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiXG5FUlJPUiA6ICVzWyVjID0+ICVjXSB2
YWx1ZSBpcyBpbnZhbGlkXG4gZHVlIHRvIGl0IGhhcyBkZWZhdWx0IHZhbHVlXG4iLAo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3ltLT5uYW1lLAo+IFNhbWUg
aGVyZQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJpc3Rh
dGUyY2hhcltzeW0tPmRlZltTX0RFRl9VU0VSXS50cmldLAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdHJpc3RhdGUyY2hhcltzeW0tPmN1cnIudHJpXSk7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoc3ltLT5pbXBsaWVkLnRyaSAh
PSBubykgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cl9wcmludGYo
JmdzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlxuRVJS
T1IgOiAlc1slYyA9PiAlY10gdmFsdWUgaXMgaW52YWxpZFxuIGR1ZSB0byBpdHMgaW52aXNpYmxl
IGFuZCBoYXMgaW1wbHkgdmFsdWVcbiIsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzeW0tPm5hbWUsCj4gQW5kIGhlcmUKPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRyaXN0YXRlMmNoYXJbc3ltLT5kZWZbU19ERUZfVVNF
Ul0udHJpXSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRy
aXN0YXRlMmNoYXJbc3ltLT5jdXJyLnRyaV0pOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cl9wcmludGYoJmdzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIiBJbXBseSA6ICIpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGV4cHJfZ3N0cl9wcmludChzeW0tPmltcGxpZWQuZXhwciwgJmdzKTsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJfcHJpbnRmKCZncywgIlxuIik7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gPiA+ICsgICAgICAgICAgICAgICBjYXNlIFNfU1RSSU5HOgo+ID4gPiArICAg
ICAgICAgICAgICAgY2FzZSBTX0lOVDoKPiA+ID4gKyAgICAgICAgICAgICAgIGNhc2UgU19IRVg6
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChzdHJjbXAodmFsdWUsICIiKSAhPSAw
KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RyX3ByaW50ZigmZ3Ms
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiXG5FUlJPUiA6
ICVzWyVzID0+ICVzXSB2YWx1ZSBpcyBpbnZhbGlkXG4iLAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3ltLT5uYW1lLAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKGNoYXIgKikoc3ltLT5kZWZbU19ERUZfVVNFUl0udmFs
KSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChjaGFyICop
KHN5bS0+Y3Vyci52YWwpKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJfcHJpbnRmKCZncywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICIgZHVlIHRvIGl0IGhhcyBkZWZhdWx0IHZhbHVlXG4iKTsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgfQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4g
KyAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiArICAgICAgICAgICAgICAgZnB1dHMo
c3RyX2dldCgmZ3MpLCBzdGRlcnIpOwo+ID4gPiArICAgICAgIH0KPiA+ID4gK30KPiA+ID4gKwo+
ID4gPiAgc3RydWN0IHByb3BlcnR5ICpzeW1fZ2V0X3JhbmdlX3Byb3Aoc3RydWN0IHN5bWJvbCAq
c3ltKQo+ID4gPiAgewo+ID4gPiAgICAgICAgIHN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKPiA+ID4g
QEAgLTYwMCw3ICs2NDcsOCBAQCBib29sIHN5bV9zdHJpbmdfdmFsaWQoc3RydWN0IHN5bWJvbCAq
c3ltLCBjb25zdCBjaGFyICpzdHIpCj4gPiA+ICBib29sIHN5bV9zdHJpbmdfd2l0aGluX3Jhbmdl
KHN0cnVjdCBzeW1ib2wgKnN5bSwgY29uc3QgY2hhciAqc3RyKQo+ID4gPiAgewo+ID4gPiAgICAg
ICAgIHN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKPiA+ID4gLSAgICAgICBsb25nIGxvbmcgdmFsOwo+
ID4gPiArICAgICAgIGxvbmcgbG9uZyB2YWwsIGxlZnQsIHJpZ2h0Owo+ID4gPiArICAgICAgIHN0
cnVjdCBnc3RyIGdzID0gc3RyX25ldygpOwo+ID4gPgo+ID4gPiAgICAgICAgIHN3aXRjaCAoc3lt
LT50eXBlKSB7Cj4gPiA+ICAgICAgICAgY2FzZSBTX1NUUklORzoKPiA+ID4gQEAgLTYxMiw4ICs2
NjAsMjAgQEAgYm9vbCBzeW1fc3RyaW5nX3dpdGhpbl9yYW5nZShzdHJ1Y3Qgc3ltYm9sICpzeW0s
IGNvbnN0IGNoYXIgKnN0cikKPiA+ID4gICAgICAgICAgICAgICAgIGlmICghcHJvcCkKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+ICAgICAgICAgICAgICAg
ICB2YWwgPSBzdHJ0b2xsKHN0ciwgTlVMTCwgMTApOwo+ID4gPiAtICAgICAgICAgICAgICAgcmV0
dXJuIHZhbCA+PSBzeW1fZ2V0X3JhbmdlX3ZhbChwcm9wLT5leHByLT5sZWZ0LnN5bSwgMTApICYm
Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgdmFsIDw9IHN5bV9nZXRfcmFuZ2VfdmFsKHBy
b3AtPmV4cHItPnJpZ2h0LnN5bSwgMTApOwo+ID4gPiArICAgICAgICAgICAgICAgbGVmdCA9IHN5
bV9nZXRfcmFuZ2VfdmFsKHByb3AtPmV4cHItPmxlZnQuc3ltLCAxMCk7Cj4gPiA+ICsgICAgICAg
ICAgICAgICByaWdodCA9IHN5bV9nZXRfcmFuZ2VfdmFsKHByb3AtPmV4cHItPnJpZ2h0LnN5bSwg
MTApOwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKHZhbCA+PSBsZWZ0ICYmIHZhbCA8PSByaWdo
dCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+ICsgICAg
ICAgICAgICAgICBpZiAodmVyYm9zZSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBz
dHJfcHJpbnRmKCZncywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiXG5F
UlJPUjogdW5tZXQgcmFuZ2UgZGV0ZWN0ZWQgZm9yICVzXG4iLAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN5bS0+bmFtZSk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHN0cl9wcmludGYoJmdzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICIgc3ltYm9sIHZhbHVlIGlzICVsbGQsIHRoZSByYW5nZSBpcyAoJWxsZCAlbGxkKVxuIiwKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWwsIGxlZnQsIHJpZ2h0KTsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZnB1dHMoc3RyX2dldCgmZ3MpLCBzdGRlcnIpOwo+
ID4gPiArICAgICAgICAgICAgICAgfQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
Owo+ID4gPiAgICAgICAgIGNhc2UgU19IRVg6Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAoIXN5
bV9zdHJpbmdfdmFsaWQoc3ltLCBzdHIpKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gPiA+IEBAIC02MjEsOCArNjgxLDIwIEBAIGJvb2wgc3ltX3N0cmluZ193
aXRoaW5fcmFuZ2Uoc3RydWN0IHN5bWJvbCAqc3ltLCBjb25zdCBjaGFyICpzdHIpCj4gPiA+ICAg
ICAgICAgICAgICAgICBpZiAoIXByb3ApCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiB0cnVlOwo+ID4gPiAgICAgICAgICAgICAgICAgdmFsID0gc3RydG9sbChzdHIsIE5VTEws
IDE2KTsKPiA+ID4gLSAgICAgICAgICAgICAgIHJldHVybiB2YWwgPj0gc3ltX2dldF9yYW5nZV92
YWwocHJvcC0+ZXhwci0+bGVmdC5zeW0sIDE2KSAmJgo+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgIHZhbCA8PSBzeW1fZ2V0X3JhbmdlX3ZhbChwcm9wLT5leHByLT5yaWdodC5zeW0sIDE2KTsK
PiA+ID4gKyAgICAgICAgICAgICAgIGxlZnQgPSBzeW1fZ2V0X3JhbmdlX3ZhbChwcm9wLT5leHBy
LT5sZWZ0LnN5bSwgMTYpOwo+ID4gPiArICAgICAgICAgICAgICAgcmlnaHQgPSBzeW1fZ2V0X3Jh
bmdlX3ZhbChwcm9wLT5leHByLT5yaWdodC5zeW0sIDE2KTsKPiA+ID4gKyAgICAgICAgICAgICAg
IGlmICh2YWwgPj0gbGVmdCAmJiB2YWwgPD0gcmlnaHQpCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOwo+ID4gPiArICAgICAgICAgICAgICAgaWYgKHZlcmJvc2UpIHsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RyX3ByaW50ZigmZ3MsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIlxuRVJST1I6IHVubWV0IHJhbmdlIGRldGVjdGVk
IGZvciAlc1xuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzeW0tPm5h
bWUpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdHJfcHJpbnRmKCZncywKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiIHN5bWJvbCB2YWx1ZSBpcyAweCVsbHgs
IHRoZSByYW5nZSBpcyAoMHglbGx4IDB4JWxseClcbiIsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdmFsLCBsZWZ0LCByaWdodCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGZwdXRzKHN0cl9nZXQoJmdzKSwgc3RkZXJyKTsKPiA+ID4gKyAgICAgICAgICAgICAg
IH0KPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gICAgICAgICBjYXNl
IFNfQk9PTEVBTjoKPiA+ID4gICAgICAgICBjYXNlIFNfVFJJU1RBVEU6Cj4gPiA+ICAgICAgICAg
ICAgICAgICBzd2l0Y2ggKHN0clswXSkgewo+ID4gPiAtLQo+ID4gPiAyLjE3LjEKPiA+ID4KPiA+
Cj4gPgo+ID4gLS0KPiA+IEJlc3QgUmVnYXJkcwo+ID4gTWFzYWhpcm8gWWFtYWRhCg==
