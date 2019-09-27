Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1D8C0E53
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2019 01:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfI0Xaz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 19:30:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:24604 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbfI0Xaz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 19:30:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Sep 2019 16:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,557,1559545200"; 
   d="scan'208";a="180675357"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
  by orsmga007.jf.intel.com with ESMTP; 27 Sep 2019 16:30:55 -0700
Received: from orsmsx124.amr.corp.intel.com (10.22.240.120) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 27 Sep 2019 16:30:54 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.190]) by
 ORSMSX124.amr.corp.intel.com ([169.254.2.164]) with mapi id 14.03.0439.000;
 Fri, 27 Sep 2019 16:30:54 -0700
From:   "Keller, Jacob E" <jacob.e.keller@intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
CC:     "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: RE: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Topic: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Index: AQHVdYkISHS3XNGT0kCKyhZHN6EY9KdALBNA
Date:   Fri, 27 Sep 2019 23:30:54 +0000
Message-ID: <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
In-Reply-To: <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODE0ZDVjODgtYjQ4Yi00OTg5LTgyYTQtMTQ5NGI4MzFlNzhmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicExlNWJQK3Rmb0xrMDlYSkoycForT2lFdVlicDZzVnlaQ1M3QmpyeURzTXVjNE9MTld5Z3NvQ0VvM2ZMSlwvUEEifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYW5keSBEdW5sYXAgW21haWx0
bzpyZHVubGFwQGluZnJhZGVhZC5vcmddDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI3LCAy
MDE5IDQ6MTIgUE0NCj4gVG86IEtlbGxlciwgSmFjb2IgRSA8amFjb2IuZS5rZWxsZXJAaW50ZWwu
Y29tPg0KPiBDYzogaW50ZWwtd2lyZWQtbGFuQGxpc3RzLm9zdW9zbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtidWlsZCA8bGludXgtDQo+IGtidWlsZEB2Z2VyLmtl
cm5lbC5vcmc+OyBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBuYW1lc3BhY2U6IGZpeCBuYW1lc3BhY2UucGwgc2Ny
aXB0IHRvIHN1cHBvcnQgcmVsYXRpdmUgcGF0aHMNCj4gDQo+IA0KPiByZTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDE5MDEyOTIwNDMxOS4xNTIzOC0xLWphY29iLmUua2VsbGVyQGlu
dGVsLmNvbS8NCj4gDQo+IERpZCBhbnl0aGluZyBoYXBwZW4gd2l0aCB0aGlzIHBhdGNoPw0KPiAN
Cj4gUGxlYXNlIHNlbmQgaXQgdG8gbGludXgta2J1aWxkQHZnZXIua2VybmVsLm9yZyBhbmQNCj4g
Q2M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+DQo+IA0K
PiBZb3UgY2FuIGFsc28gYWRkOg0KPiBBY2tlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+DQo+IFRlc3RlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVh
ZC5vcmc+DQo+IA0KPiANCj4gSSB3YXMganVzdCBhYm91dCB0byBmaXggdGhpcyBzY3JpcHQgYnV0
IEkgZGVjaWRlZCB0byBmaXJzdCBzZWUgaWYgYW55b25lIGVsc2UNCj4gaGFkIGFscmVhZHkgZG9u
ZSBzby4gIFRoYW5rcy4NCj4gDQo+IC0tDQo+IH5SYW5keQ0KDQpEb25lLCB0aGFua3MuDQoNClJl
Z2FyZHMsDQpKYWtlDQo=
