Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020964690DD
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Dec 2021 08:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238479AbhLFHiC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Dec 2021 02:38:02 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51556 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhLFHiB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Dec 2021 02:38:01 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 01A5A891AF;
        Mon,  6 Dec 2021 20:34:30 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1638776070;
        bh=0Tnh/7w8NutVos3QgBFtkzzrU7g1CNwyGaPWqav3wEk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=s2o4Z/C5OwBdzomv0/r4RKL5oBduMJtlOnTiVi0LzNdtOxsvRHjRU3izmTXZXn9x/
         VOBSdQ9JrXFE0a382pSUg9luKx0keB8QE4pDVEPTFDp7HeOIvxtIGVKEWZkB/tMXcD
         qkN38JpwpGu7UcutFeF1KWsRQTKefkuykhq7ptJt5V7VkLsHg8ii8/IQDykR+t/hXY
         Vhso2OuscgkwjVVmFpAUGBnEcLuU+ox9oozT8SJ6ucJIS0f47eZIePKIr/cgNLlNvh
         bWrX4CISNU/V46KALrowXz4+lHunLP0UGJvOMGtdqyfY+eT1t7/Idu4CEJasnLbiyS
         AdqTRgCNbV4zw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61adbd050001>; Mon, 06 Dec 2021 20:34:29 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 20:34:29 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.026; Mon, 6 Dec 2021 20:34:29 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: Enable DT schema checks for %.dtb targets
Thread-Topic: [PATCH v2] kbuild: Enable DT schema checks for %.dtb targets
Thread-Index: AQHX6nO08beVuCfA/0Kxy5t++H/TdQ==
Date:   Mon, 6 Dec 2021 07:34:29 +0000
Message-ID: <cc083619-3744-5979-4750-9c26f016505c@alliedtelesis.co.nz>
References: <20210913145146.766080-1-robh@kernel.org>
In-Reply-To: <20210913145146.766080-1-robh@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <35AEF6AEF7C697438B51A1095FF4B995@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=XOZOtjpE c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=IOMw9HtfNCkA:10 a=KKAkSRfTAAAA:8 a=k-42gJp3AAAA:8 a=VwQbUJbxAAAA:8 a=bYLquNiKjVeCADY__y4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=uCSXFHLys93vLW5PjgO_:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SGkgUm9iLA0KDQpPbiAxNC8wOS8yMSAyOjUxIGFtLCBSb2IgSGVycmluZyB3cm90ZToNCj4gSXQg
aXMgcG9zc2libGUgdG8gYnVpbGQgYSBzaW5nbGUgZHRiLCBidXQgbm90IHdpdGggRFQgc2NoZW1h
IHZhbGlkYXRpb24NCj4gZW5hYmxlZC4gRW5hYmxlIHRoZSBzY2hlbWEgdmFsaWRhdGlvbiB0byBy
dW4gZm9yICUuZHRiIGFuZCAlLmR0Ym8NCj4gdGFyZ2V0cy4gQW55b25lIGJ1aWxkaW5nIGEgZHRi
IGZvciBhIHNwZWNpZmljIHBsYXRmb3JtICpzaG91bGQqIHBheQ0KPiBhdHRlbnRpb24gdG8gc2No
ZW1hIHdhcm5pbmdzLg0KPg0KPiBUaGlzIGNvdWxkIGJlIHN1cHBvcnRlZCB3aXRoIGEgc2VwYXJh
dGUgJS5kdC55YW1sIHRhcmdldCBpbnN0ZWFkLg0KPiBIb3dldmVyLCB0aGUgLmR0LnlhbWwgZm9y
bWF0IGlzIGNvbnNpZGVyZWQgYW4gaW50ZXJtZWRpYXRlIGZvcm1hdCBhbmQNCj4gY291bGQgcG9z
c2libHkgZ28gYXdheSBhdCBzb21lIHBvaW50IGlmIHNjaGVtYSBjaGVja2luZyBpcyBpbnRlZ3Jh
dGVkDQo+IGludG8gZHRjLiBBbHNvLCB0aGUgcGxhbiBpcyB0byBlbmFibGUgdGhlIHNjaGVtYSBj
aGVja3MgYnkgZGVmYXVsdCBvbmNlDQo+IHBsYXRmb3JtcyBhcmUgZnJlZSBvZiB3YXJuaW5ncywg
YW5kIHRoaXMgaXMgYSBtb3ZlIGluIHRoYXQgZGlyZWN0aW9uLg0KDQpKdXN0IHN0YXJ0ZWQgYnVp
bGRpbmcgNS4xNi1yYzQgYW5kIGhpdCB0aGUgZm9sbG93aW5nIGVycm9yDQoNCi91c3Ivc3JjL2xp
bnV4L3NjcmlwdHMvZHRjL01ha2VmaWxlOjIzOiAqKiogZHRjIG5lZWRzIGxpYnlhbWwgZm9yIERU
IA0Kc2NoZW1hIHZhbGlkYXRpb24gc3VwcG9ydC4gSW5zdGFsbCB0aGUgbmVjZXNzYXJ5IGxpYnlh
bWwgZGV2ZWxvcG1lbnQgDQpwYWNrYWdlLi7CoCBTdG9wLg0KbWFrZTogKioqIFsvdXNyL3NyYy9s
aW51eC9NYWtlZmlsZToxNDA1OiBzY3JpcHRzX2R0Y10gRXJyb3IgMg0KbWFrZTogKioqIFdhaXRp
bmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCg0KSSB0cmFja2VkIGl0IGJhY2sgdG8gdGhpcyBw
YXRjaCBhbmQgSSBnYXRoZXIgdGhhdCB0aGUgImVycm9yIiBpcyB2ZXJ5IA0KbXVjaCBpbnRlbmRl
ZC4gRml4aW5nIGl0IG1lYW5zIEkgbmVlZCB0byBnZXQgYSBuYXRpdmUgbGlieWFtbCBpbnRvIG15
IA0KY3Jvc3MgdG9vbGNoYWluLCB3aGljaCBpcyBkb2FibGUgYnV0IGEgYml0IG9mIGEgaGFzc2xl
LiBUaGlzIHByb2JhYmx5IA0KYWZmZWN0cyBvdGhlciBtZXRhIGJ1aWxkIHN5c3RlbXMgbGlrZSBi
dWlsZHJvb3QgYW5kIHlvY3RvLg0KDQpJIHRoaW5rIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSdyZSBn
ZXR0aW5nIGF0IGJ1dCBpcyBpdCBwb3NzaWJsZSB0byBoYXZlIA0Kc29tZSBraW5kIG9mIGVzY2Fw
ZSBoYXRjaCB0byBhdm9pZCBoYXZpbmcgdG8gYWRkIGEgYnVpbGQgdGltZSB0b29sIA0KZGVwZW5k
ZW5jeSAob3IgZXZlbiBidW5kbGluZyBsaWJ5YW1sIG5leHQgdG8gc2NyaXB0cy9kdGMpPw0KDQpJ
IGFsc28gbm90aWNlIHRoYXQgd2hlbiBJIGRvIHN1cHBseSBhIHRvb2xjaGFpbiB3aXRoIGxpYnlh
bWwgdGhlIGJ1aWxkIA0KdGltZXMgYXJlIGltcGFjdGVkIGJ5IGEgbm90aWNhYmxlIGZhY3Rvci4N
Cg0KPiBDYzogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0K
PiBDYzogVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4NCj4gQ2M6IE1hc2FoaXJvIFlhbWFk
YSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+DQo+IENjOiBsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwu
b3JnDQo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IC0t
LQ0KPiB2MjoNCj4gICAtIEFsc28gZW5hYmxlIHNjaGVtYSBjaGVja3Mgb24gJS5kdGJvIHRhcmdl
dHMNCj4gLS0tDQo+ICAgTWFrZWZpbGUgfCAxMCArKysrKy0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL01h
a2VmaWxlIGIvTWFrZWZpbGUNCj4gaW5kZXggN2NmZTRmZjM2ZjQ0Li5jNTdhNzY1N2M4ZGQgMTAw
NjQ0DQo+IC0tLSBhL01ha2VmaWxlDQo+ICsrKyBiL01ha2VmaWxlDQo+IEBAIC0xNDAyLDE3ICsx
NDAyLDE3IEBAIGVuZGlmDQo+ICAgDQo+ICAgaWZuZXEgKCQoZHRzdHJlZSksKQ0KPiAgIA0KPiAt
JS5kdGI6IGluY2x1ZGUvY29uZmlnL2tlcm5lbC5yZWxlYXNlIHNjcmlwdHNfZHRjDQo+IC0JJChR
KSQoTUFLRSkgJChidWlsZCk9JChkdHN0cmVlKSAkKGR0c3RyZWUpLyRADQo+ICslLmR0YjogZHRf
YmluZGluZ19jaGVjayBpbmNsdWRlL2NvbmZpZy9rZXJuZWwucmVsZWFzZSBzY3JpcHRzX2R0Yw0K
PiArCSQoUSkkKE1BS0UpICQoYnVpbGQpPSQoZHRzdHJlZSkgJChkdHN0cmVlKS8kQCAkKGR0c3Ry
ZWUpLyQqLmR0LnlhbWwNCj4gICANCj4gLSUuZHRibzogaW5jbHVkZS9jb25maWcva2VybmVsLnJl
bGVhc2Ugc2NyaXB0c19kdGMNCj4gLQkkKFEpJChNQUtFKSAkKGJ1aWxkKT0kKGR0c3RyZWUpICQo
ZHRzdHJlZSkvJEANCj4gKyUuZHRibzogZHRfYmluZGluZ19jaGVjayBpbmNsdWRlL2NvbmZpZy9r
ZXJuZWwucmVsZWFzZSBzY3JpcHRzX2R0Yw0KPiArCSQoUSkkKE1BS0UpICQoYnVpbGQpPSQoZHRz
dHJlZSkgJChkdHN0cmVlKS8kQCAkKGR0c3RyZWUpLyQqLmR0LnlhbWwNCj4gICANCj4gICBQSE9O
WSArPSBkdGJzIGR0YnNfaW5zdGFsbCBkdGJzX2NoZWNrDQo+ICAgZHRiczogaW5jbHVkZS9jb25m
aWcva2VybmVsLnJlbGVhc2Ugc2NyaXB0c19kdGMNCj4gICAJJChRKSQoTUFLRSkgJChidWlsZCk9
JChkdHN0cmVlKQ0KPiAgIA0KPiAtaWZuZXEgKCQoZmlsdGVyIGR0YnNfY2hlY2ssICQoTUFLRUNN
REdPQUxTKSksKQ0KPiAraWZuZXEgKCQoZmlsdGVyIGR0YnNfY2hlY2sgJS5kdGIgJS5kdGJvLCAk
KE1BS0VDTURHT0FMUykpLCkNCj4gICBleHBvcnQgQ0hFQ0tfRFRCUz15DQo+ICAgZHRiczogZHRf
YmluZGluZ19jaGVjaw0KPiAgIGVuZGlm
