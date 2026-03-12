Return-Path: <linux-kbuild+bounces-11884-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEiIBx6osmnwOQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11884-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 12:48:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B655427143E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 12:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 245B23028536
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 11:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A34D347526;
	Thu, 12 Mar 2026 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LPcsoVbo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021112.outbound.protection.outlook.com [52.101.95.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2FE35BDD7;
	Thu, 12 Mar 2026 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316121; cv=fail; b=Jl1qw26HLxQztQD8IIKWTZ1XTiJZdYRPveHd32dR0ojWS+ixotupB1MBIn9IWBCrgs0tSzBMXjEtheAD29ZeC/4HjTkjwjJZ/1cfRMznTLBYPErjebNKjKxSa3a3fF30/6VROp3OZxXkQXeqM57Wbj/NxZtVZ7lglJd4ZH+jD6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316121; c=relaxed/simple;
	bh=T1asWYIDPYxQeHvYnKVEcrMo/gjy21ePCVPdJKBC56E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BtP6h79qJ9GxkboWs+rmaA+W9Ngi57r2YbWzeVKn9aWaXMs0NAzsWR5q/zyZGp1RoivI2ZWYivq79cx7kSoMC6TiYSRC65ASkxlhMTM06jGDlnq9l382Kt6WFgplTHlsES7b98xzXMXWPiOXfsKlVzJvM6s4ZNyfTXpSCm0D0kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LPcsoVbo; arc=fail smtp.client-ip=52.101.95.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGHRImF11dha7kiWX2wGV4tNQQvHnFfepbFYwaEIEsM+I5D+duVCd5HFDofPeob93DrP7FPO5BitxyhFO6G4XNvCo+8XOeVwjwEQn5XkllYqG2WcjKHrDadyxpd8TvxKxL1rmYCQTzY9AIm/UN9edM+HdrUfi0ZLKvWSgtq3UuE/fqI+gXpj3aTb1L4buHPUPiUbdLMHasYMJ6JD6NBoPBCQhCYdF0O7humELpEQhEv0ZEQSv6wlYN99lmxvmdoKLhi0A99tt1L5nAu2LdSw4/TSXkprAOXzCnDJK+oJKyW9EXp1U310Pne9ZvaAsOdetrVy22BGMevZV13EjOEQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtaQ5J2SIpE+nU5i+4FxrjlL2weoA9jzjGYH5Vukuxg=;
 b=kZXYLNGB4mTSRsTPd+wVDxlxuccinIUO43WV9LBwa8CW0s4xawaOLSXaBRo0B+qVUaq/ztq33HPDcYeVhVX396yruoG5KGlHACvy3ZYAN0k6Ch3wAW7uq49h2HB9ZX98UbKMCU6G2Y/oR2RGPjYdsdE7+6p5Ajx2EoP3K0jVUwfpPW9g1ZlUcHDA96ahQWqa8TFWxXnldKhvSL3GmoO5/ZgJhXAX++m8RF7V3J4TpOeZFNvhhSx5Wppc2QxyL0xok8filO1toEkKa93bNEQjbrzierfWeG2WmEOKaBbJLXvIfEzLxIsbSsMVVh52b99Qcq/HOI0qtze4GmU+P/lwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtaQ5J2SIpE+nU5i+4FxrjlL2weoA9jzjGYH5Vukuxg=;
 b=LPcsoVbo6n7jqo77Q/jS/ySZdChA3ij43e+yQKqa6rBGs96ewdsk50WyI+faaB0wdw5N8av51rA377BHH0IIUeCYW9Bj2+U2lltnJBi/J7kbA+aDRvHIBPBO6tnzFuo5ODb/fLdit3/KbkdY2htYNKISmIMMAiDO8PeOJ0D1sS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6974.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:200::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 11:48:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 11:48:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 11:48:34 +0000
Message-Id: <DH0S3KTG8HEP.AE781DX20P4F@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] rust: kbuild: allow `unused_features`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260312111014.74198-1-ojeda@kernel.org>
In-Reply-To: <20260312111014.74198-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eead55c-25d0-4165-64c2-08de802d4b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SSoTFRTS+tOeqv3UoOXHpCuMpDunGcLU96Z9ywstUZfu3BeASun+iTPhO90H3/46fBW68B0GtL/n7NQiynEcDddQWGkTwpJwn5ATlOGg265P1aM4Bk+2cdGK3We2vmMv9JcjCNYPSJcKUfcJuE7qTns4HklxNi1BQ47y3TKQeKYSoV6hO+oyXADjTzJeVWCyRlY4KRXE1pIJK1lqd+SztOAnLv64kJHNITA2irPPvk0dnMSZzlSdBQ6rUN8OBZZxj3X+vlnV+YFrNNyiU2gaCwORxR9kTW59V1KUd7UMxc+kuMSyE+81HXcePv3eFD2KjlKcZtZen/bFFYVNxEhgGF1XVLqQnADUEyLu6XAd2NjZ3hiQM78/epVhqxlTekxyJmmS+Fn52xKJud0r0evAm05OPTfmnYnbxHuXaL9BuX+F1fp1+UDI+7bdZvIgrvkN48i9XBMpEGH08bGdkQctkWB3Vm26rQszQXQI6mOgGCUNDJ7OKc9bq3hZs7mpTEiMYleciWfOX8du5wnwsKR0Lh3rqCymb1MX6fz6ILKKzlbJ0ebGKYwTBmrSMSRvVBNG8uB4p5mU52cm6KR98t0EiZKYPfd9YirNxq/Xi9Iij21KcOSVSjOefEHxaFMFtkbzEVH+op/189s1CQH4N3gVbVpODF14pnnwNGYODNrVyl4YOouaBEvuk3uNYeZXB0Kq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXREcHRWMmNEVWYyc0lBaXlLZW1lSWJXRWN0MjBwYldsdE05b3hrNkdFb0pM?=
 =?utf-8?B?Y0Z2Q243N1RGMmhrLzRtYXlzVmEvNFhPdG1OWlZXamNMdSsvdXNldGdXWWtF?=
 =?utf-8?B?cWlrZGJnRDZqKzdUNzRnWm9GVkJ2VHl6SU9Mc1kxR1p0WmsyeU9JT29WeXdR?=
 =?utf-8?B?UjgyRXEwNUwxRFNLYjBFaTI4RzNFMUFiRWhXZDN0bXlTeExEZmgwV1NKNGFl?=
 =?utf-8?B?bE85YUJ2Qm9rWWNWcnJwbjh3OVRoWWt2QWtXc1NDVEo5M09LaG00VW10THc4?=
 =?utf-8?B?SkJCNWx1a1ZPM0xkUGllcmFoWGZOeHdGM3pBcUQ1SlpoTFJRSGhiMjJXUWNY?=
 =?utf-8?B?ekFvdW80YS9rKzVUN2gzYWpXdlE5c284WWJLSGM0cWdsZDNvQWs0YWxQSXN1?=
 =?utf-8?B?MTJGVmQrSzAycFVoVzViMS9sK3JndWsvY0lhNXc3dVVPUENhUTB2VTFyNEt3?=
 =?utf-8?B?ZG9GM0lWUGhUYWlRd0NtanNrdkdrYmtGekx3eFlNc2pTN0tER2R1MkNIYVFS?=
 =?utf-8?B?dkt3bERrM0ovaUdCMkx0a3k5aW1KaDI1SVFvcm9iWk10R3dGYnlYbmk4b3Zp?=
 =?utf-8?B?ZlBpd0RMOXU3anp6MVdTVS9vODdWRHpodGtDREhva3l2TzhuQkM0RWJHSmtZ?=
 =?utf-8?B?U01NRlJXS0xYa3RiNFhOWWRFVUhJUlZQTDNjdjlKVW8rQm5UcmY5bFZub3F0?=
 =?utf-8?B?NlpoSGhqWk0vVDZLbkxxNmhBdVFIQ0E5U0lJMXZvRTh2VTBCYnRaL1ZWdlhB?=
 =?utf-8?B?Mmk1ZDArZmlNMmg0aGFsbm5KUUdSNzhnSTA1eXhjZ2d5Tmt5TGpHOS8wdmUv?=
 =?utf-8?B?NDVJZjJqa2VpMWhYZUNjVnJ4cFBLVXhuTmJqL1FWUlRQOEk3V0JwOFlqcEMv?=
 =?utf-8?B?b0QyOEk4Y2JsODVuNVN6bldyK1F3MW5XNEpHOVJwSnlVN3IwSmpaa1gwR3RQ?=
 =?utf-8?B?Y21FOU85bThlTnhSdW9rTHdkMXRwT1NiNnJNd1d5MXhibXRtbitRckZkR3ZQ?=
 =?utf-8?B?Q0RxUkhCRFNBbUFkbGlNYWRPMW9mcHJQS2Q4NTVzYTh2Z2EzbnhIT0RhNWdI?=
 =?utf-8?B?UU9SbjNoNEtVWVlYODIvK3ZBVFVJZkdBTXJJcHJ0UGtPd3NzcmdjUllZQjk0?=
 =?utf-8?B?dDhoUkUwRUNPRFUySUJlejRBOUpjbldES0p6WW4zMUhqMEtTSXk5c3A3dFY2?=
 =?utf-8?B?aWU1NklKR1hnaWZIVUxrcEFMYVk3cjZnMTMzek1EcEZqQnRDMHlSSTFLNlhk?=
 =?utf-8?B?bU1OODQ5NGp3ZllKNllLUElpRHoxZ1RWWUEwSUtuOVIzSG9tdlNwa3JCR3Nl?=
 =?utf-8?B?SlhaSVF6Y0lZeEFmclMvQ1VDakFTeDNhSlk3QktINzAydFhHWUgxMXNOWnZ3?=
 =?utf-8?B?UUN3RnFneFBPSFFKdjQzS0NNRTE1c0F5TTMxaVR6ZzFFL0lXMlgzamtZTjhG?=
 =?utf-8?B?c09nSjVOMEJQdFUzTENFTk9SeHAveGhmbXdnekVKa1NLdTM1Y0tGVnAvbHJY?=
 =?utf-8?B?VXJvRTR3SFRRcWJ2b0JDMTJERDRZeElaNUFuQXNYSUxCWEUyU0VubW5rdVJV?=
 =?utf-8?B?YVBtUW1Bd2Frb1NLRXJzT0lhYXFYSVJQV1d0ZjJLR3VMWjJncytGaVVBMzNX?=
 =?utf-8?B?TEVpOU1FTmxGc2MxMXk4ZWNaLzNSc0ltODZpbHI5dXRBeDdZeHJMZFY0ckFK?=
 =?utf-8?B?VkxxczlyWkFkYnBQS3dIV3ZrcEVWSU0yVzE4bXVNWjhOMHBBOWJmd0JXOVN3?=
 =?utf-8?B?N1djdTlyYTY4bTVqMC90TGNYd2FvcEs5bVhVTEw1OFNzMmhJSnR0akRBNmZU?=
 =?utf-8?B?a1hvaHJ1NG9GUDBEMjBKd3FrMW1ENzRINldrQ1ZQRzlvUjVLaDVpNHdIS0NG?=
 =?utf-8?B?NFcrTzBCSnNZQzdTdEZ4QnVhRHBMVmRneXAzcVRoVUErcTQySFduUTFkOEhr?=
 =?utf-8?B?cklkRjJOV1J3WnU2UFI5THNWem1heXpMdkZIUnVrRzhVQTUycHltb0k2R0ZV?=
 =?utf-8?B?ZWtxdm5DcVB3bUg3RkNETlpPNTdZMDIwaE5YYnhqdG5EK1VQaE9WQXZWazV2?=
 =?utf-8?B?Rm9sa3BEdnJQeXRrWXJIeFkzV2Jpc243UUNsM1F2eUlpbk5GZ2pFWWhDTVR1?=
 =?utf-8?B?NURzaDR2WWpaNWFCM3ZiUEtDVmxpTFhKbmIyYjViZnB4MHkwWFhsMVBxcWpq?=
 =?utf-8?B?Z25FOFlXT1NzRjlzZDFiWUVtTkVnTjEwNWNWdkMwSEZ6UDJTWU1zcmlEWjFH?=
 =?utf-8?B?SnJUbTg2TnNrcFNyWFZqRkI0TkFiVFJBQXBDTDBic05JMXBabW00UEs5TWlK?=
 =?utf-8?B?ZytWdzJNcTh0cnV2SjNuYjl1ZzZFYVFoQVVSRHFKNkdnemdZTnlSdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eead55c-25d0-4165-64c2-08de802d4b0a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:48:35.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbMPJwC4M8zjrOJ0rrErN4DS6KK/73Gw0mfvzxK3vSlP2Zre1xMgjCujpIbDTq272LoENaQppKmCKAHsbWfrZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6974
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-11884-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B655427143E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 12, 2026 at 11:10 AM GMT, Miguel Ojeda wrote:
> Starting with the upcoming Rust 1.96.0 (to be released 2026-05-28),
> `rustc` introduces the new lint `unused_features` [1], which warns [2]:
>=20
>     warning: feature `used_with_arg` is declared but not used
>      --> <crate attribute>:1:93
>       |
>     1 | #![feature(asm_const,asm_goto,arbitrary_self_types,lint_reasons,o=
ffset_of_nested,raw_ref_op,used_with_arg)]
>       |                                                                  =
                           ^^^^^^^^^^^^^
>       |
>       =3D note: `#[warn(unused_features)]` (part of `#[warn(unused)]`) on=
 by default
>=20
> The original goal of using `-Zcrate-attr` automatically was that there
> is a consistent set of features enabled and managed globally for all
> Rust kernel code (modulo exceptions like the `rust/` crated).
>=20
> While we could require crates to enable features manually (even if we
> still keep the `-Zallow-features=3D` list, i.e. removing the `-Zcrate-att=
r`
> list), it is not really worth making all developers worry about it just
> for a new lint.
>=20
> The features are expected to eventually become stable anyway (most alread=
y
> did), and thus having to remove features in every file that may use them
> is not worth it either.
>=20
> Thus just allow the new lint globally.
>=20
> The lint actually existed for a long time, which is why `rustc` does
> not complain about an unknown lint in the stable versions we support,
> but it was "disabled" years ago [3], and now it was made to work again.
>=20
> For extra context, the new implementation of the lint has already been
> improved to avoid linting about features that became stable thanks to
> Benno's report and the ensuing discussion [4] [5], but while that helps,
> it is still the case that we may have features enabled that are not used
> for one reason or another in a particular crate.
>=20
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/152164 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/pull/114 [2]
> Link: https://github.com/rust-lang/rust/issues/44232 [3]
> Link: https://github.com/rust-lang/rust/issues/153523 [4]
> Link: https://github.com/rust-lang/rust/pull/153610 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)


