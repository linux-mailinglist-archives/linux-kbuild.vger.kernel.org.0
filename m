Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A21C1946F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 20:04:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgCZTEK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 15:04:10 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:35408 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726340AbgCZTEK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 15:04:10 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02QIxSk9007134;
        Thu, 26 Mar 2020 12:03:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=fTgITLvZTBoYemsG7+Me3v7p1AJ7bXuNQFeAH9vvroU=;
 b=nCDGqninh+xNJWSgH/jW0kV3CCo9qZr3nEfllZ9Nh1aBSXyyY2UqYfEZN+g2CB7WQHIx
 9edA2ul85ZVf4kjKUUKTkBlFn1EsM65UwLQPjEzNPez85C+V5uMfzOSGjmh39HdF+yBB
 wua8zz6VuVtRqWBgdDyy2/mlGW1lqtVJNl4= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 300td72kn0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 26 Mar 2020 12:03:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 26 Mar 2020 12:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCxwKaLYKTYiZ5ddE8AAuO1U+QZsJTBUCy7aNYQtPx06x9LgfkaMmgStSV93+WfUdznETHxCwqfazQdjQlwH7sJI0r32gUaq4TFX7Zoz2WvfJcSnB9orFeyGpkcLmnVxVJ6e4sAMq4JrRTTUWGtYVcKna+yRiHkzganQvKHGX7pRuADK7SvX9IE99uI7uwnbbGhN/vyP2mnWkJzzNpL8eeachNNd/y63R6FBdwYO0T/kVV4t7xk9J0/lzisa5VF2xXE1nxaZVtpZjzUShB6jtFT5uja/Tq+l6MkmMIW1R236GciqrbSASjRFZXDaWvjTL4T1/KKdTqT5GTXogogUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTgITLvZTBoYemsG7+Me3v7p1AJ7bXuNQFeAH9vvroU=;
 b=n8cXBhwxUnrjKYMs39bdl8ewpK3QkDT7F3TiIn/nCzOoJ1K8OJZm4c1uitWLqsXEqmB23Ww6qWEpEPpsXv3htbZlROjN4vuxwjnxYRqjoHp0pOqTmLFSNTvfc/mn8ygEo6db8yEJ0r6N4prPdFffQqEmEXT1dauUL8oWG0JzJI0gTmFY1d80ZfPaFc8ow/46PZNEvIO4NvXgK1QVAgIOpga9nOeaHtYPzC2/2504XIHpDBzRIMYvro+Ykhx2Evc6/47LZl3pY0v7jOMU3nO9wnEL204CC4vM31nCDAU6sF4ixBBtn1U2yMtuyF+1fglBi6gUumrgqMxBxdO146D7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTgITLvZTBoYemsG7+Me3v7p1AJ7bXuNQFeAH9vvroU=;
 b=Qm/HpHeWXCfKrWgWk/QwwlOM2btjJW/iaxrUa7yOEF+psP5WltQ+Z7z3p4R2nXjI0ZFYb3fQjANLxLatdo0419JaGgWVR2zWy/P3gdBPTFFcBoKxw1k1gpcKrLVjaAWhYGi26SDCJJcIBLvC9+uATmj5/PrzgVxr7NQjRMy/hRM=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3868.namprd15.prod.outlook.com (2603:10b6:303:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Thu, 26 Mar
 2020 19:03:55 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 19:03:54 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Petr Malat <oss@malat.biz>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v3 3/8] lib: add zstd support to decompress
Thread-Topic: [PATCH v3 3/8] lib: add zstd support to decompress
Thread-Index: AQHWAt/m23+sZPjy5kGvzHRfaAnHI6hbFrwAgAAmGgA=
Date:   Thu, 26 Mar 2020 19:03:54 +0000
Message-ID: <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
 <20200326164732.GA17157@ntb.petris.klfree.czf>
In-Reply-To: <20200326164732.GA17157@ntb.petris.klfree.czf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [67.188.225.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9111a387-4f1f-494c-33de-08d7d1b86e3d
x-ms-traffictypediagnostic: MW3PR15MB3868:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB3868BCDCAA8C66FE97C83C21ABCF0@MW3PR15MB3868.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39860400002)(6486002)(186003)(2616005)(316002)(8676002)(36756003)(26005)(5660300002)(6916009)(54906003)(66946007)(66446008)(66556008)(4326008)(478600001)(8936002)(64756008)(66476007)(6506007)(6512007)(53546011)(33656002)(81156014)(81166006)(86362001)(71200400001)(76116006)(2906002)(966005)(7416002)(91956017)(343044003);DIR:OUT;SFP:1102;SCL:1;SRVR:MW3PR15MB3868;H:MW3PR15MB3753.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: du1w0pmHUVD7Q7wFudnKiT61KN3JcOS0Vq29wtfYVSsSeR7jnS+7nSdi2OxLIBkfQAKZ4ExYffS09X6H+H01Yrp3i7ttIGeqvFgKq8sbuG9VFY6kCgSP0NiLaqfevppzkmgqRVZDoQHghkeBsCdycOb1+WJUPZBjByZD1Sn5g2B6coRrtKzWMC3+C5N3qBy5Avzb0mHeG1diX1PaKdubieaFrqzVrTUM483ix+LfFuIgfeiS+BpkVcL+J3kMUNczIfJE7eFxMpX8UGvOobf1bB6vmw8OwUmUdAXTEtIQEGRk+lPGRGZAntpcq1nem8T72opFxmoY3PFDWpogQIMns7z/7U02sSAKCtq+mX00vl3610r7+jqr2rn9mCbL2HKzEh6AVMLy4WWVggFwBf+57Gtuv0dAFnVTAsk0/cXFIwforRfm6GhcDeJT/pHuE2wKts4TF+8j9syVkaiLNqNKKMr4J+g6G3jm9sbHcA6LILOWgZKpmUB9ErR7rBkjKRdcUX8YwPFkoHR2JuNpD/vmT46q2S7c1BDqZpSiqgh2zrkXvOKh8Fiud910tSnVNebtT4ltM05luLGZiYwOfUnoBw==
x-ms-exchange-antispam-messagedata: ij4BOZ8JsNnzz1LK8dnMQtqSWUmqz9T3Mb9KlV9Ziawf9V7OhfTXAwCCeVk1XsluT/s9Ucyam/EVUK9RlbNEP7oRI6YjlF5/qn5XOJ2FitHNitOq2O8MmJdS0+mz9LYvQurtsUevmpUfZFv9/cWOZw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5CFD1D6E92BBA48B087E0108739BEE5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9111a387-4f1f-494c-33de-08d7d1b86e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 19:03:54.8065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dz0+OltmX02JHWdGeCgc8Fa7WGPOLp7or/qHmmFgHAMwleLtPVDkLXe3frA10tHX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3868
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-26_11:2020-03-26,2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxlogscore=787
 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260142
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

PiBPbiBNYXIgMjYsIDIwMjAsIGF0IDk6NDcgQU0sIFBldHIgTWFsYXQgPG9zc0BtYWxhdC5iaXo+
IHdyb3RlOg0KPiANCj4gSGkhDQo+IE9uIFdlZCwgTWFyIDI1LCAyMDIwIGF0IDEyOjU4OjQ0UE0g
LTA3MDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+IEZyb206IE5pY2sgVGVycmVsbCA8dGVycmVs
bG5AZmIuY29tPg0KPj4gKiBBZGQgdW56c3RkKCkgYW5kIHRoZSB6c3RkIGRlY29tcHJlc3MgaW50
ZXJmYWNlLg0KPiBIZXJlIEkgZG8gbm90IHVuZGVyc3RhbmQgd2h5IHlvdSBsaW1pdCB0aGUgd2lu
ZG93IHNpemUgdG8gOE1CIGV2ZW4gd2hlbg0KPiB5b3UgcmVhZCBhIGxhcmdlciB2YWx1ZSBmcm9t
IHRoZSBoZWFkZXIuIEkgZG8gbm90IHNlZSBhIHJlYXNvbiB3aHkgdGhlcmUNCj4gc2hvdWxkIGJl
IHN1Y2ggYSBsaW1pdGF0aW9uIGF0IHRoZSBmaXJzdCBwbGFjZSBhbmQgaWYgdGhlcmUgc2hvdWxk
IGJlLA0KPiB3aHkgaXQgZGlmZmVycyBmcm9tIFpTVERfV0lORE9XTE9HX01BWC4NCg0KV2hlbiB3
ZSBhcmUgZG9pbmcgc3RyZWFtaW5nIGRlY29tcHJlc3Npb24gKGVpdGhlciBmbHVzaCBvciBmaWxs
IGlzIHByb3ZpZGVkKQ0Kd2UgaGF2ZSB0byBhbGxvY2F0ZSBtZW1vcnkgcHJvcG9ydGlvbmFsIHRv
IHRoZSB3aW5kb3cgc2l6ZS4gV2Ugd2FudCB0bw0KYm91bmQgdGhhdCBtZW1vcnkgc28gd2UgZG9u
4oCZdCBhY2NpZGVudGFsbHkgYWxsb2NhdGUgdG9vIG11Y2ggbWVtb3J5Lg0KV2hlbiB3ZSBhcmUg
ZG9pbmcgYSBzaW5nbGUtcGFzcyBkZWNvbXByZXNzaW9uIChuZWl0aGVyIGZsdXNoIG5vciBmaWxs
DQphcmUgcHJvdmlkZWQpIHRoZSB3aW5kb3cgc2l6ZSBkb2VzbuKAmXQgbWF0dGVyLCBhbmQgd2Ug
b25seSBoYXZlIHRvIGFsbG9jYXRlDQphIGZpeGVkIGFtb3VudCBvZiBtZW1vcnkgfjE5MiBLQi4N
Cg0KVGhlIHpzdGQgc3BlYyBbMF0gc3BlY2lmaWVzIHRoYXQgYWxsIGRlY29kZXJzIHNob3VsZCBh
bGxvdyB3aW5kb3cgc2l6ZXMNCnVwIHRvIDggTUIuIEFkZGl0aW9uYWxseSwgdGhlIHpzdGQgQ0xJ
IHdvbuKAmXQgcHJvZHVjZSB3aW5kb3cgc2l6ZXMgZ3JlYXRlcg0KdGhhbiA4IE1CIGJ5IGRlZmF1
bHQuIFRoZSB3aW5kb3cgc2l6ZSBpcyBjb250cm9sbGVkIGJ5IHRoZSBjb21wcmVzc2lvbg0KbGV2
ZWwsIGFuZCBjYW4gYmUgZXhwbGljaXRseSBzZXQuDQoNCkkgd291bGQgZXhwZWN0IGxhcmdlciB3
aW5kb3cgc2l6ZXMgdG8gYmUgYmVuZWZpY2lhbCBmb3IgY29tcHJlc3Npb24gcmF0aW8sDQp0aG91
Z2ggdGhlcmUgaXMgZGVtaXNpbmcgcmV0dXJucy4gSSB3b3VsZCBleHBlY3QgdGhhdCBmb3Iga2Vy
bmVsIGltYWdlDQpjb21wcmVzc2lvbiBsYXJnZXIgd2luZG93IHNpemVzIGFyZSBiZW5lZmljaWFs
LCBzaW5jZSBpdCBpcyBkZWNvbXByZXNzZWQNCndpdGggYSBzaW5nbGUgcGFzcy4gRm9yIGluaXRy
YW1mcyBkZWNvbXByZXNzaW9uLCBJIHdvdWxkIGV4cGVjdCB0aGF0IGxpbWl0aW5nDQp0aGUgd2lu
ZG93IHNpemUgY291bGQgaGVscCBkZWNvbXByZXNzaW9uIHNwZWVkLCBzaW5jZSBpdCB1c2VzIHN0
cmVhbWluZw0KY29tcHJlc3Npb24sIHNvIHVuenN0ZCgpIGhhcyB0byBhbGxvY2F0ZSBhIGJ1ZmZl
ciBvZiB3aW5kb3cgc2l6ZSBieXRlcy4NCg0KPiBJIHJlbW92ZWQgdGhhdCBsaW1pdGF0aW9uIHRv
IGJlIGFibGUgdG8gdGVzdCBpdCBpbiBteSBlbnZpcm9ubWVudCBhbmQgSQ0KPiBmb3VuZCB0aGUg
cGVyZm9ybWFuY2UgaXMgd29yc3QgdGhhbiB3aXRoIG15IHBhdGNoIGJ5IHJvdWdobHkgMjAlIChv
bg0KPiBpNy0zNTIwTSksIHdoaWNoIGlzIGEgbWFqb3IgZHJhd2JhY2sgY29uc2lkZXJpbmcgdGhl
IG1haW4gbW90aXZhdGlvbg0KPiB0byB1c2UgenN0ZCBpcyB0aGUgZGVjb21wcmVzc2lvbiBzcGVl
ZC4gSSB3aWxsIHRlc3Qgb24gYXJtIGFzIHdlbGwgYW5kDQo+IHNoYXJlIHRoZSByZXN1bHQgdG9t
b3Jyb3cuDQo+ICBQZXRyDQoNCldoYXQgZG8geW91IG1lYW4gYnkgdGhhdD8gQ2FuIHlvdSBzaGFy
ZSB3aXRoIG1lIHRoZSB0ZXN0IHlvdSByYW4/DQpJcyB0aGlzIGZvciBrZXJuZWwgZGVjb21wcmVz
c2lvbiBvciBpbml0cmFtZnMgZGVjb21wcmVzc2lvbj8NCg0KQmVzdCwNCk5pY2sNCg0KWzBdIGh0
dHBzOi8vdG9vbHMuaWV0Zi5vcmcvaHRtbC9yZmM4NDc4I3NlY3Rpb24tMy4xLjEuMS4y
