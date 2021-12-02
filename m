Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD0C465E7A
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Dec 2021 07:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352018AbhLBHBe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Dec 2021 02:01:34 -0500
Received: from mx5.sophos.com ([195.171.192.119]:43282 "EHLO mx5.sophos.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230521AbhLBHBd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Dec 2021 02:01:33 -0500
X-Greylist: delayed 395 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Dec 2021 02:01:32 EST
Received: from mx5.sophos.com (localhost.localdomain [127.0.0.1])
        by localhost (Postfix) with SMTP id 66041F1FEC
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Dec 2021 06:51:35 +0000 (GMT)
Received: from abn-exch5a.green.sophos (unknown [10.224.64.44])
        by mx5.sophos.com (Postfix) with ESMTPS id 57EB2F1D5F
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Dec 2021 06:51:35 +0000 (GMT)
Received: from EUW1-EXCH7A.green.sophos (10.240.64.23) by
 abn-exch5a.green.sophos (10.224.64.44) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 06:51:34 +0000
Received: from EUW1-EXCH7B.green.sophos (10.240.64.122) by
 EUW1-EXCH7A.green.sophos (10.240.64.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Dec 2021 06:51:33 +0000
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.57) by
 EUW1-EXCH7B.green.sophos (10.240.64.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 2 Dec 2021 06:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDLritkIOo7pD0nyYb/dVdvSCCaFt7mLbsI1n7B7z5X7CUyDEnUoPN0g1k5Jr0oRfw0K5deNMoADoYlBQeGt43TUquywmMa0lCNFplpL3oV1jd7/NhPAN4ud9VXhbP6bloum0oECrf6u214XPSbGQHVmwxNLwQKh3LQcFvKqb8mBH+lZ8wUi7ysWlE+wEF/804svGV8ra0M3HDYob+oDNm7HUg5Mc9LCJpwjETZgXlEutSjkNAhxtBKAZhZXF2YWbLTFL7f+tXzBas8qaNjAgRHvj5N5ei8JoTKfCNSGvf9D2nDufM7JLo0/ggZV/WOmkyllj3xoNkdHSNZoCYND2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW5PrvOOhPFPU+4uZKSD3XyPlDW+cO8rKcs6azaLuao=;
 b=ezWoo7lO2pDUpcSpqA+0Sy0fVRPoqsL6YW1V0lZXtSbQ+RKwMcTwPohFeQg4GG/gLZKUkYU9FsRxhC06rf+DpAseQQIq8Udf8ROe1cx3duy0W6ccE1eeZ3eMyxcBP1YyahEnJctUIc2ClbOLsehgAfAMtSSKUWenlmUhCF9X/aTI+Qoly9cbnSEwp40/07A9LkF3b7JfELvvwabeasSBK6nFgSHwxeTdkDztWgDwBHg5w+T0mwY7wR10JKniwlIto9M2Tu5ci8hy1bm8Va6UTHemlrOTewNnmCrxdBody5RUtUgLcVSA7/Stv7JJnzDGucAebBqrUwEn0cWnCzfcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sophos.com; dmarc=pass action=none header.from=sophos.com;
 dkim=pass header.d=sophos.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sophosapps.onmicrosoft.com; s=selector1-sophosapps-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NW5PrvOOhPFPU+4uZKSD3XyPlDW+cO8rKcs6azaLuao=;
 b=qxcXRCntmG7V6DxXPWVwQB9jbc2sUvgUMO3VtnDb2wwS/ZiOr2wzAZvQpOdlljsPGiZ8553PGVlCSnpYD7u73x8VR4TPkpoixZePSgp/s3wMB8pNgfslJ//zoq3sQHpzwWbOj81uedIYxKLnx5zOwi+AU05KW1Nt2oXeQ9LFbqs=
Received: from LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:146::13)
 by LO0P265MB2585.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 06:51:30 +0000
Received: from LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a512:1d52:7de1:122d]) by LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a512:1d52:7de1:122d%6]) with mapi id 15.20.4734.028; Thu, 2 Dec 2021
 06:51:30 +0000
From:   Vimal Agrawal <Vimal.Agrawal@sophos.com>
To:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: No stripping options for vmlinux in kbuild
Thread-Topic: No stripping options for vmlinux in kbuild
Thread-Index: AQHX50kIHpNnBhjzhUu1fhBc0sRZAg==
Date:   Thu, 2 Dec 2021 06:51:29 +0000
Message-ID: <4AC92E5C-9E7D-4F00-B8D1-AE9F23C34D54@sophos.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sophos.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f39ab16f-e1ed-4152-8914-08d9b5602b7f
x-ms-traffictypediagnostic: LO0P265MB2585:
x-microsoft-antispam-prvs: <LO0P265MB2585B3373A13A366A5A2AF1C93699@LO0P265MB2585.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8H6McQgG95VX4PVfif/ZUFDGKmoz76pb6XZ4+1zKZUpCap0a8p31x2f4VGpoCxGvHWqEQSYUI1KMyu6rRdLEVbz77/KDv6p0NFQrfJNQo+z+JUFw1UfKbOtTDSm6QDIMaZxho5YxXv7YG1nb7lBPRM8X1+SZ5hDTOaFW1tpEdAmW05xZtwtSpSVDBDsiyUbkdygQ9bg2O2Kberry7f2CkmowgqSAJVyXKWos2Ndu2MlhuFFmwl5eQ2UoAmxaYHt6H/Q7g1IF9yS78ZuunzZ84hfEUiaYMX4FoGAHnT56+lsaKLcQ5aAgUuGMNM53pFIMtKwzOTZw3aAlIdzxLQzgptjPHD+znZuyiyYDj7xQPd7UE5kp5V0b55qjI4u6iqGzqs/FYGawH9d/JYU0E0WvG0f11ko+aXxMDE8vx3qh1lSzU3jPNK/MJzmOzSLBZXB/+6weRa9YewHfpOc2cy6ck59ALkKOkeydgUhahuTb3bhzRmHu8J5mIMs9GboOx34QsQj7l3xx8vyTsqM9rPcFZVxxPTpNkW3TRxyGV83ag/pQZuvoN953rZZEi2KH4FMiJy4UMCrOq+kgYH31oREvD1PMZ/AB2ydG2pU1kku6lwqohVfTm9XikP847sTMPhr7LLufHNc8djeSIcGHL3a8iIGe8g9J61zUosADHHI6vnptgnPjlZKth9Reg8zRrkJRHFzyYZBkXHDFQ5HLf7SxTu0A22M9Jj+Wdf4/KaVVnrTJekgfcE7s6ZP3G/O5q57uw4zwMPuL0IPqHS2qymEk5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(55236004)(6506007)(91956017)(76116006)(26005)(66946007)(66446008)(66476007)(66556008)(64756008)(38100700002)(33656002)(36756003)(8936002)(186003)(6916009)(2906002)(8676002)(6486002)(316002)(122000001)(6512007)(4744005)(2616005)(508600001)(38070700005)(86362001)(71200400001)(168613001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N052Q0V4eEdmY3BIeFpEUGZSb1hzNUJhUDRlMkgwM2xySHpUK1J5V3JDV2NH?=
 =?utf-8?B?d1c1dVczWlhvQThWeTl0TUlVaFVvVUpDL3JjdGdpZEQrd0tzanFIRVo1MStI?=
 =?utf-8?B?WXI5cVd4RStsSFBRaFdlb1dzSVBxd0ZmWmNvZXFHbSthSDJaL3RjSWZnVDMx?=
 =?utf-8?B?ZnVIUjlEWnN0NXZhcnhnaWRLUVNML2dFQk1YNThVT1ZLUGVUQnZSZXNoRlpG?=
 =?utf-8?B?TEI2eS9oUUdUM1MzWURRV0xzSXdpM1p3RWlzMFNDeFI0SGdPa2trRXltVDJR?=
 =?utf-8?B?Sm9GZWdSMEhVejZXWTVTM2h6VXZoNUw2VUJVVHowSmU2aUc3d1hqRHBiaHlR?=
 =?utf-8?B?cUxpMHRQMllPbXBncGthc0lweVd0aThSSUxldGxKTHhVS2RHYThzRWlVN05T?=
 =?utf-8?B?bTJaU2tjSzhZR1l5cWd5Z1VOZ1B0aUt2SUp0KzJRVU52TDdkSVVvMmdLenVG?=
 =?utf-8?B?a0ovQ1RXbEU1d3krUDV0K0dVa2tqT2d6TGR4QTlIbWxkRXdGZ2l2UVVndXk3?=
 =?utf-8?B?ZCt2bGNVVjFPK2h3OC9TOXVMNDZpbkZNTm1ERUlqbEZReGYxSk1Tdi9PZUto?=
 =?utf-8?B?NGRvblJlS3V6cm8reTkwT2c2YzFwNVI5cHcyOXBNR0lOOURzY0htS1FlZkRv?=
 =?utf-8?B?OVNML1gybkQ1WGR4OGZYM29ROVZaRTZWeUtFVUM2WG1GR2U0NG9OSmNNRStw?=
 =?utf-8?B?aWZKTkI0ZnRNYnRtMXdrc2VaMVluSzVGR0RRSkg0d216M3ViRTNMdk1zUjBz?=
 =?utf-8?B?QU8rS1NIemh6ajZkeFFpSWZkMWNkRE1WOHJPcVRqK3hmaXJkR1ZVRXVpNkFU?=
 =?utf-8?B?SFV6a3FlemdaQWNkaksrUWlodlcyL1VocUpSRS9nSy9yZUc2d2JrN0hZTFcv?=
 =?utf-8?B?RU5KbVdsV1k5MmR1aWFvSllqdTY5ekhsZzVQV0paRjZsODRjOThyNFVXY1dY?=
 =?utf-8?B?b0NuZTVLSWJmTG1rbGh3YUJXQ0tPZFg1SmUxUmZ5ekJkYyt6aWJUYnRzVGkv?=
 =?utf-8?B?clZzYmsvZmdWNWlTQlllSWpid1Q2ejh2aFlZR1Z1YmZuWC9NajBncFdzOXFW?=
 =?utf-8?B?MnlYYXgyUTR1cHhlME5VUklNMFpoekExR010VjdIWDY4UnIwbmlOSFhyNEhE?=
 =?utf-8?B?TXI2UXlkUjBoOEMxVE51VmpTczl2c1ZmNnNFblh6Y2lyd2JrMklaVDF6WDJR?=
 =?utf-8?B?cGVpY2w0NTY3RTRKRWNrNE5xQnZrVlI2NzJ2YmdFM1BYTXUwcW5xaTUyRWpU?=
 =?utf-8?B?Rjg0MkgvZDM0L3BFcmtTNEZLeGNLTk8wSzZDOG5tM2trR0ZjdWY1NUFKcThN?=
 =?utf-8?B?Yis4aU5TMnZ6UnRsZDFDSVhYbnRMY0h3RTBkQmRGOTBvdHdrZFZabmwwdDdP?=
 =?utf-8?B?WTZ6d3I5YWk5RkVBSWtUbjJFcDArNXIzeG0wamw4VThTUndNZkNzeDZhS3FP?=
 =?utf-8?B?RnZUT0kvOTNjY283ZWRmUEFqai9QSm9YZ3lmdWx4OXFpb1lyNWRDeUFTUHhm?=
 =?utf-8?B?MUNRM256R2FBd2VyekxyOEpWNkhtcEtZYTQrTjlaWGxOYUlsQVBjZEw3Wnpx?=
 =?utf-8?B?eUhHZDA4RW1XRWFMaTROdm9iTWhzdG0wSjhTbVg3RzJTNEZJRHVQY3JrWVlM?=
 =?utf-8?B?cW5JMXFnaW90YThxU0ZrVjN2NU13Y2hhbG1QbTRDOHkrZlk1bDhGQU9hS21F?=
 =?utf-8?B?RzJOc002emcwaWF6cDVRZk1FSXVpd3lHSThMdnE5SitYRzNmWXZNOXQ3eXY2?=
 =?utf-8?B?SjZaWjhZRW9pcUxzNDFZT0wxc0x3RDBGemZDUVVoRW9OUEJmR24xWVRQODdO?=
 =?utf-8?B?VHJ6cDVLMFNoQTB6UWU0bjR1TU42N1JGaUhTZ1RIbHUzQWR4NEJNN1YxbjFu?=
 =?utf-8?B?LzBTSVhZUE5uTkQ1VU5BOUFaYmNaUktiS0VQNFRwL2hoZVJpN1hRcEUwOEUr?=
 =?utf-8?B?NFhTWGxvdUdwS3cwaFJYWDU4RHVvUEp4SGF2RzNuTlpMZ0gzVEJ0N1ZTa1o1?=
 =?utf-8?B?NVQ4SUx5aFYxaUpJZThzODRHSjViYkJDZkNDMkRHeFdzdnF0RkZBdHlvRnk5?=
 =?utf-8?B?T0EzeVpKRnZYdTJ1OW5jT2NhbktWZ01LeWV4QmlSc0hxU1FsTHNtaWIwUXQx?=
 =?utf-8?B?dGlUMzdkL1p0MzVtUmROYW5RRlpXamNaS2FLMkFXYVgvSFF3Wk1ReUJ6OGlO?=
 =?utf-8?B?K3dsWU5nRVNQcnp0Sm44NWdsNGhpRms3UHdDWkQra0JxOEl4UlI2R3Q3Zkkw?=
 =?utf-8?Q?hMZt+ONEBRvEybMXBtT7GklzjnUmzdIQhQZWQL+Ro4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <870D386F8E525046B2BD0CA858358AA5@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB2671.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f39ab16f-e1ed-4152-8914-08d9b5602b7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 06:51:29.9488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 358a41ff-46d9-49d3-a297-370d894eae6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xE93sAEiN18VwMNPgC+1Tbig1Av5BoKtrPu0fjnA36ELLM3NnPfIWwswXkuMm4OZ9iobmAe68tpZwLHUAAKEweDhCq5lPktzhFEUQmItB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2585
X-OriginatorOrg: sophos.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sophos.com; h=from:to:subject:date:message-id:content-type:content-id:content-transfer-encoding:mime-version; s=global; bh=NW5PrvOOhPFPU+4uZKSD3XyPlDW+cO8rKcs6azaLuao=; b=k5uivn1LbQer/LBfPVqJZAATCbHNjt0vobeld9BcJC03ky/+JoUxNqsp6cj9az3L/H++RynmHdSWMlPNOQkKPYfm1fvjQdJZmRJH9wHq7m5xf6vKiakI6dLLpJlhdHOLipYcMhqEPfE1pQMmb0S55Gsy8UJs3qb074YrQ5QR1WQ=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SGkgYWxsLA0KDQpJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIGlmIHRoZXJlIGlzIGFueSBleGlz
dGluZyBvcHRpb24gaW4ga2J1aWxkIHRvIGVuYWJsZSBzdHJpcHBpbmcgb2YgZGVidWcgc3ltYm9s
cyBmcm9tIGZpbmFsIHZtbGludXggaW1hZ2UgYW5kIGNvdWxkIG5vdCBmaW5kIGFueXRoaW5nLiAg
R2VuZXJhbGx5IG9uY2UgQ09ORklHX0RFQlVHX0lORk8gaXMgZW5hYmxlZCBpbiBjb25maWcsIGV2
ZXJ5b25lIGV4cGVjdHMgYm90aCB2bWxpbnV4ICggc3RyaXBwZWQpIGFuZCB2bWxpbnV4LmRlYnVn
ICggdW5zdHJpcHBlZCkgdG8gYmUgYnVpbHQgc28gdGhhdCB2bWxpbnV4IGNhbiBiZSB1c2VkIGlu
IHByb2R1Y3Rpb24gYW5kIHZtbGludXguZGVidWcgY2FuIGJlIGFyY2hpdmVkIGZvciBkZWJ1Z2dp
bmcgbGF0ZXIuIEl0IHNlZW1zIHRvIGJlIGdlbmVyYXRpbmcgb25seSB1bnN0cmlwcGVkIHZtbGlu
dXggYXMgb2Ygbm93Lg0KDQpXZSBjYW4gYWx3YXlzIGRvIHN0cmlwcGluZyBhcyBhIHNlcGFyYXRl
IGNvbW1hbmQgb3Igc2NyaXB0IGJ1dCBpdCB3aWxsIGJlIHJlYWxseSBuaWNlIHRvIGhhdmUgdGhp
cyBpbi1idWlsdCBpbnRvIGtidWlsZC4NClNvIGl0IGNvdWxkIGJlIHNvbWV0aGluZyBsaWtlIGlm
IGdlbmVyYXRlZCB2bWxpbnV4IGhhcyBkZWJ1ZyBpbmZvIHRoZW4gc3RyaXAgaXQgYW5kIGtlZXAg
Ym90aCBzdHJpcHBlZCBhbmQgdW5zdHJpcHBlZCB2ZXJzaW9ucy4NClBvc3NpYmx5IGluIC9zY3Jp
cHRzL2xpbmstdm1saW51eC5zaCAoIGR1cmluZyBvciBwb3N0IGxpbmtpbmcgdm1saW51eCkuDQoN
CkkgYW0gbm90IHN1cmUgaWYgSSBoYXZlIG1pc3NlZCBzb21lIG9wdGlvbiBzbyBjaGVja2luZyB3
aXRoIHlvdSBhbGwuDQoNCg0KVmltYWwgQWdyYXdhbA0KDQoNCg==
