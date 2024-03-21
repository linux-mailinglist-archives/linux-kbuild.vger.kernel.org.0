Return-Path: <linux-kbuild+bounces-1271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025028858AE
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Mar 2024 12:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 551DDB2183C
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Mar 2024 11:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56DA74262;
	Thu, 21 Mar 2024 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="rNQ+701F";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="AfDQtB0/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0846E2AA
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Mar 2024 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.180.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711022370; cv=fail; b=FENdojU5LMHMcvVwdYIrIOhYRL4YPLHXDhaEqEGTvvnOv3HydJPpXWfB8UF8sm0k61CfWdSxGu7IjmOP96CwgmUaaLGdEUk81nFR2pQVDirMYr2N37QmE8+VkQXyeXENPUJ0N1WP6hvvv1ewWtq5+wn8Kc946h7v0WNZgQkJIO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711022370; c=relaxed/simple;
	bh=jCAtckOnWRqgdtXxwSoNOx1669cFGV8QAmqlR5TzGZs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ABQXCM4leAJztGhqZ3ZsKcj2ExNs3U8q+Fn3jVMBIcRlpMNt+3CJFP80MUxSy78G3tON3axxR5g23nILb4OQajTmKwd1+OdHjaD6UMNR1GGflvYEx6ZozfDfoZ8kaZt0dmCxsx5c9pM8S6WESqk6DBOiJm2KzxNFAoXwEC+qPsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=rNQ+701F; dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b=AfDQtB0/; arc=fail smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42L7LeK3012835;
	Thu, 21 Mar 2024 11:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
	from:to:cc:subject:date:message-id:content-type:mime-version; s=
	dk201812; bh=zkveGeqGB1ZT08z+WOpbfcr+QzzAJ/qLKsdVutHT6bk=; b=rNQ
	+701F5vkV6m/jEjifsw0GWbr2zRZHDoKizPf8OjHr+DNPoNA0BHuYnLe4jOl0Es2
	+KIuSVYUTWcc+Dm0HaJ5lHi0bRLF4HBYUMC0LmUCj3/bWYZ/XHeB3b7gd82dM7QH
	siU+iymK74b/HIjSUekmgyTRbhNqEdfcHVw0jzP5CNYETXe84Z1QmsYXiDOeRPue
	vqHj/8LTrOBZfa3uYz2BkKhMGb8xv7LSNyRFobpC2ZioFT+NgXMRIosGTmJxsgZJ
	EYzHiUxDJJUUjSzj6//+If+75nzZTXkAgB8fzO/inAUVFMQew63iohkOadxsjve1
	GreROojCjTQm85vv17g==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3ww4cwr696-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 21 Mar 2024 11:58:59 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 11:58:58 +0000
Received: from CWXP265CU007.outbound.protection.outlook.com (40.93.68.3) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 21 Mar 2024 11:58:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNvnTxoNlZdpEwg2pzbG7y7oAVMklTKE3wEbp4LfY7ausq25MdhJbvH3bofhekTUktmWONOdUPKCMZBrLTJj4SqnV5pqxGedNxneQsYejkN4bxxY2JTl3iVnpC43S/CpDyd1CzCMVK1gbziFjsrWGMcEocULvbOLWyLyy12FnRl2cdXFR+K3uWLSE2Na5cz1NNqjEVO2nU7N9OdfJ5IPaiJtCiGdxfNsa26vvxcyb4nVs3nIGBN4ATLG0riYfVfWIkRPdO6dvz4cGG+a744VCmgSGpW1V28gEi21D4g6lXQ6+newoco0ToqKklIg7IJL9PqaVa82EzYueM7YpOd08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkveGeqGB1ZT08z+WOpbfcr+QzzAJ/qLKsdVutHT6bk=;
 b=hgeKSGUQKo8pkpzby2ZjBiYcpyMn1CoNhNiIFEMizKEiAzz41mf0Hpu1uYzXj1bcWI/tM0DxAjhGS9pTQZdh39SV9Owyi26ohPe9g9/Uz4pskKn65Ex0tgbEo4145T+QEJGCy7p5mECkZV1yAPp4u4Ji2mhIUYwLLlQ4EF0Dm0EcLh8g4oaIvRVYyLvQRmaUXpuwauK4EcKEQXLYjwcoPl+woqXzcODhd/cbd4HMIiRRlDGvx90zq8wmXVMXb9FMEV10gadwXJaAcNqvqGW5LL/4Y9XWNt8RGPqYcMk84Tk4nrHrpE1TPRGbE4S07+JETVgk/l7Mzt5/sJll1L6rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkveGeqGB1ZT08z+WOpbfcr+QzzAJ/qLKsdVutHT6bk=;
 b=AfDQtB0/MpsIkufHpC9Q+XkYc+fAjxZ2jY2KqBr0R5v5nAHIvo8P2li2egq4fS1VDc8tZnBpVccRK8ymhNeKDGvZNfOjRR8GFS8bD5VaNJjLW5pvKEqJoyPKmCvOo3ZSW1kOJoj9RlibIlb93kgadZrdOxq34DnCZNQoJDtcBz8=
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16c::5)
 by CWLP265MB3394.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 11:58:52 +0000
Received: from LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b]) by LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
 ([fe80::92e:bc74:c95e:719b%4]) with mapi id 15.20.7386.030; Thu, 21 Mar 2024
 11:58:52 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
CC: Karolis Mituzas <Karolis.Mituzas@imgtec.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier
	<nicolas@fjasle.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Carlos de Paula
	<me@carlosedp.com>,
        "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Thread-Topic: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Thread-Index: AQHae4ck5Pp+KL91LEW/mCP+xRabVA==
Date: Thu, 21 Mar 2024 11:58:51 +0000
Message-ID: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB3404:EE_|CWLP265MB3394:EE_
x-ms-office365-filtering-correlation-id: 7e24c82a-45cd-4b69-2264-08dc499e46bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kIICCBKbdLqpIWYkcJlglJzRVq+Au50LCMDRvZxE8725KjPF3GU2/kw4yGqeZ70sP5XvS3LGH1XHaK5OMjjwjQwO+WeykcC99c5Lcv1f/Y04/MSkrEVVz4wiwuiggd2Q+ETHIeQmFlUBmtXeq5dc2BxFY0qNuCAvGbV2CqxCRwJkdW/SB9X7uxXrQOk28YSteDWptC1FD7iedgy1gRCM7tQj7Dm4j4BRb++IQbR3orifK8VoaT2CNcP0qijc9Ek4e7oPKNL7NxzKafAiiDPw/EA80y5y724CU/gU5rxMDy0QU2qxacPYEJ9ByUCCulx6RO3JOfH0ijKTEnA8fCIt8/IePUdVjzDRuCOeUdjglxeJefwVBC0AEr5yghv1gP3Nfa7XnhWUxh9bvmDYGyk/tTXIQ51eefMJ+RBkqYu3AWPSic0hgT4OvyxhoSAruPMXDLBNnRHpJtV6RbPLwjHRdiLr4vW5eH2Usa7odEAEgbLfLrIE/wgyWGtUoKCcAmZZNBIIimzLZLBDomxbdGdxvRUTu42TIjjot/ICpq7PEL5Tah1QzJR0/50jR25lsATKx/7GGmbZZWLK/UmxjK2fOuawGZhTfuLsxCkAMufeYBlG75q5LKQw9ZDHcgL9Q+7UQd/ReMNpsycmU5BOUtiB+Yr0PtroGtEIPDFSSQptEAoIsi+Ji7ckSf+3JGOnHIQKG9uxh7ICVYdwhJg6TW8gKRCqTVfBrSGVagiK8ynahxk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGM1eUN3WUs3T1lYUXhGM1dGV2xzczIxSUNYY1JUNVRZbklGMEhQUm9RSXdE?=
 =?utf-8?B?V3RGWmxGTTlHVk1PUGRTZTlHaHJEMnlWdHVKVzdxajdITDZKRStFVTQ4SGM5?=
 =?utf-8?B?TTNvRE5aWW1MeWtidlg0NVg3Nit5akpNMnVJM1lManZoSFJaejFPbUlza0Mr?=
 =?utf-8?B?NTdoQ1drdUd6dUtlU3YwYVJzaE1nZEFTOUlYc1BMZFZSbTZEY2FUVFhvTWdQ?=
 =?utf-8?B?c285S2NXY1MybUtMeHU5cGxPNzh1VTk5VnRieWFyVnp3bnM3dTU0QjZ6ZW1G?=
 =?utf-8?B?dTZKTkZnc2VpSDJvdFV5MXVzM2xHUmMyTndKSWlwVzBuNFUyb2FpS1VRN0da?=
 =?utf-8?B?cHhKT0VZKzhSNFdNRXFZaHlCWE04bExEUU1TeVRWdVpaYU9RWTk1ZGc0Wm02?=
 =?utf-8?B?SkVMbnR1N1hZbEFOZ1pZZWE4OHdVNnFRZ3JDY2d4ajhTTmlMaG54NWI0Nkxx?=
 =?utf-8?B?WGw3bytTN1YwQ0tsYTBZVnQvQ1NMbjRxNFQrTXR0M04wRkJEWFY1U2RsUDZO?=
 =?utf-8?B?bnYvMFFhK2dtQTNoYlBmSm5mUk9hMzg2T3JWVTNFSUloWGFtOUQ1bHo5b1BR?=
 =?utf-8?B?YjFnQ0p6Z1pqWW1oTGl4TkVhcVBtS00xL1hmTm16ZTVmOUhuRjlYa2J1NVcz?=
 =?utf-8?B?aHh5VGMwMlF0c21LclNOczdRSlRoZzhyRmFmd0x4dzVIdS9ydnB0cGZnRGFT?=
 =?utf-8?B?SnlzTDVheWUwRGptLzMwSWFCQzNrQ1oxUjRCT25KbmFhdm9iajViUVFwWjlm?=
 =?utf-8?B?bXBGazJIS0RwaEhyVXUwRFBlTitvRzJKYTZrbXBuaHg3Q0xWYzdsUFEwS2Y0?=
 =?utf-8?B?dll1ZkJVOWdSRmh1dXpmbHUvRiszNEYvbk9wK0thV0FvaXdYZ3BkTnJhc1p2?=
 =?utf-8?B?MWJwT2tWM2djTHhBY2xxN2JuUVFoQVZYU0dxOVhwQ05IWGk0M0xqRWVoUUkr?=
 =?utf-8?B?ZWdXT1NrUXR6ek9oWDdvL1NiaVJKTmg4NWZLTWZVZkV6TS96a252Nk93VU5S?=
 =?utf-8?B?dlI0TmlmVGFjd1lDZzN2N0ZFQnE4TFRRa2MxYjhFVlhYN3FFRjdMMnQrRWdx?=
 =?utf-8?B?VXRsbnF1MlNoUG5UTXNpQWN1RFJtaUMzWVFBYUJUYkVMWFhKdmN2VFJhSWM4?=
 =?utf-8?B?ODV5TktXOHdjZVJqWXdMZTVNYjNVcWhGeE5CMVFWZlB5VnVsSFE5MnhBOGVV?=
 =?utf-8?B?WWNKcUlaUmJ6Y2d0UEF1aDNwbUFYQzlHR0RhcDRMT2FxTmJPZlhjemprdExy?=
 =?utf-8?B?M2RjV1dIZXlXSGE3dkRpdDFwT01oOXY4U3dndjk5VExCek1GUmt5Tk1NUTNL?=
 =?utf-8?B?bWZuN0pnUytlZ3F0Z05iakZjRzhudXZjcWZhR1pLNUl5VnNWdVVSd1VJS1BB?=
 =?utf-8?B?Ky9xUUFiLytQdzNnTnM3eExsV253U2VVSjFQd1ZDdGprMEJkUExPMEV2WEhF?=
 =?utf-8?B?NWJSVStQRkROM2pGWGFKMk5YM2hlWWs2Snl3c2Z6Tml1eXVOL0EveHlBd21D?=
 =?utf-8?B?Z3JsdDVkdm9wendPMGV0N1MzRTBZWkVDNDJmS1BWMXhqTXJSak1SazZhc1o5?=
 =?utf-8?B?RFNhWGxQTHZ3eE9vZnl6cTMram01UVVVQUQrL09mQ0t5c0NKZ2tEZkVSdkhB?=
 =?utf-8?B?dnVVcm1OeWhpWG43eG8yQTJ0MFVuNVZneVE0b250UjVyeFpLaXBOOXBqTmdF?=
 =?utf-8?B?d3Nza1VFaXhIMCtpVnNrMXZ3clBYcVN2VWhaZjc4Z2VFU2hoR3VVbkppbFlE?=
 =?utf-8?B?MUk1U3pqcjV0TmVNdUkrWkRpbGdwSUZaYURJNG01NklSZ3JmdVJrYUp0YWEw?=
 =?utf-8?B?dTBsMExpQlRuSWhzd2xWTnU3SXFCQXNTR2I0aEZGT0IxMWZPd2tobGNiS21T?=
 =?utf-8?B?cW81UUVRS1grS1ovdVNqNmN4K3hrWEdzZmFaaFJpRDJOY0l3SWNnVzBuM25E?=
 =?utf-8?B?VTBTUDFIdU5vZytxMXZtRHc1QVE2SFFsZ2xYQnEzVWRoK1NoS3JFY0RlTk85?=
 =?utf-8?B?ZEx0WFZSODloSzhyckRpOUNVcStVR0dkYjhOaGRwc2VOZUxrK3hwamVrNHV3?=
 =?utf-8?B?UWRXWEw3bUpSQUNLb3dpYlNQZjVDM2wvRDdRcnBHejNFSTMveFV2emNNWi9s?=
 =?utf-8?B?WXRWMVFRV01vNzdjWnFiekwwVGd4c3NFSERSY1NlZ3FWREM3WjlOT0N3dFdz?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vRmCMF8JgrvcguGD0N7XNlHr"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB3404.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e24c82a-45cd-4b69-2264-08dc499e46bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 11:58:51.9610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjnOUkS89K/ih6X17EbpceMz8Dlend4NFiyVsvLYo2MwxEH21HHfv9d/ZkkNFTk0dfEIcFOwJW6VySkozl5p/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3394
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: s9TmNYYcb43jhV5B6cEL1QzJ7dNK41yB
X-Proofpoint-GUID: s9TmNYYcb43jhV5B6cEL1QzJ7dNK41yB

--------------vRmCMF8JgrvcguGD0N7XNlHr
Content-Type: multipart/mixed; boundary="------------Pk0zzoktJNvTERg55QaWTgU5";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: linux-kbuild@vger.kernel.org
Cc: Karolis Mituzas <karolis.mituzas@imgtec.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Carlos de Paula <me@carlosedp.com>, linux-riscv@lists.infradead.org
Message-ID: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
Subject: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv

--------------Pk0zzoktJNvTERg55QaWTgU5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Karolis Mituzas <karolis.mituzas@imgtec.com>

This matches the behavior for arm64 [1] and prevents clobbering of
vmlinux-${KERNELRELEASE}.

[1]: commit 0df57d90bfd6 ("kbuild: buildtar: add arm64 support")

Fixes: 7d0bc44bd0ea ("kbuild: buildtar: add riscv support")
Signed-off-by: Karolis Mituzas <karolis.mituzas@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 scripts/package/buildtar | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 72c91a1b832f..a36aca2a27cc 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -96,7 +96,7 @@ case "${ARCH}" in
 	riscv)
 		for i in Image.bz2 Image.gz Image; do
 			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
-				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-$=
{KERNELRELEASE}"
+				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinuz-$=
{KERNELRELEASE}"
 				break
 			fi
 		done
--=20
2.44.0


--------------Pk0zzoktJNvTERg55QaWTgU5--

--------------vRmCMF8JgrvcguGD0N7XNlHr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZfwg+wUDAAAAAAAKCRB5vBnz2d5qsAu2
AP9tSQhisLxyA56Cx157TFEC6Sx+mR0XPWOkAq278gI6fAD+Lz/FaQQCAwWppg3DbvKZVEkl3HOr
js+VBqfWkEPvBQo=
=W3ZD
-----END PGP SIGNATURE-----

--------------vRmCMF8JgrvcguGD0N7XNlHr--

