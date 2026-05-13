Return-Path: <linux-kbuild+bounces-13141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AJ+CKrCBGqiNgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13141-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 20:27:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D86538F1A
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 20:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3443300C30C
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 18:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3567B3A7D91;
	Wed, 13 May 2026 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="gNzVsLzw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC73A8759;
	Wed, 13 May 2026 18:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696772; cv=fail; b=t24dWz9QRFi+Vu1aZHIjaSj7OyDJ40a4EPN+T0uPp/TaxRid7c0s7hwndMx1vjlXYdVFN1uVTKBP2rcY8CidX52UZj+3PPNJx+b/pXomyM4VcFZtAGIO4cSThJRnU6UNPnpEzFnxQIJW5wC40QSwUcBCo36Ct6qhgxLhNdoPnPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696772; c=relaxed/simple;
	bh=bGC3LyTN/RbyOL23EJ9LBuOEi/K9Fg13oBIZt51SB0g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OzgZVQQ9alsb1kGvvoHEuLJ+Lc3OG3uMOZ1c6qV1fpx1tD6TrNv7GII4Yl1sj0wNH+RedXzJCT8bOJWgSs6Svkm8Peq9TEgIu4ZALP3MrKyf7MQR0/G7fF/gUZB4pk5EtfltiYZh1VeIJrHpI5HCA4BZaptd59tUmLbqlb0EPL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=gNzVsLzw; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DIA2Qx466778;
	Wed, 13 May 2026 18:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=p1; bh=bGC3LyTN/RbyOL23EJ9LBuOEi/K9F
	g13oBIZt51SB0g=; b=gNzVsLzwt0PA2iMsC/mbd2pIwWeICv2HGO1kqEJ6IhTDe
	dBGBSBBHjpBQfmFNVdMP5SDkVGcps0/lQJl1B8a7f5qDRMglyuQzJWghHmdqSwto
	ELedRT3G2cDZROYPY27hyDf+cUPIdYhNQxujSCMqEs6FML75iBCwWkf9X2gajfER
	6cKvAEHEftAvU0xuWTUMNEjY837E+ZCWTjqoXvf3U3Hpr+X2zThOh2SS6oL9xfXM
	225H7rfb9xN7kyWApwJssJhfEWbwVo4A4uu37/WPK36plUXRaZDke3kTyOBkMOMN
	WIYq6mPmPUV5NHhkGyen9Y9qyr3WAKY4DJBIwjQOQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4e3nv0je3u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 13 May 2026 18:25:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSzbOfAKs1TbsfXwNIY1Dk6gBuH1R7IJJ+44JZDTZ8XHnOLWC1rCxbpZuHs2KIkS5fDpH8aKIpRMyMGxBMcal/Xuojqu/S4eaVb4wFOU4uRNmlV/xRU+pIWt+488iYB4MMC23MXGvHTgL/JXqWwgyu5HTerhI0qLT6MvtqqdPQ5xu2qE8Ts/gzIK8C6BC9+7DaiVgfbhDChnWUMu852eoiUPAuFlHegskXFVGYO2/qUZYa9TUX1ZZSKo5Lp7QXl0DuQazkTt7YUPx6IF375TnX0Eefn6UoEStX0fEf7mimfo6TZppZPcQpIcoe2+2ElLhnTy4cWGRxHnR1aEsy3ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGC3LyTN/RbyOL23EJ9LBuOEi/K9Fg13oBIZt51SB0g=;
 b=E2j1Cy2dp39UNZf2F6M1SXf0jVTjYT+imZoCHzgsqzXHPbcaOr1XPtrxf4ac4nImcDSZT4WoO0CTo9i7iecClSrwsxAk930qNJx7INU/vcWBk6ef2jQHU4tH/y6agtBe0ew0rDGFFJeXgp8L/ubFWuVtqCHvvKN8pSCPTz/Tnllc9OJCOIKTMSsg7z4N+JjQL/jBHqQ59dTSJ7HUaqx0c1BWFrmqri8ZOmoJAdZD4utLuRVm5UCrfw8ZL92Pvg3TOIyH7CSrRYfI2SGGXfx9loY+vnX0VWMnqWAY9VntfWRdm39wP3jRZcZ5AhWtlJlPO7rEDCY7FUOJc8EWyOKACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by BLAPR13MB4754.namprd13.prod.outlook.com (2603:10b6:208:326::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Wed, 13 May
 2026 18:25:36 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%3]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 18:25:35 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: "luis.augenstein@tngtech.com" <luis.augenstein@tngtech.com>,
        "nathan@kernel.org" <nathan@kernel.org>
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KroahHartman <gregkh@linuxfoundation.org>,
        Kate Stewart
	<kstewart@linuxfoundation.org>,
        "maximilian.huber@tngtech.com"
	<maximilian.huber@tngtech.com>
Subject: Re: [PATCH v6 00/15] add SPDX SBOM generation script
Thread-Topic: Re: [PATCH v6 00/15] add SPDX SBOM generation script
Thread-Index: AdzjBJ1nLMyF+vT+SmOGnx2gOgEOZg==
Date: Wed, 13 May 2026 18:25:35 +0000
Message-ID:
 <MW5PR13MB5632E740EE09E377C6E076E7FD062@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|BLAPR13MB4754:EE_
x-ms-office365-filtering-correlation-id: dff294fd-9190-4f99-d8ad-08deb11d06be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|11063799003|3023799003|56012099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 aSSmOKChpa9ebTWbwnzx1pDBMRJ4Ej487PZfPVs+tqZEKGjXfzHYz7z60XtJn3BBtAWWlI/JAWeOBwVQR6uf2mGTloDegLLPDaAaKVOgV/eJ4bsjEi+NhjEd3XFtVEnwqODcTx0GbAK3KkgnRDERILTA9/xXuq3Ne9XP6LRghO4mpWuKiNGRl6NLd8zwz3lob5+QgoT/Wa2kY6waJlvNPZbHDROOu5fJjSt6tRHP/ysvPt/J1i3Afmu2xUxss8wbyOLWLvg/+UEXjafsG/rlkx6JujyH/g0E7R0dYkBcA7aAtXJzvh1C8S1gKx5P4WVxdyn2vmQnNgv4+anVwMvF1uGRsw6mF+9CktRJcLN184nDNaCFmVyc3hMxtXBFjkkXLFczs1b7IOAuuPd34DrWtxCUjinDXhFELUYCTqrO+X3bVBN5Czn/DTcCZ29An5bxTd2SgF7WdQBHUzf1c5KqxrAC46lr6ySEtTlYzbLODziJ8HffXWEbfXWyMOVVDpDMs4GQB0Y3C/Wry2MVCyDJQiE/42IAXNjXSQWaCcsIX2w4I0wu16ppti8H++ewU5xu8RIaseqfmLWwRaQ5581m3UfhElSo5eZpXfm6+jY+q9VGITGednDLb0BbOfklp/6BauMmvC571svFnG+fuzu8drluscuBdhL8Gd2SlBaUId2S3vZU9FzIVhkXrpdo+dvJaGGzoAgmXbN6BKb837UDdlpQO2RRhjUbekQf+E9wJArnnOSZmu2ovmykKXy4buVo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(11063799003)(3023799003)(56012099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckRRRTZBbkJKcWNiMUgvdE8wS2tqNVVGTjhwU2I5RkxpaEtnalVXL1FXMDFK?=
 =?utf-8?B?ZVV2M2FHbWlFZFJPQjAwOHhYQzA2ay8veW82NkRaVnVTRk5jSHFOQzRpTERW?=
 =?utf-8?B?UGI0TzZMWHM3ZW5rK1hhQTJDVUVpWFg2TVkwZ29DdFNURkduZDVhMHZyRU1Y?=
 =?utf-8?B?Qi9pYWhONzdlZkZkQVEyOXlxNlMzK3hsc0ppNk1iRktjRFVsRVBTS2lMdjcz?=
 =?utf-8?B?d3VldlFkZG8yZlBUc1BuNUFCZ1BTTmUzb0E5RmE3eUtjV3BMaFRLZnBDNDBN?=
 =?utf-8?B?MmpmalJ5NVZNWWZIUk5UR1ZkcmI5bENjUXVUWEhZQ2RaVHl6ck1ONXBYeDBY?=
 =?utf-8?B?WTZhZ0N0UXRldysrQnFNNGowdklKSmxZK1hsOFl3OTY4eC94MXI0SmQ3YytY?=
 =?utf-8?B?WVZuWHVIOXNMRFVwYnFMeWNOVEhzNzQ4aCs2dTRRa1JpL2lRekhOZlZhZk5T?=
 =?utf-8?B?aFpBNFZid2xJdDhuRFY0U2t3S0xtcXRNbWl3T1RRb2ZlZ0JWLy9TT0tUVm9z?=
 =?utf-8?B?ZG9hdW5YdHVPSjdtNmQvOWhScGVFSDRaY2NNbDdkOGlzZnM0U3FSZndCNnU5?=
 =?utf-8?B?RzMxT3dMdnBJQ3dsS0xrOFV0eHdZTDhYV2JCcVFaREtLZ2JKVzBVblM0Q2U0?=
 =?utf-8?B?R1d1eXZBYUJQL2R0Vk9sOVhMNC9DZDhmeUV2U1AzNlhOMTk1KzFhTVhnTEJI?=
 =?utf-8?B?Mk5PM1dJMEE5WHBOdjR2UTV1eFJ4dUN5VUI3ckFROHpOd0ZjL2QvQ3BYZnlr?=
 =?utf-8?B?YWpVcmhCVVVKR25wMzYzVmJIS21OZHlyTnpPV3B1eGpJS1owcG5sM0VqWGxq?=
 =?utf-8?B?YXF4Vm5PNVBBRVNGWUJQZ3Y0QXF4b1h6a3F6L3c1TWRCMXBWcUthV0JEYkNM?=
 =?utf-8?B?ajVYbkxTSmlmaG5Rb0tmVCtXNlc0RWZ5ZjM0RzRkSVhUL0o0TXo3OFJEMFhZ?=
 =?utf-8?B?UFh2MTZlSjVQL2MxVGl5aW9WcVZaMHFzN0xkaWdmQU5aN0E4TjhWeGQ0bmw0?=
 =?utf-8?B?TE00QkVpdjJoZWgzTlRzbkR2b2p2UVRQdFRxbGNzOUNySEU1d29PM045U2R3?=
 =?utf-8?B?SjB4eTBWUnR4MEJ6VHZoZmRmbGVnTlRyb2ttWDVOcWFCa043M2R3WWlSZmpT?=
 =?utf-8?B?MSthTFRUTWtZSmdlb0drSHpnejZqbEVKazlkZFlzOWdqSVU5Zkx6QmVDeGlF?=
 =?utf-8?B?ek9NK05rT2xuZHBpYXo1ZzdRSlEzQ3pkOXR6KzB2VlVoODlRWUYra1AwTU8r?=
 =?utf-8?B?aEJJbUJHcE9ha1J6WDd4QzdJVlRtVzArUWdWZms0c1VRK1pjR01QRi96YzRO?=
 =?utf-8?B?RnJ3bS9zbld2NnNWQlNvMWVMTGZMbjhOR1I0dktpMDdtUnVyRFhldFE3c21h?=
 =?utf-8?B?WDhsWlJMWnNCRHJxeUQ4cmo2cTFvMHU0ekgwaGlsQktTN0pmMHZzaVBaQXhh?=
 =?utf-8?B?SGtUTDNTS1cxSlpMY1NkRkRyWjBSSENUN1lVbGs5cTh4dU81V2FEbnY1N1Nr?=
 =?utf-8?B?YmxWcFBwci9iUmVjajFMREFFc2xZS3FlWHhwK1h3ckxwU1QrcXNDQUFwZUta?=
 =?utf-8?B?STR4WnJTVjhaR0YzTXNkbmU5bjlzMFBIM3p3VklOZFBUN3Y1UzN5T0NEbjln?=
 =?utf-8?B?TFkyWjVRc241VC85VGZSNzhUNGlZQ1o0cmRKdTNlVmsvWWg3ZVZQcjQ1SHdG?=
 =?utf-8?B?RllLNG93bVhUSEZ4blo1VFNySEd1RHRwMmNXWTBqM3NOVVRTajZ2aHBzcjBr?=
 =?utf-8?B?enZNT2pXRHM3dzZ6T2JlcmJSNjdMMkxyOTk1TmNYVG5US05hVkxoUFJRbFZ4?=
 =?utf-8?B?N3lEdyswaDRoVjEydFdxVFFwWEpUTUFQeCtLS3VmL3FSY3llQ2p6aHVhOFp2?=
 =?utf-8?B?TmRPSmVHejVZRzUwOStUdnhmbE9UL0VwaldiM2wvMStyNWEzbGdRbGYvME82?=
 =?utf-8?B?K0NDVHNWb1krUkE1cFlyVU1KRVdIZ2loZ0VHbTVvc21VNzgyWFBFeVdFUVFX?=
 =?utf-8?B?dGtkSWZTUmFTWHRHSUttSEpxTjlseWQ4NVhCaG1Fdm9ZWG56UDJmVzlWNzdD?=
 =?utf-8?B?elByOVhSWWtpb0tYR3RRY3lZSW9ZS3plRnZTaTBmUjRSaWRWVXphTTBVaHNE?=
 =?utf-8?B?S1ZhdHRQKzVoREN1WWRNQ055aVlJYVF0Nm9kM3JIQ3kwTk4xc2wrbE1oNTNw?=
 =?utf-8?B?U1FDWDdydWFzMXgzbjNGTHJjVTlFTzRvTU9kM1dkVGoyZHBveWQ1WVFyVHJR?=
 =?utf-8?B?WnByM2FHUGxvQWVXM1JjWlIxNUFXeEhTc285LzQ0VXpPdDNEbHZ5RnZwaUtS?=
 =?utf-8?B?bGV1RE1MOHUwYXZEYlRGOERPY3c2d2dIOUNKWDJScTQ4NWo3cjRjSFNUMEpZ?=
 =?utf-8?Q?YC5b5KJ/xTCdzsSp0nyF4ECTah1vSVErwh7/I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	YcvWUCHUO4XOg6M3qAEFLDIIKAjSNHrjRpgLHpIAk+vJYa/as/nmjcl/hzfgdZHawa0H8KnXeolsfsHb+rRwdTQJq1oDXup1bCb10kEpHWh+CjkCYzK48F2TB7aEObKh0QIYL4uxOnfxF+oQ67BQ6sisfXlP2q4bqnoH7AB1sX9KtXJIzqeex3LnG+qmVaR4hwkFCgrOuXk+nPU1EB/hDqw8TllnFNAejENgvEFZPUfm1KsEjy9f9XkIXSBzVLMsFzB1/7HEbE6lP86W85o8Qb+QPfvqQGKZPQzwIDdgB+aKjUJwaN6TX8iW969eTyMmjTf/Eo+OFkpI/Q+idr35VA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p7/QfbIULzNRw9arUxMzD/0LACKmcD33qxcGN0f5E+S665v4yP1jECvGxSSa99rnCgbU0CU/nQ2OD1BrxK832e2unxQp01LEsM/PkRObQ/7l7T0uq2RYKZ6Kt5E88qqAS34dzMh6SHiWLFbtgn+K4HlGz601xAEB09Y/aWjD3tRddgXIsD0kCQ6idE2oVG2reR0Pyj8iYaluTT/logGKggHTuzaREgq7/dDM+2pSBU4/HV6qSHl0/is1klq9luBW+xRr40Okqn/pRAzR56KIX/8DYHO2Z1+Yno/ZAMplm1tow8n7YUnynPb6JnUkdu5i1lPlLSWFa2BDs6Xt/3wBAeZooPrZXsqWlBpHaKhT/sp7cN0NdfE0U6ZlqLPYEORsE5xiqhENVKsAeh9xr6CSLZGcx9JXBTlIR31aFcUh5nGDTwTq6PHFGeOtbpFLOxyIdqR9R57RDg1ACiSUHp8P9EhHgQxxd7KxM6zbc2WrCYeVKyamrWOHf2cUeL5AZkqM1G/UOMMYP9zsr3y/ap3wE43qJi2XGPJyzWNvMsFsFiKjEIdlv4uLG+r13jJMz3q3pB9d0IKJ6AlKuy7R7gScyhm3eVHi4nnUOdSe48IpEmxYsyn1U+XjwNZcX4+PQ/k7
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff294fd-9190-4f99-d8ad-08deb11d06be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 18:25:35.8045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ss9Yg4qeSlMjWFhd4j05yIweWvrLJRj4M26k5RwPk/Wnm4lftzyQNKKtKu79hd7rf/DtQrW4Bx7yq1Nr6cHvTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR13MB4754
X-Proofpoint-ORIG-GUID: DBxSaMA-YWvEIOLwsXn20UsHt-Ya4FNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX0+sXshlmB5dU
 3N/NzSFY4TEJd5G4e+brecn/TAvm81N3KJhvoLmSFvxePtf0cn9X5HEfk3uYdkA0B7zsCALqvfW
 0D/+kXuuo/fLSpEmf/HP/4ZwepxDGYn/l/017Ap0M45olmixvkgSGv0ERa2+C3Zjr1Tdcv1s0ex
 0eeiL4ki0h1l3yQgM7d7QKgdRDx6XfbKOqodlsJe+uuh7twQMzojDH2ntnxVpwKTv3Fash5kmxq
 hS5J92ePouDutkcMKhB6NQ6fsU/bVocVpcZkQxHPbTnfvPrEAgtCN+onzoBXqyonv4vqXgSvipM
 oQq52Is1LjQSnVjJ7Fd3xZU0i8jy+mX+fgRTs9shcgWhrA1GRfv6TZ2feMuvI2Co47DCqEvOFWe
 g3PQj4ntR3ImporoWvPqVwB+laAz1hxVgxm2kcyS1hf6CUOzh2uBCHIBhF6Qgo8Qb+9XJNMIji/
 jMEf5Hq2Iny8Pp774tw==
X-Proofpoint-GUID: DBxSaMA-YWvEIOLwsXn20UsHt-Ya4FNw
X-Authority-Analysis: v=2.4 cv=dNyWXuZb c=1 sm=1 tr=0 ts=6a04c223 cx=c_pps
 a=/mfax+0MUk3zis5Hx41TAA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KAb5x4SsHD3PzxGk7EmX:22 a=lmptg-Pxpg44AF-n8Qp9:22 a=j1L0gcs-lUg_ILwdgZ8A:9
 a=QEXdDO2ut3YA:10
X-Sony-Outbound-GUID: DBxSaMA-YWvEIOLwsXn20UsHt-Ya4FNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Rspamd-Queue-Id: B4D86538F1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	FAKE_REPLY(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	R_DKIM_ALLOW(-0.20)[sony.com:s=p1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13141-lists,linux-kbuild=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sony.com:dkim,MW5PR13MB5632.namprd13.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Tim.Bird@sony.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sony.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

SGV5IEtlcm5lbFNCb20gcGVvcGxlLA0KDQpJIGdvdCB0aGUgZm9sbG93aW5nIGVycm9yIG1lc3Nh
Z2Ugd2hlbiB1c2luZyBLZXJuZWxTQm9tIChib3RoIHdpdGggdGhlIHY1IHJlbGVhc2UgYW5kIHRo
ZSByZWNlbnQgdjYgcmVsZWFzZSkNCg0KSSB3YXMgZG9pbmcgYSBhbiBhcm02NCBkZWZjb25maWcg
YnVpbGQuICBJIGNhbiB3b3JrIGFyb3VuZCB0aGUgcHJvYmxlbSB1c2luZyB5b3VyIGhhbmR5DQoi
LS1kby1ub3QtZmFpbC1vbi11bmtub3duLWJ1aWxkLWNvbW1hbmQiIG9wdGlvbiB0byB0aGUgc2Jv
bSBnZW5lcmF0b3IsIGJ1dCB0aG91Z2h0IEkNCnNob3VsZCByZXBvcnQgdGhlIGlzc3VlLg0KDQo9
PT09IGVycm9yIG1lc3NhZ2UgPT09PQ0KLi4uDQogIEdFTiAgICAgc2JvbS1zb3VyY2Uuc3BkeC5q
c29uIHNib20tYnVpbGQuc3BkeC5qc29uIHNib20tb3V0cHV0LnNwZHguanNvbg0KW0VSUk9SXSBG
aWxlICIvaG9tZS90YmlyZC93b3JrL3RvcnZhbGRzL2xpbnV4L3NjcmlwdHMvc2JvbS9zYm9tL2Nt
ZF9ncmFwaC9zYXZlZGNtZF9wYXJzZXIvc2F2ZWRjbWRfcGFyc2VyLnB5IiwgbGluZSAzMywgaW4g
bG9nX2Vycm9yX29yX3dhcm5pbmcNClNraXBwZWQgcGFyc2luZyBjb21tYW5kIC9iaW4vc2ggLWUg
L2hvbWUvdGJpcmQvd29yay90b3J2YWxkcy9saW51eC9hcmNoL2FybTY0L3Rvb2xzL2dlbi1rZXJu
ZWwtaHdjYXBzLnNoIC9ob21lL3RiaXJkL3dvcmsvdG9ydmFsZHMvbGludXgvYXJjaC9hcm02NC9p
bmNsdWRlL3VhcGkvYXNtL2h3Y2FwLmggPiBhcmNoL2FybTY0L2luY2x1ZGUvZ2VuZXJhdGVkL2Fz
bS9rZXJuZWwtaHdjYXAuaCBiZWNhdXNlIG5vIG1hdGNoaW5nIHBhcnNlciB3YXMgZm91bmQNCj09
PT09PT09PT09PT09PT09PT09PQ0KDQphcmNoL2FybTY0L3Rvb2xzL2dlbi1rZXJuZWwtaHdjYXBz
LnNoIGlzIGEgc2ltcGxlIHNjcmlwdHMgdGhhdCBkb2VzIHNvbWUgc2ltcGxlDQp0cmFuc2Zvcm1h
dGlvbnMgKHVzaW5nIHNlZCkgb24gbGluZXMgZnJvbSB0aGUgaW5wdXQgZmlsZS4gIEFzIHlvdSBj
YW4gc2VlLCB0aGUgYnVpbGQgY29tbWFuZCB0YWtlcw0KYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkv
YXNtL2h3Y2FwLmggYW5kIHRyYW5zZm9ybXMgaXQgaW50byAkS0JVSUxEX09VVFBVVC9hcmNoL2Fy
bTY0L2luY2x1ZGUvZ2VuZXJhdGVkL2FzbS9rZXJuZWwtaHdjYXAuaA0KDQpJIHRoaW5rIHRoaXMg
c2hvdWxkIGJlIGVhc3kgdG8gYWRkIHRvIHlvdXIgY29tbWFuZCBsaW5lIHBhcnNlci4gIEp1c3Qg
d2FudGVkIHRvIGJyaW5nIGl0IHRvIHlvdXIgYXR0ZW50aW9uLg0KDQpHcmVhdCB0b29sLCBieSB0
aGUgd2F5LiAgSSdtIHRhbGtpbmcgYWJvdXQgaXQgYXQgT1NTTkEgbmV4dCB3ZWVrLCBhbmQgd2Fz
IGp1c3QgZG9pbmcgc29tZSB0ZXN0aW5nIG9uIGRpZmZlcmVudA0KcGxhdGZvcm1zLg0KDQpSZWdh
cmRzLA0KIC0tIFRpbQ0KDQo=

