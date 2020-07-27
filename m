Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6D022FC6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 00:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgG0WpJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 18:45:09 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:32442 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727892AbgG0WpB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 18:45:01 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06RMfda0010751;
        Mon, 27 Jul 2020 15:44:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XGCcjZr0gmZrh9EQbutSeABLzVdXuDuYrP3nWHNmxw0=;
 b=k/hAD2Qy5klecApX3CLUjR2XeI4edJT+Qzt2R40UxovE5tEvri9F2dR+hRUQNNdXIot5
 0nX05piTin39FaxUq/0BzuC6cQXfJ0kMt0zU9ScIH95VihJ9vcEyZMfLcyt0TMr1sbg5
 +3dQPvOAeIZA+EMFXWCNu9lcDk4as5K1Eko= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 32h50vprmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 27 Jul 2020 15:44:43 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 15:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXNMcWRYQBkEFmUcQU+7vpqbjDA5t6GSOFNDkyQ/ohk8ANwQf6khvpgkIpyUnofvb1GmOrIPGJeaUeHI97mE1tvjS1ZsOJP7/lbbTQ+R7ZDe9APs1QiD3yvfZDBL//05Da9nfpZ2ln5+SePDWZ4s/6i5yQth7Yxktp3lxKC+ntXYneqpQVsukhMlfK+32PBQY+gVOGXfuhuzIDaS0RJb6JSK9y94zdrjf1INMhO9ElryscGne7UlWeiSMmhwBNZAVGQVgfgAXf3DNeVKGFyIBymU4Mqg2blddHJ1aD/iIAs1oGAH1V52Ee/VC0vi9C1xle/QV0Oh+8ZJ029ntbszTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGCcjZr0gmZrh9EQbutSeABLzVdXuDuYrP3nWHNmxw0=;
 b=mC7WUPM/FEAf5GXAtmtSs8CJBnc9nPc4fvNvjwJOzxKC2tydEYrSzy5IPTMaiyCzUCoYsFuMibbPm2M0xy0Bf+hSb92+v9WA3ct2+f3eF/w9Kb6Cy0b1r4NhwSSot5+iMl0pWGuqD3G7ep57PB6xP7Y3Le1yGWZbTZrNXxccO3FacqkKPFpnUAPML/wH0gmc1xoOzi1IpOytpWuKp9gERt1sz+maPRf1DP3JprxfXRmMDIpwsaULYdku0tWF3ZVSRmvGVmsPrG6uVXcAUqUx7tAE1Ny1evX3gPkM86UCiwO/Ua1/5YcBtr6UQFCnqG/ETdtjBgR/+Heke9RFOWNy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGCcjZr0gmZrh9EQbutSeABLzVdXuDuYrP3nWHNmxw0=;
 b=Bmb1pmnFEqeCuy5p2SBOXBkqv4IhJmxeTL4FOXoTFCKnvPumnSafUQQzgM4yFuF9xWEO8noVHTuLGyLImrh8kKnQOAy6uBVPuboituO86Vwu1lXjBxRrLHBRRvTkqlNQCv0Rc4Wh1QSmeWnh0zmsrTcqeOO6ZigmQTkavKQEtsM=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2950.namprd15.prod.outlook.com (2603:10b6:a03:f6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 22:44:37 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 22:44:37 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Arvind Sankar <nivedita@alum.mit.edu>
CC:     Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Chris Mason" <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Thread-Topic: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Thread-Index: AQHWYSfJcwxv6ZmoP0i5UtMjZQMfxakV5pAAgADlDQCABUEVAA==
Date:   Mon, 27 Jul 2020 22:44:37 +0000
Message-ID: <D5815CBB-EAA8-4942-80CA-874DA325EE7A@fb.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-7-nickrterrell@gmail.com>
 <CA+icZUWV3ANmBj08QZKBtEE38Y-iyCGGxLWtiFkdpKqkGP7ZqQ@mail.gmail.com>
 <20200724143022.GA601509@rani.riverdale.lan>
In-Reply-To: <20200724143022.GA601509@rani.riverdale.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alum.mit.edu; dkim=none (message not signed)
 header.d=none;alum.mit.edu; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:c3fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc7774cf-0a81-4cd8-6024-08d8327ea43f
x-ms-traffictypediagnostic: BYAPR15MB2950:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB29501CF9719A3656D3CBB4F4AB720@BYAPR15MB2950.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P5Y+zYV/eQNiK6gx94H+Tem1nU9/DjMubzV0Q1OSDP8JjzuY+WJuShnxLmlgw0NdqmE0KR/Y7XbytPH/FlesxYB8n1kvyc5ozoJUw2d1nrREp6U+aVeSmqxqyLvgVgzkMgQXJdnFWlDc8EAFEDBxPSVIzN+gpa3uYOU1WJxoxwPQl3B/u456ba+qJS11EsWDBsUSnL86ynnIHRiEQR0wxVCc5NsFeUkkYZHkO+LQJtWPZ8ZjdB+2Bt9KIL0j+anoXpPSIKu3TFht2t9XnkUVNIf1XousWUm4wf7Eix/cTpr7QzH8l7lccFeT30AkRoF4lgIS5IVjJlHj3Kedqa+bhQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(366004)(396003)(376002)(346002)(33656002)(6486002)(6506007)(6512007)(8936002)(66476007)(66556008)(53546011)(66446008)(64756008)(2906002)(6916009)(66946007)(478600001)(76116006)(86362001)(5660300002)(8676002)(71200400001)(4326008)(54906003)(83380400001)(36756003)(186003)(2616005)(316002)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: cjRlMTf8yWBG0gMnTEmRqOyZkXg0jDFl9j+F3VP47l0xznQc6JU8GWM2rp92x0rDrELqzKUazHnBuGuXdxQcT7Fe39gMpPIGClAwLFmLxn4BKZu7ghQs5SHEsMbf8zrP33uKc1dq8h4KmhhFv6da8KifFYsnY0N0AhCJmI+aHnuVjkvBBJUlT7uwwqNoxchhk2Q1qmy94Y8z4MqXN2fMe5SmsXc1UCD1478JB41CWuu2cMabRQ4rQRfVWMRyDWGMNZXxXa0MkS8pBlOxpTg7YLQ/5VLEHp+prGdYCQefhwTLmoNRvxSJ1Gn5G16a6vn1qAuZ+muVAm4rd7ydun8Nm+LuEVhMCAOt3jCwDHqjEGfbMlYz64WRqzMcyTjxvpzy3rOxndB/kbhXkk0QuDXAcFaXbdreL2OYdIzIBAs/Uhqv9QNAIBNZgAVnNJ8L2sSZE7ThtAr3960Dl7HV6zIJg4S2kjaAKSr4chhq2w7wbIP0M9fi2EdCGevL6TnvF2x88P8StXwJ0/EdQ7cM1kCugg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9754CC0A3FB4894B89610A65FEF0F59A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7774cf-0a81-4cd8-6024-08d8327ea43f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 22:44:37.3281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWzIvFXligfilylUeAEC0so0IvPYpzXWCXgzm312X41XfEQAsZkxP42HwWwcZ+tB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2950
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_15:2020-07-27,2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 suspectscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270153
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jul 24, 2020, at 7:30 AM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>=20
> On Fri, Jul 24, 2020 at 02:50:34AM +0200, Sedat Dilek wrote:
>> On Thu, Jul 23, 2020 at 9:30 PM Nick Terrell <nickrterrell@gmail.com> wr=
ote:
>>>=20
>>> From: Nick Terrell <terrelln@fb.com>
>>>=20
>>> * Add support for zstd compressed kernel
>>> * Define __DISABLE_EXPORTS in misc.c
>>> * Bump the heap size for zstd.
>>> * Update the documentation.
>>>=20
>>> Integrates the ZSTD decompression code to the x86 pre-boot code.
>>>=20
>>> Zstandard requires slightly more memory during the kernel decompression
>>> on x86 (192 KB vs 64 KB), and the memory usage is independent of the
>>> window size.
>>>=20
>>> __DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
>>> kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile give=
s
>>> duplicate definition warnings.
>>>=20
>>=20
>> That was reported by Arvind - feel free to add a Reported-by: ...
>>=20
>> - Sedat -
>>=20
>=20
> It's not necessary to add Reported-by's for problems encountered while
> developing the series. Especially as it was my drive-by suggestion to
> use __DISABLE_EXPORTS that introduced the issue in the first place :)
>=20
> I'd have added it to the Makefile and just dropped the definition in
> kaslr.c -- should be no reason for anything in here to use EXPORT_SYMBOL.

Sure, I was a bit hesitant to modify more than necessary here, but I will g=
o
ahead and do that.

Thanks for the reviews!=
