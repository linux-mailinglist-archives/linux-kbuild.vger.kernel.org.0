Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8756215A49
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jul 2020 17:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgGFPGA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 11:06:00 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:22002 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729121AbgGFPGA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 11:06:00 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 066F4Isn017552;
        Mon, 6 Jul 2020 08:05:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=44O4nwKsRSTutUqOjBN0Crc4UScKe7ImlJjjipczk/Y=;
 b=DOlFt6HRD5XzTmR3VKyfl6J3rKL3uZ8UdDeHFaO9gduu2geyHzpyCRPJH/mFhIGFvVS+
 NHCLW5jjyYBKGr73RGBGFySSM2SZtTcRCE0zRxAvxSwU3OAoMaW2kZeAuRNOqEAXJNE9
 fLn3GF6lYODJzDERJjnH2qTMJnTRTU9Y+Xg= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 322qkg73pk-6
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 06 Jul 2020 08:05:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 6 Jul 2020 08:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h50YHlyMAkDd3DxrCxNmvqLU1WG6cmEgF8/fGuQGAaJMTPY/7rT/yym0wJiA8KqS/+7qexmW5gu1kFLvAKy2l3+q2XDQpEWR0zdhF4E3+23U9NCDV557kz5cmo5OWgajmQK6+7pc5k2gAP0dYnrxT3KaTxNIiKPLNPxG0d/7B67eymbqwQwBZWAvaMcOwE2k5uTuTZPEZ7Xsith62zQUOs2b+7JzK364FN2Zs5LCVRfd4avRD2z0laRWd07R+Sq+aqgfAB5jDs1G7ufLBPWdBP8nUfRt0mDJyf8EnQ+FoBY4pJoWmrwT2CBWQEFerpw2O5KwN0N0zxL9+kTZ0GKL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44O4nwKsRSTutUqOjBN0Crc4UScKe7ImlJjjipczk/Y=;
 b=IQYDVcnbXuV1MKOZ3KX11wW97hMKxGFP76nnkdgf0PEuytiOskuq7fjR9ZqxGsHUgc+xdN5MT2atZ5kwueDwopDv9HxhjL4a5PlVGAqWzjvyzgBuG0VAfa4y4LIEq0TClC92rBO7bDSV8zikTs6CoRGXETK2c2ncCV3JWYy8jv+z59KBKHRJlrO4IhblrZ2LtR1oaezxIG6PdBW/kK9Kz3zxPXzoRSk2Xy59jhO2b/ZW0ebX2kvSDK8ifSL2AWHgm90zg4bkXVT1ahcgSNj5vX/u/E/YKVkv0mYRN2BVxgp5QsJOvk/exNoIf/XAyMd1b7Nu/w989fds9PhGA3Dwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44O4nwKsRSTutUqOjBN0Crc4UScKe7ImlJjjipczk/Y=;
 b=giQNDkNULDqTrBnW3MAc6X2N2eMrf2gSqLq2ZKq+znv6R0Qa2RQhUeDcuwdx2hnYquNFb0s35+3j9UlRgQL6gkkTSx3TsvgOmodm7rVhVT8HgWocSfXw5M8Fo+3A8FlzPB/9ppeyh8kNQdrXPA/nzrbOy/Yb5HGlSerALWqhKN8=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2726.namprd15.prod.outlook.com (2603:10b6:a03:157::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.29; Mon, 6 Jul
 2020 15:05:41 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::993d:262a:f163:ec9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::993d:262a:f163:ec9c%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:05:41 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Kees Cook <keescook@chromium.org>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Norbert Lange <nolange79@gmail.com>, Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Kernel compression benchmarks
Thread-Topic: Kernel compression benchmarks
Thread-Index: AQHWUIQTTOzggWvjsE6UACsBiu1uH6j1gyYAgACDlACABKYQAA==
Date:   Mon, 6 Jul 2020 15:05:41 +0000
Message-ID: <C3E7DA59-BDC7-4B81-B2B1-58BD9E865840@fb.com>
References: <1588791882.08g1378g67.none.ref@localhost>
 <1588791882.08g1378g67.none@localhost> <202007020818.87EA89106@keescook>
 <CA+icZUUBAzBNwqThSF=YS1zg9EVCuSZ-XDc5Pu3NrO6R3Fi2Zw@mail.gmail.com>
 <202007030855.ED7AABDF@keescook>
In-Reply-To: <202007030855.ED7AABDF@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:eefc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb6781a8-3e35-45cb-72a0-08d821be0cdf
x-ms-traffictypediagnostic: BYAPR15MB2726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB27260003D8CFF634859953E5AB690@BYAPR15MB2726.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g+MbZ0dmvUm4+Rq4Rhu+xufsRE2KQGUaw1gjrpvO4gRLopdca2QzZ9ZvABtvrUhjQ1E2rzyWw6K28SpgHW2XUHfiUxL5RQSR/gtPdjGItOmQH0m3oW7mbc8FMAE24q9HtUQhmJnWNUFZBxA7XarLEgkGbKHmwBUsRAv5YjLuT8pci406yy+1aISgdJEdBIyWSk1C9SS6GIfg/f6OBMxCU3R7t4wtxyKl5seOuKFOkGWGTTwSFDRV1MCZJT8e/NUYev46gkQIHVHfKC0jmDF2XV6SFRIO16aGv2BZZAUsy3pckiwNIW3AuN0JaTy8b1WOuHClvW/R7EcvA/mBEjEssoI9Ki/UEKB9eA09B5gXyKUYpX4c9qUI1m2QSe4IvkFqmLVj3eeSgqV9WC7K0G+Bhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39860400002)(136003)(376002)(346002)(396003)(83380400001)(2616005)(66476007)(186003)(66946007)(6486002)(76116006)(8676002)(66556008)(66446008)(64756008)(4326008)(7116003)(8936002)(7416002)(3480700007)(6916009)(36756003)(6512007)(478600001)(53546011)(6506007)(966005)(33656002)(71200400001)(2906002)(5660300002)(316002)(86362001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: RLSDMSXHQLS6/wLJ0JChLNm6p3SPzW0EYYAqu7vxuZ6/BkMyBzpUmgvJwFMF9UOIDi5iVB4dI86P+kbSDyjkzESuZqjGoCcJjOjdll62Kmmld7g5NZW/HQQPbxcz8AbHy7svfeC1X/PkQghUZBmPnBoombx1jyCNqCGu4iHseMqBMzHfNrdOChmSqNz2aMvPLhqqpVFr8rxFJ/oGW8K28plfdwuQa76NTGH1YqTScaCIVAAPEQk8S7B8Q2mThk4VH/G2KXcaDv6dmWvxe2m+wiFp0b9kyOrkOZWzuU45bHR+EPBtLO5dkHlTuM//2+uEX+4U9m0bdOYajcsNA4Ff8hWd6CQBqRtDIeQLt7X8MFu/rsTBmtvFwJAn2NtaGIIPA8jrkJR2QQc9N1NsswpR2sHEvtdgCNRbwIsIACdKJ1vZ2gzZx+oRrpajNQQTSAN1IC4dMPaCSsJcPyI/irOERwy6TZUdm7+7+gu3yVuiXSi4NOs+5weVEAWzF3/VaaiomXmj4j4/duUTxGlOaDqCUQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <560B3F278B024642A9978184FABB4CB7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6781a8-3e35-45cb-72a0-08d821be0cdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 15:05:41.5558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxeMoXdkzP+ka+jQPmC0nS8JvZr0csI6dJv2Hu4Y0fvVJC0+bowy0iD7oKDWwMem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2726
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-06_12:2020-07-06,2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 spamscore=0 cotscore=-2147483648 bulkscore=0 clxscore=1011
 adultscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060115
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gSnVsIDMsIDIwMjAsIGF0IDEyOjA2IFBNLCBLZWVzIENvb2sgPGtlZXNjb29rQGNo
cm9taXVtLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAwMywgMjAyMCBhdCAxMDoxNToy
MEFNICswMjAwLCBTZWRhdCBEaWxlayB3cm90ZToNCj4+IE9uIFRodSwgSnVsIDIsIDIwMjAgYXQg
NToxOCBQTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3JvdGU6DQo+Pj4gDQo+
Pj4gT24gV2VkLCBKdWwgMDEsIDIwMjAgYXQgMTA6MzU6NDhBTSAtMDQwMCwgQWxleCBYdSAoSGVs
bG83MSkgd3JvdGU6DQo+Pj4+IFpTVEQgY29tcHJlc3Npb24gcGF0Y2hlcyBoYXZlIGJlZW4gc2Vu
dCBpbiBhIG51bWJlciBvZiB0aW1lcyBvdmVyIHRoZQ0KPj4+PiBwYXN0IGZldyB5ZWFycy4gRXZl
cnkgdGltZSwgc29tZW9uZSBhc2tzIGZvciBiZW5jaG1hcmtzLiBFdmVyeSB0aW1lLA0KPj4+PiBz
b21lb25lIGlzIGNvbmNlcm5lZCBhYm91dCBjb21wcmVzc2lvbiB0aW1lLiBTb21ldGltZXMsIHNv
bWVvbmUgcHJvdmlkZXMNCj4+Pj4gYmVuY2htYXJrcy4NCj4+PiANCj4+PiBXaGVyZSdzIHRoZSBs
YXRlc3Qgc2VyaWVzIGZvciB0aGlzLCBidHc/IEkgdGhvdWdodCBpdCBoYWQgbGFuZGVkLiA6UCBJ
dA0KPj4+IHNlZW1lZCBsaWtlIGl0IHdhcyBkb25lLg0KPj4+IA0KPj4gDQo+PiBIaSwNCj4+IA0K
Pj4gQWdhaW4sIEkgd291bGQgbGlrZSB0byBzZWUgdGhpcyB1cHN0cmVhbSwgdG9vLg0KPj4gDQo+
PiBMYXN0IEkgYXNrZWQgZm9yIGEgcmViYXNlIGFnYWluc3QgTGludXggdjUuOC1yYzEgb3IgbGF0
ZXIuDQo+PiANCj4+IEJleW9uZCBhYm92ZSBhZGFwdGF0aW9ucywgdGhlIGxhdGVzdCBzZXJpZXMg
InpzdGQtdjUiIG9mIE5pY2sgVC5zDQo+PiBwYXRjaHNldCBuZWVkcyBzb21lIGFkZGl0aW9uIG9m
IHpzdGQgdG8gdGhlIHBhdGNoIChzZWUgWzFdKToNCj4+IA0KPj4gY29tbWl0IDhkZmI2MWRjYmFj
ZWIxOWE1ZGVkNWU5YzlkY2Y4ZDA1YWNjMzIyOTQNCj4+ICJrYnVpbGQ6IGFkZCB2YXJpYWJsZXMg
Zm9yIGNvbXByZXNzaW9uIHRvb2xzIg0KPj4gDQo+PiBOT1RFOg0KPj4gInpzdGQtdjUiIHdhcyBh
Z2FpbnN0IExpbnV4LW5leHQgMjAyMDA0MDggb3IgZG93bmxvYWQgdGhlIHNlcmllcyBmcm9tDQo+
PiBwYXRjaHdvcmsgTEtNTCB3aGljaCBhcHBsaWVzIGNsZWFubHkgYWdhaW5zdCBMaW51eCB2NS43
IC0gbGFzdCBpcyB3aGF0DQo+PiBJIGRpZC4NCj4+IA0KPj4gVGhlcmUgd2FzIGEgZm9sbG93LXVw
IHRvIHRoZSBhYm92ZSBwYXRjaCAoc2VlIFsyXSk6DQo+PiANCj4+IGNvbW1pdCBlNGE0MmM4MmU5
NDNiOTdjZTEyNDUzOWZjZDdhNDc0NDViNDNmYTBkDQo+PiAia2J1aWxkOiBmaXggYnJva2VuIGJ1
aWxkcyBiZWNhdXNlIG9mIEdaSVAsQlpJUDIsTFpPUCB2YXJpYWJsZXMiDQo+IA0KPiBPa2F5LCBj
b29sLiBZZXMsIG5vdyBpcyB0aGUgcmlnaHQgdGltZSB0byBzZW5kIGFuIHVwZGF0ZWQgc2VyaWVz
IGJhc2VkDQo+IG9uIHY1LjgtcmMyIHdpdGggYW55IG91dHN0YW5kaW5nIGFkanVzdGVkL2ZpeGVz
IG1hZGUuDQo+IA0KPiBJdCBzZWVtcyB2NSBpcyBoZXJlPw0KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjAwNDA4MjE1NzExLjEzNzYzOS0xLW5pY2tydGVycmVsbEBnbWFpbC5jb20v
DQo+IA0KPiBUaGF0IHdhc24ndCBzZW50ICJ0byIgYSBtYWludGFpbmVyLCBzbyBpdCBsaWtlbHkg
d2VudCB1bm5vdGljZWQgYnkgZWl0aGVyDQo+IGFrcG0gb3IgdGhlIHg4NiBtYWludGFpbmVycy4g
SSB0aGluayB0aGlzIHNob3VsZCBsaWtlbHkgZ28gdmlhIHRoZSB4ODYNCj4gdHJlZS4NCj4gDQo+
PiBOZXZlcnRoZWxlc3MsIHRoaXMgaXMgdGhlIGtlcm5lbC1zaWRlIG9mIGRvaW5nIC0gdXNlci1z
cGFjZSBsaWtlIGZvcg0KPj4gZXhhbXBsZSBEZWJpYW4ncyBpbml0cmFtZnMtdG9vbHMgbmVlZHMg
YWRhcHRhdGlvbnMgKHNlZSBbM10pLg0KPiANCj4gUmlnaHQsIGJ1dCB0aGUga2VybmVsIG5lZWRz
IHRvIGltcGxlbWVudCB0aGUgc3VwcG9ydCBmaXJzdC4gOikNCj4gDQo+PiBAS2VlczogQ2FuIHlv
dSBhaWQgTmljayBULiB0byBnZXQgdGhpcyB1cHN0cmVhbT8gWW91IGtub3cgdGhlDQo+PiBwcm9j
ZXNzZXMgYSBiaXQgYmV0dGVyIHRoYW4gbWUuDQo+IA0KPiBTdXJlOyBOaWNrLCBjYW4geW91IHBs
ZWFzZSByZWJhc2UgYW5kIGhhbmRsZSBhbnkgaXNzdWVzIGZyb20gdjU/IFdpdGgNCj4gdGhlIHJl
c3VsdCwgc2VuZCBhIHY2IGFzIHlvdSBkaWQgZm9yIHY1IGJlZm9yZSwgYnV0IEkgd291bGQgbWFr
ZSB5b3VyDQo+ICJ0byIgYmU6DQo+IA0KPiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4N
Cj4gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+DQo+IA0KPiBhbmQga2VlcCB0
aGUgQ0MgYXMgeW91IGhhZCBpdC4NCg0KSeKAmWxsIHNlbmQgaXQgb3V0IHRvZGF5LCB0aGFua3Mg
Zm9yIHRoZSBhZHZpY2UhDQoNCi1OaWNrDQoNCg==
