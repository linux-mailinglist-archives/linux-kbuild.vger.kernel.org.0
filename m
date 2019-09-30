Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E60C2735
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2019 22:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbfI3UtZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Sep 2019 16:49:25 -0400
Received: from mga05.intel.com ([192.55.52.43]:52671 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731071AbfI3UtZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Sep 2019 16:49:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Sep 2019 12:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,568,1559545200"; 
   d="scan'208";a="390945133"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
  by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2019 12:46:53 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.190]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.5]) with mapi id 14.03.0439.000;
 Mon, 30 Sep 2019 12:46:53 -0700
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
Thread-Index: AQHVdYkISHS3XNGT0kCKyhZHN6EY9KdALBNAgAIVm4CAAmLQsA==
Date:   Mon, 30 Sep 2019 19:46:52 +0000
Message-ID: <02874ECE860811409154E81DA85FBB58968E1402@ORSMSX121.amr.corp.intel.com>
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
 <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com>
In-Reply-To: <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTc4YzZmZTMtY2JlMi00YTI0LTg1ZTUtNTE5N2VjYTBkYTU1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNHJQcTI5eXdvXC9oa0J6MUFsYzNpQkpsZ0l0UFRBa3o2cGxMWkRjMHo2RmEweGZranYxRVBrUUFCMnErNjBTUUkifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXNhaGlybyBZYW1hZGEgW21h
aWx0bzp5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbV0NCj4gU2VudDogU2F0dXJkYXksIFNl
cHRlbWJlciAyOCwgMjAxOSA1OjIxIFBNDQo+IFRvOiBLZWxsZXIsIEphY29iIEUgPGphY29iLmUu
a2VsbGVyQGludGVsLmNvbT4NCj4gQ2M6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQu
b3JnPjsgaW50ZWwtd2lyZWQtbGFuQGxpc3RzLm9zdW9zbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rYnVpbGQgPGxpbnV4LWtidWlsZEB2Z2VyLmtlcm5lbC5v
cmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG5hbWVzcGFjZTogZml4IG5hbWVzcGFjZS5wbCBz
Y3JpcHQgdG8gc3VwcG9ydCByZWxhdGl2ZSBwYXRocw0KPiANCj4gT24gU2F0LCBTZXAgMjgsIDIw
MTkgYXQgODozMCBBTSBLZWxsZXIsIEphY29iIEUNCj4gPGphY29iLmUua2VsbGVyQGludGVsLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBSYW5keSBEdW5sYXAgW21haWx0bzpyZHVubGFwQGluZnJhZGVhZC5vcmddDQo+ID4gPiBT
ZW50OiBGcmlkYXksIFNlcHRlbWJlciAyNywgMjAxOSA0OjEyIFBNDQo+ID4gPiBUbzogS2VsbGVy
LCBKYWNvYiBFIDxqYWNvYi5lLmtlbGxlckBpbnRlbC5jb20+DQo+ID4gPiBDYzogaW50ZWwtd2ly
ZWQtbGFuQGxpc3RzLm9zdW9zbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWtidWlsZA0KPiA8bGludXgtDQo+ID4gPiBrYnVpbGRAdmdlci5rZXJuZWwub3JnPjsgTWFz
YWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4NCj4gPiA+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIG5hbWVzcGFjZTogZml4IG5hbWVzcGFjZS5wbCBzY3JpcHQgdG8gc3Vw
cG9ydCByZWxhdGl2ZSBwYXRocw0KPiA+ID4NCj4gPiA+DQo+ID4gPiByZTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDE5MDEyOTIwNDMxOS4xNTIzOC0xLQ0KPiBqYWNvYi5lLmtlbGxl
ckBpbnRlbC5jb20vDQo+ID4gPg0KPiA+ID4gRGlkIGFueXRoaW5nIGhhcHBlbiB3aXRoIHRoaXMg
cGF0Y2g/DQo+ID4gPg0KPiA+ID4gUGxlYXNlIHNlbmQgaXQgdG8gbGludXgta2J1aWxkQHZnZXIu
a2VybmVsLm9yZyBhbmQNCj4gPiA+IENjOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGly
b0Bzb2Npb25leHQuY29tPg0KPiA+ID4NCj4gPiA+IFlvdSBjYW4gYWxzbyBhZGQ6DQo+ID4gPiBB
Y2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+ID4gPiBUZXN0
ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiA+ID4NCj4gPiA+
DQo+ID4gPiBJIHdhcyBqdXN0IGFib3V0IHRvIGZpeCB0aGlzIHNjcmlwdCBidXQgSSBkZWNpZGVk
IHRvIGZpcnN0IHNlZSBpZiBhbnlvbmUgZWxzZQ0KPiA+ID4gaGFkIGFscmVhZHkgZG9uZSBzby4g
IFRoYW5rcy4NCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gflJhbmR5DQo+ID4NCj4gPiBEb25lLCB0
aGFua3MuDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IEpha2UNCj4gDQo+IA0KPiBBcHBsaWVkIHRv
IGxpbnV4L2tidWlsZC4gVGhhbmtzLg0KPiANCg0KR3JlYXQsIHRoYW5rcyENCg0KPiAtLQ0KPiBC
ZXN0IFJlZ2FyZHMNCj4gTWFzYWhpcm8gWWFtYWRhDQo=
