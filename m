Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25A8DE5508
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2019 22:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfJYUUy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Oct 2019 16:20:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:18009 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfJYUUy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 16:20:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 13:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,229,1569308400"; 
   d="scan'208";a="400221917"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2019 13:20:53 -0700
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 25 Oct 2019 13:20:52 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.88]) by
 ORSMSX116.amr.corp.intel.com ([169.254.7.79]) with mapi id 14.03.0439.000;
 Fri, 25 Oct 2019 13:20:52 -0700
From:   "Keller, Jacob E" <jacob.e.keller@intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: RE: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Topic: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Index: AQHVdYkISHS3XNGT0kCKyhZHN6EY9KdALBNAgAIVm4CAAmLQsIAjqUEAgACZz9CAALWTgIACLwmwgACTTID//5iEgA==
Date:   Fri, 25 Oct 2019 20:20:51 +0000
Message-ID: <02874ECE860811409154E81DA85FBB589693DABC@ORSMSX121.amr.corp.intel.com>
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
 <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com>
 <02874ECE860811409154E81DA85FBB58968E1402@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARAhZtzdnS9+mgtamj=pLdV81dudnYVDa8NRxcQPpF0bw@mail.gmail.com>
 <02874ECE860811409154E81DA85FBB589693A38A@ORSMSX121.amr.corp.intel.com>
 <CAK7LNAQow8N9a5e_=pu7qDiuvETy1x1P5fxp20zYOZgQhXPJhg@mail.gmail.com>
 <02874ECE860811409154E81DA85FBB589693D053@ORSMSX121.amr.corp.intel.com>
 <6127ec91-ad81-f0d7-576e-22e06e677442@infradead.org>
In-Reply-To: <6127ec91-ad81-f0d7-576e-22e06e677442@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWU4ZmM3ODctNGY1Mi00MTM4LTljMjktNzE1ZDg0ZWE5Y2Y1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiajNuSXhreW1PSlhYaUxBcmh1M1JGQ0lwVEJuSzZWZXV5RUg1cUs0OER1bndVRXJsWVp1K1lWcFlCdGJkWGdBdiJ9
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDI1LCAyMDE5IDEyOjMw
IFBNDQo+IFRvOiBLZWxsZXIsIEphY29iIEUgPGphY29iLmUua2VsbGVyQGludGVsLmNvbT47IE1h
c2FoaXJvIFlhbWFkYQ0KPiA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQo+IENjOiBp
bnRlbC13aXJlZC1sYW5AbGlzdHMub3N1b3NsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgbGludXgta2J1aWxkDQo+IDxsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBuYW1lc3BhY2U6IGZpeCBuYW1lc3BhY2UucGwgc2NyaXB0IHRv
IHN1cHBvcnQgcmVsYXRpdmUNCj4gcGF0aHMNCj4gDQo+IE9uIDEwLzI1LzE5IDEwOjQ1IEFNLCBL
ZWxsZXIsIEphY29iIEUgd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0
LmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIzLCAyMDE5IDY6MjIgUE0NCj4g
Pj4gVG86IEtlbGxlciwgSmFjb2IgRSA8amFjb2IuZS5rZWxsZXJAaW50ZWwuY29tPg0KPiA+PiBD
YzogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+OyBpbnRlbC13aXJlZC1sYW5A
bGlzdHMub3N1b3NsLm9yZzsNCj4gPj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2J1aWxkIDxsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnPg0KPiA+PiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBuYW1lc3BhY2U6IGZpeCBuYW1lc3BhY2UucGwgc2NyaXB0IHRvIHN1cHBvcnQg
cmVsYXRpdmUNCj4gPj4gcGF0aHMNCj4gPj4NCj4gPj4gSWYgeW91IHdhbnQgdG8gZGV0ZWN0IG1p
c3NpbmcgJ3N0YXRpYycsDQo+ID4+IGhhdmUgeW91IHRyaWVkICdzcGFyc2UnPw0KPiA+Pg0KPiA+
DQo+ID4gV2UndmUgdXNlZCB0aGF0IGFzIHdlbGwuDQo+ID4NCj4gPiBUbyBiZSBmYWlyLCBJIGFn
cmVlIHRoYXQgaXQgY292ZXJzIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBhcyBvdGhlciB0b29scy4g
SSBoYXZlbid0DQo+IGxvb2tlZCBkaXJlY3RseSBhdCBuYW1lc3BhY2UucGwgb3V0cHV0IGluIGEg
d2hpbGUsIGFuZCB0aGUgZml4IGhlcmUgaXMgbXVsdGlwbGUNCj4geWVhcnMgb2xkIHRoYXQgdG9v
ayBhIGxvbmcgdGltZSB0byBnZXQgcGlja2VkIHVwLg0KPiA+DQo+ID4gSWYgaXQncyBhZ3JlZWQg
dGhhdCB0aGUgdG9vbCBoYXMgbm8gdmFsdWUsIGFuZCBlc3BlY2lhbGx5IGlmIGl0IHJlc3VsdHMg
aW4gZmFsc2UNCj4gaW5kaWNhdGlvbnMgb2YgYSBwcm9ibGVtLCB0aGVuIG1heWJlIHJlbW92aW5n
IGl0IHRvIHByZXZlbnQgc29tZW9uZSBmcm9tIG1pcy0NCj4gcmVhZGluZyBpdHMgb3V0cHV0IG1h
a2VzIHNlbnNlPw0KPiANCj4gSWYgdGhlcmUgaXMgYSBzYXRpc2ZhY3RvcnkgYWx0ZXJuYXRpdmUs
IEkgZXhwZWN0IHRoYXQgbmFtZXNwYWNlLnBsIGlzIG9sZCwNCj4gdW5tYWludGFpbmVkLCBhbmQg
dW5uZWVkZWQsIGFuZCBzaG91bGQgZ28gYXdheS4NCj4gDQo+IC0tDQo+IH5SYW5keQ0KDQpHaXZl
biBZYW1hZGEncyBjb21tZW50cyBhbmQgbXkgZXhwZXJpZW5jZSwgbW9kcG9zdCBhbmQgc3BhcnNl
IGFyZSBib3RoIGdvb2QgYXQgZGV0ZWN0aW5nIHRoZSBpc3N1ZXMgdGhhdCBuYW1lc3BhY2UucGwg
aGFuZGxlcy4NCg0KSSBhbSBub3Qgc3VyZSBpZiB0aGVyZSdzIGFueSBvdGhlciBvdXRwdXQgdGhh
dCB3b3VsZCBiZSB2YWx1YWJsZSBmcm9tIG5hbWVzcGFjZS5wbCwgYnV0IGlmIG5vdC4uIEkgZG9u
J3Qgc2VlIGEgcmVhc29uIHRvIGtlZXAgaXQgY29tcGFyZWQgdG8gdGhlIG90aGVyIHRvb2xzLg0K
DQpUaGFua3MsDQpKYWtlDQo=
