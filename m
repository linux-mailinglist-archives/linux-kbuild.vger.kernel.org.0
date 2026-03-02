Return-Path: <linux-kbuild+bounces-11525-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OCiDG4XpmkCKQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11525-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 00:04:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CFB1E63DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 00:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 531AE313E9B5
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 22:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D886D282F1F;
	Mon,  2 Mar 2026 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RplNURi1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021117.outbound.protection.outlook.com [52.101.100.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8CD282F23;
	Mon,  2 Mar 2026 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772489986; cv=fail; b=Oi54ecYS7qTLBC6hcd56LVP5Se1r77I4bKqKYDmNTh2QFSQsHD1lD+pHB2GTUeKUQ13rrtsXqepQxAFWGJDVW1+saUXAl5iY/mDAxNKrq3NZRDirOsbZlo4vRSVZTsxCC86p+eu/0E4NSjFs+lkGgVTURtqVI92ZQnMLdVKqnPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772489986; c=relaxed/simple;
	bh=KeUHh5cDyKxCmjVxeCANLaF13Qls3MT1uUkDGQ+CyZc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=M5HUu3Ebp2FWmZxGSv9fTQ+oUeh2H9itkc6UfimhXt9oi37NSWfz5JkgLbbAUklIuV34+AkTeK1XTDfj7k8Eoe9mAQFAKiZyDz5gqqYFYeaO5Xuvpx7S75gPzs4rZc/mQhisxqBe2oqVqcWLchhB/Ohy87IwwX958lR4GkBvLuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=RplNURi1; arc=fail smtp.client-ip=52.101.100.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoHukaB1bvAmeIAcqNSHQL/GEM7ep1HhMJlu4l3xz/8Ti0yVjiarDm04ARut/VWaCoz6AWU9JfZZPwUKYVxVPi//vFAapm1/vpes3CJCIEK5FLfNt0JIBRjk+fUe9RlWM0Niu7vy0CzW0NS9/IP9kTYQA3bz4SsHfpulZnxEXeNx6qTIMxuwV+WOetA1TLHFTl7CVYb6voWTHbdDxWox0WwncCMIdci5wTxjCy36IUTpGzgI45x5vgGG31D9Fm7CoytcQRH0VYS0xJVyNHUSA5fFNPraK+rHjsOe5FHf5gRo4g5hHs/Sal1TGzlPA+t+SV+Dy2aqKBiYLtZSHl/OoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeUHh5cDyKxCmjVxeCANLaF13Qls3MT1uUkDGQ+CyZc=;
 b=Ke4Khj/1wa6/HPJX7lLDFsqEq35Mph2R5w7l5xG9YoufzeglL+B+n31ET0KUolZoXdX3G8VyYqEwog6l3Luvvz7ewJPXmBX50N8sEcZn3Nvv+cUjYOTHNuCGnidyDiMtOMYrwY/qfyqW0PnqXn+9+P6deb63yJwBV1n0ivhal2r0F7e53oDc/CXBMUklSgMdJGQe5RsJbqofuu8jpAlHYDfos09VsNpltKJ+jVMaiSBvxHJyVwAEsZlr4tsWkYDuVYYz4OkgCkqAzF4QwIwQyeH0G44mJbkXsWwBDNROOt/mxViQ9uJVfeLph5sZB/MTlbI9SoQZuU8exuGRhDpfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeUHh5cDyKxCmjVxeCANLaF13Qls3MT1uUkDGQ+CyZc=;
 b=RplNURi1gc+Y4+aleNL+DHY/U2Z+0WqLnEQ5sI6LUEsXAzcQCJzjTNXX6ZuyZkO9WFXqG9X5eTBAN+f/AJO+PECcYHv1y7CdtdtD2yvyCjfisxaCaCPkndLUqpcIrScpPmPmqhGYq4CRIrMLIzw0xFmgAXej+YQRSy0oqjhoOLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8957.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 22:19:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 22:19:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 22:19:41 +0000
Message-Id: <DGSN9C8PBFYP.2T48HOEE5LXSM@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
 <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
 <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
 <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org>
In-Reply-To: <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org>
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 79279205-1ef7-419c-802d-08de78a9ccf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	QIjyv0m9isCfpCSeAliIMWKbD5Ix77viDnaZI9LLZ78W2MoxI2r4a3JsdBKORcm/hTMdcHwYFcwvCFHfBD7jzJGGFkMT8C0jCdhYN1dR2OhbD9oa4i+0HvQnXKfAnxUSP4vpdeIV47u/lasS9igJnONUs1532CtOKgGhHpJrzaOOGmPIas5LFMGEjttsXhi5YdRfy865JR6wVh1Y5xmAt8x6neTb5UiJ/7j+Vws+EreTStrS730frVbvR/h6X6Qz6ahcRgwW5aZYE2t7b/kLSv9G6OWrrhGCiX0bHckTMr9NxAKouz0rvk96VL97K3G2k82H7Dn/t2Bsb1somQ3Pwdn+SoSANjnCDbOuclNgrKQqYbyOq9I6zRhP48cXao64jeAKWyxD5mGl67wV4bw47wfmwPSLbk87naYOydWQX7TRHpMHe3DseMQFv64lmBPqRxyikPTd07tgq07XLxItJ+Fljdpzw8I9VnjjsoaLyFjKbjD1eNDvuISgbG5sYputtb7joKyF4pQ/1aiaKc0oPi5aPl/rcM4zE488pMKSw2jskR+yvJQj1qLUU7j0YYj43g6t9vDTxRrWwi0GBWajakOZXceM7znvVQl0wcl9Nyv4LZ9ICyIL8gQxDTNEbrDgknAhkPxK2JohXzOt0CJ+B4EBCwZvn72hfQoTe/GbY14IPIWuQpfYx3dgjep3kUKAGVZ+k0rQkd0D9OxdpW9odoLw03e5pBXjPPJJ4XbJYiyHVaYHygcVsqGxadHJ/ltuS3c80DPBoLQwa284SS3CWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDBDSzhOaUQvQXpRY0RHNE9ML1M5WElKbjdZVEI4dFBvbWNqa1lhQXZmcUo2?=
 =?utf-8?B?cmxRemdxc3hFS0FCUnZVNUtNVlkyN1hSU0I3R0pqV1ljWDM4TzM2dk5tT0Za?=
 =?utf-8?B?eWl3c2MxSllUc0Q3ZWUydlJ3Mzd4Zm9HeDR6QzZ1QTYrUUlyWi9lVDFWVitX?=
 =?utf-8?B?UUxCMlQ4RFFRSnJ5bTA3clV2Zmc2cFkyVFk1NUU3Tkd0ZXBUVUROL0g5ODBp?=
 =?utf-8?B?bmJ6ais3V2hYRGdPNnJnTWNabEdmZnU1VXVqWHdlcDloYWFVYjZIRUc4SktL?=
 =?utf-8?B?d21qeHZ6U05uY0pBV2dWYm1TVWJlV3c5U045dURRelllMk42d0pZeU13a3lR?=
 =?utf-8?B?L1B6QVZMZVRPZTJmVTZtTFpxTk85R0p0VGpZaEVIdmNTQzhWYWc2cHVWbU9K?=
 =?utf-8?B?WllwTFFyczNDR3NOTkFZak83ekpLWHRnK1VDS0s2c2phdm1HYjJFdm1GWFlV?=
 =?utf-8?B?SWIzMkU4cmZaSzVoU2JPczFyN3hIcTAzMU1wMmNZN3pxREpUMVhYNkEyVU5U?=
 =?utf-8?B?UnhzaUtrOHU4WWJNdFdPOTdoT3ZMQjlaMXdrdk9IdWNhRHdHLzFsMGxsb1k3?=
 =?utf-8?B?RGhCTU9TTE5Xdnh4T0VWQ2QvMStWWmRWT3pMQVQvN1JXNmttdG1LU3pIVkxX?=
 =?utf-8?B?QmJjSndTd0JqWWxIaEY4SndUZmNBcFpOcGlaUCttRWd5eHFVK2RuUVBGVmla?=
 =?utf-8?B?d0YwYmN2R1Q2WTVNaW9kUDJTYkFIeUN2c1lMeU1aa3BFY2hoSHBQdW9pUUtR?=
 =?utf-8?B?aXpQMzUxMkRPS2pBYjVqV2NnMnFWMXNSZ0pLck4vT0RVR2VTSU9WMGo1SGNF?=
 =?utf-8?B?MGFyRzdtWSsvY2t6VUpQQ3ZzcVJuNVRzU2NkYzdzM0lzeFloZmduNW1HMUVV?=
 =?utf-8?B?MU14cURUZWsrMzBMRkdaejZnS0Vsa2NFaHVzNDI0eDE2M1J0ZGN1WXI2aXV1?=
 =?utf-8?B?YlB0amFlMmVxN2tQck9GSTFkZ0VsZEl2MUVoSUVTWVNKQnBJa21mY2xUMUlD?=
 =?utf-8?B?TkhlSWdYWWpUcFN3bjdBMDNuQk9KeEdVb3NiVmxsTHE1akE3SjM2SXY2eU9O?=
 =?utf-8?B?UzF6NnBEN1BpQXM0RDRjalFkaFlRaHBQcmZPWEVBT0VlYnRMKysvVXBQcFMw?=
 =?utf-8?B?NFQxTVpWQUxYK0F5ZmtRc2l2eHdPRFkrRWVZcmtUUnJFM0lXRktlaVZRK3pD?=
 =?utf-8?B?YjNDbURSZTJPSjJ1QlZhWWMxQ1BPV2xpTENkUnBNNjhza0RlZUNTWVFvTU9N?=
 =?utf-8?B?VTF4R1ROL3Jsd0locEtYWjFGOUJBSDZEbFBLUDl1cWFJWWg3QVdQRnNxZjZu?=
 =?utf-8?B?Mm5aT2VvMVJ4M0pTU0N2eFBKT05OUDVrVjBTZTNRU2FiZFltYnc2UkdBM0M5?=
 =?utf-8?B?THBHTnFpdDFHa0Q1Uk9DT3VxaFhubDhYMG0vZ3JiRDljQ1FBTU40N1NxN2ZV?=
 =?utf-8?B?Qm9KdzRlK1ZVYkQyYzlpUnRWcGpzRFJXVi9WVTV3NzdIbjZOWS85WXh6ckRI?=
 =?utf-8?B?V3RjTVZIUUloTDBsNURtc0o2WVFRazFOVHZXUWJSMEVuYXZpSnpHektDb01E?=
 =?utf-8?B?eURhVzFBbzJON1dESHdGZXJiS3cwVDI1Z1hoaWc3cTlDYng3RkdGVlRPREJN?=
 =?utf-8?B?RkRpNTdKQi9NUzJwNTVYTDc2K3MwVFdpMnE3Qlpvc3R1aUd0aXdmcTZSdzNT?=
 =?utf-8?B?dCt4eExaNXZ5Z1hYYkRLeTQ0YiswczRwVDRLSVJxcGZzaW1sWmpPWFpqLzBB?=
 =?utf-8?B?MFBCT0x6b2FzZ1RyRXZMVk1PelB3enNsUGpGTlVZTTU3T3A4WHpkU3lsbEJv?=
 =?utf-8?B?VDV0QVFDbThGTEwvb24wdVY3T3pvTUdjcmJ4K0kwU3VTc1VZNnhSOEFTUTlT?=
 =?utf-8?B?NlZ2cVN1M1M4enp5WklhKzMrMTZxUDdYV1FoeDhxMG5pNGZZYnYzakwzUWd0?=
 =?utf-8?B?cXVqUmJZemJyelJOQUZZSThJN3NEUFFBMWp4NWNPNjVwRmZCenU0ZS8rNFcz?=
 =?utf-8?B?V0xZYTkwTU8rQTNYdk1YR0xjWW51UHNPMDhWcmpIYmhxaFdiNFZPaGdNT1dO?=
 =?utf-8?B?SXlQYVhYRHlFcHk3YXNpY0xieGkvVXRtWExDN2o2V1YvbzU4Q2RidWE2MitJ?=
 =?utf-8?B?cjB1UXZkMlZlZmlXak9QMm1DOVNmbkFNUmF3cWhzeGlubVRleWxJVEN2Nm5X?=
 =?utf-8?B?L2NqNkREWHp3WHZjak52ZzdYb3ZleXRrRU00bFVNQTAwSkNxVzNoaUphRldv?=
 =?utf-8?B?ZTEreGxXb0xUZDI1L1VuOTQ5L3g5SXVwYU1QMGFocjZwTE5IM054OUpNQjda?=
 =?utf-8?B?bURSdWI2bU5VTVdUeFNZVTBUc3NXN3NmTVNta0lJTVNObUpXMnViZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 79279205-1ef7-419c-802d-08de78a9ccf5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:19:41.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4g2iiP3UFpPsIBqz5VlhyKx6WScPF7Jhsv8gt/5Bhg6btx25wnC69AnZk3ujphaWSBXUPFWBhVkWja7czjrXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8957
X-Rspamd-Queue-Id: 89CFB1E63DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11525-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 10:01 PM GMT, Benno Lossin wrote:
> On Mon Mar 2, 2026 at 9:14 PM CET, Gary Guo wrote:
>> On Mon Mar 2, 2026 at 6:49 PM GMT, Benno Lossin wrote:
>>> On Mon Mar 2, 2026 at 3:49 PM CET, Gary Guo wrote:
>>>> On Mon Mar 2, 2026 at 2:38 PM GMT, Benno Lossin wrote:
>>>>> On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
>>>>>> +/// A helper trait to perform index projection.
>>>>>> +///
>>>>>> +/// This is similar to `core::slice::SliceIndex`, but operate on ra=
w pointers safely and fallibly.
>>>>>> +///
>>>>>> +/// # Safety
>>>>>> +///
>>>>>> +/// `get` must return a pointer in bounds of the provided pointer.
>>>>>
>>>>> This only makes sense when the provided pointer already points at an
>>>>> allocation. But since the functions of this trait aren't `unsafe`, it
>>>>> must be sound to pass `ptr::null` to them.
>>>>
>>>> The "in bounds" here is the conceptual bounds of the pointer. So, for =
a pointer
>>>> with size `x`, the address of the returned pointer lies between `ptr .=
. ptr +
>>>> x`.
>>>
>>> Okay, I haven't really seen that as a concept. Also, what is the size o=
f
>>> an invalid pointer?
>>
>> It's `size_of::<T>()` for sized types, and `size_of::<T>() * slice.len()=
` for a
>> raw slice pointer.
>
> And for `dyn Trait`?
>
> Do you have a link to somewhere?

For `dyn Trait` it would be the size in the vtable, which is always availab=
le as
vtable metadata on a raw pointer is required to be valid anyway (this is
something that lang team has already decided so that trait upcasting could =
work
for raw pointers).

I am basically just having `size_of_val_raw` in mind when writing this. So =
the
current `KnownSize` comment in v4 is something that I am happy about.

>
>> The projection semantics is same regardless whether it's valid or not. T=
he I/O
>> projection work will rely on this, as many I/O impls will act on pointer=
s that
>> are not "valid" in Rust sense because they refer to a different address =
space.
>> But they're still legit pointers with proper meaning.
>
> I like the solution with `KnownSize`. The previous safety requirement
> was nebulous IMO.

Best,
Gary

