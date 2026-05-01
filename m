Return-Path: <linux-kbuild+bounces-12973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFE9EGWk9GlKDAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12973-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 15:02:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4174AC890
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 15:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5736E30098A1
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 13:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786E922652D;
	Fri,  1 May 2026 13:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vYW/zxmu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022130.outbound.protection.outlook.com [52.101.96.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67D1EE7D5;
	Fri,  1 May 2026 13:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777640546; cv=fail; b=IXu94G1oNIc4wsl0aQ7AkI0g5lcUCKJEyCpzxdSt8sPjTt9qqESOYP2tOotkBfbdx46gzbVvfQ5D//CLr2bdDSBUKleUXVwnV5ZYIMi3OSU08F6aw6nr54izdqP4uqc7WLMQQS0JQ/YYpQXIDKZEmD/Fuq2M54TqMqdVtz4vDYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777640546; c=relaxed/simple;
	bh=oJTOr60VCurG9D6cOW9e31sUMpWyfdI/Z3Dd9mNae4w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ryA3/lVtOooSaRQem2ZBIlIy6mq0bPlSQR/6yJBA5cCxzOIwdliYDj0Qj5+2y0roN4GF3AJdrs6psQbpEaCnHyDD+Cla8hGXV67sehLa2wtqYWoCtHk8qUQ+UGUUReN8lcY1qtIbkiSN7fgOCSrY0UtuOaZ1NNZRl98fxUR0dhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vYW/zxmu; arc=fail smtp.client-ip=52.101.96.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGXOKjKwtnTuT4ep97CaZl1fThYUCoWILEmC66UXWkuVb2sNja/zV8LwisLtEv7RmfseMkRv8IaVjRoONUlYnBOw1KUlZjNcqD4xeTvS3bbYGRZiS31DnqaSRZLDDsC7yhhqlWOUHg3eOSHPO+YYn46+DURNZkkUkPuvpKgs1KBnOimIym0FhAfg5lQF1FT8UnKe/AnFlPG74ShqzqOHn2PXmLd4FDPljRu2oSCo03KoJFW5m2DXDGgsa8J2v1xiLYPHrTLJfNLsw6oAaPsX+KzO84jNQEhJ5pwDmFYbVHMyUvSLZz1ZIHqgTuInL0sgZWcP84K0bWjliWcrQWKNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOpvnaxbMpIEoMRzMM5IFwcvjkbhniSFXkBJjbjBRs8=;
 b=gVC95XNJB3KmR5Bb9mBr9BGI6GoFIMDadLoS+6grj5Z4MzTOjrbiT3Bxl4RVM1AR996fQun6ek+/js6gz4B1Tsye/9dxxiZWKWxTbMqG0R1LdiN7zn8/KoTQHhuQEc5rTmbf8uqOEDAjVUw1l30OdRbIQF5HHHwIOJfLnMY2pfB6J0MsHnMN8rt4EQWUa8RH6+QtfiO0+gcc5v1s7OWj9blaZseIgvSZDND/dXPya4NKFkjrJdRfJV0sR3M4t/o8cB+zw8oY2mtB07IDrez/Jt1tK+7RlgjOnxjG/jVdYGo/9Dutp637p3u8C+Elfw6+lGEIk6TuAWGm+1D/Jbv4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOpvnaxbMpIEoMRzMM5IFwcvjkbhniSFXkBJjbjBRs8=;
 b=vYW/zxmufqTY/A66quh0YpV8LR+o2bcaakrsVB8lykwoc4uSYpN7hPKThZDrN3mhYaCwrdX1KVzMm/pDBfXcfhz2o5V004BYW+a64Rv+kEqZtzWKFLQFNPhTLU5Jofs1we7jV5USIbS9zBK/6jLrZ9zGpMdFdIcQN1qfhMg6TaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB1937.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:63::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 13:02:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 13:02:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 14:02:19 +0100
Message-Id: <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] scripts: modpost: increase buf_printf's buffer size
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com>
In-Reply-To: <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com>
X-ClientProxiedBy: LO4P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB1937:EE_
X-MS-Office365-Filtering-Correlation-Id: abfdb296-a7e0-4e2c-16b6-08dea781e104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4yoph3+qx9AU7BBLV6u5QoswNwgZPZ7d0SdBQRJz4TzrnY+xdGgJoD/FnOcXH7azxDzm+yQQvhhqnfTtpvrLbfjVnwBUdjAVyCuix2CJpuW4N4V47Htme2pN5D6qu2LkHgwRSsamua4j+Rv+uiVQg3fLjcZjCSfZIIEv9WGbrnx37ZlJenN2haUOmkP0Ri1XHYC26sCphzkpmkJFTi5GT0UWL0g/336H4648U38KJ3skWTMAaco2TPTGBbf/QhMecEhG8MINd7pXK+ySx+/vBqs92wK1y6rDBsLTKy8b84pwoAKr3Enq8QM5KP1ivxIBhaFmEVxuk9aDNsn3JbtUrP9CtJ3AcbWozNy7XpyrpJ8MwblVutLxTLLh7zCFNuhblRfaULrBS/324iHDKVjhGltwwth8h8sF9/Ci1ZDTeYIqEpMklCGSchJI7MZytO+8SLv4nNmFFxG8AsLh3NZytqj44qDHYHJHDvTEJXC21M4WapOBG8EF9vv0O2wOfqGum9/7BKJDy8i+QMJFIGTqdS2b4/01AMe/0qxV4cXkyiykBfCUsuqXyOr9Or20u8xxf1FeJ6B5LJfSl5IeLUi6twQvnUotHfvo5Fl/9o0mDtSPDm3ZTHqp+BDIXT9OOwh1Fc1Dk5DOIQTQRtPkUrrAYnCdM4HpYcbrbA6L3KMoXvrRVCvnVaWx/u9NzkuI/fRKyNQLru1DrzwtuAfztxM0VUVAV9GPUQNSzL/rQciakiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ArbHYxeFFSa2cwVEc1K2Ntd3E2NC9qeE1JQnE0eE9PejAwaHcvOHc0dTNa?=
 =?utf-8?B?QVk1K1lMVklyaHBMaHgzUUZ5MU9GUkxVM09kNUkvSDRJL3o0dTlibU9TZDFR?=
 =?utf-8?B?Wjlxdy80SWcxVUtIMXpOQXR1YWgya0NodDJwdmZlVnJSR3hHREdLS0FJSXZW?=
 =?utf-8?B?MXVhTEk2ZTNoZk00WGFmZXV6d25DOVBHWnRwOGFFd1JWNjdNb3IrMGpaaklB?=
 =?utf-8?B?RlQ3L2tteGY1MngrNXB3Zk5Mdm9LdmlWc1ZNemgzNHlEUVBuSmlyZDhDem5F?=
 =?utf-8?B?R3FIRnNwTEdtUy9zMGY3aG9NODNWcVhyZFFDUFd1T0hqNzUwaTdWRlZscEFv?=
 =?utf-8?B?S2RveHVJb05WaUV0THRadnpsZVY5VkpERDBoT3l1OXNXZ25kWnF1TlFDMi96?=
 =?utf-8?B?TndHd1BJVjgwM08vS3E0MkRkZFBHTmFKS25SdUR3dTNUdlE5bU5QSXhZZ2cy?=
 =?utf-8?B?eXdvak8vRkQ5enJjMFhIb1l1TzAzdXlVdUFCQXNSN0xnOHRSbnBZdEoremtF?=
 =?utf-8?B?TUlhV3FxWVgrOHY4dXVLNFd3S2tRaHBjN1FoYXpnMVJrbGZUKy9rSncwOWp0?=
 =?utf-8?B?ZXRYOUIzQ0QzTFFBV0RIaFhHZTBXMmdZTktCUURuajFiSk94eVZYOWlYQitj?=
 =?utf-8?B?eDFiRlFVSkt6TVQ1ekJmbFN6K1FVSm5NempNWENBUmN3Q1lXVTlwQTJvRGFQ?=
 =?utf-8?B?S0p6YVlvdDFsS0xuVk9iOTE5MDVvNUxLQ0N3MmhReSt1ajZRSlRQeHpqaGd4?=
 =?utf-8?B?Vkp1Mzl1QS9kc1hLalFCbEtiSW9nUVh5MFZWYjU2aThRbTIrdC9iNG9INFI1?=
 =?utf-8?B?anZwMHg3TERnVjRKNGJ1KzVpQnNRV2Y4eDE1TUVaN2dzeXR5SkxOanZVSGdk?=
 =?utf-8?B?SGpzNXorY3NERG1jMXVuVndQMHc0emhKSFpCcjNCdE4vUWl1b1ErNXcxekdW?=
 =?utf-8?B?VFFOK0ZWbFdlaGtPT3lFeU9YaGhIN0FMSHpsbGdmWlNib1kwU2krQVNjYmts?=
 =?utf-8?B?SFZaVjY0TVB0OWRSMFY2T3drdGdEc2tnOS9sL2ZmbGdOYmM0a004TDV2N0tQ?=
 =?utf-8?B?M25tQklzK0t0Q0JTSklLWWw3cll3VlR0NVVhVHVPS1JMeFdGVEVLK3NNajMv?=
 =?utf-8?B?UnA2MTREdUJIOWVYSlRHZlIwQVU1MUN3UThmYjM1ZndTN1V5TDdhV011dDFv?=
 =?utf-8?B?QmRGc3BHcTlETy9mWm1Db0VhZW5SajJTd1RpNGFEZGFhTm96dnBBNEV6TCtM?=
 =?utf-8?B?cEgvTXJDMmNVNU8yTUl2YVdodzIxaXErOG9jWGdHTjhMMm00S0tyQzkxYm5o?=
 =?utf-8?B?T2JhcWtQY1ZIOUl4bCtGTWF4U2t5TThaaDdFcmM1b2VKMVBxN2hJWGdFTUZ6?=
 =?utf-8?B?NUFvV1R2T3Q0Q2JzajdpMTEydUhBRk5NSnBPTmFqdWpsM08xUGpwblI3Zk5T?=
 =?utf-8?B?dmovcFQxWkQ2Q1NIdmVVOUhyMHp4TnpkRGt1c1g2cElsbGJsZHFYTkRETjU3?=
 =?utf-8?B?QnRzcVE5UzIxTVpnMUZRSFFQK1dqNmR1eUpaVkdoSmE2ZXR4ZEp2ZUFEejFu?=
 =?utf-8?B?TzNTUVlnemtOd0J2dDBad25KQXFlRndPZlFXbDFWNGo3cHJ6Q2ZKT3BLWExm?=
 =?utf-8?B?REN6OEdhdU0yRGlGWDZSZDQ1VGgzbzBoeUdoYXk0V3lmN3ZnSUR4OFN2ditC?=
 =?utf-8?B?dkZRU295YXBYMGhRem4rY2k0OFFiUDlrbWZSZEl3TFFWVkVlMDdCcklXSGt5?=
 =?utf-8?B?QjVSZkE5YStkNktob0RYUGJYMkVZd2YzOW5IOXplK1JRS0dSM2JsQlhoQkpy?=
 =?utf-8?B?SWdIcXVvbnUxRHB3UkRnYVY4REFHR0UvY3BFTm1KcnYzdk5yNFZPRk1UZzFq?=
 =?utf-8?B?amNROFNuK1pWcVlvZGtIWXVoZHkyQTB6N2ZSckRGREFVTFd2Q3VES29ES0N3?=
 =?utf-8?B?NDQzbmZjbFVoaU50ZmtsNnZtWWdhbkpBeVZSSUpueFVWSzVPanRSK2FJeG14?=
 =?utf-8?B?V2pEV0RyR2ViQjcvanp2NGJ5YjFGb2c5Z0d3bjl2bUpqM1pPd3UvRVhvTG9h?=
 =?utf-8?B?QmZGd3pCK1pSdmwzU0tZWEtvZGtHc00xTjhTZUo2WXlXdEhwTFUzOWxhZGtR?=
 =?utf-8?B?NStuL20wTzlMKzNwYjVhQXdSRDdmUGlYeEdOU2oxZGlmV3lnckIrSlZqV2lB?=
 =?utf-8?B?MGxDSmM1SDFySUpTYjAyWGdoZzN0b01OYU9DamFteU1vbjVSZUJjaStHdXhm?=
 =?utf-8?B?RjNIT3h3ek9VRGlnVGNmdmxnQkFkVnB3RS90T0lhN2szaUowOVJmL2tFdytk?=
 =?utf-8?B?NndKSjRPUFFaMW1BZlBKM1pvdkVmU01PdytrU0VKNWVFakk5WjFtQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: abfdb296-a7e0-4e2c-16b6-08dea781e104
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 13:02:20.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXNugQ+lal6lk4xJMWJFarMprubMQcRl8lqVMCh020gjGGI25+i/Ka/Vfoao9skGSxTor0QGzzepT1quTtFltg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1937
X-Rspamd-Queue-Id: DE4174AC890
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-12973-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,garyguo.net:dkim,garyguo.net:mid]

On Thu Apr 30, 2026 at 3:55 PM BST, Alexandre Courbot wrote:
> Rust tends to produce long symbol names; when trying to export symbols
> from nova-core for nova-drm to link to, the 500 bytes of the internal
> buffer used for symbol name formatting are not enough, making modpost
> fail.
>
> Fix this by increasing the size of the buffer used to format the symbols
> to 1024 bytes. It is a stack buffer, but modpost is a user-space program
> so that shouldn't be a problem.

I think we should make sure all constants related to symbol names match.
KSYM_NAME_LEN is 512 so this should just be that.

The only case that I've been hit with very long symbol names so far is doc =
tests.
Can you provide an example of the case where you're hit with very long symb=
ol
names in Nova? In many cases they're just functions that are supposed to be
inlined but isn't.

Best,
Gary

>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 16f6bc20b058..2ab7aa6edcb4 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1674,7 +1674,7 @@ static void read_symbols_from_files(const char *fil=
ename)
>  	fclose(in);
>  }
> =20
> -#define SZ 500
> +#define SZ 1024
> =20
>  /* We first write the generated file into memory using the
>   * following helper, then compare to the file on disk and

