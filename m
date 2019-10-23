Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D035FE2569
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2019 23:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405743AbfJWVeI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Oct 2019 17:34:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:8888 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405467AbfJWVeH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 17:34:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 14:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; 
   d="scan'208";a="281741938"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by orsmga001.jf.intel.com with ESMTP; 23 Oct 2019 14:34:07 -0700
Received: from orsmsx121.amr.corp.intel.com ([169.254.10.88]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.210]) with mapi id 14.03.0439.000;
 Wed, 23 Oct 2019 14:34:07 -0700
From:   "Keller, Jacob E" <jacob.e.keller@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Randy Dunlap <rdunlap@infradead.org>
CC:     "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: RE: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Topic: [PATCH] namespace: fix namespace.pl script to support relative
 paths
Thread-Index: AQHVdYkISHS3XNGT0kCKyhZHN6EY9KdALBNAgAIVm4CAAmLQsIAjqUEAgACZz9A=
Date:   Wed, 23 Oct 2019 21:34:06 +0000
Message-ID: <02874ECE860811409154E81DA85FBB589693A38A@ORSMSX121.amr.corp.intel.com>
References: <20190129204319.15238-1-jacob.e.keller@intel.com>
 <7b26e6cc-10ce-5df2-6375-1f95bc4da04e@infradead.org>
 <02874ECE860811409154E81DA85FBB58968DBE54@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARyUEakeG_N9TWcO2cjFSzbgY__k_QJm6C+oOz+fW0aeg@mail.gmail.com>
 <02874ECE860811409154E81DA85FBB58968E1402@ORSMSX121.amr.corp.intel.com>
 <CAK7LNARAhZtzdnS9+mgtamj=pLdV81dudnYVDa8NRxcQPpF0bw@mail.gmail.com>
In-Reply-To: <CAK7LNARAhZtzdnS9+mgtamj=pLdV81dudnYVDa8NRxcQPpF0bw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDM0NzM2NjAtY2FkYi00M2RlLWJkMjAtMDRlNjYzZWEwNjVmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSml3YTNpVGVEakpDSEJyakU2ZFhyaTBMc1F5ZHBmdWYyamJyKzZEWUYxYnRRXC9GOHlINVlWS0poeHQ5TE41aUEifQ==
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXNhaGlybyBZYW1hZGEgPHlh
bWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDIy
LCAyMDE5IDEwOjIyIFBNDQo+IFRvOiBLZWxsZXIsIEphY29iIEUgPGphY29iLmUua2VsbGVyQGlu
dGVsLmNvbT47IFJhbmR5IER1bmxhcA0KPiA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiBDYzog
aW50ZWwtd2lyZWQtbGFuQGxpc3RzLm9zdW9zbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtidWlsZA0KPiA8bGludXgta2J1aWxkQHZnZXIua2VybmVsLm9yZz4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gbmFtZXNwYWNlOiBmaXggbmFtZXNwYWNlLnBsIHNjcmlwdCB0
byBzdXBwb3J0IHJlbGF0aXZlDQo+IHBhdGhzDQo+IA0KPiBUaGlzIHNjcmlwdHMgaGFzIGJlZW4g
NS15ZWFyIGJyb2tlbiwNCj4gYW5kIEkgZGlkIG5vdCBzZWUgYW55IGNvbXBsYWludCBleGNlcHQg
ZnJvbSB5b3UuDQo+IFNvLCBJIHdvbmRlciBob3cgbWFueSBwZW9wbGUgYXJlIHVzaW5nIHRoaXMu
DQo+IA0KPiBOb3IsIGRvIEkgdW5kZXJzdGFuZCBob3cgdG8gdXNlIGl0Lg0KPiANCj4gQ291bGQg
eW91IHRlYWNoIG1lIGEgYml0IG1vcmUgYWJvdXQgdGhpcyBzY3JpcHQ/DQo+IA0KPiANCj4gDQo+
IFNvbWV0aGluZyBtaWdodCBiZSBtaXNzaW5nIGluIG15IG1pbmQsIGJ1dA0KPiBJIGRvIG5vdCBr
bm93IGhvdyB0byB1c2UgdGhpcyBzY3JpcHQgaW4gYSB1c2VmdWwgd2F5Lg0KPiANCj4gDQo+IA0K
PiBJdCBwcm92aWRlcyB0aHJlZSBjaGVja3MuDQo+IA0KPiBbMV0gbGlzdF9tdWx0aXBseV9kZWZp
bmVkKCkNCj4gDQo+IFRoaXMgd2FybnMgbXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBmdW5jdGlvbnMu
DQo+IA0KPiBUaGUgY29tcGlsZXIgd291bGQgZmFpbCBpZiBpdCBzYXcgYW55IG11bHRpcGxlIGRl
ZmluaXRpb24sDQo+IHNvIHRoZSByZXBvcnRzIGZyb20gdGhpcyBjaGVjayBhcmUgYWxsIGZhbHNl
LXBvc2l0aXZlLg0KPiANCj4gDQo+IFsyXSByZXNvbHZlX2V4dGVybmFsX3JlZmVyZW5jZXMoKQ0K
PiANCj4gVGhpcyB3YXJucyB1bnJlc29sdmVkIHN5bWJvbHMuDQo+IA0KPiBUaGUgY29tcGlsZXIg
d291bGQgZmFpbCBpZiBpdCBzYXcgYW55IHVucmVzb2x2ZWQgc3ltYm9sLA0KPiBzbyB0aGUgcmVw
b3J0cyBmcm9tIHRoaXMgY2hlY2sgYXJlIGFsbCBmYWxzZS1wb3NpdGl2ZSwgdG9vLg0KPiANCj4g
DQoNClRoZSBjb21waWxlciB3b24ndCBuZWNlc3NhcmlseSBmYWlsIHdoZW4gYnVpbGRpbmcgbW9k
dWxlcywgYmVjYXVzZSB0aGUgc3ltYm9sIG1pZ2h0IGJlIGluIGFub3RoZXIgbG9hZGFibGUgbW9k
dWxlLg0KDQo+IA0KPiANCj4gWzNdIGxpc3RfZXh0cmFfZXh0ZXJuYWxzDQo+IA0KPiBUaGlzIHdh
cm5zIHN5bWJvbHMgd2l0aCBubyByZWZlcmVuY2UuDQo+IA0KPiBUaGlzIHBvdGVudGlhbGx5IGNv
bnRhaW5zIGxvdHMgb2YgZmFsc2UtcG9zaXRpdmVzLg0KPiBGb3IgZXhhbXBsZSwgdGhlIGNvcmUg
ZnJhbWV3b3JrIHByb3ZpZGVzIEFQSXMsIGJ1dCBpZiBhbGwgZHJpdmVycw0KPiBhcmUgZGlzYWJs
ZWQsIHRoZXJlIGlzIG5vIHVzZXIgb2YgdGhvc2UgQVBJcy4NCj4gDQoNCldlIHVzZSB0aGlzIHRv
IGhlbHAgdmVyaWZ5IHRoYXQgZHJpdmVyIG1vZHVsZXMgZG8gbm90IGV4cG9zZSBzeW1ib2xzLg0K
DQpUaGFua3MsDQpKYWtlDQo=
