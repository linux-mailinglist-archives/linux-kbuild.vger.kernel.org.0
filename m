Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C6946DE7B
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Dec 2021 23:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237797AbhLHWl2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Dec 2021 17:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236539AbhLHWl2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Dec 2021 17:41:28 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98931C061746
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Dec 2021 14:37:55 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 57955891AF;
        Thu,  9 Dec 2021 11:37:51 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1639003071;
        bh=l7oJEom0QnHyfFC7sr/ELE2IAPdQ2shKlcTo+EwdIi8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=2H06Ylh4CITkVdNgSwGhgy0VWk0ja+5DcC6Bup4I9OU651uYFY1UphQS+W9WML7qx
         dbCt5gWqzJM09xKitFmwIGPNHAsyJQdrvTHKMRhzHvAzJVuMhQEF0Hm/UAoFNrpEsW
         Nn/O7DHZLg2fnLU/9l3cHbwH9C056oJWy6oeXxdKNSEcR2L3d8hM/iZd9rcDTI/ri3
         1xs0BZ//7qdghbfOAti3Lk8MyhvcveLdWWp7BOfBw+s/r+hhE/+IbkxdXsDk1ukAzT
         mFA5O8Ts4Tz68+6W9lBTOGzwvUfyBpjC5X/+a3AxMD4Y6B7msPmHy5+6DzwrrQ4TQ6
         Un6yaCvxxU4cQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61b133bf0001>; Thu, 09 Dec 2021 11:37:51 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 9 Dec 2021 11:37:51 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.026; Thu, 9 Dec 2021 11:37:51 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: Enable DT schema checks for %.dtb targets
Thread-Topic: [PATCH v2] kbuild: Enable DT schema checks for %.dtb targets
Thread-Index: AQHX6nO08beVuCfA/0Kxy5t++H/TdawoRy0AgAAScwA=
Date:   Wed, 8 Dec 2021 22:37:50 +0000
Message-ID: <9efecfd9-4021-642b-7dd0-dc03b24b336a@alliedtelesis.co.nz>
References: <20210913145146.766080-1-robh@kernel.org>
 <cc083619-3744-5979-4750-9c26f016505c@alliedtelesis.co.nz>
 <CAL_JsqKqcCD+0ymW_km874A+HMeONBCF5Zgu352mwr-nNjDeqA@mail.gmail.com>
In-Reply-To: <CAL_JsqKqcCD+0ymW_km874A+HMeONBCF5Zgu352mwr-nNjDeqA@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1566D8AC8996C6429C5B09EDEB77BF59@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=XOZOtjpE c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=IOMw9HtfNCkA:10 a=w01Ayc6Ka1JdUX0gakEA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQpPbiA5LzEyLzIxIDEwOjMxIGFtLCBSb2IgSGVycmluZyB3cm90ZToNCj4gT24gTW9uLCBEZWMg
NiwgMjAyMSBhdCAxOjM0IEFNIENocmlzIFBhY2toYW0NCj4gPENocmlzLlBhY2toYW1AYWxsaWVk
dGVsZXNpcy5jby5uej4gd3JvdGU6DQo+PiBIaSBSb2IsDQo+Pg0KPj4gT24gMTQvMDkvMjEgMjo1
MSBhbSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+Pj4gSXQgaXMgcG9zc2libGUgdG8gYnVpbGQgYSBz
aW5nbGUgZHRiLCBidXQgbm90IHdpdGggRFQgc2NoZW1hIHZhbGlkYXRpb24NCj4+PiBlbmFibGVk
LiBFbmFibGUgdGhlIHNjaGVtYSB2YWxpZGF0aW9uIHRvIHJ1biBmb3IgJS5kdGIgYW5kICUuZHRi
bw0KPj4+IHRhcmdldHMuIEFueW9uZSBidWlsZGluZyBhIGR0YiBmb3IgYSBzcGVjaWZpYyBwbGF0
Zm9ybSAqc2hvdWxkKiBwYXkNCj4+PiBhdHRlbnRpb24gdG8gc2NoZW1hIHdhcm5pbmdzLg0KPj4+
DQo+Pj4gVGhpcyBjb3VsZCBiZSBzdXBwb3J0ZWQgd2l0aCBhIHNlcGFyYXRlICUuZHQueWFtbCB0
YXJnZXQgaW5zdGVhZC4NCj4+PiBIb3dldmVyLCB0aGUgLmR0LnlhbWwgZm9ybWF0IGlzIGNvbnNp
ZGVyZWQgYW4gaW50ZXJtZWRpYXRlIGZvcm1hdCBhbmQNCj4+PiBjb3VsZCBwb3NzaWJseSBnbyBh
d2F5IGF0IHNvbWUgcG9pbnQgaWYgc2NoZW1hIGNoZWNraW5nIGlzIGludGVncmF0ZWQNCj4+PiBp
bnRvIGR0Yy4gQWxzbywgdGhlIHBsYW4gaXMgdG8gZW5hYmxlIHRoZSBzY2hlbWEgY2hlY2tzIGJ5
IGRlZmF1bHQgb25jZQ0KPj4+IHBsYXRmb3JtcyBhcmUgZnJlZSBvZiB3YXJuaW5ncywgYW5kIHRo
aXMgaXMgYSBtb3ZlIGluIHRoYXQgZGlyZWN0aW9uLg0KPj4gSnVzdCBzdGFydGVkIGJ1aWxkaW5n
IDUuMTYtcmM0IGFuZCBoaXQgdGhlIGZvbGxvd2luZyBlcnJvcg0KPj4NCj4+IC91c3Ivc3JjL2xp
bnV4L3NjcmlwdHMvZHRjL01ha2VmaWxlOjIzOiAqKiogZHRjIG5lZWRzIGxpYnlhbWwgZm9yIERU
DQo+PiBzY2hlbWEgdmFsaWRhdGlvbiBzdXBwb3J0LiBJbnN0YWxsIHRoZSBuZWNlc3NhcnkgbGli
eWFtbCBkZXZlbG9wbWVudA0KPj4gcGFja2FnZS4uICBTdG9wLg0KPj4gbWFrZTogKioqIFsvdXNy
L3NyYy9saW51eC9NYWtlZmlsZToxNDA1OiBzY3JpcHRzX2R0Y10gRXJyb3IgMg0KPj4gbWFrZTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4+DQo+PiBJIHRyYWNrZWQgaXQg
YmFjayB0byB0aGlzIHBhdGNoIGFuZCBJIGdhdGhlciB0aGF0IHRoZSAiZXJyb3IiIGlzIHZlcnkN
Cj4+IG11Y2ggaW50ZW5kZWQuIEZpeGluZyBpdCBtZWFucyBJIG5lZWQgdG8gZ2V0IGEgbmF0aXZl
IGxpYnlhbWwgaW50byBteQ0KPj4gY3Jvc3MgdG9vbGNoYWluLCB3aGljaCBpcyBkb2FibGUgYnV0
IGEgYml0IG9mIGEgaGFzc2xlLiBUaGlzIHByb2JhYmx5DQo+PiBhZmZlY3RzIG90aGVyIG1ldGEg
YnVpbGQgc3lzdGVtcyBsaWtlIGJ1aWxkcm9vdCBhbmQgeW9jdG8uDQo+IFllcy4gSSdtIGdvaW5n
IHRvIHJldmVydCB0aGlzIGZvciBub3cuDQo+DQo+IEFyZSBweXRob24gZGVwZW5kZW5jaWVzIGFu
eSBlYXNpZXI/IFRoZSBsaWJ5YW1sIGR0YyBkZXBlbmRlbmN5IG1heQ0KPiBhY3R1YWxseSBnbyBh
d2F5LCBidXQgZHRzY2hlbWEgYW5kIGl0J3MgZGVwZW5kZW5jaWVzIHdpbGwgcmVtYWluLg0KDQpQ
cm9iYWJseSBubyB3b3JzZSB0aGF0IG5vbiBweXRob24gZGVwZW5kZW5jaWVzLg0KDQpPdXIgcGFy
dGljdWxhciBzcGVjaWFsIGluLWhvdXNlIGJ1aWxkIHN5c3RlbSBtaWdodCBiZSBhIGJpdCB0cmlj
a2llciBhcyANCndlIGNhbid0IGp1c3Qgc3BpbiB1cCBhIHZpdHJ1YWxlbnYgYnV0IHRoYXQncyBv
dXIgcHJvYmxlbSBub3QgeW91cnMuIFdlIA0KZG8gbWFuYWdlIHRvIGJ1aWxkIG90aGVyIHBhY2th
Z2VzIHRoYXQgaGF2ZSBidWlsZC10aW1lIHB5dGhvbiANCmRlcGVuZGVuY2llcyBzbyBJJ20gc3Vy
ZSB3ZSBjb3VsZCBtYWtlIHRoYXQgd29yayBmb3IgdGhlIGtlcm5lbC4gSSdtIG5vdCANCnN1cmUg
aG93IG11Y2ggcHVzaC1iYWNrIHlvdSdkIGdldCBmcm9tIG90aGVycyBpZiBweXRob24gYmVjYW1l
IGEgDQpkZXBlbmRlbmN5IGZvciBidWlsZGluZyB0aGUga2VybmVsLg0KDQo+PiBJIHRoaW5rIEkg
dW5kZXJzdGFuZCB3aGF0IHlvdSdyZSBnZXR0aW5nIGF0IGJ1dCBpcyBpdCBwb3NzaWJsZSB0byBo
YXZlDQo+PiBzb21lIGtpbmQgb2YgZXNjYXBlIGhhdGNoIHRvIGF2b2lkIGhhdmluZyB0byBhZGQg
YSBidWlsZCB0aW1lIHRvb2wNCj4+IGRlcGVuZGVuY3kgKG9yIGV2ZW4gYnVuZGxpbmcgbGlieWFt
bCBuZXh0IHRvIHNjcmlwdHMvZHRjKT8NCj4gTXkgY3VycmVudCB0aG91Z2h0IGlzIHRvIG1ha2Ug
aXQgYSBrY29uZmlnIG9wdGlvbi4gSSBhc3N1bWUgdGhhdCB3b3VsZA0KPiB3b3JrIGZvciB5b3U/
DQoNCkFuIG9wdGlvbiB3b3VsZCB3b3JrIGZvciB1cy4gSXQgY291bGQgYWxzbyBiZSB0aGUga2lu
ZCBvZiB0aGluZyB0aGF0IA0Ka2lja3MgaW4gd2l0aCBtYWtlIEM9MS8yLg0KDQpJIHByZXN1bWUg
dGhhdCB5b3Ugd291bGQgd2FudCBwZW9wbGUgdG8gcnVuIHRoaXMga2luZCBvZiB0aGluZyB3aGVu
IA0Kc3VibWl0dGluZyBuZXcgYmluZGluZ3Mgb3IgYm9hcmQuZHRzLiBGb3IgdXMgd2UgY2FuIGRv
IHRob3NlIGJ1aWxkcyANCm1hbnVhbGx5IG91dHNpZGUgb3VyIGZ1bGwgYnVpbGQgc3lzdGVtLg0K
DQo+PiBJIGFsc28gbm90aWNlIHRoYXQgd2hlbiBJIGRvIHN1cHBseSBhIHRvb2xjaGFpbiB3aXRo
IGxpYnlhbWwgdGhlIGJ1aWxkDQo+PiB0aW1lcyBhcmUgaW1wYWN0ZWQgYnkgYSBub3RpY2FibGUg
ZmFjdG9yLg0KPiBIb3cgbWFueSBkdGJzIGFyZSB5b3UgYnVpbGRpbmc/DQpOb3RoaW5nIGV4Y2Vz
c2l2ZS4gU29tZXRoaW5nIGluIHRoZSBvcmRlciBvZiA3IGRlcGVuZGluZyBvbiB0aGUgDQphcmNo
aXRlY3R1cmUuIEl0J3MgYXZvaWRlZCBvbiBtb3N0IHJlLWJ1aWxkcyBzbyBnZW5lcmFsbHkgaXQn
cyBqdXN0IGEgDQpvbmUtb2ZmIGNvc3QgYnV0IGl0IHdvdWxkIGFmZmVjdCBhbnkgdHlwZSBvZiBD
SSBzeXN0ZW0gdGhhdCBidWlsZHMgZnJvbSANCmNsZWFuLg0KPg0KPiBSb2I=
