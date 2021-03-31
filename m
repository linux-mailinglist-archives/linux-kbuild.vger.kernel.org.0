Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14901350753
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 21:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbhCaTWN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 15:22:13 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:57898 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235869AbhCaTVj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 15:21:39 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12VJJa46026987;
        Wed, 31 Mar 2021 12:21:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=sPkjzfdKR0rVBQ10T7SakNIu9xdzdDJOwXKRhZ7BUTo=;
 b=Y/Y8zRVC1c4OIB0tejewCGKV+GixuuDCuG4dEh6r99xyWId2/53aoHSKxPYvcLEFhRvS
 A0SDOWYnZmCI3NtwThVui4PthmbRtDcOz3mvLw6MK3arjwaCvvG1Ffb4w0pUfsqRa+ub
 6FJA/zpEXSsmhZwTcYgwkhq0dlVc5T3XJaE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 37mx600ch4-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 31 Mar 2021 12:21:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 31 Mar 2021 12:21:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/ICmTxVIkdt4gKr9RbKpPLvL2pPVG6NMlY3VOji7euDLXjUDc6uO2yOPgkDj7ojEAJL4G7lujRM6oPf1HbRs7/bBUi+l//DNANXwT03iz7A0PJS2d7xm7ZSBdSq6hAXWnBMht+UiKLP/ohx2xNYPJeNg+KQmCo7YJYKmzCajh7rjwpznViHcg2EttaabtWVaOsBxjoI/vTVHoZFjq8MPb20UYST5WoMAaE2rfz8nHythtlexA/rWGYn76YwClH2VueGSecUkjKAGZp50w4Xkfqhw6/eLezjj7DEpU6Bhoi3bYHULmzgiWPlYY3mMXECZqsfCD0q8Kn/nk30gumvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPkjzfdKR0rVBQ10T7SakNIu9xdzdDJOwXKRhZ7BUTo=;
 b=YFjScGGT5PeGrNQOpw5/RVqRzH3YWevLZNMtBRezBrsDhYmIFx08R+L9co699tvNkDTzIcVvEnzvs6v8ogWPtX9C7thGSGO+b/5TCEs4eXXsPtbIDHcNaXRlWYe8+GLsPcqo0cA9SFOXrGUdSs9BfyAdSe6Yy3HO/bHDz6UA3HXjjONy2Dd2IP6gASa0+9upKUtep55b1lOlFLc6S0JbFZeICqrUq/ZXrlkVdS8PWTqBU7t/NF7f993HPemFUq4VvbzRPof8mo1X3ka641oxI1qbeSZtXffu01fkwnwOIAG0qXhzQkXiCvdDxIcp213kj1Gw+G/GPUNWcz/MeP9D6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2456.namprd15.prod.outlook.com (2603:10b6:a02:82::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Wed, 31 Mar
 2021 19:21:07 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b%4]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 19:21:07 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
CC:     Piotr Gorski <lucjan.lucjanov@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        "Nathan Chancellor" <nathan@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Valentin Schneider <valentin.schneider@arm.com>,
        "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH] init: add support for zstd compressed modules
Thread-Topic: [PATCH] init: add support for zstd compressed modules
Thread-Index: AQHXJVrjTl/b3y00YEOpOt7F0WiTWaqeXt4AgAAChgCAABnkAA==
Date:   Wed, 31 Mar 2021 19:21:07 +0000
Message-ID: <5288EB41-5257-4B4C-9D37-3C314FA90573@fb.com>
References: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
 <20210330115023.qt742qsdekwiroey@spock.localdomain>
 <33D7F6C9-6F53-471A-A146-7F128F6918F5@fb.com>
 <20210331174826.uhunfmkhlpyteb3d@spock.localdomain>
In-Reply-To: <20210331174826.uhunfmkhlpyteb3d@spock.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: natalenko.name; dkim=none (message not signed)
 header.d=none;natalenko.name; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:31f0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e334941a-8a6b-42da-7fa7-08d8f47a2282
x-ms-traffictypediagnostic: BYAPR15MB2456:
x-microsoft-antispam-prvs: <BYAPR15MB24568DC9CBBE09795BAD3C5AAB7C9@BYAPR15MB2456.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Es9A7Aq69wtRcE6zdiDkTDfWaT/xwv87peaoQMN1N1FGLF3q7K5zYkmJFZt3SyCGOYVC1MRzNMuEf3IvWaKGlNVFAb8LIh24wrKfIjiva+hvAI1jMh3SwsWJN4jIEMjMhs4R6qLRqARk2piMU8xlXSWVsJ7grVDK+KZIAiJl9EEFVbPE/RwuKVSIYkUkhwbrd9ILHBo2vCi/h5FDrZXbuSoyKTqYKJJgfh5XTXIp3jOClON9EBzfKr0jNceR7aOCvvlhabQEVwuI80eFiW63ins2C+SUIIS3miCr7vNjr4qXl2eVDT7RyE1Bgn5dB0dHo6RlURL79YAsOgZQtm7Fm9gHDRSJM5WXo6oEXW/enZu/gljMT07HxXFjO8LzElyyFUcevylkmCqUHj8UPgiykl77dNLjUpSKGujsQZuLk8cWRogzU2pTUy+j41VQLfrtv9cAq+FP2XyAGEnkTuNmZFLDV6fIjmk0qf54nxg7mwN5hwvSNGdeRRfQyC7SWswpBcy+UU9RpindK66nwo2AJ4Tn4etSMgEjpXCpxhvjSCEQ976EzgdjYKe5bIE2Y2KrPWNBgjxWJhvY/q/f3IxE0P7PAxuruLQOfvy3tsLGA0lDKUV8XykArb+OabIhGsFcih9nSnQfdQnnJLVkFSgBejWhjVq2Na2xVpKfTNKer55HuWhkk4xJJusQ5ZbufHC1rB1f9xp9Z8THGj2r2P4iyC41bgiKBHZ49TRIxBs77zcnR1GFILJU9n5piQg38eAV0+xvh38ppbRAf9u72FBvrA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(346002)(39860400002)(376002)(53546011)(6506007)(966005)(478600001)(66556008)(5660300002)(33656002)(38100700001)(54906003)(86362001)(2906002)(8676002)(76116006)(2616005)(6486002)(71200400001)(7416002)(91956017)(66476007)(83380400001)(6512007)(36756003)(6916009)(66946007)(4326008)(66446008)(64756008)(8936002)(316002)(186003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y2pDQlNacVdhUnJTUk4yb00vUXd2UkJKTU5DQytLam1IWE16YUVxL2RncXFs?=
 =?utf-8?B?N3R4R3FtUWQzM0k0eFJRRW05dWdQZC9oQjZmTmdhQ0tSbjZ6WUVnTE1PeUhO?=
 =?utf-8?B?WVZLYjNLWjFwQkJqZTZsc2E2TDQ5L2tScU5Jd2hTNjZsUUticmY1R0tqRml4?=
 =?utf-8?B?aVc5WUJWY2o5aEZaQ3pQTTN1Q2VJeExNZEc0SERjUHYwOE1jVTZQaGlwMEF3?=
 =?utf-8?B?MVJwVGxScWFQUWoxNDYxaFJsbXAxd1RrWnU3WVV0MnJMRFRPKzh3QmpYMzc3?=
 =?utf-8?B?SlJqNlJlNVdjalJJMG5saGZiYUg1dTNTbUNiRWlvYktTNGtEOXJpd28yQ3Mv?=
 =?utf-8?B?VUZKemI1aTlnM2JuZi9HMitRRDdKL1Jva0NwZmdKK3dwandlTFdTYk5jQnli?=
 =?utf-8?B?NytNNHdPNmhoWVRubmR3cTJ5dFJCc09vNHV4MHdsS1dXRnl2cTBFLzhtRDlI?=
 =?utf-8?B?K2ozZ3NCSEFFUmdveTh4bmI5R0phc3FIaTBveXFXeWhGSHN0VEQwenJVeCs2?=
 =?utf-8?B?dUpVTktVMFFuYjFBT3hTMjZJRW1hV0dqN3RnaENXdnpzdmFjKy9zVitORWJE?=
 =?utf-8?B?YWtFZGRvM0JBaTNHUzVRVG9jVDE5WWYzdGxCaXNBWkJCcDViWWZnRjdPWlZX?=
 =?utf-8?B?YmR2RlY1Z1pPQ05GckNTQjh1Qmk4SGh6TDdZeitqNXArSlllWUpJTnBmNEEy?=
 =?utf-8?B?VGZEcUpZbys3dzBDT0VyRTJPajNxcFZ6SHNBbnBveU9CaWpjVU5xRVlqUG5J?=
 =?utf-8?B?OTlmNSs3cDl5RGVaL3ZSUGdVTzMxYmx4VllYaFRUN09GU3JsWjhEbThXc3Y3?=
 =?utf-8?B?N2NERGhoQStYR21rZEg1ZVI5MnBxOW5udVB2bW1OZ2ZURHY5Vnh3aEcyQlpa?=
 =?utf-8?B?QkQvUFQ4WEQ5cVhYTHV5NHZqb0ZDRTlwZnZUZWxkSytoL0YvVWJ0cEdhOG5a?=
 =?utf-8?B?KzUzVUNvck1OSEVnVUlhSlpsRDJwdUhIYXcwQUluMGJDaTRYaUdPQm8vNndk?=
 =?utf-8?B?SFI2RGdhcldMZGpSd2ZWcmljTVZscGR1YVhsekg0UjJIak92eGY0aEQrUFd1?=
 =?utf-8?B?QytpU3V0Q21XSWZYM1pGNmU2d0oyblZ6ZGloMHluaFhoUXJEZE5wV0M3eU01?=
 =?utf-8?B?dnBUL2w1c0VhNk9GTUQveXpEVWN2aDBRQ3ViM2NTbkx2KzdZWEU3b1plbitJ?=
 =?utf-8?B?K1Jkamx0MUo1NEkrK0dreE9raHJWWkQvWEVRQWJPUldOSlJweXk1ZU9GZnhz?=
 =?utf-8?B?dlpNVWtzYnlJZXNIaG8relNPcDJET21Sbmh2WFhOMkQ4LzZUK204dDdSTnp5?=
 =?utf-8?B?TTdqbzRiVXB0UGVnZjNVL3RuVjVrSmpuYjFwMy85dUxWYmlscDdKQktYYVd1?=
 =?utf-8?B?SlRybmUwR3FxMnRmd0hUaEFmUUNqR3JGRGdub0RLdkF2VHBKSW9IWU54b3Za?=
 =?utf-8?B?dlo0MXdZWXZkaTlVZXJIMkhLdWNIeUZLWmMzSG5rQTcxMW5ZRVovMEY5d3do?=
 =?utf-8?B?Y0dCcVdOVnk5THRkMFNSa2QrYVBOM3VoVWRYbWZ5RFd5aXZidjN4d2ZPbmpy?=
 =?utf-8?B?UytQWjlIZ05FaGlidmIyZldJajFDZVhmQ1hPTXdVSlFOcHp3REd4NXZLWnBH?=
 =?utf-8?B?bE1mSXlFV1k4L1U4eldWNkRMY1ZEL1BvREl5K1hheWpOeWhrREJFclBnUERZ?=
 =?utf-8?B?RFJKVHZ2L2xObW1HYWFVTjB5MTZoSHVadys1ZmthUVVtUzErZ3U5U2hJcTVi?=
 =?utf-8?B?dUFXR3Vtak1SVEtDazhua0lUeUU3R1hmeDhiQjNTU3Z0N3Z5VDJabXF0WVJR?=
 =?utf-8?Q?SVeOJprxbsOfwspqFvUy90EpG64EiX0Mwl4EE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F62DB7BE3779748A68AB45F5EAEEA24@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e334941a-8a6b-42da-7fa7-08d8f47a2282
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 19:21:07.3741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lTZ8XVRrJ26EXC6+2F/cx+SAt3CVeJRmLlsvCN/5fLeSRwgs4+hDrU2/DKkrvLsh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2456
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: vnK7qt8vupSOjh1YvtZPe4V_O8Myha3d
X-Proofpoint-ORIG-GUID: vnK7qt8vupSOjh1YvtZPe4V_O8Myha3d
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_10:2021-03-31,2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310132
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gTWFyIDMxLCAyMDIxLCBhdCAxMDo0OCBBTSwgT2xla3NhbmRyIE5hdGFsZW5rbyA8
b2xla3NhbmRyQG5hdGFsZW5rby5uYW1lPiB3cm90ZToNCj4gDQo+IEhlbGxvLg0KPiANCj4gT24g
V2VkLCBNYXIgMzEsIDIwMjEgYXQgMDU6Mzk6MjVQTSArMDAwMCwgTmljayBUZXJyZWxsIHdyb3Rl
Og0KPj4gDQo+PiANCj4+PiBPbiBNYXIgMzAsIDIwMjEsIGF0IDQ6NTAgQU0sIE9sZWtzYW5kciBO
YXRhbGVua28gPG9sZWtzYW5kckBuYXRhbGVua28ubmFtZT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24g
VHVlLCBNYXIgMzAsIDIwMjEgYXQgMDE6MzI6MzVQTSArMDIwMCwgUGlvdHIgR29yc2tpIHdyb3Rl
Og0KPj4+PiBrbW9kIDI4IHN1cHBvcnRzIG1vZHVsZXMgY29tcHJlc3NlZCBpbiB6c3RkIGZvcm1h
dCBzbyBsZXQncyBhZGQgdGhpcyBwb3NzaWJpbGl0eSB0byBrZXJuZWwuDQo+Pj4+IA0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBQaW90ciBHb3Jza2kgPGx1Y2phbi5sdWNqYW5vdkBnbWFpbC5jb20+DQo+
Pj4+IC0tLQ0KPj4+PiBNYWtlZmlsZSAgICAgfCA3ICsrKysrLS0NCj4+Pj4gaW5pdC9LY29uZmln
IHwgOSArKysrKystLS0NCj4+Pj4gMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZp
bGUNCj4+Pj4gaW5kZXggNTE2MGZmODkwM2MxLi44MmY0ZjRjYzI5NTUgMTAwNjQ0DQo+Pj4+IC0t
LSBhL01ha2VmaWxlDQo+Pj4+ICsrKyBiL01ha2VmaWxlDQo+Pj4+IEBAIC0xMTU2LDggKzExNTYs
OCBAQCBlbmRpZiAjIElOU1RBTExfTU9EX1NUUklQDQo+Pj4+IGV4cG9ydCBtb2Rfc3RyaXBfY21k
DQo+Pj4+IA0KPj4+PiAjIENPTkZJR19NT0RVTEVfQ09NUFJFU1MsIGlmIGRlZmluZWQsIHdpbGwg
Y2F1c2UgbW9kdWxlIHRvIGJlIGNvbXByZXNzZWQNCj4+Pj4gLSMgYWZ0ZXIgdGhleSBhcmUgaW5z
dGFsbGVkIGluIGFncmVlbWVudCB3aXRoIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUA0KPj4+
PiAtIyBvciBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1haLg0KPj4+PiArIyBhZnRlciB0aGV5IGFy
ZSBpbnN0YWxsZWQgaW4gYWdyZWVtZW50IHdpdGggQ09ORklHX01PRFVMRV9DT01QUkVTU19HWklQ
LA0KPj4+PiArIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1haLCBvciBDT05GSUdfTU9EVUxFX0NP
TVBSRVNTX1pTVEQuDQo+Pj4+IA0KPj4+PiBtb2RfY29tcHJlc3NfY21kID0gdHJ1ZQ0KPj4+PiBp
ZmRlZiBDT05GSUdfTU9EVUxFX0NPTVBSRVNTDQo+Pj4+IEBAIC0xMTY3LDYgKzExNjcsOSBAQCBp
ZmRlZiBDT05GSUdfTU9EVUxFX0NPTVBSRVNTDQo+Pj4+ICBpZmRlZiBDT05GSUdfTU9EVUxFX0NP
TVBSRVNTX1haDQo+Pj4+ICAgIG1vZF9jb21wcmVzc19jbWQgPSAkKFhaKSAtLWx6bWEyPWRpY3Q9
Mk1pQiAtZg0KPj4+PiAgZW5kaWYgIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1haDQo+Pj4+ICsg
IGlmZGVmIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfWlNURA0KPj4+PiArICAgIG1vZF9jb21wcmVz
c19jbWQgPSAkKFpTVEQpIC1UMCAtLXJtIC1mIC1xDQo+PiANCj4+IFRoaXMgd2lsbCB1c2UgdGhl
IGRlZmF1bHQgenN0ZCBsZXZlbCwgbGV2ZWwgMy4gSSB0aGluayBpdCB3b3VsZCBtYWtlIG1vcmUg
c2Vuc2UgdG8gdXNlIGEgaGlnaA0KPj4gY29tcHJlc3Npb24gbGV2ZWwuIExldmVsIDE5IHdvdWxk
IHByb2JhYmx5IGJlIGEgZ29vZCBjaG9pY2UuIFRoYXQgd2lsbCBjaG9vc2UgYSB3aW5kb3cNCj4+
IHNpemUgb2YgdXAgdG8gOE1CLCBtZWFuaW5nIHRoZSBkZWNvbXByZXNzb3IgbmVlZHMgdG8gYWxs
b2NhdGUgdGhhdCBtdWNoIG1lbW9yeS4gSWYgdGhhdA0KPj4gaXMgdW5hY2NlcHRhYmxlLCB5b3Ug
Y291bGQgdXNlIGB6c3RkIC1UMCAtLXJtIC1mIC1xIC0xOSAtLXpzdGQ9d2xvZz0yMWAsIHdoaWNo
IHdpbGwgdXNlIGENCj4+IHdpbmRvdyBzaXplIG9mIHVwIHRvIDJNQiwgdG8gbWF0Y2ggdGhlIFha
IGNvbW1hbmQuIE5vdGUgdGhhdCBpZiB0aGUgZmlsZSBpcyBzbWFsbGVyIHRoYW4NCj4+IHRoZSB3
aW5kb3cgc2l6ZSwgaXQgd2lsbCBiZSBzaHJ1bmsgdG8gdGhlIHNtYWxsZXN0IHBvd2VyIG9mIHR3
byBhdCBsZWFzdCBhcyBsYXJnZSBhcyB0aGUgZmlsZS4NCj4gDQo+IFBsZWFzZSBuby4gV2UndmUg
YWxyZWFkeSBkb25lIHRoYXQgd2l0aCBpbml0cmFtZnMgaW4gQXJjaCwgYW5kIGl0DQo+IGluY3Jl
YXNlZCB0aGUgdGltZSB0byBnZW5lcmF0ZSBpdCBlbm9ybW91c2x5Lg0KPiANCj4gSSB1bmRlcnN0
YW5kIHRoYXQgYnVpbGRpbmcgYSBrZXJuZWwgaXMgYSBtb3JlIHJhcmUgb3BlcmF0aW9uIHRoYW4N
Cj4gcmVnZW5lcmF0aW5nIGluaXRyYW1mcywgYnV0IHN0aWxsIEknZCBnbyBhZ2FpbnN0IGhhcmQt
Y29kaW5nIHRoZSBsZXZlbC4NCj4gQW5kIGlmIGl0IHNob3VsZCBiZSBzcGVjaWZpZWQgYW55d2F5
LCBJJ2Qgb3B0IGluIGZvciBhbiBleHBsaWNpdA0KPiBjb25maWd1cmF0aW9uIG9wdGlvbi4gUmVt
ZW1iZXIsIG5vdCBhbGwgdGhlIGtlcm5lbCBhcmUgYnVpbHQgb24NCj4gYnVpbGQgZmFybXMuLi4N
Cj4gDQo+IEZXSVcsIFBpb3RyIG9yaWdpbmFsbHkgdXNlZCBsZXZlbCA5IHdoaWNoIHdvcmtlZCBv
a2F5LCBidXQgSSBpbnNpc3RlZA0KPiBvbiBzZW5kaW5nIHRoZSBwYXRjaCBpbml0aWFsbHkgd2l0
aG91dCBzcGVjaWZ5aW5nIGxldmVsIGF0IGFsbCBsaWtlIGl0IGlzDQo+IGRvbmUgZm9yIG90aGVy
IGNvbXByZXNzb3JzLiBJZiB0aGlzIGlzIGEgd3JvbmcgYXBwcm9hY2gsIHRoZW4gb2ggbWVoLA0K
PiBtZWEgY3VscGEgOykuDQo+IA0KPiBXaGF0ZXZlciBkZWZhdWx0IG5vbi1zdGFuZGFyZCBjb21w
cmVzc2lvbiBsZXZlbCB5b3UgY2hvb3NlLCBJJ20gZmluZQ0KPiBhcyBsb25nIGFzIEkgY2FuIGNo
YW5nZSBpdCB3aXRob3V0IGVkaXRpbmcgTWFrZWZpbGUuDQoNClRoYXQgbWFrZXMgc2Vuc2UgdG8g
bWUuIEkgaGF2ZSBhIGRlZXAgc2VhdGVkIG5lZWQgdG8gY29tcHJlc3MgZmlsZXMgYXMNCmVmZmlj
aWVudGx5IGFzIHBvc3NpYmxlIGZvciB3aWRlbHkgZGlzdHJpYnV0ZWQgcGFja2FnZXMuIEJ1dCwg
SSB1bmRlcnN0YW5kIHRoYXQNCnNsb3cgY29tcHJlc3Npb24gc2lnbmlmaWNhbnRseSBpbXBhY3Rz
IGJ1aWxkIHRpbWVzIGZvciBxdWljayBpdGVyYXRpb24uIEnigJlkIGJlDQpoYXBweSB3aXRoIGEg
Y29tcHJlc3Npb24gbGV2ZWwgcGFyYW1ldGVyIHRoYXQgZGVmYXVsdHMgdG8gYSBoYXBweSBtaWRk
bGUuDQoNCknigJltIGFsc28gZmluZSB3aXRoIHRha2luZyB0aGlzIHBhdGNoIGFzLWlzIGlmIGl0
IGlzIGVhc2llciwgYW5kIEkgY2FuIHB1dCB1cCBhbm90aGVyDQpwYXRjaCB0aGF0IGFkZHMgYSBj
b21wcmVzc2lvbiBsZXZlbCBwYXJhbWV0ZXIsIHNpbmNlIEkgZG9u4oCZdCB3YW50IHRvIGJsb2Nr
DQptZXJnaW5nIHRoaXMuDQoNCkJlc3QsDQpOaWNrIFRlcnJlbGwNCg0KPiBUaGFua3MhDQo+IA0K
Pj4gDQo+PiBCZXN0LA0KPj4gTmljayBUZXJyZWxsDQo+PiANCj4+Pj4gKyAgZW5kaWYgIyBDT05G
SUdfTU9EVUxFX0NPTVBSRVNTX1pTVEQNCj4+Pj4gZW5kaWYgIyBDT05GSUdfTU9EVUxFX0NPTVBS
RVNTDQo+Pj4+IGV4cG9ydCBtb2RfY29tcHJlc3NfY21kDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0
IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29uZmlnDQo+Pj4+IGluZGV4IDhjMmNmZDg4ZjZlZi4u
ODZhNDUyYmMyNzQ3IDEwMDY0NA0KPj4+PiAtLS0gYS9pbml0L0tjb25maWcNCj4+Pj4gKysrIGIv
aW5pdC9LY29uZmlnDQo+Pj4+IEBAIC0yMjUwLDggKzIyNTAsOCBAQCBjb25maWcgTU9EVUxFX0NP
TVBSRVNTDQo+Pj4+IAlib29sICJDb21wcmVzcyBtb2R1bGVzIG9uIGluc3RhbGxhdGlvbiINCj4+
Pj4gCWhlbHANCj4+Pj4gDQo+Pj4+IC0JICBDb21wcmVzc2VzIGtlcm5lbCBtb2R1bGVzIHdoZW4g
J21ha2UgbW9kdWxlc19pbnN0YWxsJyBpcyBydW47IGd6aXAgb3INCj4+Pj4gLQkgIHh6IGRlcGVu
ZGluZyBvbiAiQ29tcHJlc3Npb24gYWxnb3JpdGhtIiBiZWxvdy4NCj4+Pj4gKwkgIENvbXByZXNz
ZXMga2VybmVsIG1vZHVsZXMgd2hlbiAnbWFrZSBtb2R1bGVzX2luc3RhbGwnIGlzIHJ1bjsgZ3pp
cCwNCj4+Pj4gKwkgIHh6LCBvciB6c3RkIGRlcGVuZGluZyBvbiAiQ29tcHJlc3Npb24gYWxnb3Jp
dGhtIiBiZWxvdy4NCj4+Pj4gDQo+Pj4+IAkgIG1vZHVsZS1pbml0LXRvb2xzIE1BWSBzdXBwb3J0
IGd6aXAsIGFuZCBrbW9kIE1BWSBzdXBwb3J0IGd6aXAgYW5kIHh6Lg0KPj4+PiANCj4+Pj4gQEAg
LTIyNzMsNyArMjI3Myw3IEBAIGNob2ljZQ0KPj4+PiAJICBUaGlzIGRldGVybWluZXMgd2hpY2gg
c29ydCBvZiBjb21wcmVzc2lvbiB3aWxsIGJlIHVzZWQgZHVyaW5nDQo+Pj4+IAkgICdtYWtlIG1v
ZHVsZXNfaW5zdGFsbCcuDQo+Pj4+IA0KPj4+PiAtCSAgR1pJUCAoZGVmYXVsdCkgYW5kIFhaIGFy
ZSBzdXBwb3J0ZWQuDQo+Pj4+ICsJICBHWklQIChkZWZhdWx0KSwgWFosIGFuZCBaU1REIGFyZSBz
dXBwb3J0ZWQuDQo+Pj4+IA0KPj4+PiBjb25maWcgTU9EVUxFX0NPTVBSRVNTX0daSVANCj4+Pj4g
CWJvb2wgIkdaSVAiDQo+Pj4+IEBAIC0yMjgxLDYgKzIyODEsOSBAQCBjb25maWcgTU9EVUxFX0NP
TVBSRVNTX0daSVANCj4+Pj4gY29uZmlnIE1PRFVMRV9DT01QUkVTU19YWg0KPj4+PiAJYm9vbCAi
WFoiDQo+Pj4+IA0KPj4+PiArY29uZmlnIE1PRFVMRV9DT01QUkVTU19aU1REDQo+Pj4+ICsJYm9v
bCAiWlNURCINCj4+Pj4gKw0KPj4+PiBlbmRjaG9pY2UNCj4+Pj4gDQo+Pj4+IGNvbmZpZyBNT0RV
TEVfQUxMT1dfTUlTU0lOR19OQU1FU1BBQ0VfSU1QT1JUUw0KPj4+PiAtLSANCj4+Pj4gMi4zMS4w
Ljk3LmcxNDI0MzAzMzg0DQo+Pj4+IA0KPj4+IA0KPj4+IEdyZWF0IQ0KPj4+IA0KPj4+IFJldmll
d2VkLWJ5OiBPbGVrc2FuZHIgTmF0YWxlbmtvIDxvbGVrc2FuZHJAbmF0YWxlbmtvLm5hbWU+DQo+
Pj4gDQo+Pj4gVGhpcyB3b3JrcyBwZXJmZWN0bHkgZmluZSBpbiBBcmNoIExpbnV4IGlmIGFjY29t
cGFuaWVkIGJ5IHRoZQ0KPj4+IGZvbGxvd2luZyBta2luaXRjcGlvIGFtZW5kbWVudDogWzFdLg0K
Pj4+IA0KPj4+IEknbSBhbHNvIENjJ2luZyBvdGhlciBwZW9wbGUgZnJvbSBnZXRfbWFpbnRhaW5l
cnMgb3V0cHV0IGp1c3QNCj4+PiB0byBtYWtlIHRoaXMgc3VibWlzc2lvbiBtb3JlIHZpc2libGUu
DQo+Pj4gDQo+Pj4gVGhhbmtzLg0KPj4+IA0KPj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYXJj
aGxpbnV4L21raW5pdGNwaW8vcHVsbC80Mw0KPj4+IA0KPj4+IC0tIA0KPj4+IE9sZWtzYW5kciBO
YXRhbGVua28gKHBvc3QtZmFjdHVtKQ0KPj4gDQo+IA0KPiAtLSANCj4gIE9sZWtzYW5kciBOYXRh
bGVua28gKHBvc3QtZmFjdHVtKQ0KDQo=
