Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647E427A0D3
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Sep 2020 14:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgI0MT5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Sep 2020 08:19:57 -0400
Received: from mail-eopbgr60087.outbound.protection.outlook.com ([40.107.6.87]:47172
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726185AbgI0MT4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Sep 2020 08:19:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nls47zYFgJ6Tp5fQxIBwQ3V/cbeG2gj8+28eFssXVvJ4xP0Sm7bmiTToc2jbXWIoXFk133GlLCy5D8Rfm00PCNNdj+am/VnbFvLm3YJEKHV7Ld/RjRh+qTGOdct48Xg7UtiFgUllX/u/DgVIVC6uX9a770ZvARtEVLQnQK1sPDRY5kByJ2SoXjhUTLgovEptmE8Sk+nlfafSuysBmvrsU/v+lpWNP6Uef3Ln5fR9PxPf5GcBXKGZmwb+xjLJixrFusG+GzYQik5DPOnM2NnRJSl6AEo/vs4He/VNZ10MvF2eE3WmeiHoOB1u0DX/McV4IoUy2N5x/5LBHtttSQVugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr8kJSesjkfpd+YpP2ZfVC9YFel+8L61L4zxZKSD7sc=;
 b=DksvnhtHbPz0uKrp+GjdzoFNvv+S/78WSDMZmvrBNt2DhTfZBnSZvdgTPsITYrHvzgA39xj1sPltmZRyzloXNK2ZmJNDJYibNKkfIkQbgkqUX50qx2nvS7ag4/Z5WaG827VQaToFZyDGx0SWf313aPebcVzsVcQHJG4H7KjlHReojfJ2XQubWMyUWp0BQNxGkzmtCeKsMTSZJUH6rNGs+GVnZB+NGwDenE8PEQN3ZMjH8eB9ZgwuU7NfjBrLGKPaJKM62od4brcCYfBHs8LhxLwuKuzrvSs4aDxOySF1vAv26zVMEbFZSNS1jd5PAaSjKe9mfyJEzYh+FV9JOL/Wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr8kJSesjkfpd+YpP2ZfVC9YFel+8L61L4zxZKSD7sc=;
 b=mE0zEeegOn6S48gpzA8wC+N1b06zAcVs18VoGkci3S+0/OBtwUffAWFA1hmoP3tfBAsk5VgDzEHGOApwmi4S4PiZgARBs8GvZIF7KvbIVlheD0/7T5PPOIRP/9CeD3RVtIUj86TMO476bCVTB+8Z3fEzPxCicAEwZS4iyvjYOiE=
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR04MB3278.eurprd04.prod.outlook.com (2603:10a6:802:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Sun, 27 Sep
 2020 12:19:50 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.024; Sun, 27 Sep 2020
 12:19:50 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "rikard.falkeborn@gmail.com" <rikard.falkeborn@gmail.com>,
        "mst@redhat.co" <mst@redhat.co>, "bp@suse.de" <bp@suse.de>,
        "jhugo@codeaurora.org" <jhugo@codeaurora.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Sherry Sun <sherry.sun@nxp.com>
Subject: RE: [PATCH 1/3] mic: vop: fix a written error in MODULE_DEVICE_TABLE
Thread-Topic: [PATCH 1/3] mic: vop: fix a written error in MODULE_DEVICE_TABLE
Thread-Index: AQHWkw4aU/FELyjSmE6L34ApDqm5Eal8S9wAgAAWFWA=
Date:   Sun, 27 Sep 2020 12:19:50 +0000
Message-ID: <VI1PR04MB4960185041AEE411141583EA92340@VI1PR04MB4960.eurprd04.prod.outlook.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
 <20200925073158.8238-2-sherry.sun@nxp.com> <20200927102848.GA88650@kroah.com>
In-Reply-To: <20200927102848.GA88650@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [114.219.66.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 00f5b6fc-b858-432d-0e1a-08d862dfa1f9
x-ms-traffictypediagnostic: VI1PR04MB3278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB327869DA4182DE60E25D54ED92340@VI1PR04MB3278.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3rhRpkYZ0y+C0W1gg4of0KmTsOLL2HxTdgBcwxc2tQ6/1YMUTXHNB28ASJlBq1dYihNoe5pMxFyr6PJXix9tr7Y7OuKmlyMt2QVEjqoCJYVb3LTUotDHReJWiVu3vFipoEgNno445brFJ/v014+3zGhBYrUVUcnoaL+vsmql49EOpBA547inSXdAy+beNwErnbfjqHJIty41LXJSBKH9UkzN1/USmhN+f3EmKz0YSJ54fL7sxV2qLIRsTST8itiLXUQwnWdVF61/iwDLivZW81A4hfcT8yvEh2aIaRqhlVjuZ64JSo+I/F5z4awHlfoyd3Ls5P7xd+GraAwgzQz6/tqAPslrwtvaKXrt+MEIX0YaMWqNV2INx2NOeGep1kpc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39850400004)(136003)(376002)(86362001)(8676002)(6916009)(186003)(4326008)(2906002)(53546011)(6506007)(44832011)(55016002)(8936002)(7416002)(5660300002)(9686003)(54906003)(26005)(316002)(7696005)(76116006)(64756008)(66446008)(33656002)(66946007)(66476007)(66556008)(71200400001)(83380400001)(478600001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /uFk+1fO4n/2fZz8CfQgPi5hhXksA9nPay6ZfY0R9jVqxHrJT9WHAdIUa0b7uppWtBmRH8PN+/rL7b7Yzh6XhqxNyp1ZdqayUwZlf8kK6nElzW4Uzt7PvyNoZ0x8B+S2aw5K9x+dFs/8cwc0+QKp+FeAV8n99JkTKdv3iclq7msVGDOkQo/7v4XMO3kt80NCcYBTDSmwoGf9fR+rVvInZDDqUS3IxxoHGns5wgXo9c9UhQ60MY8yYfML9FrPe7+74OKCcn9iVaj/oqzxfE0WcDIxhFAf1oMKHwpKSQ6hkmMZVmvtynBxXxI+TmZryaHYKFtXNL52XSGkzI8PqnTPWGISoFreuH5gTPvWidSjHVVgGaG1IihkXbQfUCI45xcXKf/t1vWi7ElqFvLZqj8uas3XQUDZv8Q788zZStsISLFKIYL+SWn1LF9O8vkEHNtJ4e/fpmrb0vguTmc2yTChe6SfzUIhAvc0I312bMuuB1huf7Qsm05Hagd5PyboNxOXK2SyZ1fzfRfnz47K92B37/+LZTYLMwpGaSFswCy+RJBw0BUAdrlc96aHnl57FmKDFvj60PO6JL+4Mu6juOPTwHa+ua3zwp6BJHBogBtqcESZ0F2VBBfbet4OP8IpKxJI/hYGpMEZyc1r560M0JHTJA==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f5b6fc-b858-432d-0e1a-08d862dfa1f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 12:19:50.5759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHYLQeUs6/AOlO2I0dqD3fPv0FrJILSGtZk2FjzRBh/MLss5fFz3Jye2ACY/PKBkkWMb/uR6qJBHm6/F+DfNbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3278
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SGkgR3JlZywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtI
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogMjAyMMTqOdTCMjfI1SAxODoy
OQ0KPiBUbzogU2hlcnJ5IFN1biA8c2hlcnJ5LnN1bkBueHAuY29tPg0KPiBDYzogc3VkZWVwLmR1
dHRAaW50ZWwuY29tOyBhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb207IGFybmRAYXJuZGIuZGU7DQo+
IG1hc2FoaXJveUBrZXJuZWwub3JnOyBtaWNoYWwubGttbEBtYXJrb3ZpLm5ldDsgbGVlLmpvbmVz
QGxpbmFyby5vcmc7DQo+IHJpa2FyZC5mYWxrZWJvcm5AZ21haWwuY29tOyBtc3RAcmVkaGF0LmNv
OyBicEBzdXNlLmRlOw0KPiBqaHVnb0Bjb2RlYXVyb3JhLm9yZzsgdGdseEBsaW51dHJvbml4LmRl
Ow0KPiBtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZzsgbWdyb3NzQGxpbnV4LmludGVs
LmNvbTsgcGllcnJlLQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtidWlsZEB2Z2VyLmtlcm5lbC5vcmc7IGRs
LWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8z
XSBtaWM6IHZvcDogZml4IGEgd3JpdHRlbiBlcnJvciBpbg0KPiBNT0RVTEVfREVWSUNFX1RBQkxF
DQo+IA0KPiBPbiBGcmksIFNlcCAyNSwgMjAyMCBhdCAwMzozMTo1NlBNICswODAwLCBTaGVycnkg
U3VuIHdyb3RlOg0KPiA+IEZvciB2b3AgYnVzLCB0aGUgZmlyc3QgcGFyYW1ldGVyIHNob3VsZCBi
ZSB2b3AgaW4gTU9EVUxFX0RFVklDRV9UQUJMRS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNo
ZXJyeSBTdW4gPHNoZXJyeS5zdW5AbnhwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0g
WmhhbmcgPHFpYW5ncWluZy56aGFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21p
c2MvbWljL3ZvcC92b3BfbWFpbi5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21p
c2MvbWljL3ZvcC92b3BfbWFpbi5jDQo+ID4gYi9kcml2ZXJzL21pc2MvbWljL3ZvcC92b3BfbWFp
bi5jIGluZGV4IGQ2MDlmMGRjNjEyNC4uNTg5NDI1ZmE3OGQ0DQo+ID4gMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9taXNjL21pYy92b3Avdm9wX21haW4uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWlz
Yy9taWMvdm9wL3ZvcF9tYWluLmMNCj4gPiBAQCAtNzk2LDcgKzc5Niw3IEBAIHN0YXRpYyBzdHJ1
Y3Qgdm9wX2RyaXZlciB2b3BfZHJpdmVyID0gew0KPiA+DQo+ID4gIG1vZHVsZV92b3BfZHJpdmVy
KHZvcF9kcml2ZXIpOw0KPiA+DQo+ID4gLU1PRFVMRV9ERVZJQ0VfVEFCTEUobWJ1cywgaWRfdGFi
bGUpOw0KPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKHZvcCwgaWRfdGFibGUpOw0KPiA+ICBNT0RV
TEVfQVVUSE9SKCJJbnRlbCBDb3Jwb3JhdGlvbiIpOw0KPiA+ICBNT0RVTEVfREVTQ1JJUFRJT04o
IkludGVsKFIpIFZpcnRpbyBPdmVyIFBDSWUgKFZPUCkgZHJpdmVyIik7DQo+ID4gTU9EVUxFX0xJ
Q0VOU0UoIkdQTCB2MiIpOw0KPiANCj4gRG9lc24ndCB0aGlzIGhhdmUgdG8gZ28gX2FmdGVyXyB0
aGUgTU9EVUxFX0RFVklDRV9UQUJMRSh2b3AuLi4pIHN1cHBvcnQsDQo+IHdoaWNoIHlvdSBhZGQg
aW4gcGF0Y2ggMiBvZiB0aGlzIHNlcmllcz8NCg0KWWVzLCB0aGlzIHBhdGNoIG11c3QgYmUgdXNl
ZCBpbiBjb25qdW5jdGlvbiB3aXRoIFBhdGNoMi4NCkJ1dCBJIHRoaW5rIGhlcmUgbWF5IGJlIGEg
c21hbGwgYnVnLCBpbiBvcmRlciB0byBkaXN0aW5ndWlzaCBpdCBmcm9tIHRoZSBkcml2ZXINCmF1
dG9sb2FkaW5nIHN1cHBvcnQsIG1ha2UgdGhpcyBhIHNlcGFyYXRlIHBhdGNoLg0KDQpJIGNhbiBw
dXQgdGhpcyBwYXRjaCB0b2dldGhlciB3aXRoIFBhdGNoMiBpZiB5b3UgdGhpbmsgaXQgbWlnaHQg
bG9vayBtb3JlIHJlYXNvbmFibGUuDQoNCj4gDQo+IERvZXMgdGhpcyBwYXRjaCBoZXJlIGJyZWFr
IHRoZSBidWlsZD8gIElmIG5vdCwgaG93IGlzIGl0IHdvcmtpbmc/DQo+IA0KPiBBbmQgaWYgeW91
IG9ubHkgaGF2ZSBvbmUgdm9wIGRyaXZlciwgd2h5IGRvIHlvdSBuZWVkIGF1dG9sb2FkaW5nIGZv
ciBpdD8NCj4gDQpObywgaXQgZG9lc24ndCBicmVhayB0aGUgYnVpbGQuIEJ1dCBhY3R1YWxseSBp
dCB3b24ndCB3b3JrKGF1dG9sb2FkZWQpIHdoZW4ga2VybmVsIGJvb3QgYW5kIHZvcCBkZXZpY2Ug
YXBwZWFycy4NCg0KQWx0aG91Z2ggd2UgbWF5IG9ubHkgaGF2ZSBvbmUgdm9wIGRyaXZlciwgYnV0
IGluIHRoZSBtaWMgS2NvbmZpZywgdGhlIGludGVsIG1pYy92b3AvY29zbS9zY2lmIGRyaXZlcnMg
YWxsDQpyZWNvbW1lbmRlZCB0byBiZSBidWlsdCBhcyBtb2R1bGVzLCBpZiB3ZSBkb24ndCBhZGQg
YXV0b2xvYWRpbmcgZm9yIHRoZW0sIHdlIG1heSBuZWVkIG1vZHByb2JlIHRoZW0NCm9uZSBieSBv
bmUgbWFudWFsbHkgYm90aCBvbiBFUCBhbmQgUkMgc2lkZS4NCg0KT2J2aW91c2x5LCBmb3Igb3Vy
IHVzZSBjYXNlLCBkcml2ZXIgYXV0b2xvYWRpbmcgaXMgbW9yZSBjb252ZW5pZW50Lg0KDQpCZXN0
IHJlZ2FyZHMNClNoZXJyeQ0KDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQo=
