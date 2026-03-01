Return-Path: <linux-kbuild+bounces-11495-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B1tgB9g6pGlnawUAu9opvQ
	(envelope-from <linux-kbuild+bounces-11495-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 14:10:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C51CFC36
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 14:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C764301476A
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Mar 2026 13:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D8C2773EE;
	Sun,  1 Mar 2026 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UIfXco7j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020113.outbound.protection.outlook.com [52.101.196.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19622517AC;
	Sun,  1 Mar 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370643; cv=fail; b=lwmtoAXyjaVPoRJJCe4nkzFgwhFnOx1S1CKVhULMG+RU4ot4EK7rTNNZbizUPSQHc4O8oqEE4kcdIUMqdEN2s5tWgnygxYpo2ap0ulmJfHV0H9bMeAsv6BO334mINfcT32+Uedz0u5yxVdtT/9EuViD7rJ9UcpN9Kwg8vFjG2VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370643; c=relaxed/simple;
	bh=M5mwD5KQZlmYwYLJBdczcEP1vCAXoEc9tm2nuxVKz9g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SkbOdd/NbOLUyMvaSCKEQSXy3GfZcu2zZnPGqy4L21gb+dq5kv38uoCn1RFBrn+cFCz1tGhvT8Fd2U3LVECqOUf5XBQLTeWJnSo7LgNqopRX9nKY2dXnM/E9NAnNRhStnIMnheOHfjRxmMlZpjdIKQeESPT0V2MIdVjQSznbOM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UIfXco7j; arc=fail smtp.client-ip=52.101.196.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0R/LlVxNIb/oZtfD6yIV58lqrcD+GbSRAoHTt5ibDaEhNBcXhJnNoR/W8g6YSrUAZ9SuoyvcQeUFJNQm0PCBeJwUMMullIbjRIlPLpUNeNwd+HoG1p/P5W+Gkjo5ZoxAyrpZIaB260JgDORB27PPHInWsRvDnIjMmb94qBebEXdH5fAeOkTcgKvDelgslAgu0bczKG1ldBbl3mByknFl6CyhQg10BJ3fuI5Y9xfrU4GGi/Jy7bM7E20Bjv9Lgy1OFtnavkupaG3pleCtZMDuKbDCJLo+KDHw3NNikmoXKl+bmEcHwss6RV8dp6y7chvnno0xrFVzPY53zqdjlOFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwtMLsmY6onU34vuoYU62rhFCYzvQBr5PMWf90Wd5dE=;
 b=HEkk2qgy+66Mbg+lSSMZt2YALBxJS5ub7/VpT5yPHcZvqNlji9EYZ+eH0bz4tRlNfyHqKc3Y2ZWjiuz+xr3J3EXEBWQbmCAKfdObAvG5bYxYbVnrAXXRBfFO8UBP+AxPed+C9n45uYqyEklzD3gcoiAjaV+kVGbAd6WNTVaoHd7zeiAxwlJsYxuy9xpfWOgShu1KiYxPg2L0I58ZnwWGrenDEp7PYqUqGHD7C5egc6MccGG0b93w8I/ujSkHp9QcDS6Ctq3Ql19OmWCakxPYGYVgvCjhau+Iy89OhtRiGT3RkOk/Jtww2bqpEq2DkRibsBryOOaeM/A2ZVklCACpIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwtMLsmY6onU34vuoYU62rhFCYzvQBr5PMWf90Wd5dE=;
 b=UIfXco7jE+CMirxU0OogGk/k17wj2vMeNL/T40TpvzU5rPpbtwg8+EGKSBDB3EwRzDc6FLmce3/s4AlMe0iQjZfi/CIOAZ5FAFN0tvLP8wi0EmRtCowIHv2Zdsoef7RmmQhLwCBSnvVOK4KfJGhLxkwHf7ty6QGwBcLL68AzRv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8989.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:272::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 13:10:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 13:10:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 13:10:39 +0000
Message-Id: <DGRGYFHZF7PF.1Q3MZ7C1SBRL7@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: add projection infrastructure
From: "Gary Guo" <gary@garyguo.net>
To: "Aditya Rajan" <adi.dev.github@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226154656.3241736-1-gary@kernel.org>
 <20260226154656.3241736-2-gary@kernel.org>
 <DGQZOLAH72HC.2OE3REDD7M7U7@gmail.com>
In-Reply-To: <DGQZOLAH72HC.2OE3REDD7M7U7@gmail.com>
X-ClientProxiedBy: LO4P123CA0698.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa600b0-d14e-48da-0538-08de7793efe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	LCucMauUneQ89SGLSfzkgCRnViDncklpthoTbN35GIBVAOu/4XFDJbmSXbSqiVIBxsJwrXyRF6yAXtUw/PIvRL2YiMbTmyp9+0J3uceCBNUehtrGW3yZZuheZ68hb0afX3Xe9w7XYMX/LBvaZ1l9iiipOEwks4jVVjZAzxq2jMM5d18JJyioTXEhx8KmOOXjhvS1tiAJYpzGI1M3lSl5Mr6mAEvlndeYQKexxtNSQI2uWgefXpahTTQEigI5k0sAEM/mbPTPykD6Zy4I2qytlWo3d5uy5hLZyOqu1D/5gBHfMLC11dlrlHznyeYo/rsdD938/KvFYO5W6XNr5hu1LQONHAA4/kuK1U5dPcrb/+6cZalJu3H1qdF62y77hyWV37tGN20dr7adIWnzHW4oyddM0d12t0sWAf845EkpD9bWIF3vHY9JpEhtGHYuQIfodgBiGwZXCAvvocf6DDkllvwwTQQeYH/zQwUBiwOUFccGqD9wmNnexLaN4sNfh250pD705VYyq/aqQadw4Xg5WJXaK/2v1f28w/LCpEm852rQTHdwbwTHhIDK2CQpj4IXKdyArZgUFhj30EOs7jAiF+eWPOCsZcMZ65uIE1nu6gHNT+r6kcCM4/cttEeBXJetFCPz+IoCA1HoRnBQqBsqUPq72ds2H6GZAFecgkpcpSyN97vL2FUK4ObjYG+nF53OFOfYQE/kBYDOjoVv2cRXXXMLpzEyQyaIcPKIngLe5MktN+RfBYr2BlMuoGaqlmqj26VDebXscdws2kDgenz+2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHAyKzVIaVdVTHlqOFFEV3FPeUtaYjRRT0FmSDkwZzdoaEpTeDdNemc1ZlVB?=
 =?utf-8?B?VUNJd3Nza3JoS29xSGVBUVFxeG1HN0xtS2RSKzFEUWhsUCtNVnlwQ2p4UmZY?=
 =?utf-8?B?Qmk4eklzZXZpUzlTVFdmcVFoazFLOTMyeHJkdG9uM1lJRDJZRm0yRDZsek1o?=
 =?utf-8?B?TDdab2dFenFCazlMbi9waXhFNTQrTkE0eXdlSmQ4U2FNRm83Y2lybXlXMm9s?=
 =?utf-8?B?ZXNXUnVUUEt4bUZLVWJldDloOFZWK3hnV3Y0bVE1RDhVNDZSb1J0YVdJSTBX?=
 =?utf-8?B?L0VkUFVUaFd5YzFWOUxOZTlxQ3VaLzBSck1KSkNOK0tEVUNYMjA0c1JBOVJZ?=
 =?utf-8?B?Um9zaG9WRU1wK3pkd1lFMXh1eENlUmN6NzlDdTd5NEh0aTRPOFlUdWZRd0RE?=
 =?utf-8?B?QkE1NENjaUw0VVlTbTRRMnpmYnZydTdiUjl0cmJvTzJoVjEybVRMVTB6cWt3?=
 =?utf-8?B?RGpzWEdqYXBNZFhhOUZ4V3ZBY1BXM3pTWW9WVTBYbnltUi9JOFJXTTdVek5u?=
 =?utf-8?B?cktpVHY3dU5mdlc3NzRTbFBsa3ZjSFpYM2pKcGJyVllDaUx6d1F5RTIvRU9N?=
 =?utf-8?B?V1hpeXZpRUdBYzdvNndwYTY0N05mVS9rbUkxOGJQTjR3SThLdWRIeG82aklT?=
 =?utf-8?B?NUpOT1p6bjVkOTBSTjFLNGhVNk1ja0lZVEhQeW5xcWwySCtCVlNFeDZocFJx?=
 =?utf-8?B?cml6eDYvR3RGWllPYkRTOEhIbmVXUHE4L2dQVG14bmZkU0RyZVhRL2NoT1B3?=
 =?utf-8?B?aHNFRFpndTVpbUhQSDVReUpTa2RvU2diYUp3cWlNblNianpzTHg0OS9OZmM4?=
 =?utf-8?B?dWhUakUxbmRCN0VLR3ZRM1FUblhFeXptUURCdnJhTDhTMG1xTFdxTjJiUitY?=
 =?utf-8?B?eE5XWGNBSUZWRmFQd3ViNUNsODhTNk5WMjFYbDh0bzRSTW10TE1XdnYvYkpQ?=
 =?utf-8?B?OERBUDJ4NDJiTmxQbzJiZTlJcS80L2g2MmlrK3B5YUNaKzIzai9EQ01hekgr?=
 =?utf-8?B?eFhScDNFZTVrc0w1NWI5ay9KTTZ5Mko1RjIvK0ZuUEJERzM1NEVXbEk3TVpY?=
 =?utf-8?B?YkN5cWxFSlY3Y244bGV3R3U4Smk4cFdqcGR1MHhxUkdwRWM5NDA0ekNwTmQw?=
 =?utf-8?B?VzlaSHhQekJxWCtweGZZZ1dZMVpFUUVDTUlVUjVmeDU1SW1aWktLZEtMbFEy?=
 =?utf-8?B?ZC9rTTVaSTNDcytiVTI4cnBtcVg4U1g1N1dsd2FhWGFINk0rSWpWU2F1T2N2?=
 =?utf-8?B?YktEL29IOUZIRm1pN2w3YVN2WStjL1NGcjhPbnFwY1BPQTJEZldJa05NV1NT?=
 =?utf-8?B?STVJdllCTWJhbFMvb256bnpNbUk5aXpmRmVqenpXVUZvL2t4RWVXTGFycGlh?=
 =?utf-8?B?TkwyMWJGWXRTLy81c25rNCt0Y2VJWU8ySGtzbUpNRWlyRVZhMTRvNm5JUFVF?=
 =?utf-8?B?ZkJkZEp5UW5XOWpMbi9EUDI3aW5nWW45VXNxUEpPbmI5N3ZuRHp3dVpHVUNM?=
 =?utf-8?B?M2cwTUZHMDBLaHlGKzBOTTdXblFjQnU4WlJmWVZZdmNwN3BOSExqMHJxa1FN?=
 =?utf-8?B?RVNNa0djZU83MGJpNUJ0RkNhWlozTTRHSm5sT1lUOW9uWG5VWTlQdjA3UHNs?=
 =?utf-8?B?TkJQUWZlY1lNVnU0eEVYNVNpbXF4OWNNVVVHcjhrTFFDRlcwVTduaklLeE5s?=
 =?utf-8?B?L293eVRsVk0ydVVBQmJjU1oyRjRIQUZENGpsY2ZmTG0ySEdwYTB3bjllTHJZ?=
 =?utf-8?B?cUMramluUWE1QVRWT2FtRm1FOGZtV1Q1K2VHNHJ5enNHUllHelFvMFBDTHBB?=
 =?utf-8?B?empGdUNZaXhRSUJuUGROYTVBSmkvQnN0R1VEM1F5SmhHdERRUDZsUU43ejhT?=
 =?utf-8?B?M2grajJUQlJjdExMM1lrbHEzRlFsQ0VLbXV1K05sVElwcy9CWW45YnJiM2ha?=
 =?utf-8?B?c00xL2dJdDJxYVpBU2pZWXpDTmJyLzVmUTcvTnJ5UHY0SHZmY1pjSmt6a0ww?=
 =?utf-8?B?QndoSS9GQ2x4ZnRzc3VzUUsxMzJHWmZ6NWQ3ekdDYUxtenJMb3FBNW16UTZC?=
 =?utf-8?B?Q1J0TjhHWlpvbWNQOTlBMm5wMFVYZzBkdFdZV0paTi82QTNydmZwbFh2SmMz?=
 =?utf-8?B?dW1FK2t0LytWT09uZnJPUzNwY21qVDlOa2dJVXJ3eGR1Vk02TFBZdFNucmlx?=
 =?utf-8?B?TnJQOTNVTjBBQ2dQLzBoSGs3clN6RFptT05PU1Y1WmNZeTRDbm1jMGphUURF?=
 =?utf-8?B?M1pOY1YvVHM4MFJkZnlDdm9HdEZISDdWeVlHNDloZDhCSXlNT2FtczNQN1Vw?=
 =?utf-8?B?MFA3Z0tSMVVVak9TRElydFBuMlJFTGt6aWxQNWRwVExDcTNtR1Q5dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa600b0-d14e-48da-0538-08de7793efe3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:10:40.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1ZJaL8z/0Om6PNNhi8gYFELviVkPFn1eyc8GxDNpcNVvCz4anuzmaCcoWbSlfzbhsxP1Tmy89mIJD4JX4LUOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8989
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11495-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,garyguo.net,kernel.org,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,garyguo.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 772C51CFC36
X-Rspamd-Action: no action

On Sat Feb 28, 2026 at 11:38 PM GMT, Aditya Rajan wrote:
> On Thu Feb 26, 2026 at 7:46 AM PST, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>> diff --git a/rust/kernel/projection.rs b/rust/kernel/projection.rs
>> new file mode 100644
>> index 000000000000..186ec194f2b8
>> --- /dev/null
>> +++ b/rust/kernel/projection.rs
>> +unsafe impl<T> ProjectIndex<[T]> for usize {
>> +    type Output =3D T;
>> +
>> +    #[inline(always)]
>> +    fn get(self, slice: *mut [T]) -> Option<*mut T> {
>> +        if self > slice.len() {
> I am not sure but shouldn't this be `self >=3D slice.len()` ? I could be =
wrong but `slice.get(n)` should return `None` for slice 0..n ?
> There is a similar condition somewhere else in the code as well.

Good catch!

The code below

    if self.end > slice.len() {
        return None;
    }

is rightfully `>` as it's okay to have end being equal to the length. I sup=
pose
this is what you mean by "somewhere else in the code"?

This one though should indeed be `>=3D`, and I've obviously messed this one=
 up.

Best,
Gary

>
> [...]
>
>> +                // Check unaligned field. Not all users (e.g. DMA) can =
handle unaligned
>> +                // projections. (e.g. DMA).
> Nit: Comment mentions (e.g. DMA) twice
>
> One question regarding the `in bounds` check otherwise LGTM
>
> Thanks
> Aditya


