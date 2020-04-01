Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094CD19A3AF
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 04:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731554AbgDACwc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 22:52:32 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:53920 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731531AbgDACwb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 22:52:31 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0312mgNG019414;
        Tue, 31 Mar 2020 19:52:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=7srY/tkQ8MjFr7QRMk08/e45fYePFCeBn86qLeX4h6A=;
 b=IBefbRWh2wglrTwwFt2qSbugpczDUHTF9vntu2eOWIFiZNFyhxrMEd/zjUNkx0+Igi/z
 KcXDaRip8B3y4eR+kHITKYMmulLqpqj6DutSVb1dXptrkoYJTsLmqmw4Z7COCpOsHlre
 MCf08C5jhY6VuH2uDyQD3j+BPNx9pJdwYJE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 304cxbhcga-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 31 Mar 2020 19:52:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 19:52:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOCSlRq55jE7tLf9XwqQKING2VjwJ/d9N9gwws8bUqVtzNFtEQ7FHpCGA9HZds0GXseiid1E4zCRVHUGuRryNC9fcyOX9s5rG38+WhT8W2lNamr7qPD9aMu9F3DM1SDTjKdABB1dkYai2Ht1oEZA1DjPCW541TPZwCi4cv55jjjtRHJJst6u79ttTElzeCzUfmlQvNCEFPT8wUfbKOGcjtbgaC0m2MKrUuks+s7klBSUWdmZIMRpv67dwmmucARTQwxGBg3XBcOo4kIA2WUesTLWp0pSRLLJHKCXc7C2qpnq6XrCnBNi/QpWygthrF91wy/N7EC7ocY0Xl4BJKbyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7srY/tkQ8MjFr7QRMk08/e45fYePFCeBn86qLeX4h6A=;
 b=cN/sMGOCLQ1rZKRbmK/UYjMqNUf4AdipHAlJvkT9+8Ocz9JoRMukrQ3QSS4ocVI/iuiGFeYOR+NP6xgBi+7K1QXlFtQgW6WrCzUriyuqvKe2IjN1xqCOI920BoFwCplHtjQftTz+FUXOP5odIBKM5TdbkNfgOK/3/1kHGWKlmVGfVn1LeNjn/92Xz3P/MAbeWlGV8OnraGniW5OJ9zm6pBmr4bBwh8MhXo2Yc1WZNmbKyMgrNAoaiSof9uUQZyX2uUO2qpb5L7yjUkRBjCMKtRnumGiNMil5JxuiZySRZ74RkkbcFoA3fPjPQcVd6LLqvQtrL1ecwJCnRWlL51OSDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7srY/tkQ8MjFr7QRMk08/e45fYePFCeBn86qLeX4h6A=;
 b=WF6bf7U70FhGJlEL7iYhZ2tj+/kutlYbuzZsEbwrFySWDuJU3hh7/eEJhDqS+mU2SC2F9s0HfW+TkuxgUqigPiWo5AnwyuHaacC6ZrSz4Gaoh3dFRToTEW43dmeiaaidBHe+rek77gCi28D4MLM9NAKiLNtxLqe7BJ9RdVrj5OU=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3996.namprd15.prod.outlook.com (2603:10b6:303:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Wed, 1 Apr
 2020 02:52:07 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 02:52:07 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     "sedat.dilek@gmail.com" <sedat.dilek@gmail.com>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        "Michael van der Westhuizen" <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        "Patrick Williams" <patrick@stwcx.xyz>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Thread-Topic: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Thread-Index: AQHWBeEQDgWL3aTsC0eAZqS0g1IF3qhiGjEAgAC3YoCAAMO5AA==
Date:   Wed, 1 Apr 2020 02:52:06 +0000
Message-ID: <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com>
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
 <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
In-Reply-To: <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:365f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bafdd016-ac60-420d-1159-08d7d5e7aa87
x-ms-traffictypediagnostic: MW3PR15MB3996:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB3996E8760A517EDFDCCB387BABC90@MW3PR15MB3996.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3753.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(346002)(136003)(376002)(366004)(39860400002)(186003)(6512007)(6486002)(66476007)(76116006)(6916009)(966005)(36756003)(2906002)(64756008)(478600001)(54906003)(8676002)(316002)(66946007)(7416002)(66446008)(66556008)(4326008)(86362001)(2616005)(81166006)(71200400001)(81156014)(8936002)(5660300002)(6506007)(53546011)(33656002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FoCToDfgan86RgT9qWM9j5SHb2WUAQZ5TlbziLdRPKXQH4VCMSXZQhbGZEjZxg8sVI7Hvzr8vSYRm3ybECU3KM0dhX6NfNFQAZLOUvOAdhUBN8J2ZGcwCsbjAmivMQHY63W67x4FSe3gxCmeOgkvY+zwYP6Dw1kG0a2Q6Y5ZAKd2+fEk/viAp7CzARDipjZ1dYQFCC4KYN7nLanf66GJvmNrnXvsCGEuVS/fc3wKt5ONf7u7TqHQceZFuGejvPXHsrL4bzBUqHYo90F6IiGu3BB2AD4J59DqiPTRB+09RAvnKRx6g4sl8CSi2ucDd7UcdJJ071PPtxzRCGqKLIGzsLTzqZ+OUNZfpi0Fkovu2mvnjQgaKwXMNhAWhi2AL1tgPdEVME65PunCqlCp7RdI+w5+JQVqxp3LH7kCIxOX32EZ0ua6SNu2jUBVWTH376KEA+TnkPSmlrqNQ3IdwI1Faf87zkJdUzKKwC6xOzH5ZjMGr8Lxg66X7hzB/R5kn+orgkpIYJQ5Ec2skn1ppOtfw==
x-ms-exchange-antispam-messagedata: 8qz1j/v/ycCnx4L2ucLvVVDvMbTg0YXzNXK1SjhZ3L2PFEgKW1SXDzN3cU7/K8BEtnqEfaGygCiEvL7TtvDbGXlK2RTDbZCQ+CvRDvTWyu0rDgIivUsgclQDx5S4doXRA1GZZq+HP+QQ7FG7d8snM/7FuuzdtH8olFb2gYoxHVR0GZzmETlLRtrxI1AWW47f
Content-Type: text/plain; charset="utf-8"
Content-ID: <C512C6B60894E04E9D4F60AD0759CAC0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bafdd016-ac60-420d-1159-08d7d5e7aa87
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 02:52:06.9572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYCR+mrJvhkz60tj+uxdcmdKqNSSPjwiFgP+Qb7AsPMDjeU7FCoaPsbSVZGzdKOu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3996
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-03-31_07:2020-03-31,2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010025
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gTWFyIDMxLCAyMDIwLCBhdCA4OjExIEFNLCBTZWRhdCBEaWxlayA8c2VkYXQuZGls
ZWtAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDY6MTUg
QU0gTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+IHdyb3RlOg0KPiANCj4gWy4uLl0NCj4g
DQo+Pj4gRG8geW91IHBsYW4gdG8gcHVzaCB0aGlzIGZvciBMaW51eCB2NS43Pw0KPj4gDQo+PiBJ
IGhvcGUgdGhhdCBpdCB3aWxsIGJlIGFjY2VwdGVkLiBGcm9tIG15IHBvaW50IG9mIHZpZXcgdGhp
cyBwYXRjaCBzZXQgaXMNCj4+IHJlYWR5IGZvciBtZXJnZSwgZXhjZXB0IGZvciB0aGUgbWF4aW11
bSB3aW5kb3cgc2l6ZSBpbmNyZWFzZQ0KPj4gcmVxdWVzdGVkIGJ5IFBldHIuDQo+PiANCj4gDQo+
IEhpIE5pY2ssDQo+IA0KPiB0aGFua3MgZm9yIHlvdXIgYW5zd2VyLg0KPiANCj4gRGlkIHlvdSBz
ZW5kIG91dCBhIHB1bGwtcmVxdWVzdCBhbHJlYWR5Pw0KDQpJIGhhdmVu4oCZdCBzZW50IG91dCBh
IHB1bGwgcmVxdWVzdC4gSWYgdGhhdCBpcyBzb21ldGhpbmcgdGhhdCBJIG5lZWQgdG8NCmRvLCBv
ciBpZiBpdCBtYWtlcyB0aGUgcHJvY2VzcyBlYXNpZXIgZm9yIGEgbWFpbnRhaW5lciB0byBtZXJn
ZSB0aGVuDQpJIGNhbiBkbyB0aGF0Lg0KDQo+IENhbiB5b3UgcG9pbnQgbWUgdG8gdGhhdCByZXF1
ZXN0IG9yIHBhdGNoIG9mIFBldHI/DQo+IElzIGl0IHJlbGV2YW50IG9yIG9wdGlvbmFsIGZvciB0
aGUgcHVsbC1yZXF1ZXN0Pw0KDQpUaGUgcGF0Y2hlcyBmcm9tIFBldHIgYXJlIGEgcGFyYWxsZWwg
aW1wbGVtZW50YXRpb24gb2YgaW5pdHJhbWZzDQpkZWNvbXByZXNzaW9uIGFuZCBhcmUgYXZhaWxh
YmxlIGhlcmUgWzBdLiBUaGV5IHN1cHBvcnQgaW5pdHJhbWZzDQpjb21wcmVzc2lvbiB3ZWxsLCBi
dXQgYXJlIG1pc3Npbmcgc29tZSBwaWVjZXMgZm9yIGNvcnJlY3QgYW5kDQpwZXJmb3JtYW50IHpz
dGQga2VybmVsIGRlY29tcHJlc3Npb24uIE5hbWVseSB0aGUgZXF1aXZhbGVudCBvZg0KcGF0Y2gg
NiBpbiB0aGlzIHNlcmllcyB0byBpbmNyZWFzZSBaT196X2V4dHJhX2J5dGVzLCB0aGUNCnBlcmZv
cm1hbmNlIGZpeCBpbiBwYXRjaCAxIHRoYXQgc3dpdGNoZXMgbWVtY3B5KCkgdG8NCl9fYnVpbHRp
bl9tZW1jcHkoKSwgYW5kIHRoZSBkZWNvbXByZXNzX3NpbmdsZSgpIGZ1bmN0aW9uIGluIHBhdGNo
IDMuDQoNCldpdGhvdXQgdGhvc2UgY2hhbmdlcyBhIHZlcnkgY29tcHJlc3NpYmxlIGtlcm5lbCBt
YXkgZmFpbCB0bw0KZGVjb21wcmVzcyBzdWNjZXNzZnVsbHksIGFuZCB3aWxsIGJlIGNvcnJ1cHRl
ZC4gQW5kIHRoZSBwZXJmb3JtYW5jZQ0KaXMgYWJvdXQgNHggd29yc2Ugb24geDg2XzY0LiBNeSBw
YXRjaGVzIHRvb2sgNzAgbXMgdG8gZGVjb21wcmVzcyB2cw0KMzE4IG1zIHdpdGggUGV0cuKAmXMu
IFNlZSB0aGUgZGV0YWlsZWQgY29tcGFyaXNvbiBoZXJlIFsxXS4NCg0KPj4+IEZlZWwgZnJlZSB0
byBhZGQgY3JlZGl0cyBmb3IgdGhlIHdob2xlIHNlcmllczoNCj4+PiANCj4+PiAgVGVzdGVkLWJ5
OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPg0KPj4gDQo+PiBUaGFua3MgZm9y
IHRlc3RpbmcgdGhlIHBhdGNoIHNldCBTZWRhdCENCj4+IA0KPiANCj4gSSBoYXZlIHJlLXRlc3Rl
ZCB6c3RkLXYzIHBhdGNoc2V0IHdpdGggTGludXggdmVyc2lvbiA1LjYgZmluYWwgYW5kDQo+IENs
YW5nL0xMRCB2ZXJzaW9uIDEwLjAuMCBmaW5hbCAoZnJvbSBEZWJpYW4vdW5zdGFibGUgcmVwb3Np
dG9yeSkuDQo+IA0KPiBJcyBpdCBwb3NzaWJsZSB0byBtZW50aW9uIHRoYXQgdGhlcmUgbWlnaHQg
ZGlzdHJvLXNwZWNpZmljIGNoYW5nZXMNCj4gbmVlZGVkIHRvIGluaXRyYW1mcy1oYW5kbGluZz8N
Cj4gRm9yIERlYmlhbiB5b3UgYXJlIHdlbGNvbWUgdG8gaW5jbHVkZSBiZWxvdyBMaW5rIFsxXS4N
Cj4gTm90IHN1cmUgSSB3aWxsIHNlbmQvYXNrIHRvL29uIHRoZSBkZWJpYW4ta2VybmVsIG1haWxp
bmcgbGlzdCBpbiB0aGlzIHRvcGljLg0KDQpJIGRvbuKAmXQgZXhwZWN0IGFueSBkaXN0cm8gc3Bl
Y2lmaWMgY2hhbmdlcyBhcmUgcmVxdWlyZWQgdG8gY29udGludWUgb3BlcmF0aW5nDQphcy1pcy4g
SG93ZXZlciwgaWYgYSBkaXN0cm8gd2FudGVkIHRvIHN3aXRjaCB0byBhIHpzdGQgY29tcHJlc3Nl
ZCBpbml0cmFtZnMgDQp0aGV5IHdvdWxkIG5lZWQgdG8gdXBkYXRlIHRoZWlyIHRvb2xjaGFpbiB0
byBjb21wcmVzcyB3aXRoIHpzdGQuDQoNCj4gVGhhbmtzIGFuZCBib25uZSBjaGFuY2UuDQo+IA0K
PiBSZWdhcmRzLA0KPiAtIFNlZGF0IC0NCj4gDQo+IFsxXSBMSU5LOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL0NBK2ljWlVYQ24yYW45YU5Ecm0rLWVuZVNBT3lHaWJ6MFcxeFlod2tBNWsz
QjNVLTV2UUBtYWlsLmdtYWlsLmNvbS8NCg0KWzBdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIw
LzMvMTYvNDYxDQpbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvMy8zMS8xNTczDQoNCg==
