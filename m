Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7664A47A665
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Dec 2021 09:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhLTI6S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Dec 2021 03:58:18 -0500
Received: from mx5.sophos.com ([195.171.192.119]:53339 "EHLO mx5.sophos.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232530AbhLTI6S (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Dec 2021 03:58:18 -0500
Received: from mx5.sophos.com (localhost.localdomain [127.0.0.1])
        by localhost (Postfix) with SMTP id F1B67F23E5;
        Mon, 20 Dec 2021 08:58:15 +0000 (GMT)
Received: from abn-exch5a.green.sophos (unknown [10.224.64.44])
        by mx5.sophos.com (Postfix) with ESMTPS id BA4B0F23CD;
        Mon, 20 Dec 2021 08:58:15 +0000 (GMT)
Received: from EUW1-EXCH7A.green.sophos (10.240.64.23) by
 abn-exch5a.green.sophos (10.224.64.44) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Dec 2021 08:58:14 +0000
Received: from EUW1-EXCH7A.green.sophos (10.240.64.23) by
 EUW1-EXCH7A.green.sophos (10.240.64.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 20 Dec 2021 08:57:47 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.54) by
 EUW1-EXCH7A.green.sophos (10.240.64.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 20 Dec 2021 08:57:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huvT8B6xDYbIAwVTRqDZA+Fb9Efhl2ns6yg+WnYCL+lfAqWLYZgF+ItcdAKHzyNMo2pXUvKcB0F/d+Lx2JRj9/hSn+OP9fPFue92DiAPHBRIiQjCQDifBTojQT6yWbQmYhbCx/iQ4ngjmjuIsShXa1yiutw87mgAoZpOBvxKM4dbjEGvxXjrZsmbin2EzH6RcYWlLDMFrTzXEKfHkEj09sFvg5sLd/NrURa/d1qQvFXv+P5B/uzs/lJ+6RjVWNkyIcMOPApBqzUIvMvz6oW3HWe/U5CaqjP9cw6sE2bPfswvqQwEEwF4NLZWMVlWU2llCZxHbAI2Jy+VciIPDdP3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDF/py9q3w+P01C8npSLSsdroT+o+lVSjK8ASzb0Ewo=;
 b=Os2Qj67HLE6gFB89wvBT8BUNk9J8drdB/63f/CfEeinPO0WW2cpjte54ekTxT7t5cY11pDkVUMYx8a6sMif9j/2GysPSSPjUXxrvSjNTpvQyK4DIDMmCREtwlv8ETHCkcPMv2TvVmPpj5jl0iSZSMO6NBX53gVRGZ+g5L5SeaLQ3deH3zm1rKiyx3I4v9/Az9Fh9AVZq+4Q6eDrIustVphPhU4zer8tO0NckXAcBp6MNx//943Qsy4S+SksUW0OszLPipNNHruNMlX9BwxetM1wF6s/4qY/6xLHziP/FymWD1Q5kLfzFhboaAQgTp7ghxDy4USoHfpkhY77bw95coA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sophos.com; dmarc=pass action=none header.from=sophos.com;
 dkim=pass header.d=sophos.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sophosapps.onmicrosoft.com; s=selector1-sophosapps-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDF/py9q3w+P01C8npSLSsdroT+o+lVSjK8ASzb0Ewo=;
 b=D5FbD7qE6iiA+iw9iTeMHfYIdaJM8jxlT/3+rM8mKyTDDvyVjnSDIuAtHEwjNpGiNjKix+4I9gTfl5Ww5ebgGOvx+EkZzYi/pOPdq4Vez9CjnfqbDIL0Fm3R0JLadFRPOKzk+YVV96aOhI4VDzSAnECzKaY9zQcqrjbFGUDHpNU=
Received: from LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:146::13)
 by LO2P265MB2591.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:141::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 08:57:46 +0000
Received: from LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM
 ([fe80::5065:fa42:8b68:fecd]) by LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM
 ([fe80::5065:fa42:8b68:fecd%4]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 08:57:46 +0000
From:   Vimal Agrawal <Vimal.Agrawal@sophos.com>
To:     Luis Chamberlain <mcgrof@kernel.org>
CC:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Jan Beulich" <JBeulich@suse.com>, Jeff Mahoney <jeffm@suse.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "jeyu@kernel.org" <jeyu@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vimal Agrawal <avimalin@gmail.com>
Subject: Re: [PATCH] kernel/module.c: fix for symbol decode in stack trace for
 stripped modules
Thread-Topic: [PATCH] kernel/module.c: fix for symbol decode in stack trace
 for stripped modules
Thread-Index: AQHX7Gp3fbn/V0AKa0eD8pIqYmXF4qwqASmAgACgA4CAEOGCAA==
Date:   Mon, 20 Dec 2021 08:57:46 +0000
Message-ID: <DFAD7F0E-4D95-40FC-8FB6-D488EB81A530@sophos.com>
References: <LO2P265MB2671DF8D82C0C6A1504D85D6939F9@LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM>
 <LO2P265MB267173F563B0A2CA5995FA2C939F9@LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM>
 <106F23FD-3768-4CF0-893D-EDFE4A0BA2BF@sophos.com>
 <YbEIe+jxzQTFPHwk@bombadil.infradead.org>
 <DB2D69B2-B523-4626-BDCE-CE7DEFCD9268@sophos.com>
 <YbJpvT/zRBuyuNxT@bombadil.infradead.org>
In-Reply-To: <YbJpvT/zRBuyuNxT@bombadil.infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sophos.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09fdbaf4-0c9d-4e2b-f276-08d9c396cae6
x-ms-traffictypediagnostic: LO2P265MB2591:EE_
x-microsoft-antispam-prvs: <LO2P265MB2591A514E52F817BBE351B18937B9@LO2P265MB2591.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K4MNNCYHfAzgRmfK6RoHEwecbAz0QBqOeikY9reCLuuk7joTZFvmag1Kz9H4/S2rtn1Js7pSR0SEti3qLydXq7IG/aGhYR8Lt61Dd1mEGEj5JqEGFUqvMk9p7iCZ6An3q+FokOZlxYjk5am42dPfj5Qnn+B+fC0sh+nF9bZPdY2TpRhMGwQVsMZtK39ZjTWvwpWSCOrnPbGgHFIX7Ojrp+H2LAoUIy41NkJaVGK7+V7TvOBpJEjDQnKoK3yiG5u9bLP41bMN3/f88aA71RpjvXeH2vy3y3NumAg5Z/hNZm/5L0p/hXFu9XeBuoRcZqFav2cAX3H/+DlJcHdqhb2NBr4AykB56jpwd9FT2Jel2TZ2R5yLqfleH8FqSpNChU0UU4unKXSHUI1LaT3vzruF4Wqaw3tn+H5wSzj1xAkH7cq9R3HsX+zUZYs9wkENZDGXqH390EjawN8axTSgrs8qk3zKoZumu1opFxnXhWDHJ++wtQKuScvB4lkh95O1Nkyi2wk14VqVtWI2oyICg4LY781F+2S4L1i994uf1bsVxdviHR8z5uyQce/FpnUSbccljGm0yiYe21G0w8YvaKfXgEpoZisgNjp8f1+11B9pCCadqCOqdPfRfKZHV55oT1MKsVDBQFJ4+GLlW+bS55DPARMz8twHdUMl7J+ptVmwn+wSJsaxcL45UeOLTfQABdCtqmGjer7TSULFjdIsg7TGx6nDFF3IH+hVvypyFDY90ZeHli6r/kDS6HOZEYYQnNJtzxAo/euIBeUcUVr/+7vDoE8s22GQPJ1y3rW7sPRvIZlCgivnRtXvYtERlrgr2gor
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(54906003)(4326008)(316002)(36756003)(76116006)(86362001)(6506007)(91956017)(38070700005)(71200400001)(966005)(45080400002)(6916009)(30864003)(7416002)(83380400001)(2616005)(5660300002)(6512007)(2906002)(8676002)(8936002)(55236004)(64756008)(66446008)(33656002)(66476007)(122000001)(38100700002)(66946007)(6486002)(66556008)(53546011)(186003)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlkxS3lnN3BXMWI2NGF4eWZxdUlnM1Juci9ITTNjbDA4WUNJdEdqVDJVQnc3?=
 =?utf-8?B?WmNIUFNqWHErRGlVaGxSSzN3emE2dUNtdnpaYmJTWDdLWGFwVWJKNGMxV2Vz?=
 =?utf-8?B?NGx1UzlJdDk4Rlh0U3MrSStzRUhXY1daNnRHb2xpMzNUTWwxWXgvMEFxeENG?=
 =?utf-8?B?ZnIzalVURFZNZXkycXB5bGcrbWFVa1FFK25SUmR5emUvdlF4Qk5FSVJNQk0z?=
 =?utf-8?B?RXVsKzNIZVdjT2k4K3pJbk5YMkxxM0V1U2xpWE1zbURKU1c5cTBZOUd2UDAy?=
 =?utf-8?B?UkcyS1pYY0tOYk12cFQ1LzFjY0s2ZVpVWUtnMjVuY2pMSjdLRVhLM0tLbUpW?=
 =?utf-8?B?eUFGK0NTUzRQUER3YlhkOUlXZUhhQlBrQmRLVktCUktBWG1aeHp5eVFxSTRH?=
 =?utf-8?B?RXpsUjBUK3ZsS29VMnZoZENwNU1maE9adHY5MzJPZFNWY0Mvc29tMEJ2eUUx?=
 =?utf-8?B?MnF6N0hJZWxtSVVsQWlaK1R4dGV1c2ZXeVJlaWljS1VaKzdnK1FPYW8ybnlT?=
 =?utf-8?B?aGRwak9DTnloNklTME9lM1EvZkFzZGxwcGYzSVJxWXFFdk1sd2ExdnJENDdw?=
 =?utf-8?B?dW1pUXBpWkE2aHVwT1JoSUdDMU1lU1R5ZGcvZnB5QUtsallPYUluRmRIZkxn?=
 =?utf-8?B?T0dpdW5uNTM3M2xyV29VZExXNXdOZjlzem91b3RiWGZ3UWg3T010LzNXRzJv?=
 =?utf-8?B?NTFLWXRVN2VlUzY4bFVES3EyYk5oY2hHVFJZeHF5aW5ENlRQV0t5L2xtQk5E?=
 =?utf-8?B?TGtnbjRyRXdCcy9FSkdXcTVFdVFuL1VFd0ZTTFRxT3dSNEowVlgvT0c0ckVF?=
 =?utf-8?B?OC9xSG1remE1bG9TbVRuaTNOQzVqS3g3dmlheVlzSjNyN0hYMDFtZDhvTVkx?=
 =?utf-8?B?SHBXSXMvWjkvcnpNV1lPQi82b1M2bkxHZzNQY0w4ZUtuRnlMUnRiL1l6dW11?=
 =?utf-8?B?NkZRQ2xtRFV4S29BWk5jdGZCcUpqelpWeE1FUkdYdkVWS3M3cFA5eC9CSWRN?=
 =?utf-8?B?ekUwam5PN095NlJ3a3RqaGJuU1lQcExQRXhjZG5CUHEwckNLRXRHa1pCTkc2?=
 =?utf-8?B?OEtabUR3NlFaM3lIQ2VTVXh2WW1TYjEzby9pcEJDczhiQmZtYy9KQ3o2d3Ra?=
 =?utf-8?B?bTJqWjhrZEViSEdGRk5SalpETEFSSUM2cWhjbis1NFdiR25hZDhwK2JvUlRL?=
 =?utf-8?B?b1A0SzQvQkdvR0NpNzhaSU9HT0I5RjFGZmZvL045cktoTEo4cjZML1JVOVox?=
 =?utf-8?B?SENEVzNGbVdOQ3llN3dYS0JJK3RhZE1YaW8rZXZGTE1pLy9Tb25uK2xEaHVD?=
 =?utf-8?B?b2JiNmVFWkJSSFBxOHkxa3Z4aFhpNThXY3ZPY3JmZVM4ODl6NFJvZStmajlM?=
 =?utf-8?B?VTFVeWhSV1FMWnVDdVhjRGw2bUxxYzFYY0w5K1oxVEsycDQ1SDlsMFNGYUVT?=
 =?utf-8?B?b0ducGttRFVTbXNXRDdHeTVHZU11U1hoTkR0Nmx4Vmc5ZDNVS3RKdk9Ya0cz?=
 =?utf-8?B?K0NnbG9lZmdNODYzT3lzUVcrUHB4QVZHdXZSTkVZRHdqaUpsSTZUZWZxOFRp?=
 =?utf-8?B?Z0VjRUZvbFlzd0RKT2dOdTZacmphNmluVEx0czRlRGxuTlY3UFBablRJVlhV?=
 =?utf-8?B?b2FhQTVuTjluZ0ZsSjFFeThVQXAwdzJsN0w5NXpZWkowWVZVRnhpYWxORml4?=
 =?utf-8?B?V3pKNVBTOGhMc0ZaZzAvU3lmUXIrdVdtUEVUS0RPa3JjdUFrNTQrS1psMlVV?=
 =?utf-8?B?enY4aHBIN3plUWZVdjlqL2F4blp5SmprNHFjQysxdHh1VEtQRkI2T0hLaTFI?=
 =?utf-8?B?b2IzUHN2QmRrNG5FQkRTWkdTcUFRRXRXVWxOUGVjNlF1VTloUldTdDB0ZTJk?=
 =?utf-8?B?bXJLS0tQOHBQSmNPczNraXJKVTNlVkRIRXZxdnIvSjI3a1hLYnRqQUZzR3pv?=
 =?utf-8?B?ZEhsK3JnUzl0VDlwT3lsVUNnM3c0ZzEvWm51RlFCWVl2Y1V0MmwzdU13ODZq?=
 =?utf-8?B?NFkzWnhXWVMvTTd1V2lMZ1ZqWGpWVFRWZVZ5NHp5dnVreTkvbThrNkJlR3JV?=
 =?utf-8?B?Z2ZZVnlvYnNHR3liLzVqSE94V2xQTDExZkRoaUpYbGJ3Y0ZCSmxTcU0wQmwr?=
 =?utf-8?B?WXp2Q0xWZHhHVUlURTNWVytmYjlPL01SMEtQeVR0U1ZHNGJuNVFTcUFUOFlu?=
 =?utf-8?B?OXpNbjFKYXNGaWVjczZ3eURiWWxVR1BBTWVqRTlyakdXTE9NbXk0R2ZQNm5r?=
 =?utf-8?Q?IovdV9Az9KtVij+GJpJcqj95Ci2+OpYu4HavyRZqxI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73164581BD0D8A4288017CD6906BE1F1@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fdbaf4-0c9d-4e2b-f276-08d9c396cae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 08:57:46.5810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 358a41ff-46d9-49d3-a297-370d894eae6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYuNRjmr+khgCsNd0nm0LF4XcXigCECadKd/N9HyH2GNyqFoQuDoZLmxoobXrN9P60WmyXyc49SO76KnB6cGsvyK2l+EcFA40EHstOFZ+7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2591
X-OriginatorOrg: sophos.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sophos.com; h=from:to:cc:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version; s=global; bh=IDF/py9q3w+P01C8npSLSsdroT+o+lVSjK8ASzb0Ewo=; b=Jfn6hPK1dSDz2iY6kqYq8aQGItPtTwJLv6DEgudry3ytrsvB+ZuT5rnjV0vjdvW1KoUc0RW9Jqlo+9j312zvY6JFCae+hr6dU+z3q00nC7ypl/nKKzk8Vhv0u7zCNJDeULToV1ZIOCvZo5HvavGQKxfYcb3jxgvr6NturowdDCk=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SGkgTHVpcywNCg0KU29ycnkgZm9yIGdvb2YgdXAgd2l0aCBpbmxpbmUgcmVwbGllcy4gSSBmb3Vu
ZCB0aGF0IGdtYWlsIHN1cHBvcnRzIGJvdHRvbS1wb3N0aW5nIHNvIEkgd2lsbCBiZSByZXBseWlu
ZyBpbmxpbmUgZnJvbSBnbWFpbCBuZXh0IHRpbWUuIEkgd2lsbCBzZW5kIHRoZSBuZXh0IHBhdGNo
IHVzaW5nIGdpdCBzZW5kLWVtYWlsLg0KDQpMb29rcyBsaWtlIGl0IGhhcyBiZWVuIHRoZXJlIGlu
IGNyYXNoIHNvdXJjZSBmb3IgdmVyeSBsb25nLg0KDQpzdG9yZV9tb2R1bGVfc3ltYm9sc192Mg0K
ICAgICAgICBzcHJpbnRmKGJ1ZjIsICIlcyVzIiwgIl9NT0RVTEVfU1RBUlRfIiwgbW9kX25hbWUp
Ow0KICAgICAgICAgICAgc3ByaW50ZihidWYzLCAiJXMlcyIsICJfTU9EVUxFX0lOSVRfU1RBUlRf
IiwgbW9kX25hbWUpOw0KDQpJIHdpbGwgdGVzdCBpdCBmaXJzdCBvbiBsYXRlc3QgdWJ1bnR1IHdo
aWNoIGhhcyBrZXJuZWwgdmVyc2lvbiA1LjEzLjAtMjIuDQoNClZpbWFsDQoNCu+7vy0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAaW5mcmFk
ZWFkLm9yZz4gb24gYmVoYWxmIG9mIEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwub3Jn
Pg0KRGF0ZTogRnJpZGF5LCAxMCBEZWNlbWJlciAyMDIxIGF0IDI6MTAgQU0NClRvOiBWaW1hbCBB
Z3Jhd2FsIDxWaW1hbC5BZ3Jhd2FsQHNvcGhvcy5jb20+DQpDYzogTWFzYWhpcm8gWWFtYWRhIDxt
YXNhaGlyb3lAa2VybmVsLm9yZz4sIE1pY2hhbCBNYXJlayA8bWljaGFsLmxrbWxAbWFya292aS5u
ZXQ+LCBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4sIEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4sIEplZmYgTWFob25leSA8amVmZm1Ac3VzZS5jb20+LCBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+LCAibGludXgta2J1aWxkQHZnZXIua2VybmVs
Lm9yZyIgPGxpbnV4LWtidWlsZEB2Z2VyLmtlcm5lbC5vcmc+LCAiamV5dUBrZXJuZWwub3JnIiA8
amV5dUBrZXJuZWwub3JnPiwgImxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmciIDxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSF0ga2VybmVsL21vZHVs
ZS5jOiBmaXggZm9yIHN5bWJvbCBkZWNvZGUgaW4gc3RhY2sgdHJhY2UgZm9yIHN0cmlwcGVkIG1v
ZHVsZXMNCg0KICAgIE9uIFRodSwgRGVjIDA5LCAyMDIxIGF0IDA1OjM3OjQ4QU0gKzAwMDAsIFZp
bWFsIEFncmF3YWwgd3JvdGU6DQogICAgPiBIaSBMdWlzLA0KICAgID4gDQogICAgPiBNeSByZXBs
aWVzIGluLWxpbmUgdW5kZXIgVmltYWw+Pg0KICAgID4gDQogICAgPiBUaGFua3MsDQogICAgPiBW
aW1hbA0KICAgID4gDQogICAgPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAgID4gRnJv
bTogTHVpcyBDaGFtYmVybGFpbiA8bWNncm9mQGluZnJhZGVhZC5vcmc+IG9uIGJlaGFsZiBvZiBM
dWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4NCiAgICA+IERhdGU6IFRodXJzZGF5
LCA5IERlY2VtYmVyIDIwMjEgYXQgMTowMyBBTQ0KICAgID4gVG86IFZpbWFsIEFncmF3YWwgPFZp
bWFsLkFncmF3YWxAc29waG9zLmNvbT4sIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5l
bC5vcmc+LCBNaWNoYWwgTWFyZWsgPG1pY2hhbC5sa21sQG1hcmtvdmkubmV0PiwgTmljayBEZXNh
dWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+LCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+LCBKZWZmIE1haG9uZXkgPGplZmZtQHN1c2UuY29tPiwgU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPiwgImxpbnV4LWtidWlsZEB2Z2VyLmtlcm5lbC5vcmciIDxsaW51eC1r
YnVpbGRAdmdlci5rZXJuZWwub3JnPg0KICAgID4gQ2M6ICJqZXl1QGtlcm5lbC5vcmciIDxqZXl1
QGtlcm5lbC5vcmc+LCAibGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyIgPGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+DQogICAgPiBTdWJqZWN0OiBSZTogW1BBVENIXSBrZXJuZWwvbW9k
dWxlLmM6IGZpeCBmb3Igc3ltYm9sIGRlY29kZSBpbiBzdGFjayB0cmFjZSBmb3Igc3RyaXBwZWQg
bW9kdWxlcw0KICAgID4gDQogICAgPiAgICAgVGhhbmtzIGZvciB5b3VyIHBhdGNoISBJIHdpbGwg
bm90ZSB0byBzdGFydCBvZmYgd2l0aCB0aGF0IHVuZm9ydHVuYXRlbHkNCiAgICA+ICAgICB3aGF0
ZXZlciBpdCBpcyB5b3UgdXNlIHRvIHNlbmQgZW1haWxzIGxlYXZlcyB0aGVtIHdpdGggVVRGIGVu
Y29kaW5ncw0KICAgID4gICAgIHdoaWNoIGRvZXMgbm90IGxldCBtZSBlYXNpbHkgZG93bmxvYWQg
dGhlIHBhdGNoZXMgdXNpbmcgbG9yZS4gRm9yDQogICAgPiAgICAgaW5zdGFuY2UsIHRoaXMgaXMg
d2hhdCBJIHNlZToNCiAgICA+IA0KICAgID4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8xMDZGMjNGRC0zNzY4LTRDRjAtODkzRC1FREZFNEEwQkEyQkZAc29waG9zLmNvbS9yYXcNCiAg
ICA+IA0KICAgID4gICAgIEhlcmUgaXMgYW4gZXhhbXBsZSBvZiBhIGdvb2QgcGF0Y2g6DQogICAg
PiANCiAgICA+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTExMjkwMzQ1MDku
MjY0Njg3Mi0yLW1pbmcubGVpQHJlZGhhdC5jb20vcmF3DQogICAgPiANCiAgICA+ICAgICBXaGF0
IGFyZSB5b3UgdXNpbmcgdG8gc2VuZCBwYXRjaGVzPyBDb25zaWRlciB1c2luZyBnaXQgc2VuZC1l
bWFpbC4NCiAgICA+ICAgICBJIHRoaW5rIHlvdXIgbWFpbGVyIGlzIHNlbmRpbmcgdGhlIGVtYWls
cyBvdXQgYXMgTUlNRSBhdHRhY2htZW50cy4NCiAgICA+IFZpbWFsPj4gSSBhbSB1c2luZyBvdXRs
b29rIGFwcCBvbiBtYWMgYW5kIEkgY2hhbmdlZCBmb3JtYXQgdG8gdXNlICJwbGFpbiBmb3JtYXQg
dGV4dCIuIEkgd2lsbCB1c2UgZ2l0IHNlbmQtZW1haWwgZnJvbSBuZXh0IHRpbWUgZm9yIHBhdGNo
ZXMuDQogICAgPiBUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4NCg0KICAgIE9oIG15LiBFdmVu
IHlvdXIgcmVwbGllcyBkbyBub3QgZm9sbG93IHR5cGljYWwgZGV2ZWxvcG1lbnQgc3R5bGUgYmVz
dA0KICAgIHByYWN0aWNlcy4gSSByZWNvbW1lbmQgdHJ5aW5nIGEgTWFpbCBVc2VyIEFnZW50IGxp
a2UgbXV0dCBvciBhbnl0aGluZw0KICAgIHRoYXQgY2FuIGxldCB5b3UgcmVwbHkgYm90dG9tIHN0
eWxlLCBwbGVhc2UgcmVhZDoNCg0KICAgIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1Bv
c3Rpbmdfc3R5bGUjQm90dG9tLXBvc3RpbmcNCg0KICAgIFlvdXIgTVVBIHNldHRpbmcgZm9yICJw
bGFpbiBmb21hdCB0ZXh0IiBzZWVtcyB0byBoYXZlIGxpZWQuDQoNCiAgICBJZiB5b3UgcmVhbGx5
IHdhbnQgYSBHVUkgZm9yIGEgTVVBLCBjb25zaWRlciBUaHVuZGVyYmlyZC4NCiAgICBJIGFtIG5v
dCBzdXJlIHdoYXQgb3RoZXIgb25lcyB0byByZWNvbW1lbmQgZm9yIHRoZSBNYWMuDQoNCiAgICA+
ICAgICBPbiBNb24sIE5vdiAyMiwgMjAyMSBhdCAwMjowMjozMFBNICswMDAwLCBWaW1hbCBBZ3Jh
d2FsIHdyb3RlOg0KICAgID4gICAgID4gSWYga2VybmVsIG1vZHVsZXMgYXJlIHN0cmlwcGVkIG9m
ZiBzeW1ib2xzIChzYXkgYnVpbHQgYnkgdXNpbmcgc3RyaXAgLS0NCiAgICA+ICAgICA+IHN0cmlw
LXVubmVlZGVkKQ0KICAgID4gDQogICAgPiAgICAgT0sgc28gaXMgeW91ciBidWlsZCBzeXN0ZW0g
dXNpbmcgc29tZXRoaW5nIGxpa2U6DQogICAgPiANCiAgICA+ICAgICBtYWtlIGluc3RhbGwgbW9k
dWxlc19pbnN0YWxsIElOU1RBTExfTU9EX1NUUklQPSItLXN0cmlwLXVubmVlZGVkIg0KICAgID4g
DQogICAgPiAgICAgQXQgbGVhc3QgdGhhdCdzIG9uZSB3YXkgdG8gc3RyaXAgbW9kdWxlcyB1c2lu
ZyB1cHN0cmVhbSB0ZWNobmlxdWVzIHNpbmNlDQogICAgPiAgICAgdGhlIDIuNiBrZXJuZWwgZGF5
cy4gQmVjYXVzZSBpdCB3b3VsZCBiZSB3aXNlIGZvciB1cyB0byBkb2N1bWVudCAqaG93KiB0bw0K
ICAgID4gICAgIHJlcHJvZHVjZSB0aGUgaXNzdWUgeW91IGFyZSBzZWVpbmcgaW4geW91ciBjb21t
aXQgbG9nLg0KICAgID4gVmltYWw+PiB5ZXMsIG91ciBidWlsZCB1c2VzIElOU1RBTExfTU9EX1NU
UklQPSItLXN0cmlwLXVubmVlZGVkIg0KDQogICAgT2sgZ3JlYXQgdGhlIGNvbW1pdCBsb2cgc2hv
dWxkIGluZGljYXRlIHRoaXMuDQoNCiAgICA+ICAgICA+IHRoZW4gc3RhY2sgdHJhY2VzIGluIGRt
ZXNnIGRvIG5vdCBzaG93IG1vZHVsZSBuYW1lIG9yDQogICAgPiAgICAgPiBzeW1ib2wgbmFtZSBm
b3IgYWRkcmVzc2VzLg0KICAgID4gDQogICAgPiAgICAgYXMgaW50ZW5kZWQuIFNvIHRoZXJlIGlz
IGFjdHVhbGx5IG5vIGlzc3VlIGFuZCB5b3VyIHBhdGNoIGlzIG5vdCBhIGZpeC4NCiAgICA+ICAg
ICBJdCBpcyBhbiBvcHRpbWl6YXRpb24gdG8gaGVscCByZWFkZXJzIHdpdGggYSBoaW50LiBTbyBp
ZiB3ZSBnZXQgYW55d2hlcmUNCiAgICA+ICAgICB3aXRoIHRoaXMgcGF0Y2ggSSdkIHNheSBjaGFu
Z2UgdGhlIHN1YmplY3QgdG8gcmVsYXRlIGl0IHRvDQogICAgPiAgICAgYSBoZXVyaXN0aWMgZW5o
YW5jZW1lbnQgZm9yIElOU1RBTExfTU9EX1NUUklQIHdoZW4gLS1zdHJpcC11bm5lZWRlZCBpcyB1
c2VkLg0KICAgID4gVmltYWw+PiB5ZXMsIHByb2JsZW0gaXMgb25seSB3aGVuIC0tc3RyaXAtdW5u
ZWVkZWQgb3B0aW9uIGlzIHVzZWQgdG8gc3RyaXAgdGhlIG1vZHVsZXMuDQoNCiAgICBJdCBpcyBu
b3QgYSBwcm9ibGVtLCBpdCBpcyBieSBkZXNpZ24uDQoNCiAgICA+ICAgICA+IEl0IGp1c3QgcHJp
bnRzIGFic29sdXRlIGFkZHJlc3MgKCB3aXRob3V0IGFueQ0KICAgID4gICAgID4gcmVmZXJlbmNl
IG9mIG1vZHVsZSkNCiAgICA+ICAgICA+IGUuZy4NCiAgICA+ICAgICA+IA0KICAgID4gICAgID4g
WzI0NTg2NC42OTk1ODBdICBkb19ubWkrMHgxMmYvMHgzNzANCiAgICA+ICAgICA+IFsyNDU4NjQu
Njk5NTgzXSAgZW5kX3JlcGVhdF9ubWkrMHgxNi8weDUwDQogICAgPiAgICAgPiBbMjQ1ODY0LjY5
OTU4NV0gUklQOiAwMDEwOjB4ZmZmZmZmZmZjMDZiNjdlYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDw8PDw8PDw8DQogICAgPiAgICAgPiBbMjQ1ODY0LjY5OTU4NV0gUlNQOiAwMDAwOmZmZmZh
YWE1NDBjZmZlNDggRUZMQUdTOiAwMDAwMDA5Nw0KICAgID4gICAgID4gWzI0NTg2NC42OTk1ODZd
IFJBWDogMDAwMDAwMDAwMDAwMDAwMSBSQlg6IGZmZmY5MzM1N2E3MjkwMDAgUkNYOiAwMDAwMDAw
MDAwMDAwMDAxDQogICAgPiAgICAgPiBbMjQ1ODY0LjY5OTU4N10gUkRYOiBmZmZmOTMzNTdhNzI5
MDUwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6IGZmZmY5MzM1N2E3MjkwMDANCiAgICA+ICAg
ICA+IFsyNDU4NjQuNjk5NTg4XSBSQlA6IGZmZmY5MzM1Y2Y1MjEzMDAgUjA4OiAwMDAwMDAwMDAw
MDAwMDAxIFIwOTogMDAwMDAwMDAwMDAwMDAwNA0KICAgID4gICAgID4gWzI0NTg2NC42OTk1ODhd
IFIxMDogZmZmZmFhYTU0NWIyM2VkMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDEgUjEyOiBmZmZmZmZm
ZmMwNmI2MWEwDQogICAgPiAgICAgPiBbMjQ1ODY0LjY5OTU4OV0gUjEzOiBmZmZmYWFhNTQwY2Zm
ZTYwIFIxNDogZmZmZjkzMzVjNzdmYTNjMCBSMTU6IGZmZmY5MzM1Y2Y1MWQ3YzANCiAgICA+ICAg
ICA+IFsyNDU4NjQuNjk5NTkwXSAgPyAweGZmZmZmZmZmYzA2YjYxYTANCiAgICA+ICAgICA+IFsy
NDU4NjQuNjk5NTkyXSAgPyAweGZmZmZmZmZmYzA2YjY3ZWMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPDw8PDw8PDwNCiAgICA+ICAgICA+IFsyNDU4NjQuNjk5NTkzXSAgPyAweGZm
ZmZmZmZmYzA2YjY3ZWMNCiAgICA+ICAgICA+IFsyNDU4NjQuNjk5NTk0XSAgPC9OTUk+DQogICAg
PiAgICAgPiANCiAgICA+ICAgICA+IE5vdGUgUklQOiAwMDEwOjB4ZmZmZmZmZmZjMDZiNjdlYyBh
bmQgMHhmZmZmZmZmZmMwNmI2N2VjIHByaW50ZWQgaW4gYWJvdmUNCiAgICA+ICAgICA+IHN0YWNr
IHRyYWNlIGFzIGFic29sdXRlIGFkZHJlc3MuDQogICAgPiAgICAgPiBUaGVyZSBpcyBubyBlYXN5
IHdheSBpbiBjYXNlIGJveCBjcmFzaGVzIGFzIHdlIGxvb3NlIC9wcm9jL21vZHVsZXMgdG8gc2Vl
DQogICAgPiAgICAgPiBsb2FkIGFkZHJlc3Mgb2YgbW9kdWxlcyB0byBtYXAgYWRkcmVzcyB0byBv
bmUgc3BlY2lmaWMgbW9kdWxlLiBJdCB3aWxsIGJlDQogICAgPiAgICAgPiByZWFsbHkgZ29vZCB0
byBnaXZlIHNvbWUgaGludCBvZiBtb2R1bGUgYW5kIG9mZnNldCBpbnNpZGUgbW9kdWxlIHNlY3Rp
b24NCiAgICA+ICAgICA+IGFib3V0IHN1Y2ggYWRkcmVzc2VzLg0KICAgID4gICAgID4gDQogICAg
PiAgICAgPiBzbyBjaGFuZ2VkIGtlcm5lbC9tb2R1bGUuYyBzbyB0aGF0IGl0IGNhbiBkZWNvZGUg
YWRkcmVzcyB0byBfTU9EVUxFX1NUQVJUXysNCiAgICA+ICAgICA+IG9mZnNldC9zaXplIG9yIF9N
T0RVTEVfSU5JVF8rb2Zmc2V0L3NpemUgZGVwZW5kaW5nIG9uIHdoZXJlIHRoZSBhZGRyZXNzDQog
ICAgPiAgICAgPiBsaWVzIChpbiBjb3JlLy50ZXh0IG9yIGluaXQvLmluaXQudGV4dCBzZWN0aW9u
IG9mIG1vZHVsZSkuDQogICAgPiAgICAgPiANCiAgICA+ICAgICA+IGUuZy4gbmZubV9xdWV1ZV9u
ZXRfaW5pdCsweDJmMS8weDM5MyBbbmZuZXRtYXBfcXVldWVdIHByaW50ZWQgaW4gY2FzZSBvZg0K
ICAgID4gICAgID4gc3ltYm9scyBwcmVzZW50IHNob3dzIHVwIGFzIDAwMTA6MHhmZmZmZmZmZmMw
NmI2N2VjIGluIGNhc2Ugc3ltYm9scyBhcmUNCiAgICA+ICAgICA+IGFic2VudC4gV2l0aCBtb2Rp
ZmllZCBsb2dpYywgaXQgd2lsbCBiZSBzaG93biBhcyBfTU9EVUxFX0lOSVRfKzB4MmYxLzB4Mzkz
DQogICAgPiAgICAgPiBbbmZuZXRtYXBfcXVldWVdDQogICAgPiAgICAgPiANCiAgICA+ICAgICA+
IFRoaXMgd2lsbCBoZWxwIGZvciBkZXZlbG9wZXIgdG8gZGVidWcgYW5kIG1hcCB0aGlzIHRvIGFj
dHVhbCBuZm5tX3F1ZXVlX25ldA0KICAgID4gICAgID4gX2luaXQgc3ltYm9sIGxhdGVyLiBPbmUg
Y2FuIHVzZSBvYmpkdW1wL3JlYWRlbGYvbm0gdG8gZmluZCBzeW1ib2xzIHdpdGgNCiAgICA+ICAg
ICA+IG9mZnNldCBpbiAuaW5pdC50ZXh0IGFuZCAudGV4dCBzZWN0aW9ucy4NCiAgICA+ICAgICA+
IA0KICAgID4gICAgID4gdGVzdHMgZG9uZToNCiAgICA+ICAgICA+ID09PT09PT09PT09DQogICAg
PiAgICAgPiAxLiBhZGRlZCBXQVJOX09OX09ORSgxKSBpbiBpbml0X21vZHVsZSBvZiBhIG1vZHVs
ZQ0KICAgID4gICAgID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KICAgID4gICAgID4gWzUzLjc5NTk3N10gdGFzazogZmZmZjlkNjAwOTRiMzAw
MCB0YXNrLnN0YWNrOiBmZmZmOWQ2MDJjNzA0MDAwDQogICAgPiAgICAgPiBbNTMuNzk1OTc4XSBS
SVA6IDAwMTA6X01PRFVMRV9JTklUXysweDJmMS8weDM5MyBbbmZuZXRtYXBfcXVldWVdICAgPD09
PT09DQogICAgPiANCiAgICA+ICAgICBIdWgsIGlmIHRoZSBtb2R1bGUgaXMgYWxyZWFkeSBwcmlu
dGVkICh0aGUgW25mbmV0bWFwX3F1ZXVlXSkgd2h5IGV2ZW4NCiAgICA+ICAgICBoYXZlIF9NT0RV
TEVfSU5JVF8gYW5kIGluc3RlYWQgd2UganVzdCBzYXk6DQogICAgPiANCiAgICA+ICAgICBbNTMu
Nzk1OTc4XSBSSVA6IDAwMTA6W21vZHVsZSBfX2luaXRdKzB4MmYxLzB4MzkzIFtuZm5ldG1hcF9x
dWV1ZV0NCiAgICA+IA0KICAgID4gICAgIFRoaXMgd2F5IGlmIHlvdSBjb21lIHVwIHdpdGggb3Ro
ZXIgaGV1cmlzdGljcyB0aGlzIGNhbiBhbHNvIGJlIHB1dCBpbg0KICAgID4gICAgIHRoZSBbXSBh
bmQgd2UnZCBkb2N1bWVudCB0aGF0Lg0KICAgID4NCiAgICA+IFZpbWFsPj4gSSBhbSBmaW5lIHdp
dGggdGhhdC4gSSB1c2VkIF9NT0RVTEVfSU5JVF8gYW5kIF9NT0RVTEVfU1RBUlRfDQogICAgPiBi
ZWNhdXNlIEkgc2VlIHNvbWV0aGluZyBzaW1pbGFyIGJlaW5nIHJlcG9ydGVkIGJ5IGJ0IGNvbW1h
bmQgaW4gY3Jhc2gNCiAgICA+IHV0aWxpdHkgaW4gdGhlc2UgY2FzZXMuICBTbyBJIHRvb2sgcmVm
ZXJlbmNlIG9mIHRoYXQuIFNlZSBmb2xsb3dpbmcgYnQNCiAgICA+IGZyb20gY3Jhc2ggdXRpbGl0
eTogPDwNCg0KICAgIE9oIGJveSByZWFkaW5nIHlvdXIgcmVwbGllcyBpcyByZWFsbHkgZGlmZmlj
dWx0LiBQbGVhc2UgcGxlYXNlIHVzZSBhbg0KICAgIE1VQSB0aGF0IGxldHMgeW91IHJlcGx5IHVz
aW5nIGJvdHRvbSBzdHlsZSwgZG9uJ3QgZG8gdGhlIFZpbWFsPj4gdGhpbmcNCiAgICBhbmQgaW5z
dGVhZCB1c2UgdGhlICI+IiBhbmQgbGV2ZWxzIG9mIHRoYXQgdG8gaW1wbHkgd2hhdCB3YXMgc2Fp
ZCBsYXN0Lg0KICAgIFRoZSB3aWtpcGVkaWEgYXJ0aWNsZSBoYXMgZXhhbXBsZXMgb2YgdGhhdCBh
bmQgeW91IGNhbiBzZWUgb3RoZXINCiAgICBtYWlsaW5nIGxpc3QgZXhjaGFuZ2VzIGZvciBob3cg
dGhpcyBpcyBkb25lLiBBbHNvIGRvbid0IG1ha2UgbG9uZyBsaW5lcy4NCg0KICAgID4gIzYgW2Zm
ZmY5OWNkYzA1OWI4YzBdIF9NT0RVTEVfU1RBUlRfYWN0X21pcnJlZCBhdCBmZmZmZmZmZmMwNmNk
N2VlIFthY3RfbWlycmVkXQ0KICAgID4gICM3IFtmZmZmOTljZGMwNTliOTAwXSB0Y2ZfYWN0aW9u
X2V4ZWMgYXQgZmZmZmZmZmY4NjRjNTdiYw0KICAgID4gICM4IFtmZmZmOTljZGMwNTliOTQ4XSBf
TU9EVUxFX1NUQVJUX2Nsc191MzIgYXQgZmZmZmZmZmZjMDZkMjYyMCBbY2xzX3UzMl0NCg0KICAg
IEFoLCBpbnRlcnN0aW5nLCB0aGVuIGl0IGlzIHNvbWV0aGluZyB0byBjb25zaWRlci4NCg0KICAg
IENhbiB5b3UgZmluZCB0aGUgY29tbWl0IGZvciBjcmFzaCBidCB0aGF0IGFkZGVkIHRoYXQgaGV1
cmlzdGljPyBJJ20NCiAgICBjdXJpb3VzIHRvIHNlZSB3aHkgdGhleSBvcHRlZCBmb3IgX01PRFVM
RV9TVEFSVC4NCg0KICAgID4gSXQgaXMgZm9sbG93aW5nIGZvcm1hdCBvZiBfTU9EVUxFX1NUQVJU
Xzxtb2R1bGVfbmFtZT4uIEFzIEkgc2F3IG1vZHVsZSBuYW1lIGFscmVhZHkgYXQgdGhlIGVuZCB1
bmRlciBbXSBzbyBJIHJlbW92ZWQgdGhlIG1vZHVsZSBuYW1lLg0KICAgID4gDQogICAgPiAgICAg
PiBbNTMuNzk1OTc5XSBSU1A6IDAwMTg6ZmZmZjlkNjAyYzcwN2M0MCBFRkxBR1M6IDAwMDEwMjg2
DQogICAgPiAgICAgPiBbNTMuNzk1OTgwXSBSQVg6IDAwMDAwMDAwMDAwMDAwNDcgUkJYOiBmZmZm
OWQ2MDBiNGMwODAwIFJDWDogMDAwMDAwMDAwMDAwMDAwNg0KICAgID4gICAgID4gWzUzLjc5NTk4
MF0gUkRYOiAwMDAwMDAwMDAwMDAwMDA3IFJTSTogMDAwMDAwMDAwMDAwMDA5NiBSREk6IGZmZmY5
ZDYwM2ZjMTcyZjANCiAgICA+ICAgICA+IFs1My43OTU5ODFdIFJCUDogMDAwMDAwMDAwMDAwMDAw
MCBSMDg6IDAwMDAwMDAwMDAwMDA0YmQgUjA5OiAwMDAwMDAwMDAwMDAwMDAyDQogICAgPiAgICAg
PiBbNTMuNzk1OTgxXSBSMTA6IGZmZmZmZmZmYzIyNTAwODMgUjExOiAwMDAwMDAwMDAwMDAwMDAx
IFIxMjogZmZmZjlkNWZiNzg1YTg3MA0KICAgID4gICAgID4gWzUzLjc5NTk4Ml0gUjEzOiAwMDAw
MDAwMGZmZmZmZmY0IFIxNDogZmZmZjlkNWZiNzg1YTgwMCBSMTU6IDAwMDAwMDAwMDAwMDAwMDAN
CiAgICA+ICAgICA+IFs1My43OTU5ODNdIEZTOiAgMDAwMDdmZmI3M2MyYWI4MCgwMDAwKSBHUzpm
ZmZmOWQ2MDNmYzAwMDAwKDAwMDApDQogICAgPiAgICAgPiBbNTMuNzk1OTgzXSBDUzogIDAwMTAg
RFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQogICAgPiAgICAgPiBbNTMu
Nzk1OTg0XSBDUjI6IDAwMDAwMDAwZjc2ZTYyNzAgQ1IzOiAwMDAwMDAwMTA3YzBjMDA2IENSNDog
MDAwMDAwMDAwMDE2MDZmMA0KICAgID4gICAgID4gWzUzLjc5NjAxNF0gRFIwOiAwMDAwMDAwMDAw
MDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDANCiAgICA+
ICAgICA+IFs1My43OTYwMTRdIERSMzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZm
ZTBmZjAgRFI3OiAwMDAwMDAwMDAwMDAwNDAwDQogICAgPiAgICAgPiBbNTMuNzk2MDE1XSBDYWxs
IFRyYWNlOg0KICAgID4gICAgID4gWzUzLjc5NjAyMl0gIG9wc19pbml0LmNvbnN0cHJvcC44KzB4
ODEvMHgxMTANCiAgICA+ICAgICA+IFs1My43OTYwMjRdICByZWdpc3Rlcl9wZXJuZXRfb3BlcmF0
aW9ucysweDkyLzB4YzANCiAgICA+ICAgICA+IFs1My43OTYwMjZdICA/IF9NT0RVTEVfSU5JVF8r
MHgzOTMvMHgzOTMgW25mbmV0bWFwX3F1ZXVlXSAgICAgICAgICA8PT09PT09DQogICAgPiAgICAg
PiBbNTMuNzk2MDI3XSAgcmVnaXN0ZXJfcGVybmV0X3N1YnN5cysweDFmLzB4NDANCiAgICA+ICAg
ICA+IFs1My43OTYwMjhdICBpbml0X21vZHVsZSsweDUxLzB4YzZkIFtuZm5ldG1hcF9xdWV1ZV0N
CiAgICA+ICAgICA+IFs1My43OTYwMzFdICBkb19vbmVfaW5pdGNhbGwrMHgzNi8weDE2MA0KICAg
ID4gICAgID4gDQogICAgPiAgICAgPiAyLiBhZGRlZCBhIGNhbGwgdG8gc3ByaW50X3N5bWJvbCBp
biBhIG1vZHVsZQ0KICAgID4gICAgID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQogICAgPiAgICAgPiAkIGRlY29kZSBmb3Igc3ltYm9sIG5mbm1fcXVldWVf
Zmx1c2grMTY6DQogICAgPiAgICAgPiBfTU9EVUxFX1NUQVJUXysweDdlMC8weDFkYWEgW25mbmV0
bWFwX3F1ZXVlXSAgICAgICAgICAgICAgICAgICAgICAgPD09PT09PQ0KICAgID4gICAgID4gDQog
ICAgPiAgICAgPiAkIG5tIG5mbmV0bWFwX3F1ZXVlLmtvIHwgZ3JlcCBfZmx1c2gNCiAgICA+ICAg
ICA+IDAwMDAwMDAwMDAwMDA3ZDAgdCBuZm5tX3F1ZXVlX2ZsdXNoDQogICAgPiAgICAgPiAweDdk
MCArIDE2ZCA9IDB4N2UwIHNvIHRoaXMgb2Zmc2V0IG1hcHMgdG8gc3ltYm9sIG5mbm1fcXVldWVf
Zmx1c2gNCiAgICA+ICAgICA+IA0KICAgID4gICAgID4gdGVzdGVkIG9uIGtlcm5lbCA0LjE0LjM4
DQogICAgPiAgICAgPiANCiAgICA+ICAgICA+IFNpZ25lZC1vZmYtYnk6IFZpbWFsIEFncmF3YWwg
PHZpbWFsLmFncmF3YWxAc29waG9zLmNvbT4NCiAgICA+ICAgICA+IC0tLQ0KICAgID4gICAgID4g
IGtlcm5lbC9tb2R1bGUuYyB8IDIxICsrKysrKysrKysrKysrKysrLS0tLQ0KICAgID4gICAgID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KICAgID4g
ICAgID4gDQogICAgPiAgICAgPiBkaWZmIC0tZ2l0IGEva2VybmVsL21vZHVsZS5jIGIva2VybmVs
L21vZHVsZS5jDQogICAgPiAgICAgPiBpbmRleCA4NGE5MTQxYTVlMTUuLmQ1NWZiODQwNTE1MSAx
MDA2NDQNCiAgICA+ICAgICA+IC0tLSBhL2tlcm5lbC9tb2R1bGUuYw0KICAgID4gICAgID4gKysr
IGIva2VybmVsL21vZHVsZS5jDQogICAgPiAgICAgPiBAQCAtNDI1OSwxMiArNDI1OSwxOSBAQCBz
dGF0aWMgY29uc3QgY2hhciAqZmluZF9rYWxsc3ltc19zeW1ib2woc3RydWN0IG1vZHVsZSAqbW9k
LA0KICAgID4gICAgID4gICAgICAgICB1bnNpZ25lZCBpbnQgaSwgYmVzdCA9IDA7DQogICAgPiAg
ICAgPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbmV4dHZhbCwgYmVzdHZhbDsNCiAgICA+ICAgICA+
ICAgICAgICAgc3RydWN0IG1vZF9rYWxsc3ltcyAqa2FsbHN5bXMgPSByY3VfZGVyZWZlcmVuY2Vf
c2NoZWQobW9kLT5rYWxsc3ltcyk7DQogICAgPiAgICAgPiArICAgICAgIGNoYXIgKm1vZHVsZV9i
YXNlX25hbWUgPSAiX01PRFVMRV9TVEFSVF8iOw0KICAgID4gDQogICAgPiAgICAgSSBkb24ndCB0
aGluayAiX01PRFVMRV9TVEFSVF8iIHRlbGxzIHRoZSB1c2VyIGFueXRoaW5nIGNsZWFyLg0KICAg
ID4gICAgIElmIHdlJ3JlIGdvaW5nIHRvIHVzZSBoZXVyaXN0aWNzIGJlc3Qgd2UgdXNlIGEgbm9t
ZW5jbGF0dXJlIHdlDQogICAgPiAgICAgY2FuIGV4cGFuZCBsYXRlciBhbmQgbm90IGJlIGNyeXB0
aWMuDQogICAgPiANCiAgICA+ICAgICBTbyBtYXliZSBqdXN0IFttb2R1bGVdIGlzIGdvb2QgZW5v
dWdoLg0KICAgID4gVmltYWw+PiBBcyBtZW50aW9uZWQgYWJvdmUsIEkganVzdCB0b29rIHJlZmVy
ZW5jZSBmcm9tIGJ0IG91dHB1dCBvZiBjcmFzaCB1dGlsaXR5LiBQcm9ibGVtIGlzIHNvbWUgc3lt
Ym9sIHdpbGwgYmUgZnJvbSBpbml0IHNlY3Rpb24gaW4gbW9kdWxlLiBTbyB1c2VyIG5lZWRzIHRv
IGtub3cgaWYgaXQgYmVsb25ncyB0byBjb3JlIG9yIGluaXQgc2VjdGlvbiBvZiBtb2R1bGUgc28g
dGhhdCBpdCBjYW4gYmUgZGVjb2RlZCBtYW51YWxseSBsYXRlci4gV2UgbmVlZCBzb21lIGhpbnQg
Zm9yIHVzZXIgdG8gc3VnZ2VzdCBpZiBpdCBpcyBwYXJ0IG9mIGluaXQgc2VjdGlvbiBvciBub3Qu
DQogICAgPiBBcmUgeW91IHN1Z2dlc3RpbmcgW21vZHVsZV0gZm9yIGFkZHJlc3MgaW4gY29yZSBz
ZWN0aW9uIGFuZCBbbW9kdWxlIF9faW5pdF0gKHdpdGggc3BhY2UgYmV0d2VlbiBtb2R1bGUgYW5k
IF9pbml0KSBmb3IgaW5pdCBzZWN0aW9uPyANCg0KICAgIFllcyBteSBzdWdnZXN0aW9uIHdhczoN
Cg0KICAgIFttb2R1bGVdDQogICAgW21vZHVsZSBfX2luaXRdDQoNCiAgICBJIHRoaW5rIHRoYXQg
aW1wbGllcyBhIGhldXJpc3RpYyB3aXRoIHRoZSBicmFja2V0cyBhbmQgdGhlIHJlc3QgaXMNCiAg
ICBwcmV0dHkgc2VsZiBleHBsYW5hdG9yeS4gX01PRFVMRV9TVEFSVF8gc2VlbXMgY3J5cHRpYy4g
QnV0IEknbSBjdXJpb3VzDQogICAgd2h5IGNyYXNoIGJ0IHdlbnQgd2l0aCB0aGF0LiBTbyBpZiB5
b3UgY2FuIGxvb2sgaW50byB0aGF0IGl0IHdvdWxkIGJlDQogICAgYXBwcmVjaWF0ZWQuDQoNCiAg
ICA+ICAgICBXZSBkb24ndCBoYXZlIHRvIGluaXRpYWxpemUgdGhpcyBhcyB3ZWxsLCBhcyBpdHMg
ZWl0aGVyIG9uZSBvciB0aGUgb3RoZXIuDQogICAgPiBWaW1hbD4+IHllcy4gSSB3aWxsIGZpeCBp
dC4NCiAgICA+IA0KICAgID4gICAgID4gKyAgICAgICB1bnNpZ25lZCBsb25nIG1vZHVsZV9iYXNl
X2FkZHJlc3MgPSAwOw0KICAgID4gICAgID4gDQogICAgPiAgICAgPiAgICAgICAgIC8qIEF0IHdv
cnNlLCBuZXh0IHZhbHVlIGlzIGF0IGVuZCBvZiBtb2R1bGUgKi8NCiAgICA+ICAgICA+IC0gICAg
ICAgaWYgKHdpdGhpbl9tb2R1bGVfaW5pdChhZGRyLCBtb2QpKQ0KICAgID4gICAgID4gKyAgICAg
ICBpZiAod2l0aGluX21vZHVsZV9pbml0KGFkZHIsIG1vZCkpIHsNCiAgICA+ICAgICA+ICAgICAg
ICAgICAgICAgICBuZXh0dmFsID0gKHVuc2lnbmVkIGxvbmcpbW9kLT5pbml0X2xheW91dC5iYXNl
K21vZC0+aW5pdF9sYXlvdXQudGV4dF9zaXplOw0KICAgID4gICAgID4gLSAgICAgICBlbHNlDQog
ICAgPiAgICAgPiArICAgICAgICAgICAgICAgbW9kdWxlX2Jhc2VfYWRkcmVzcyA9ICh1bnNpZ25l
ZCBsb25nKW1vZC0+aW5pdF9sYXlvdXQuYmFzZTsNCiAgICA+ICAgICA+ICsgICAgICAgICAgICAg
ICBtb2R1bGVfYmFzZV9uYW1lID0gIl9NT0RVTEVfSU5JVF8iOw0KICAgID4gICAgID4gKyAgICAg
ICB9IGVsc2Ugew0KICAgID4gICAgID4gICAgICAgICAgICAgICAgIG5leHR2YWwgPSAodW5zaWdu
ZWQgbG9uZyltb2QtPmNvcmVfbGF5b3V0LmJhc2UrbW9kLT5jb3JlX2xheW91dC50ZXh0X3NpemU7
DQogICAgPiAgICAgPiArICAgICAgICAgICAgICAgbW9kdWxlX2Jhc2VfYWRkcmVzcyA9ICh1bnNp
Z25lZCBsb25nKW1vZC0+Y29yZV9sYXlvdXQuYmFzZTsNCiAgICA+ICAgICA+ICsgICAgICAgICAg
ICAgICBtb2R1bGVfYmFzZV9uYW1lID0gIl9NT0RVTEVfU1RBUlRfIjsNCiAgICA+ICAgICA+ICsg
ICAgICAgfQ0KICAgID4gICAgID4gDQogICAgPiAgICAgPiAgICAgICAgIGJlc3R2YWwgPSBrYWxs
c3ltc19zeW1ib2xfdmFsdWUoJmthbGxzeW1zLT5zeW10YWJbYmVzdF0pOw0KICAgID4gICAgID4g
DQogICAgPiAgICAgPiBAQCAtNDI5NSw4ICs0MzAyLDE0IEBAIHN0YXRpYyBjb25zdCBjaGFyICpm
aW5kX2thbGxzeW1zX3N5bWJvbChzdHJ1Y3QgbW9kdWxlICptb2QsDQogICAgPiAgICAgPiAgICAg
ICAgICAgICAgICAgICAgICAgICBuZXh0dmFsID0gdGhpc3ZhbDsNCiAgICA+ICAgICA+ICAgICAg
ICAgfQ0KICAgID4gICAgID4gDQogICAgPiAgICAgPiAtICAgICAgIGlmICghYmVzdCkNCiAgICA+
ICAgICA+IC0gICAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCiAgICA+ICAgICA+ICsgICAgICAg
aWYgKCFiZXN0KSB7DQogICAgPiAgICAgPiArICAgICAgICAgICAgICAgLyogcmV0dXJuIE1PRFVM
RSBiYXNlIGFuZCBvZmZzZXQgZnJvbSBpdCAqLw0KICAgID4gICAgID4gKyAgICAgICAgICAgICAg
IGlmIChzaXplKQ0KICAgID4gICAgID4gKyAgICAgICAgICAgICAgICAgICAgICAgKnNpemUgPSBu
ZXh0dmFsIC0gbW9kdWxlX2Jhc2VfYWRkcmVzczsNCiAgICA+ICAgICA+ICsgICAgICAgICAgICAg
ICBpZiAob2Zmc2V0KQ0KICAgID4gICAgID4gKyAgICAgICAgICAgICAgICAgICAgICAgKm9mZnNl
dCA9IGFkZHIgLSBtb2R1bGVfYmFzZV9hZGRyZXNzOw0KICAgID4gICAgID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBtb2R1bGVfYmFzZV9uYW1lOw0KICAgID4gDQogICAgPiAgICAgSGF2ZSB5b3Ug
dGVzdGVkIHRoaXMgb24gcmVjZW50IGtlcm5lbHM/IElmIG5vdCBwbGVhc2UgdGVzdCB0aGlzIHRo
ZXJlDQogICAgPiAgICAgYXMgSSBjYW5ub3QgcmVwcm9kdWNlIHdpdGggeW91ciBjaGFuZ2VzIHRh
a2luZyBlZmZlY3QgYXQgYWxsLiBJbiBmYWN0DQogICAgPiAgICAgdGhpcyBicmFuY2ggaXMgbm90
IGhpdCBhdCBhbGwuDQogICAgPiBWaW1hbD4+IE5vLiBJIHRlc3RlZCBvbiBrZXJuZWwgNC4xNC4x
NzMgb25seS4gSSB3aWxsIHRlc3Qgb24gbGF0ZXN0IGtlcm5lbC4gSGF2ZSB5b3Ugc3RyaXBwZWQg
dGhlIG1vZHVsZSB1c2luZyAtLXN0cmlwLXVubmVlZGVkPyBJIHNhdyB0aGUgY29kZSBiYXNlIGZv
ciB0aGlzIGZ1bmN0aW9uIGlzIHNhbWUgaW4gbGF0ZXN0IHZzIDQuMTQuMTczIHNvIEkgc2tpcHBl
ZCB0aGUgdGVzdGluZyBwYXJ0IG9uIGxhdGVzdCBrZXJuZWwuIFdpbGwgZG8gdGhhdCBub3cuDQog
ICAgPiANCg0KICAgIFBsZWFzZSB0ZXN0IHdpdGggbGludXgtbmV4dC4gWW91ciBwYXRjaCBzaG91
bGQgYmUgYmFzZWQgb24gbGludXgtbmV4dCBhcw0KICAgIHdlbGwuIFlvdSBjYW4gdGVzdCB5b3Vy
IHN0dWZmIGJ5IGFkZGluZyBhIFdBUk5fT05fT05DRSgxKSB0bw0KICAgIGxpYi90ZXN0X21vZHVs
ZS5jDQoNCiAgICAgIEx1aXMNCg0K
