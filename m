Return-Path: <linux-kbuild+bounces-12528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JXmIsc1zWlwawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12528-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:12:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF81637CC82
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B339A3049463
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 14:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3922D6E64;
	Wed,  1 Apr 2026 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nlbjavTp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020121.outbound.protection.outlook.com [52.101.196.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9630FF36;
	Wed,  1 Apr 2026 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055539; cv=fail; b=Lsr2VkEChGyh6juaAK1zswGA1nYxPzpY0HxCTqx5yjEZsytk/YX6cupOIoTjMu4u0h27HASvR+qTz6+t6DeqvBVu/Kb2G2HBfKplspGGyFvhf1eKDMmqrf/D3RNaGOmqmvE7+hCGYBuwGSUM42cUX93Y1f0kSBz+ekADqMqFqK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055539; c=relaxed/simple;
	bh=TFQ+cbtttZ0zFxM8968YgyTZBAOG9c1V6tQ342+Z0CA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=so6bUdb9KWVfCotmKAVMYqX9bYJ1oLZM8cSKiRKvPaNBQ2+AvXAZdRxh16qs6uj8nnZBOp+dVmhIr6+YpGyx6qVh+8E18aFK5rx2aNAF9etShP2tdKOPUY5Vd8Miy/qarBoi5Y6AD2I5sJVjyemaZK6rb07WoHo6Ac9dxUnw7bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nlbjavTp; arc=fail smtp.client-ip=52.101.196.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw/PjoDgY6bg8X6aDpxcszkhd95md1gY9AwhBbunaMa+7bmN1xLltiNCj5oWOmJEHVwW1LdbVs6hmBPam02I3XpH2XHbm4qy/aR7/+W7CH8ghZupSV0GQrxvW9vVZhfPHl3LJAmX3TP8l5d73kXcOSndiJJDBkej0Sl440HG9YygpkMGBLs0Ji1wroE5R5F5eqUViQ+ODJoMf1eO27e2n1Q61HcDXM6aDGle7PMO0GM1wGzeiw/vo0l+RdVaUom+ZfwCmKifysp6CwXYf+PWsegGV8wXgeWqVSOECRfOwtqm0fruZ6+vKXmznpGgjxO1+MyuvLQg8TcKtOSX/HGbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYp0xWvrQI34YjzWCRKfD/vbYPKugUhT4iiOsvBiPoE=;
 b=YGHiSGTaZRBW7eXTemgDcXTQmVc/z6m5H8soE9v9vmoYGKXYewsuJ1Lc6a9CxGbAolxwKFoy8OIWOl23SnEJMzDQK9CYQN7VIP0kYpATeEX49BC8lIJS2+1v0DyH0BJaDXDXd9vjMdOLfH+1w8pxKeopiBSQRfhVAgw01n25N9+yRVvNi3LVeej4WxlTNf514bAwqDLSeY+ETz89bnSPdKTBdStjPLYxyzQvKdOKUxOpyhxX+GbmMMKMBcMbvj+eC2jJgkRSIDzqqukTYAqo70ka3QqD2idWYIBmRfHP/+JA5ViYdLPzwlEYaRS7izdVZobRQ6tU9cCB3xnYdGJ/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYp0xWvrQI34YjzWCRKfD/vbYPKugUhT4iiOsvBiPoE=;
 b=nlbjavTpx0CKlmqDBpOaHwDJjP02TovLg3UYgFgjz+Jxfw3jrVjAhRdf5FZxrJvv87HW4jHOywvPDhyEVgA901E9Ir6Yj+Yp/F65Uf0F0pq7Egu6Vf0nJyL5bD9r0l2Tf5rowczdS2/9Z4Klwjczehpt9kMuVvAH/F8Hpo32Z/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6385.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:58:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:58:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:58:50 +0100
Message-Id: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-16-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-16-ojeda@kernel.org>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: d21b32ee-b731-4dad-7d80-08de8fff2fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v8TDFYRG56iquYQGbmX0y4ORfVsS7kIMh1vFJujRdjaxuehvcl2AQ+plT9zNxA3kEHPoujcfukV6ivfIVIO/FJkAIztoAT+t6JEsblBDMNuZDLFyWO/iVGW59FFBwcWAxxnINuLdpde88vkJH07lhPGrW2NkaH38xgXP7nrCp3ADx+QwkL/yyt5SnuLAp4R6TqBaGBnbUccbNRuitV7qkgO6OFpsqCV3EKGAgVHtiszedf5G+aFwKEyFYJ5eSpkxGg2oHFg6LQ5Z16tKubbhymPQIIrJkJ/J8NI0C02/KTsIOAZjbpFgOlS2zoBs5jSzWfT9tRHIvTshGvCo3m8ukovY6Na0MKWw7oDUyOl3F+2nSOokFxrxkNkr5BkhOXiU7UB64cbbmkRg7ZN9Tf6jrm5PcMVONDGMpYxosYB7z4H9ZujxNxdJgZBtWFkI5FnMIntc5TzB2lXt+LPdjN5sQRlDuF2gy4ey1RdvFU3yfATvqJ537i4RGh3GGbkCXVBphwUlaNceL1Lf8fMaBRp5BmAN7KUbDoEcncNo4gTNOfAdQKjDLTfGyvZ4WHS09Hmatt7duMHclT9fROKafUdnuGCEEN7KNjQJDGPnq3fkii1dtUO/9NWBauATmmUsQr16Vkrfc/HAaTUxe0sURvdep5vxSpAblRnkuasoDtzk+rUB+MFmQko5v/NS/2tWaEfZ6vuvEq9K2UsZGPIzWY8yKnnwuuBT3N/jvk+nAzuXQe69geJ9m16pBfSKxFRESXAXDlvJGeesFhPkOWKujYfwyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K016WTZ4ZWhrSHIrWU5pLzdxTmx3OERRVk1BN2RsRlMrMFg3RytQNEJsT1lw?=
 =?utf-8?B?R2x6dFZSUERtWUxaMGlOWGtVYTg4NkhNRDZYaHY1UzNadXh5OEQ0WDYydGp4?=
 =?utf-8?B?cXFFMFJRaFlSN3hQbU11VXFSM2JHTzlFSjl4dENxUnE4bGxBV2dlcUhQZHds?=
 =?utf-8?B?c0U0aEFRRnp4VDQ1Y1ZNSllSbVFEM2JpdHlpZkI4YWhtSk85Q3NSMHZoL1Y4?=
 =?utf-8?B?MDhQV3d5Ky96YjVFYktZdEpoSWVKOVlhTk5iSG9reGpWUDhPLzlRRyt1WUc0?=
 =?utf-8?B?dlNyV1RMV0pONnh4SDM1UkJXdDBEb0ZBbEloZVRwQTA5Wk9TRndWbkhFS0JK?=
 =?utf-8?B?RVdKWnBIVWp4SVRJalZRazNBblNGbEo4WmxBWW16dkhXWDdxZTJHVERweStl?=
 =?utf-8?B?ME1WaHR2RzByWjhKTnlPT2lDK3VWNCtINXQ2ZnJDV3czWDZwMXp0eWNHdExH?=
 =?utf-8?B?ZTBQODRFQ3oxY1ZxQlVPZ3dZWDJ0L3Mrekw4UFVMakpqd1Zkc3EwM0ZOU0kx?=
 =?utf-8?B?UStnc1JDRHRaTkNZUzdLbTRkTnFxeDR4WXhmbzh6SFlWYU9FYVM3N3ZNaHNr?=
 =?utf-8?B?OWcxd2F3dkxkYTk3YXZ5Y3hBb2JnZTJBaElzWXJ1dzQwRXh3L0Z1Q3N0Y25X?=
 =?utf-8?B?MlRxd2UyUitCN0lzN3A4KzVoVXhTSUNIa01Qekd4L0ROd0pqdjNqU0NqUGov?=
 =?utf-8?B?SzN1Y3RodytGMHcxR0s2NWFKeEtEU3B6dGhta2ZjdkFiRGF6QTREdUwwZVlu?=
 =?utf-8?B?SkJEWlZMNGJuYk1wdEVIc05peVc3dllFL00wQUVUdW1VT01DZ05QQnEvNFZk?=
 =?utf-8?B?czV2emdyNitTN0lCc05TR2g4elo5eGRaMnVNWmVhazgyM3pobXZIcEtEblR4?=
 =?utf-8?B?RXFxN2VUbEd1WXFwcmcrbzUxYi9oWCtCb2MyUDVMNWNWK2VRSGN6N2Z0NWpD?=
 =?utf-8?B?WjR4TEFjTHl5c2tLQnczZjcySlN4ZWVaOHMzUnI3TTNqbWQxL2Rrc0o2WTFW?=
 =?utf-8?B?ZHNzb0RzN2NmTjRuZTk4WkI0WUhLT2VjcDFGNG5lTkNkaGFYVzBSSEZUUURE?=
 =?utf-8?B?Ry8vSVZmS0V2VitRTStFL3dkN3RjOWRtRDlhSEhxVkw5WndsOG5XUW1mbjJq?=
 =?utf-8?B?UW9PU0FjZ0ZSa3FBZUlkdVBUeVF1NkpWSkprZnJKa2dwQ2R4cDQ4MDVWZVBR?=
 =?utf-8?B?NHBlZXVIYjNrbndKUXZSS1hFM2xxUXJpV2xPaFlhcnhiL3cvalM5eC9ORUtw?=
 =?utf-8?B?cmcwcjI0dUUrVDJRUmEzaUczMmpTV2pLdDNUZ0NTTlc2Mkh4dmU4M2dwR0p3?=
 =?utf-8?B?bjBXL045NjYwbHZRMGhwVXV4ZzZmMldSQmR1aGtkRW55MXRzZmxvK24wMVpn?=
 =?utf-8?B?azNkUzFBRkw2L0NpWGV1ZzN0TGFFZ3pVUU10UHp6b1dBRTdMUFRTTmgwSGxm?=
 =?utf-8?B?K2JvQlAyY0F1K0ROL2FUSWJVcHFHQXRsdWQ0dmdHM1hraEgxcUtqNjlLN1E5?=
 =?utf-8?B?MDRKRHQwSVJ1bFNuMnFPL1hkVUdUc05UMGp6Zi9IeXVIelkrSHU5UWNHLzdH?=
 =?utf-8?B?aHhTQUVBK01YVG0weXQwOGpaaFZCOWE1QmtWamlrWWMvYlJBRFZxQmpCamh6?=
 =?utf-8?B?Zlo0eWc0cCtUQzY4bE5mSGlHSllHcFV3OW9MVHJ5WGZxcVZJT3pSZGhNczRY?=
 =?utf-8?B?STU5TDZXMk9kam0vdTg3eEN6N3dtYytJTnJhUTdrd2xoWTFGMjdQdlRRTURY?=
 =?utf-8?B?TmZpUUVTcjNjaXNGVDgwcllmdU4xa3JubkNlbVZWQllVbUM5QmY3MHNXMDJC?=
 =?utf-8?B?YUttbzdwWm5lRUxnS2VoWU5BcTZ5dTE4TzkwTFRtY2wwaGZ6d0hPSXZmc1Bs?=
 =?utf-8?B?U1NnNC9HTWJDamtnK0dkcVNVTFZUQXlNeHVCNkczTDlvbUxFUUxXTnVNc1NV?=
 =?utf-8?B?enJlUHVGVFVLTWtXSkd1a3UyMk1jU1pqVEd6OUlYK0cyNmNWOUFhMUl0SDZP?=
 =?utf-8?B?cEwzYUZMaXBkR0xOa0RZNExpc3hIeEFhRnh3NFZhcWI1VktMMSsra0ZDSkUx?=
 =?utf-8?B?aTdGTnhIM0I0TWt0anpjVjQ4b1BNQnR5dUhyZ24vdDlIYmw5NmQrT1JVZlI0?=
 =?utf-8?B?Z2pMRmZBeE1MckhicGNlc3dscGxOYis0ZzFMTGJDZjU2SEszVWdqaVRtdUZl?=
 =?utf-8?B?NDhQL2Nhd2xxRjd0NGJlMytyaDBHMkc0RjBvMitMZ3hCd0NKWE9TNk9MVENK?=
 =?utf-8?B?UXptMHE1SU11bE9YcEw0RXdEbDNHU01WVWNTUlE2RUFaRWQ2cVhISHhJV3lz?=
 =?utf-8?B?UHNPSUhiKzlTOUNURDBIeFNJU3RRVmNaaTVjRmY0Rkw2NTNieDJSUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d21b32ee-b731-4dad-7d80-08de8fff2fb0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:58:51.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORNw/IMt69uuUFpdnxpfBVYRxoT6oGYQcnrhAIbWroPmGV6WGNlMoecR1BgAMQbnLZpfZTUDfldcpkv/tRvDJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6385
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12528-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.894];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF81637CC82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> It is not possible anymore to fall into the issue that this warning was
> alerting about given the `bindgen` version bump.
>
> Thus simplify by removing the machinery behind it, including tests.

The scripts/rust_is_available.sh change looks correct to me, although I cou=
ldn't
get scripts/rust_is_available_test.py to run on NixOS.=20

Looks like it filtered out PATH but uses /usr/bin/env to find python binary=
? For
obvious reasons that will only work if python is located /usr/bin/python.

Best,
Gary

>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  scripts/rust_is_available.sh             | 13 ------------
>  scripts/rust_is_available_bindgen_0_66.h |  2 --
>  scripts/rust_is_available_test.py        | 26 +++---------------------
>  3 files changed, 3 insertions(+), 38 deletions(-)
>  delete mode 100644 scripts/rust_is_available_bindgen_0_66.h
>
> diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
> index d2323de0692c..77896e31dab5 100755
> --- a/scripts/rust_is_available.sh
> +++ b/scripts/rust_is_available.sh
> @@ -163,19 +163,6 @@ if [ "$rust_bindings_generator_cversion" -lt "$rust_=
bindings_generator_min_cvers
>  	echo >&2 "***"
>  	exit 1
>  fi
> -if [ "$rust_bindings_generator_cversion" -eq 6600 ] ||
> -	[ "$rust_bindings_generator_cversion" -eq 6601 ]; then
> -	# Distributions may have patched the issue (e.g. Debian did).
> -	if ! "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_0_66.h >/dev/nu=
ll; then
> -		echo >&2 "***"
> -		echo >&2 "*** Rust bindings generator '$BINDGEN' versions 0.66.0 and 0=
.66.1 may not"
> -		echo >&2 "*** work due to a bug (https://github.com/rust-lang/rust-bin=
dgen/pull/2567),"
> -		echo >&2 "*** unless patched (like Debian's)."
> -		echo >&2 "***   Your version:     $rust_bindings_generator_version"
> -		echo >&2 "***"
> -		warning=3D1
> -	fi
> -fi
> =20
>  # Check that the `libclang` used by the Rust bindings generator is suita=
ble.
>  #
> diff --git a/scripts/rust_is_available_bindgen_0_66.h b/scripts/rust_is_a=
vailable_bindgen_0_66.h
> deleted file mode 100644
> index c0431293421c..000000000000
> --- a/scripts/rust_is_available_bindgen_0_66.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#define A "\0"
> diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_availabl=
e_test.py
> index 4fcc319dea84..b66fa5933844 100755
> --- a/scripts/rust_is_available_test.py
> +++ b/scripts/rust_is_available_test.py
> @@ -54,17 +54,12 @@ else:
>  """)
> =20
>      @classmethod
> -    def generate_bindgen(cls, version_stdout, libclang_stderr, version_0=
_66_patched=3DFalse, libclang_concat_patched=3DFalse):
> +    def generate_bindgen(cls, version_stdout, libclang_stderr, libclang_=
concat_patched=3DFalse):
>          if libclang_stderr is None:
>              libclang_case =3D f"raise SystemExit({cls.bindgen_default_bi=
ndgen_libclang_failure_exit_code})"
>          else:
>              libclang_case =3D f"print({repr(libclang_stderr)}, file=3Dsy=
s.stderr)"
> =20
> -        if version_0_66_patched:
> -            version_0_66_case =3D "pass"
> -        else:
> -            version_0_66_case =3D "raise SystemExit(1)"
> -
>          if libclang_concat_patched:
>              libclang_concat_case =3D "print('pub static mut foofoo: ::st=
d::os::raw::c_int;')"
>          else:
> @@ -74,8 +69,6 @@ else:
>  import sys
>  if "rust_is_available_bindgen_libclang.h" in " ".join(sys.argv):
>      {libclang_case}
> -elif "rust_is_available_bindgen_0_66.h" in " ".join(sys.argv):
> -    {version_0_66_case}
>  elif "rust_is_available_bindgen_libclang_concat.h" in " ".join(sys.argv)=
:
>      {libclang_concat_case}
>  else:
> @@ -83,8 +76,8 @@ else:
>  """)
> =20
>      @classmethod
> -    def generate_bindgen_version(cls, stdout, version_0_66_patched=3DFal=
se):
> -        return cls.generate_bindgen(stdout, cls.bindgen_default_bindgen_=
libclang_stderr, version_0_66_patched)
> +    def generate_bindgen_version(cls, stdout):
> +        return cls.generate_bindgen(stdout, cls.bindgen_default_bindgen_=
libclang_stderr)
> =20
>      @classmethod
>      def generate_bindgen_libclang_failure(cls):
> @@ -245,19 +238,6 @@ else:
>          result =3D self.run_script(self.Expected.FAILURE, { "BINDGEN": b=
indgen })
>          self.assertIn(f"Rust bindings generator '{bindgen}' is too old."=
, result.stderr)
> =20
> -    def test_bindgen_bad_version_0_66_0_and_0_66_1(self):
> -        for version in ("0.66.0", "0.66.1"):
> -            with self.subTest(version=3Dversion):
> -                bindgen =3D self.generate_bindgen_version(f"bindgen {ver=
sion}")
> -                result =3D self.run_script(self.Expected.SUCCESS_WITH_WA=
RNINGS, { "BINDGEN": bindgen })
> -                self.assertIn(f"Rust bindings generator '{bindgen}' vers=
ions 0.66.0 and 0.66.1 may not", result.stderr)
> -
> -    def test_bindgen_bad_version_0_66_0_and_0_66_1_patched(self):
> -        for version in ("0.66.0", "0.66.1"):
> -            with self.subTest(version=3Dversion):
> -                bindgen =3D self.generate_bindgen_version(f"bindgen {ver=
sion}", True)
> -                result =3D self.run_script(self.Expected.SUCCESS, { "BIN=
DGEN": bindgen })
> -
>      def test_bindgen_libclang_failure(self):
>          bindgen =3D self.generate_bindgen_libclang_failure()
>          result =3D self.run_script(self.Expected.FAILURE, { "BINDGEN": b=
indgen })


