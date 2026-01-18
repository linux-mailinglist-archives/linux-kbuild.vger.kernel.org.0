Return-Path: <linux-kbuild+bounces-10634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE0D392ED
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 06:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4106A3012BF2
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 05:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD0813B7A3;
	Sun, 18 Jan 2026 05:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y+dZwZsC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDEC500962;
	Sun, 18 Jan 2026 05:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768714322; cv=fail; b=VsuCHjcND55Vsxsu18zWgUHurn9qj9/ztNTzF8ohCxaw7cGkYrRBIHdR8bO2mITOsUQR9jO8hhXiHuOC+TewkCdhENiOJXBl+pyDzLIomtbNaKKFQlpYnXeiHjji7zgTY0kB5OaP3nO/OG4q3bKHINkyTwn/MUSRj43LFuHCiFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768714322; c=relaxed/simple;
	bh=sSzjLV5UWH9OPIwd6p4OvQ63NpgivdLhIKNYaluo88c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=byl0r2fDgzQLDYSB+mXEzpI0IKmLK29N94qqufFDwQirHo/V0YfeGx8q6tBfVn2ow7hG0Q3wEjbZJbs7AQmwnA24s6etXheuurojjo6ilBBKiCGg3znV98+hXdIaNFdQjVyWrMpxQ3ZSbvMgR2Uh93Xb/iVdorFzxEop3I8t3YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y+dZwZsC; arc=fail smtp.client-ip=52.101.72.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiJ1hFnCH7Y9D/Wa0hIxEPXTdXvp3GjElbvk/zdJGvPWSeCW16gsJ6VWRXHOnd2RHUELGM9WFRUD4FzaJpVkMqC9CsVethEBu7zPbTjdj430xJ25knCVsvRDv3tAed6bCPecLVJ77M3uqe+Q86W1r1gPWkOEy0ohL/JMm260RKxtNMD4FPzP2PZ7mgpdjwbo5AQkHibm2+sREUN5xxZv787ywVKu/ueGboCj5JeSVy7lyiyD6mLkoI1YEfvkGqWlQMEInNYVN9cd8zlGaozWBvoxqfTx3fQLyiofEEcTyQuUv/KyT+hgWui302XE1vra8yqCjclO80AbyiZTM5tycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSzjLV5UWH9OPIwd6p4OvQ63NpgivdLhIKNYaluo88c=;
 b=uFySE9Gg5YEOx3P7sZR46ZUbMrUYNXzN7FiFGrKqvR+n6o5CLuT25VbdYvcAdhBn7d6pd27gdGy4ceRID8VTDwsc17R69RtTMwR1JFl15pdcWVkxZ27AmV2rfWAnXl82+wZmwpq9PsfAah+ZjT0yeBXNWTbnqjnA3KvyUS5+d3cAUt46MisjZJB+X3Ex5IzF9MVLuAt/bb3f0oG47GiM+s1a5g85hPyHkVSeUb3CuH9U4jmOBDngjMVgKnSEZltWkMwS8Zjvdy/UmIcqKBuNiXGhqbdJfsqFVs51PzMXXTLqV3bt7Mr5EXQ9IvuLI+IobTwJomINkpWW2BwF0EDFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSzjLV5UWH9OPIwd6p4OvQ63NpgivdLhIKNYaluo88c=;
 b=Y+dZwZsC4oJRtmYUWbzH8+TWNGHvRYqILdVK8/LjFZNAhdQZzLrIslbRTyqMmI126kyoUHcbVXbtd6tDy48x6gnoAxOyNM2QkCRTwbyh3R3p9ZmXH6UZOSQmpJlFyw2MFp+nHQ61D05NsrxizRSD2w26b8WZm+s9gHTEd1xLWMzgjwJNcpY57KhBCM/rFbbj0tzhJ8c7xXGO99qgVmJ+/nkJlL9ak4Wkh2WP5+igLPdczGAAFNgmBa8Whj3RUTWup+G9YbLd88NOTlIPC1RyEqISrLEyMD2iP1PsrKUfY+I39sxFvlyC+pJNPp/eVXv6lKFWE2q1gCG6wjcek9tKfg==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV1PR04MB11016.eurprd04.prod.outlook.com
 (2603:10a6:150:206::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sun, 18 Jan
 2026 05:31:57 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.009; Sun, 18 Jan 2026
 05:31:57 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>
Subject: RE: [PATCH v2 9/9] arm64: dts: imx8mp-evk: add bluetooth dts node
Thread-Topic: [PATCH v2 9/9] arm64: dts: imx8mp-evk: add bluetooth dts node
Thread-Index: AQHciCvxBHElkKxbsUiJ1x8o38o8RrVXZq+A
Date: Sun, 18 Jan 2026 05:31:56 +0000
Message-ID:
 <VI0PR04MB12114F2A4527362C31CA0B094928BA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-9-0f319c7e9b55@nxp.com>
In-Reply-To: <20260117-misc_dts-v2-9-0f319c7e9b55@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|GV1PR04MB11016:EE_
x-ms-office365-filtering-correlation-id: 2ec96186-7edf-422b-86a0-08de5652e56e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ti96WGltTVB3bTFWWTlkN1Z4SEI4YlFYd0hHRWFub1N6K0k1VWxZbU1lTVJB?=
 =?utf-8?B?R3FEdVNDbzd2MHF3V0RlcXZ1OTZrbUhSa01DT01jSk9qRkdSUUs3d3VvNTlO?=
 =?utf-8?B?VUkwZ2txVkZaZnAyYVE3YVplZ0lySjE1MG9ranpzbVpONXF3allKOVRoaUlC?=
 =?utf-8?B?bVRoNjUwT0kzYmI4eHg2UGRZa3JsMlBNWHJkZVh2R0VJdzR3WStYdlU0Zm0w?=
 =?utf-8?B?U0hjZ080bFE4b0NLWkhmR2N4N2ZQQzRjaXJsRHVveDh5UnA2dEV2Y0dXTEEv?=
 =?utf-8?B?RGdabUN2UkF4QVQvU1ZxUndaQlovbVA4T05tWk5mTDU1dEQ5dVp0amZ3eTc1?=
 =?utf-8?B?NUhoN1B6U01oQ2xGYWVsd083YVp3L3k4anloSmdYajFSL0x4cy9LZ1BiM21q?=
 =?utf-8?B?M1duc01Ucm9KWTVOY09vWW9LR2V4bGMwekZZK2hNcG1DelFoK3RoNDQ4QjFy?=
 =?utf-8?B?a3huZ2pxclBSN3FrQU1sTVluU1FNbE53d1Y0RUlLc1JpUXdGSVZYMzJwZ3V4?=
 =?utf-8?B?bElDVHJsaE82YnRncjNXNWkxU28rdXJQVDBIM2NRQTJmTWIwc0VhTVpZTlI2?=
 =?utf-8?B?aHpBMVhDc3FMZUppQmVGS1pFU0hxemtjSkUxZ0lXejU1Y0tTcmp1MkpPSnJt?=
 =?utf-8?B?VmZEYzFUVHRDR05KcmVhTDZnN2xLUFB6WUp3QzVDWTBmTDA2KzdiSG5TYVpF?=
 =?utf-8?B?Ykw2VDAreVFuaE9uT2NOVzYzSk41dTFRSTI4QXU3RzhPNnFFUU81cEtuWnRB?=
 =?utf-8?B?N2NLTnJ6SEJJVFdXaThNaXc5TTh6bEdoZkRoZTN0K01SWENLb0trYU95eVQv?=
 =?utf-8?B?SzJPSFRBaGtiaWgwcW1zUlVWK1lKeGxDekU3dkVBUlhBdkc3NDlZdk93dzFn?=
 =?utf-8?B?TlgyWjQycEhHMXlpQ2ZuN1RYVVluY2Nyc0l6cWNYN0hvN3FXeVNUUWJhOWY2?=
 =?utf-8?B?enVYQkhkRzNhSFE0bExmbE1QcEFMM1h4RHFON1dNQVhoY0o0dWF4blB5cWwy?=
 =?utf-8?B?NXQ1eHZ1enpFa2xiNGdLbE00OUc4TVZpL1NydE42NVNuKzZHN1AwWDdaTTVw?=
 =?utf-8?B?cHhDMDZ5bDNVbTZXdERQdDlqL3BNZGx3STQ4VW4wQktXV1Z0Wkl0T21qVkEy?=
 =?utf-8?B?bUZEUTNpTHpySmZWZGY2M0QvdUs0OTlSTkk4QWkrVUdUbEJhaERjVVZ1OVVM?=
 =?utf-8?B?RVFCdndKcDN4VlBMZm82YklXZzc3OTMwemp3OW02MzFhTVNUMDlJOFQxWUhV?=
 =?utf-8?B?cDR1akttZW9LYm1QdWE3R1pRV2UyZURyRTVabEhmVlVJSzJtYlQvTG50aUZN?=
 =?utf-8?B?c1c4ZG1nd3J1MEZFUmZOcnRRRmlXc0p2UDB5R2RVSUVZeFpYc2w5Q01LMkY3?=
 =?utf-8?B?UGdibE0rRlBiMzVlVFAyYUhvYWxoSllISU5BZkpxV3MrVUFIcHFWM08vU2dp?=
 =?utf-8?B?dDJJSVhLbEZPdmZWUGQ2RXdrMmQvYUxRcDdRdE9jaHZXZzZnamxUSjUxVURy?=
 =?utf-8?B?UVFkbmFFK3FmY09kdTd5Vzd2anhXY2VFQnNpUEk4c3dscUUyODIwVUhTQnZR?=
 =?utf-8?B?SXU3OERLRVJiSU9JK2lNSWk5TklCV1RiZE9XTm5TYWFNVHdHYmk3OUpReUMx?=
 =?utf-8?B?MDhYTWE3dFAyUG5VbWIrMC9iM0FoSWVmalJFNHJGRWdXWnNnRGZkdVoxVmFN?=
 =?utf-8?B?Ynk1RXBWbUlBeHBkNXpCZlByZnQ5bm5qaW9sVnY0bzkzdTQwN1IzUTEyK0JE?=
 =?utf-8?B?K3dwUURETytIbGFKcnM2NjBrZnNDS3NBQ3RUWDdHYTJWN3dVRFBkaXNQYjk1?=
 =?utf-8?B?bXo1S0VuSFhxeUFuSmcwL2JoWTNjcDRlWkR6SXdQdlFwMWhlY3JOU2lWbW5z?=
 =?utf-8?B?Y0tkaEI4MmUrWWpSRllJblJxTWYvUVNockdEak8zS2VCaTN1QUJ3bGZkY1p3?=
 =?utf-8?B?UlJ3S1ZuM0RUaTFwc0xoMDY4NDM5bXcwbnZOYytETWR2M3BQY21SVVltWEhy?=
 =?utf-8?B?RlF2Slo3VkFqWSsrbldac1llQy9hb1k1VzhqME8vcEU0Z2ZPczJCWTd2OGVL?=
 =?utf-8?B?VVM0Z1JUSEJYZ2c0cGhDeVdKb05vS0dZTW9nTW5EY1RKZmtWUXNNWWZzazFj?=
 =?utf-8?B?UFcwTlRyOUoyaWl5QWRNdTBmY1RISFJOZ1E3Y0ZSR25FVEdFMzlGYTNvUEpu?=
 =?utf-8?Q?T2HTaeFo1WvdZf9A/www5y9NkDugtfinwW+6VKjeWc59?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnVDSEhXRjVJMnQ3VU8wNmJFUngrWFZvVkxkL2xNNXVMbU41VWdhSDdkaVJL?=
 =?utf-8?B?YVlMbzFhWEw5eGhUajFKQWU5VmhCTUVFTHFRaXV0b0w3cnJXQmNiODczdmFa?=
 =?utf-8?B?WHFOYStsVnZ0VDBGQVN1MDJxVDJBNms2cFJ4ME1USjdmZWwyZGQ2N2IwUW5N?=
 =?utf-8?B?dFFWakw3cVdhM3FFRTJXcWorR2NaK0pJVTZhWlU0dmtqZUFPU2gvTnVORVZ4?=
 =?utf-8?B?S29JM2FLMytyMldZL01nekJaVUd0TkdPTlZic0QxOEp2NGVMS2dUekNrUENN?=
 =?utf-8?B?TVRtaEVFOVl4SHJETTlsSSs5em5EelpkWGtyL1NWNDU1N0hsRkVydTl2bjdH?=
 =?utf-8?B?YjFTRlJyUXJweDQzNnJYOTJwVnlha3EzUjgydlY5REwzWnE4MGxwZjAxeFdK?=
 =?utf-8?B?bVBXSmtiL1NwR0h5bnVzUy9ySGowUEFrZ04zTTEyU3pOWUU5czFWY0FWOWZj?=
 =?utf-8?B?ODhoSDFIcEVRVmM2SFJhU3liRmlNWVVsbVBjbHdEc25MdFMwQ0dNd2RLWnhU?=
 =?utf-8?B?QlBGQSsyZy83N21acE1VU3RqRndCQ1R5TzFDaTZoQ09tbG1QejZzVkM4bkNX?=
 =?utf-8?B?Q09GdDdBMUhLblhKOTVsQkJTUEkwbndXNDFJT3h1dmxVVDZOWkFycXIxb0Vr?=
 =?utf-8?B?ZzBVbnNTRC9PY2dvSENjcFJxeElwQ1pkTm9ocENQZUhhSk1meXhqNGY3bjZ0?=
 =?utf-8?B?WElRVDJhVEgyS0xKdFFvbWk1Q2dxZFNIMHQvbWdoYVQyVEptWlBrazFrTDdO?=
 =?utf-8?B?dithbnRNeXZDNlk5TU9EYVdudTErdmlnREFpdzlKZlkxMUlUWGJDcWZ5YnNX?=
 =?utf-8?B?VzNKUHkrQnh3ZnpIMTdKZmF0Vkc3MzAydW5FcG1xOC90dGZIbmtKemJhUk9n?=
 =?utf-8?B?ZnlUQjdRSmxROU84d1ZRU2s5bkZnN1I1bU1sSVdSOW5VNzRXYjZ5bjFPTDUx?=
 =?utf-8?B?Z1FTUW81U0NtaS9CR3hNek5wZE1WdVFYQ1ZKME1ERXBNNElNcUhUOUlJUDMv?=
 =?utf-8?B?ejVKQVI3YUx5T3NwMDVhL0svN1ZtYkZQOFdHQUJ2Y3QreHAvWjRFSVF5ZTdM?=
 =?utf-8?B?ZytIcG1JZnJEb05oNTQxSTJheXhDcFRaODh0MGFuQmF4bVZBNitYKy9YNTNY?=
 =?utf-8?B?bWNFaHNJeWc5bnViR21nakpZei9LOUR0YkQrVGptRzNyY0s0cFZLb2FrUDB0?=
 =?utf-8?B?WElqeW1Jc3Z1SkZKeFhXWTJjT1REMTdBUnhOSmZoNS96ZHBuNkYzbVhnZkg2?=
 =?utf-8?B?bytVU2MwTzVkbFIySWxnQm9iaDI5OHVZNXVMK2RDWSs5ZmYzOEp5dzBWMU5j?=
 =?utf-8?B?SFQ4MER6QStPMmRzSEFQQWNob0pHeHk1NEgvY0hqQldjdHROVC9xQTRQKzBz?=
 =?utf-8?B?OW9jbGxWYVZpT3RSUThxNnlmNG1wdWROZyszbjBZT0o4bDE5K0NzTmJiNXNM?=
 =?utf-8?B?ZVNOaTMyc0c0a2NoV2xnS2xHN1lZOFBPL2hYR0RIdUJlL2JLSCtYMnNwUjhM?=
 =?utf-8?B?UHI4eVg3TmRJRFY3MXYwU0F5MWxKOHhOQzZ4SWVWWTZVZS9yR2lqdGdHL1dS?=
 =?utf-8?B?cE1lMmhLRFNJOUI5SWE1ZjMvNThNNGxhME9hWEM0U0FJdFdCRXI5Z3VFb3Zq?=
 =?utf-8?B?eU8xUTZySHUyUFN0UjhQT1p5eVBLaXVENFF3Y0NGcXBMQVhadmpDWW9JL0Vh?=
 =?utf-8?B?aDJJUk9IZnAweFBucVV5UUMzdlVRcGVtanVjN3ZZdHpVK2w0NTREREgzNjVG?=
 =?utf-8?B?elJ2a2VEQ1MyLzEzQWhNdXJLWkYyVmhFeC9zc25qVjg4WmdpSXYrTkV4M2J1?=
 =?utf-8?B?WlZwSlBTUGFMUnVXTW1zRGptWFRtZEJ0R24raWpmUHQrWmVhNTl0OGFETEh5?=
 =?utf-8?B?TnJWdFhDblJGQW5KdjJYbkhQK1FIR2d3RUFpMTRLdHArVVNtSDlUa1hUMk5C?=
 =?utf-8?B?c0RkUzdsbmxxOGhDOWhna2tZeEtobUk4YkZoOUVhcy9wWGpwa2ZNR0s2aDM0?=
 =?utf-8?B?TkNOYmp6Rml5TXU2U1lyVTFybXpBODF4aDExZEFPU0MvMTRPVlJ2czVCSUw4?=
 =?utf-8?B?UUZXc2l4TEJnVTJDWUVMaG9waGhpMnBTRTQrd0JYTUFIVW81YkJsdFpuUSt0?=
 =?utf-8?B?encrK2RXYWZ3OW0rMCtOK0ZJRUVTWDlLd2VwVkJQZjFFMUpiRDZjay8vTUxX?=
 =?utf-8?B?MnhqT0FaQWVjOVNKTkZBWWZ6VUZFaVBzdkdZNlhCMTJBcmVXVUVIcDdVcnFV?=
 =?utf-8?B?UGg0L0xmUGFwb1dCM3IxZU9zem1PTEhnUFJqcmtzWTNlbFBUMXREckhheUI2?=
 =?utf-8?Q?Uf06BAmhkKK+lI3jIJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec96186-7edf-422b-86a0-08de5652e56e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2026 05:31:56.9559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VH64QQf4VOF2dcDdUL9tsPxUsdNUdL7tylwm9hyZZifuCzIHpFffd+w5ENGTiOBSjwlUHHcRUNmezaMrqPZSag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11016

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsgTGkgPGZyYW5r
LmxpQG54cC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgSmFudWFyeSAxOCwgMjAyNiAxMTozOCBBTQ0K
PiBUbzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kN
Cj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9y
Zz47IFNoYXduIEd1bw0KPiA8c2hhd25ndW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlciA8cy5o
YXVlckBwZW5ndXRyb25peC5kZT47DQo+IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxA
cGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtDQo+IDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBO
YXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+OyBOaWNvbGFzDQo+IFNjaGllciA8
bnNjQGtlcm5lbC5vcmc+DQo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxp
c3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtidWlsZEB2Z2VyLmtlcm5l
bC5vcmc7IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgU2hlcnJ5IFN1bg0KPiA8c2hlcnJ5
LnN1bkBueHAuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgOS85XSBhcm02NDogZHRzOiBpbXg4
bXAtZXZrOiBhZGQgYmx1ZXRvb3RoIGR0cyBub2RlDQo+IA0KPiBGcm9tOiBTaGVycnkgU3VuIDxz
aGVycnkuc3VuQG54cC5jb20+DQo+IA0KPiBBZGQgYmx1ZXRvb3RoIGR0cyBub2RlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogU2hlcnJ5IFN1biA8c2hlcnJ5LnN1bkBueHAuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gLS0tDQo+ICBhcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtZXZrLmR0cyB8IDQgKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhtcC1ldmsuZHRzDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OG1wLWV2ay5kdHMNCj4gaW5kZXgNCj4gMDUzYzVlOTFmNWFhM2FhZDk0MTgy
MDA3MWZlNzA4M2U1YzE4NDQ3ZS4uZWE4YTMwNTBmY2NiYmY4ZmRmYTliZDdiMQ0KPiAzMDM2MTQ2
MmU5ZGUwMDggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtcC1ldmsuZHRzDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDht
cC1ldmsuZHRzDQo+IEBAIC04MjUsNiArODI1LDEwIEBAICZ1YXJ0MSB7IC8qIEJUICovDQo+ICAJ
YXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDhNUF9TWVNfUExMMV84ME0+Ow0KPiAg
CXVhcnQtaGFzLXJ0c2N0czsNCj4gIAlzdGF0dXMgPSAib2theSI7DQo+ICsNCj4gKwlibHVldG9v
dGggew0KPiArCQljb21wYXRpYmxlID0gIm54cCw4OHc4OTk3LWJ0IjsNCg0KSGkgRnJhbmssDQpO
b3cgaW14OG1wLWV2ayBzd2l0Y2ggdG8gc3VwcG9ydCBJVzYxMiB3aWZpLCB3aGljaCBzaG91bGQg
dXNlICJueHAsODh3ODk4Ny1idCIgY29tcGF0aWJsZS4NCg0KQmVzdCBSZWdhcmRzDQpTaGVycnkN
Cg0KPiArCX07DQo+ICB9Ow0KPiANCj4gICZ1YXJ0MiB7DQo+IA0KPiAtLQ0KPiAyLjM0LjENCg0K

