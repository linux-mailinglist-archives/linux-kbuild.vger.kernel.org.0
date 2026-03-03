Return-Path: <linux-kbuild+bounces-11530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EkaCjq1pmk7TAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11530-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 11:17:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0951EC8F3
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 11:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE453067745
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 10:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F66F386C18;
	Tue,  3 Mar 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="P6hSKYXV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022127.outbound.protection.outlook.com [52.101.101.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06F83876CC;
	Tue,  3 Mar 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533028; cv=fail; b=Ugttx3H9a+Na61J4Q/BMRKWSF3cDvBtdKCsy7M5LGTVU1W4rdMVCYlOTo0l7OT5lBd3hjNbCGmKHJDmO4V2AmpEaC5gfG6Tdg//c8J0rhxFFjn+0AQ937/VUXnwRI/IvX7UGqQ9X8n8YMmmsHseZj6KYSkdrw500EsABqGoJ+jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533028; c=relaxed/simple;
	bh=p1vgnvgkXE8394Ci2xsrHBvNHpFbGqDB8XYcfxFCem4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=qcBSIB0jEo76wt+jHDCrWEBvHVvmfo1WBHUH7vX0FQbaIb1XfmNK/vKL7ysehYd6tEssWl5FYwLZqh5MeertpuXvUcj1dYv1zv6GTjF2VqTqcPr7z5gzC2Cvyhf6qqCbNA8vLDdgMiSIRD9LIyCsu13sHua01G7l9aPIFW8ytqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=P6hSKYXV; arc=fail smtp.client-ip=52.101.101.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB+nkBJqIIWXLCThuBUlRc2wJ9/p3g4regLZ5t2f4gKLZcn7Ky91wWn+Qk8RWrWefzekFwMj+fcRURGfp9HRI0WrhZOafxdrVpD5Djwa8oACttNl/5D2Am8uZ3n8sIyuDJ7D0PWgBSJTFpFRkfGP0SQBZYarCSr5N4SkObmvRkshmzZ4NYtbYmcat0TkXMBcl0AAEc2QHwb9ys2Xc2F8Q7ZgX7rWxnxf31OTkOj6QGBrQ74ledDsoGhEMHIRnkZdh/J9UPoXYqjbjL+KdlYQX4jUzDBKiEn9H0Yu7FrC8C5VctpoEDHuFsunqDM6Gj7VFFXw9pbmNaPH1/At40bbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLFBKp3ytfPcLCEj43bD+V0s+pJ7Y4piOEyNmsdU5x0=;
 b=ta+qKjldZfDv5Sr6K3W0TAdwAGznjmBkeu/NYXh+tOlRby7JlB2RWTYTkZSVAeNflqAH0uY5lMm/OuiCvNSPuEnBta2kPh9s7HpQTRTELnSLID/eKz2i8SRGUxYzK/mlQVLZKxxRI0HjKitvul/5klE/5cbpPkeJi5YvJ3Z3sntqOuprCWJj7N0A7mREuDqewovxTxGymZPr7948ucdhTharFLyzKMtHk9EFtiYyrNn/0S+4XXLzpaObMkoChlnlqdoqJSqfNZDYFrR/O4atBz+HMydIygTALMsFmjlP0OkAqtAOs/Q2Rg+SQ0HXqVzmIQiIvuHGyQ+hsqepkUAuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLFBKp3ytfPcLCEj43bD+V0s+pJ7Y4piOEyNmsdU5x0=;
 b=P6hSKYXVG/3DrpRN4X7p3SnYVHYMTOzdMehZZHWICYjY7NcpHMgCcHlcjIh0iocQIE+HysnksUcQ4DwA+TW5iON028Fxk3zLDkZA+tWA7JeoFOrhY0HWd/70kp1CDH1wtSu9fB0+8PZePsvBPZvywwGtd3T80G708/rgvUD2t3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6492.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:17:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:17:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:17:01 +0000
Message-Id: <DGT2IKQK341C.35HW6HHSB03KL@garyguo.net>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
 <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
 <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
 <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org>
 <DGSN9C8PBFYP.2T48HOEE5LXSM@garyguo.net>
 <DGT16NCR2TD7.27E74897D8XEC@kernel.org>
In-Reply-To: <DGT16NCR2TD7.27E74897D8XEC@kernel.org>
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 532ca502-38c8-413a-8eba-08de790e0324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	nKkuA5+DUd1PSY0UhbjE3NV+QJA6xHZCEnjq0eigsZ28hihDUIcNpio6jO7RF8s7jvT6HOwVypezxrnVPgQKdRgJ078q2TS8fkfwEvlzVH95Ra2mc/CvfKCaIX6heGUFl4++T/oM+1B/5zeJ/nDPt/TQQcUd8d2nmF1SGCejUzR9SGzgPfdFCvmDP9JygMQLecvw9Wvl3AGjnCG9XGSrEGy36MwV8ayQnfW+sP/OR39+DpXw60x8SA24BJpFEtTM6qVmEgyVw/ipyNDa+DouhD/zLSzo6UtCzaZFLIPmwm2wkEpe73pTcvxU2wfjz3QN7ZEKuPkVvXGHQDWM4nWoV8G+WVHXTzG13xE5hlnXrUmofldBIkN5an2hjYtxbCoZsX6aQDiaXeSAAOBhP7UUJyi8afmNy0c13IiKmxtdkh1G32qvLoiTSDcuHWY/Jei+ySFLnn1V4/j1iku9toFLnpQEciPsm8VaVUD5CM3iDKacqB68tbXOZbBidg2dZh3gWixp4jYkjpHXlM8PP9GjHAlFFTrRjIsl2kdZCAo/vMWb3MqxQh7RAqrDD9PzK5DuXsgTUKpp+Nmrr9XMeXGzp9cwmjFrfOxU6IRvAioX4KQLGE/7DARvMZiaT2rcin9Q9v28tFkFVrrtB+dkufpSiNVxpCBlbK8rlRNmF0pmJ+7ymIoXTMFprLOjZvRnCmD2Tpatn+305LDqajBe62Xughljh8xShUhR7DLFSBwTJyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0pKaUltRlpMSDZYemNPQ2tLNm9zQ1pZaW5FQWZNUUJ5aS9OWk9uZnJtTFFs?=
 =?utf-8?B?eVpGVStXb1grbFhIZVdQbmR6TUFuVnRSRTlKUGpOYnRWYlpsdFFabVVXRzQ3?=
 =?utf-8?B?R1hZTTF6MmxrSDQvc1dsNWJRNmprTGZUejAyTnE3T0IwWHgzdkJlQ0x6VzlL?=
 =?utf-8?B?dXl4SysxanNSWmxTejFYQ0FhL1grSUcyMGpZUnlvNFRYejRXOHIxQ0F5VzQr?=
 =?utf-8?B?bUNVNnVLaXlITEpaanV4dTRyazFoSk1WbC9KdDgza1Zqd1Q5c2dFUy8yN1Va?=
 =?utf-8?B?UEJwYUVzWGpOMjVkcjV4R0tkakdEU2JYUFdoQldFckN4azVKRGxOWkRuVzFz?=
 =?utf-8?B?R3VrNmFveGNFaFlFZ2VUU1lBNFdkTUtKak5ETUFLZ1JRR0VUNW9EQjRadThY?=
 =?utf-8?B?L25CQjhwdlUyd0h5TUNneE5waGhiaXl4UmhnK2Z0NnBERWNEYnYxVHVJb2pI?=
 =?utf-8?B?b1VISjE0dVY4WDZldlEzMGNocUJkZ2JpY1FBWmlOTzJYUURQZmJLZzlUQzl3?=
 =?utf-8?B?eEQ4UmtYVmF2aDlVbmxkeFA3c01mTTVHRWY2c0xUaktJZ3lxcVkzVVdaTnN5?=
 =?utf-8?B?Q3lnZ1B5UkJCOXVmekJKOXMwMkFxZG1Hcnl3ZDVOcWNYZWxYT1Z1K2FlM3JV?=
 =?utf-8?B?T2IyeHV1ZTJjdEhLUFQ2WWpSTGZnT0pSMGZrK0hlTjdtWWhscHA2QWZncjVK?=
 =?utf-8?B?R0o5cnF1QnV0U2k4UXpIY0NSMGRJRnplM1JESW9TN2hVakNYV1ZsSkpKU1FC?=
 =?utf-8?B?Ym1SeFFIRTl4czVSMWRHT2w2bzZsaWhyS3dSRzBqNTkySHh4RUZxQWZ5NGQ3?=
 =?utf-8?B?Lzl4R1RUNGNGUnJDR3R0NjB3bHVZOURyNHFGeGxWUjdzRkM3RUorWE5GTFp1?=
 =?utf-8?B?KzUzNkVKb2REaStKNThidG4zS21ZbDlWSjA2TVRETUhXYzU5WnNFSzhEWHlU?=
 =?utf-8?B?QUp0eVByaHIrRGowUWpwMDBYRlArdXEzbkQvTGYzVDRMODZZNExLRDliUWRR?=
 =?utf-8?B?T2tRTy9sN2xMNm1QWlNvSDc5b1lpM3dWQ1ZqVndzNjBlR045cUtGNVlzaVhi?=
 =?utf-8?B?ejFISUNJaWVKSkdHclpkVncwSXVQL0tOZ1ZlR3g4WklWaGh0dEFybnlIOG9a?=
 =?utf-8?B?VWtsYU9rTnpUc256WGQ3K2NnY0xrRmdEaFlWVWd0ajdHTmxlelJRVGlFc3VQ?=
 =?utf-8?B?bUtiUVJUQWFsYzAwTDNrek1LUDJwVlgwWDNlcjZzMlFZell5d3N2Q0xiV0lo?=
 =?utf-8?B?VWhZc0NNUmRYVVB0S1gyZ2kzdjBrT2h3Z1UrZm1PSWlHcGRPa1JvY01qbXZu?=
 =?utf-8?B?NUtOQWFxL0JIUTIraEltdUt1bnRqcEpTTTNHOVFJY3RiQnhLWk5XVCtMZEp0?=
 =?utf-8?B?VEV0bjdIc1RITW9VN3dMcDdMeHhmZi9nbUVGS2FSdWxVc1dIUzJ3cDN1YVhS?=
 =?utf-8?B?c1ZuWnpud1lpODNrNVZmdkxWQmdJVzgzMUR6eVJqTTYvZzBHZllLYmZxbHRs?=
 =?utf-8?B?dUZjOHRkTkpEOVdUdEVPL2xiR3JJbU9KWGd0SklJRElCR0wrNlBkNkV2LzZ3?=
 =?utf-8?B?S3dvOXlEbUl1QXJ2eC82ZEFkRkE1MWEybFR5WTJ6R0dERk42K042U3doTm5y?=
 =?utf-8?B?YnVDemVHTE4rVlFKU1VEUG1QZmlpeVVZYThoblhiZ04yQm1FUG4vN0dWazJv?=
 =?utf-8?B?SWt0Zm5OSmhZS2tqd2lyM0RQM0c4Wko1bmFZVlF5a29hbjB0T1VpcjJQMVVN?=
 =?utf-8?B?WGNDNHh2ZExCR3lRTmlVSndlSmh4aWJQQUtYVWlINzRZandPWEpFYklXNktQ?=
 =?utf-8?B?aXFMS25wQ3Z1QnNUdlhDeTdaeHprZk05SEFZSUdBRllidjBEUG5YWmpRbW5R?=
 =?utf-8?B?NzltK0l0Z090VzhlZnVncFJzc0loNm01UDN6eFErVjRhTmJSQUQ4UkYzckQr?=
 =?utf-8?B?MXloRmtTV3NWb0syRnVobTJ6cTRCTzloY250Ti9ublI0M2FGUHhuTlF5bGcy?=
 =?utf-8?B?N2N5Zm1uNGJ2OTh3dmx3WGxESVVwcGUySUZyeHJNK0FvUGszdnhWZDFVWnNX?=
 =?utf-8?B?ejFQK1dzQWU1Rlk3cllId0xCOGEyOEFBK0FQaE9aZlRiT2JVMTRSSW5iM2Zk?=
 =?utf-8?B?N3l4TWovWlFVVUF4R0ptSWc3SnBGbTdSZjNMV1VqbjhXcXZlNUowckI5Z2VW?=
 =?utf-8?B?dVc0UkRuWW1TNmZraGNxTU9maUFORmJhWVdvYU90U0h0Y3haQzhlMS9FRWEv?=
 =?utf-8?B?QUdkQmRyU0VsNDEvd3QrSW01Mmh5d0Q5S1NwbDl0NU45Vm1wSFVUeEttK0p6?=
 =?utf-8?B?ak4yZkZ3U2ZFMFN5Y0pHaWxSaXVyOVdBa2VodG54YVNBMEVyd0llUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 532ca502-38c8-413a-8eba-08de790e0324
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:17:02.3803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5aTAC976jSnO1gB7yX8eFjVMu9uWsnCart+qgBbCQePmjxpGtVfl7NHbdppH6ENop6LuotArF6isP9eHJdIVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6492
X-Rspamd-Queue-Id: 7A0951EC8F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11530-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rust-lang.org:url,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 9:14 AM GMT, Benno Lossin wrote:
> On Mon Mar 2, 2026 at 11:19 PM CET, Gary Guo wrote:
>> On Mon Mar 2, 2026 at 10:01 PM GMT, Benno Lossin wrote:
>>> On Mon Mar 2, 2026 at 9:14 PM CET, Gary Guo wrote:
>>>> On Mon Mar 2, 2026 at 6:49 PM GMT, Benno Lossin wrote:
>>>>> On Mon Mar 2, 2026 at 3:49 PM CET, Gary Guo wrote:
>>>>>> On Mon Mar 2, 2026 at 2:38 PM GMT, Benno Lossin wrote:
>>>>>>> On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
>>>>>>>> +/// A helper trait to perform index projection.
>>>>>>>> +///
>>>>>>>> +/// This is similar to `core::slice::SliceIndex`, but operate on =
raw pointers safely and fallibly.
>>>>>>>> +///
>>>>>>>> +/// # Safety
>>>>>>>> +///
>>>>>>>> +/// `get` must return a pointer in bounds of the provided pointer=
.
>>>>>>>
>>>>>>> This only makes sense when the provided pointer already points at a=
n
>>>>>>> allocation. But since the functions of this trait aren't `unsafe`, =
it
>>>>>>> must be sound to pass `ptr::null` to them.
>>>>>>
>>>>>> The "in bounds" here is the conceptual bounds of the pointer. So, fo=
r a pointer
>>>>>> with size `x`, the address of the returned pointer lies between `ptr=
 .. ptr +
>>>>>> x`.
>>>>>
>>>>> Okay, I haven't really seen that as a concept. Also, what is the size=
 of
>>>>> an invalid pointer?
>>>>
>>>> It's `size_of::<T>()` for sized types, and `size_of::<T>() * slice.len=
()` for a
>>>> raw slice pointer.
>>>
>>> And for `dyn Trait`?
>>>
>>> Do you have a link to somewhere?
>>
>> For `dyn Trait` it would be the size in the vtable, which is always avai=
lable as
>> vtable metadata on a raw pointer is required to be valid anyway (this is
>> something that lang team has already decided so that trait upcasting cou=
ld work
>> for raw pointers).
>
> I really would like to see some docs of that, I didn't find anything in
> the reference, official docs, or nomicon. The reference does say [1]
> that:
>
>     `dyn Trait` metadata must be a pointer to a compiler-generated
>     vtable for Trait. (For raw pointers, this requirement remains a
>     subject of some debate.)
>
> Do you know where it was decided? I did find this [2] UCG issue that
> covers it, but that doesn't seem like the decision, just the discussion.

The FCP is here: https://github.com/rust-lang/rust/issues/101336

The gist: for a fat raw pointer with `dyn Trait` metadata, the safety invar=
iant
requires a fully valid vtable. Validity invariant is not yet decided.

>
> [1]: https://doc.rust-lang.org/reference/behavior-considered-undefined.ht=
ml#r-undefined.validity.wide
> [2]: https://github.com/rust-lang/unsafe-code-guidelines/issues/516
>
>> I am basically just having `size_of_val_raw` in mind when writing this. =
So the
>> current `KnownSize` comment in v4 is something that I am happy about.
>
> Well size_of_val_raw is `unsafe` and only valid to call in certain
> conditions. It asks in the case of slices that the length is an
> initialized integer and that the entire value must fit into `isize`.
> This to me just further indicates that `*mut T` has safety
> requirements to obtaining the size of an arbitrary pointer.
>
> In the special cases of `T: Sized` and `T =3D=3D [U]`, we have safe ways =
of
> getting their size.

Hmm, the `isize` fitting requirement is problematic indeed. It's broken cod=
e if
pointer projection is used with an allocation that exceeds the limit, but I=
 want
the API to be safe, so it'll be good if the API is defined to just be wrapp=
ing
and safe (it may return values that doesn't make sense, but that'll be on t=
he
user).

Anyhow this is moot as we're going the `KnownSize` route.

Best,
Gary

>
> Cheers,
> Benno


