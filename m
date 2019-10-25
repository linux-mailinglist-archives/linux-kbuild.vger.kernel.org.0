Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D97DE5287
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2019 19:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbfJYRps (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Oct 2019 13:45:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:12513 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726002AbfJYRpr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 13:45:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 10:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,229,1569308400"; 
   d="scan'208";a="198086417"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
  by fmsmga007.fm.intel.com with ESMTP; 25 Oct 2019 10:45:47 -0700
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 25 Oct 2019 10:45:44 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.88]) by
 ORSMSX162.amr.corp.intel.com ([169.254.3.148]) with mapi id 14.03.0439.000;
 Fri, 25 Oct 2019 10:45:44 -0700
From:   "Keller, Jacob E" <jacob.e.keller@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     Randy Dunlap <rdunlap@infradead.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: RE: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Topic: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Index: AQHVdYkISHS3XNGT0kCKyhZHN6EY9KdALBNAgAIVm4CAAmLQsIAjqUEAgACZz9CAALWTgIACLwmw
Date:   Fri, 25 Oct 2019 17:45:43 +0000
Message-ID: <02874ECE860811409154E81DA85FBB589693D053@ORSMSX121.amr.corp.intel.com>
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
 <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com>
 <02874ECE860811409154E81DA85FBB58968E1402@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARAhZtzdnS9+mgtamj=pLdV81dudnYVDa8NRxcQPpF0bw@mail.gmail.com>
 <02874ECE860811409154E81DA85FBB589693A38A@ORSMSX121.amr.corp.intel.com>
 <CAK7LNAQow8N9a5e_=pu7qDiuvETy1x1P5fxp20zYOZgQhXPJhg@mail.gmail.com>
In-Reply-To: <CAK7LNAQow8N9a5e_=pu7qDiuvETy1x1P5fxp20zYOZgQhXPJhg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZmZmNDVjMTgtNDA3ZC00NzM1LThlZmQtNThmM2Q3Yjc4NTdjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWFV0eGJtcWZwbFY4QVdIR1djN2VydkordFhyaHNuTUN4elpiOWFpZWxib1pQN25GSDNMM2R5MVFiWXZrOWlMNSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hc2FoaXJvIFlhbWFkYSA8
eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2Jl
ciAyMywgMjAxOSA2OjIyIFBNDQo+IFRvOiBLZWxsZXIsIEphY29iIEUgPGphY29iLmUua2VsbGVy
QGludGVsLmNvbT4NCj4gQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPjsg
aW50ZWwtd2lyZWQtbGFuQGxpc3RzLm9zdW9zbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWtidWlsZCA8bGludXgta2J1aWxkQHZnZXIua2VybmVsLm9yZz4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gbmFtZXNwYWNlOiBmaXggbmFtZXNwYWNlLnBsIHNjcmlwdCB0
byBzdXBwb3J0IHJlbGF0aXZlDQo+IHBhdGhzDQo+IA0KPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBh
dCA2OjM0IEFNIEtlbGxlciwgSmFjb2IgRQ0KPiA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPiB3
cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206
IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQo+ID4gPiBT
ZW50OiBUdWVzZGF5LCBPY3RvYmVyIDIyLCAyMDE5IDEwOjIyIFBNDQo+ID4gPiBUbzogS2VsbGVy
LCBKYWNvYiBFIDxqYWNvYi5lLmtlbGxlckBpbnRlbC5jb20+OyBSYW5keSBEdW5sYXANCj4gPiA+
IDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+ID4gPiBDYzogaW50ZWwtd2lyZWQtbGFuQGxpc3Rz
Lm9zdW9zbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrYnVp
bGQNCj4gPiA+IDxsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnPg0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSF0gbmFtZXNwYWNlOiBmaXggbmFtZXNwYWNlLnBsIHNjcmlwdCB0byBzdXBwb3J0
IHJlbGF0aXZlDQo+ID4gPiBwYXRocw0KPiA+ID4NCj4gPiA+IFRoaXMgc2NyaXB0cyBoYXMgYmVl
biA1LXllYXIgYnJva2VuLA0KPiA+ID4gYW5kIEkgZGlkIG5vdCBzZWUgYW55IGNvbXBsYWludCBl
eGNlcHQgZnJvbSB5b3UuDQo+ID4gPiBTbywgSSB3b25kZXIgaG93IG1hbnkgcGVvcGxlIGFyZSB1
c2luZyB0aGlzLg0KPiA+ID4NCj4gPiA+IE5vciwgZG8gSSB1bmRlcnN0YW5kIGhvdyB0byB1c2Ug
aXQuDQo+ID4gPg0KPiA+ID4gQ291bGQgeW91IHRlYWNoIG1lIGEgYml0IG1vcmUgYWJvdXQgdGhp
cyBzY3JpcHQ/DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBTb21ldGhpbmcgbWlnaHQgYmUg
bWlzc2luZyBpbiBteSBtaW5kLCBidXQNCj4gPiA+IEkgZG8gbm90IGtub3cgaG93IHRvIHVzZSB0
aGlzIHNjcmlwdCBpbiBhIHVzZWZ1bCB3YXkuDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBJ
dCBwcm92aWRlcyB0aHJlZSBjaGVja3MuDQo+ID4gPg0KPiA+ID4gWzFdIGxpc3RfbXVsdGlwbHlf
ZGVmaW5lZCgpDQo+ID4gPg0KPiA+ID4gVGhpcyB3YXJucyBtdWx0aXBsZSBkZWZpbml0aW9uIG9m
IGZ1bmN0aW9ucy4NCj4gPiA+DQo+ID4gPiBUaGUgY29tcGlsZXIgd291bGQgZmFpbCBpZiBpdCBz
YXcgYW55IG11bHRpcGxlIGRlZmluaXRpb24sDQo+ID4gPiBzbyB0aGUgcmVwb3J0cyBmcm9tIHRo
aXMgY2hlY2sgYXJlIGFsbCBmYWxzZS1wb3NpdGl2ZS4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gWzJd
IHJlc29sdmVfZXh0ZXJuYWxfcmVmZXJlbmNlcygpDQo+ID4gPg0KPiA+ID4gVGhpcyB3YXJucyB1
bnJlc29sdmVkIHN5bWJvbHMuDQo+ID4gPg0KPiA+ID4gVGhlIGNvbXBpbGVyIHdvdWxkIGZhaWwg
aWYgaXQgc2F3IGFueSB1bnJlc29sdmVkIHN5bWJvbCwNCj4gPiA+IHNvIHRoZSByZXBvcnRzIGZy
b20gdGhpcyBjaGVjayBhcmUgYWxsIGZhbHNlLXBvc2l0aXZlLCB0b28uDQo+ID4gPg0KPiA+ID4N
Cj4gPg0KPiA+IFRoZSBjb21waWxlciB3b24ndCBuZWNlc3NhcmlseSBmYWlsIHdoZW4gYnVpbGRp
bmcgbW9kdWxlcywgYmVjYXVzZSB0aGUgc3ltYm9sDQo+IG1pZ2h0IGJlIGluIGFub3RoZXIgbG9h
ZGFibGUgbW9kdWxlLg0KPiANCj4gUmlnaHQsIGJ1dCB0aGlzIGlzIGFscmVhZHkgY2hlY2tlZCBi
eSBtb2Rwb3N0LCBpc24ndCBpdD8NCj4gDQo+IA0KPiANCj4gPiA+DQo+ID4gPg0KPiA+ID4gWzNd
IGxpc3RfZXh0cmFfZXh0ZXJuYWxzDQo+ID4gPg0KPiA+ID4gVGhpcyB3YXJucyBzeW1ib2xzIHdp
dGggbm8gcmVmZXJlbmNlLg0KPiA+ID4NCj4gPiA+IFRoaXMgcG90ZW50aWFsbHkgY29udGFpbnMg
bG90cyBvZiBmYWxzZS1wb3NpdGl2ZXMuDQo+ID4gPiBGb3IgZXhhbXBsZSwgdGhlIGNvcmUgZnJh
bWV3b3JrIHByb3ZpZGVzIEFQSXMsIGJ1dCBpZiBhbGwgZHJpdmVycw0KPiA+ID4gYXJlIGRpc2Fi
bGVkLCB0aGVyZSBpcyBubyB1c2VyIG9mIHRob3NlIEFQSXMuDQo+ID4gPg0KPiA+DQo+ID4gV2Ug
dXNlIHRoaXMgdG8gaGVscCB2ZXJpZnkgdGhhdCBkcml2ZXIgbW9kdWxlcyBkbyBub3QgZXhwb3Nl
IHN5bWJvbHMuDQo+IA0KPiBBaCwgdGhlIG91dHB1dCBpcyBxdWl0ZSBsYXJnZSwgc28NCj4geW91
IHNlYXJjaCBmb3Igb25seSBtb2R1bGVzIGluIHlvdXIgaW50ZXJlc3QuIFJpZ2h0Pw0KPiANCg0K
V2UgcnVuIGl0IG9uIG9ubHkgb25lIG1vZHVsZSBhdCBhIHRpbWUsIHllcy4NCg0KPiANCj4gSWYg
eW91IHdhbnQgdG8gZGV0ZWN0IG1pc3NpbmcgJ3N0YXRpYycsDQo+IGhhdmUgeW91IHRyaWVkICdz
cGFyc2UnPw0KPiANCg0KV2UndmUgdXNlZCB0aGF0IGFzIHdlbGwuIA0KDQpUbyBiZSBmYWlyLCBJ
IGFncmVlIHRoYXQgaXQgY292ZXJzIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBhcyBvdGhlciB0b29s
cy4gSSBoYXZlbid0IGxvb2tlZCBkaXJlY3RseSBhdCBuYW1lc3BhY2UucGwgb3V0cHV0IGluIGEg
d2hpbGUsIGFuZCB0aGUgZml4IGhlcmUgaXMgbXVsdGlwbGUgeWVhcnMgb2xkIHRoYXQgdG9vayBh
IGxvbmcgdGltZSB0byBnZXQgcGlja2VkIHVwLg0KDQpJZiBpdCdzIGFncmVlZCB0aGF0IHRoZSB0
b29sIGhhcyBubyB2YWx1ZSwgYW5kIGVzcGVjaWFsbHkgaWYgaXQgcmVzdWx0cyBpbiBmYWxzZSBp
bmRpY2F0aW9ucyBvZiBhIHByb2JsZW0sIHRoZW4gbWF5YmUgcmVtb3ZpbmcgaXQgdG8gcHJldmVu
dCBzb21lb25lIGZyb20gbWlzLXJlYWRpbmcgaXRzIG91dHB1dCBtYWtlcyBzZW5zZT8NCg0KVGhh
bmtzLA0KSmFrZQ0KDQo+IA0KPiANCj4gPiBUaGFua3MsDQo+ID4gSmFrZQ0KPiANCj4gDQo+IA0K
PiAtLQ0KPiBCZXN0IFJlZ2FyZHMNCj4gTWFzYWhpcm8gWWFtYWRhDQo=
