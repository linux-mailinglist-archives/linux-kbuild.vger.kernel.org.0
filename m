Return-Path: <linux-kbuild+bounces-12080-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEmqJbcKvGkArgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12080-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 15:39:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 915742CD001
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 15:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A30F3024877
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 14:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0CB175A64;
	Thu, 19 Mar 2026 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="tWZ45K83"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E874A2E6CB3;
	Thu, 19 Mar 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930374; cv=fail; b=euk2M05Y9M8qNohBNit6YdD8Uwkhae/xaETxBzDSuQnmFQs1l5T4+v4Xu1cqTEq+xAKc1M6kQ64xzpwRlOftk/2+jpORrmHqlRZHtxtuj+fUSiPYN8gbBT1O9VqRyZsJjR1CuPxQQ0mwNKloMnPAf8WTjS17TiUHyivzkC2LzCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930374; c=relaxed/simple;
	bh=I7C3602pnBxpSFrPNKkpLMw6yrO4CFGUIlE8DsYb0LY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YR5KXYHucROR+oMieUTiWjkM6uwl4p060pVDLJbVZ5viX1z4gdaFfMy6Ua/nTq56/9xEilPGU1FmPT+p+28gxWij3nA3rX5WKGhjj+IFvQrHtDhYBd4fC7EQACDeU1B6hffhINQNd9+Vsqq8iL5yabWn/EXFasSaBmaggSDi8/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=tWZ45K83; arc=fail smtp.client-ip=52.101.100.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRl/5mRjrU8fVw9Eu5QWvft3Fx+JjflP7jXdlj8oTzx80tjUs5KdhramcshzxuUTwwYNzySdsG6b5cs47LcPwgiDfqYAkUwALFxvEwOQczd2bvnKfjZxR+Y4ATFOeRXcLPOOIEVd0KXR2bQuACmeB6IoTP38Amb3DQBqDUegLHiydJeQWtgR2A+r+ZNt8JZP0FMfDHdxDmKIyo/N/GCoOkdsVQjnwMUZilhX+74yG01OtDTYEe6ZFGzDcTf4LiJFwbI+t1sS7x2OP84inY/UE47TPg69UyLcJl6gCOZ+YZGzxwXMV7UYQh1vEqg+sW7MejA0nWfZCaJ1VeoGNYXpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7C3602pnBxpSFrPNKkpLMw6yrO4CFGUIlE8DsYb0LY=;
 b=thKVZJ3+xn03WKITCeUDmw3gMsK0E7b++gIxvwzag3ioHOiobk80JQEafpj50PqS5dzyUR69yAofVvKwEbEwRxrV5Yhsc2X53PYm1cUdjHupLpzvhaFL+/9hx++rcDSO1Sp3YKBPmspn57Jfsng7NPfkvdasGL4duEWAeZM3bCkdizrMsHxi/YADu5J0oHp+ToJ4chu0B//yavutelvF6Zi7Z/xZUU/nnUKGM3RK3Z+ZhN/OiYLQ3KjKvRJzYvj3ApvKkJO2pRI0tkeEge0NAE8MlW3LYVFwyZDWfBkvtM8YN9DNO11x96nRAmST7vtGcYfBzW6bIbMeSid/3n+0AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7C3602pnBxpSFrPNKkpLMw6yrO4CFGUIlE8DsYb0LY=;
 b=tWZ45K83Y4t2WVrDDw17NYwQiQix0L/d72+0sk7YGixmpSlspiYy4s8y1j4+rch0HhUehgh75PN5edkzp3mR9oyagqiJXBuKWL7C2axEqcm1kHnYdHxN7KvUekecAUGN3DifLIclL+ABHn2nJwjZ6MVkKPrm/72z5V60nTFxEKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5746.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:263::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:26:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 14:26:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 14:26:06 +0000
Message-Id: <DH6TTZXH3JKU.1URETSC28K6TZ@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, "Yury Norov" <ynorov@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] rust: add `const_assert!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-3-gary@kernel.org> <abwEZaOSqnuwQCux@google.com>
In-Reply-To: <abwEZaOSqnuwQCux@google.com>
X-ClientProxiedBy: LO4P123CA0663.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5746:EE_
X-MS-Office365-Filtering-Correlation-Id: a0295767-7b7b-456b-379a-08de85c37551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	XjljvL/D5KKfzvf23/fhe0R9WlALlKbJxU6SFAJwuMkQtCWJ2man6x/bZpA11lasF7d3aGqRyfjyi7iK7uQK4bydZW2TGdouqVC0C+6a3LksNnPrursaPKsDZgVi14ZddFwoQGc4WNDUkQ4x+NuOXDI2PxoXxJCfi/Jyt8pQZcaRrUuDMdctEZpvdIxftPkaZa5ix+rUCzhJRqm7iA3RJOab5XqayHHKhUu+JvPNq1njH7BhLKb5rbASfSpE7hMlbioIyM6pYzhxWeqwkanxG3bYK0O+P7MXoMlmNEh2w5AQ5r42Iph3sO0DWja0lumuxUUmBXA2WQAwxAoNWOEwLX+aRWFK2+Vu64l8KDi9bBDT/NYCOlS/R6qiuXKOpBt0QPSgq+jud7vEISxoAZfWM57vWFgW3r+VZCAzs8b3W3WAFE6bdmdNa6sUhtmLObCQq3rugWBWnO3RhURVMUjBKLiaTLSa6P0g1AK5FHrl3rFhOjNhDSfhJrcLy56nHK7QUu5hn4zN7gIsYieS8idhwNb70joHpl8xdQXHuiaTmT6qcavZDbYG8fSz34ScDsRu9WHiJ2qELGEaLc1RErg43vPsHSyIvCP78Al4n/nDCvAd06mfcg4VZzOx0FryoUDZJ359Mb1U6soIsU2fdLt8R58ovYj9WSBTkLiomAxy7R2vCtudhZLxRll8Ofcgs4eBFPMd4zOfM0WlvcJESmVvV2JRdWOmDFQeJem4Vg1SK88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk5OTncyYmdLNTJWaVN6Z3dvYkNNSGVOUDdCSGJXSWdoejJicUNpRkR1M3lv?=
 =?utf-8?B?SjllY01yUUpYMkcyc09PcHhEWEs5MFRtcWY2VFdKY3NKejQ4dTJSeStiQWwx?=
 =?utf-8?B?TG5QdWFHWkFMZlo0dXpSS00rQ0hRWVArdWt6YkdtS1pCNkQza0x6T1gwMUxp?=
 =?utf-8?B?Q1UvZkFZanJrVzVOMlgxQ1ltVWdvT0czSGZpdXlncm90d3hxbFhNeWZ2bzJ3?=
 =?utf-8?B?Uy9RWXNkc3JVRGlwN0NYeUVnNGtvWUtsRHhTNThlNWhxcSsrbkxsTjgwQVRU?=
 =?utf-8?B?TTNveUt5SVFtcTU0SEt2by9KbVdMRXNlU3g3bDJ0WHFzN1VZc1ZPMFMzd1JW?=
 =?utf-8?B?cUdUTkN6a21TZGZvUStNRGJrWG8vdEtlcmRjcXlyQ0l1cXZiMDFJYmN6U1dt?=
 =?utf-8?B?ZFd5c1VBeFJUZDVoYytsUnlOWko3Skp6UnBFVUlhUnc0dlVkOEc5amt0WWt4?=
 =?utf-8?B?aU11eUIvNVNkYzAxaWxtckdLM2RhcTJXUlFNRnFBeUFublhPbnNmanBMQzV0?=
 =?utf-8?B?TGQyZ0xzSXNLNGM2cXFjVkM4N2Yvc1VNQ0I1TEI3aU1naVFhZkVEUFUyczll?=
 =?utf-8?B?bmxDd25HTEVsZG1uczViZlh3dTZqWndnbjFOMVdtS2dtVVppMWlCcnJMUXk5?=
 =?utf-8?B?SW5VaERMcDZxSTFXdTI1dmJyK3FCRVlZaHhnSEhZWVFjN3dqWXlHMmVKbjNV?=
 =?utf-8?B?NGU4WWI3WkhwQ0szZGNLei9Mc2tTMVRPWXBMUzUvN1RoY05UVVZaaTZvRUQ4?=
 =?utf-8?B?UE1OMW1QQmFvRHFPdmkyYXU1TFJkNGk1Y09oL0lqbnFKU0thUmlOVmhGTmsr?=
 =?utf-8?B?NEJPaWFyYXEvcEV0dFlKckdwRytlbVpvcGNrNXZBWjFQMC9CWC8ySi9FcHNY?=
 =?utf-8?B?elF3WWt2U0hSZDRuTFlFVDN1Y0Z0Ky93ZWllVGJPWFZ3TElHR3BiSC9yUEox?=
 =?utf-8?B?QlM4K0tmKzlOSzNGWW5ta3dhTFNuZFRKVktncE9lNU40WUZtMDZUaFlKUXE2?=
 =?utf-8?B?b1R6MTJabjZRWWljb2xMMktxdkxNLzk5TmVaSytNTm9jc0xRMExrTUtvUmNh?=
 =?utf-8?B?dzBCT0kxeng2eUJsZ3l1RUVMS2ExSDgrMnc0U1dQRk1sbys4VTh5cjVhRGZx?=
 =?utf-8?B?VVg4RlVpWjJhWGYyN1kwR2NMNGQ2RDhROFQ1Z1ZUOW83c3NRNE1udjI2TXVN?=
 =?utf-8?B?YUc0VGxUYlE3c2V6emMwY1FTSzNuYU5WblljOWFPb08vTW5GbmtNMW5UQ0RR?=
 =?utf-8?B?QTJlOXhMbkJmNEo4YmhLL1A2dVY5ZXJjc215RUYzTG00MTVSUlZKZ2N3eGFR?=
 =?utf-8?B?ZFdnOXN1MUZkRFM5S3lRSzFUZGE1aVdka3RSSHdwZ1UyRHlpTmg3OSs0OXBw?=
 =?utf-8?B?K0VzN1VqL0F3WnRqNjJzY0N2b0grSXh6cTc2YTRjcVZUUUZIc2dmaGZlRlFS?=
 =?utf-8?B?M2FESUdGSzRabUhCSk9MeTA3WUs2VEk4WEZuZFg4cU5JL0FGeWptcXRzSXF3?=
 =?utf-8?B?Mk5ZMStUSzB5eUZHNXJtWVUzZVJkaUhQWUFEUXpodTJKNlRvMVpVVnhrMzk1?=
 =?utf-8?B?SG1WT3VQZGlPdTJkc2xxQ0VHYW9rTWJZNzVIZXlmcWowNldkendqMW5zNm1s?=
 =?utf-8?B?elA3Q2NaREZxcXo5QjJib3YwczArL21QTEV1V1Fmd0oyUlJBUWt0UVY5QTQ4?=
 =?utf-8?B?b01KT1JZaXVNZ1E5ZHo2NGlaQUlnUlN2OHpYcEtISHREY05mZExtbkUvNUxh?=
 =?utf-8?B?Z2RBOWtRVEordnl0RXEzTFE1VEpZeE44LzMrMWVEK0JVb0FaWC8wSWhqUm03?=
 =?utf-8?B?YWRVYWRYMXFpWmp5eUlUYVRPcnFHOFdvc1FDWGl5c1Y2OEZSZGduTDE2OUpt?=
 =?utf-8?B?RnJJVFhSa1M5VHBIUWlGRmlIYkpKL2RhRnQxcXliOXIrOXRzaExGYVFJK0pC?=
 =?utf-8?B?TTQyS1FYUFdLcnEwdGlOTEZ6WFhQN29aRTFQWE1zRU5iZFFuTkpZVWMrYmgz?=
 =?utf-8?B?RjdUem5XWWNLOHdOZkU2L3VpOGRIV2NJN2NwNENFQkFWZFdqdnBqUlpJanB5?=
 =?utf-8?B?Z2NWM1NreXMwRVF4SGkzZWFxWjBob3loS3Z1RjVSL0MwMWt3SWM3RzRCUUdO?=
 =?utf-8?B?QlRHcnByUXg2RnRGZE1pYk9OWWNkRGlSenc5Z3BoeHBqTWkxMDRQQUtNWWZz?=
 =?utf-8?B?ZFJISnQrUVUwNkpIVXJCK0c5L09MamZpM0UwcFhGUGZwdWtWUEk5YVQ0b0lz?=
 =?utf-8?B?WFc1WHVjbDJHNjBNUm5KMnllUDJWOGhqbjYrajFUVk1QeUI3OHNjMkp6dDBN?=
 =?utf-8?B?OTZOWjhxUmovUzJsZ2ZMVStFQXhvZHNDTDVOaDFtQW5RVVk0NUhDQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a0295767-7b7b-456b-379a-08de85c37551
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:26:06.7952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDSwtlSsxLckmQo3KLyMBz2RW9/XmUQsHdL4hum/WTq3bOQNKGoCBwgFgNbN18jpXxUq3VbQlCNjRhBoKn2/1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5746
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12080-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.890];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 915742CD001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> On Thu, Mar 19, 2026 at 12:16:46PM +0000, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>=20
>> The macro is a more powerful version of `static_assert!` for use inside
>> function contexts. This is powered by inline consts, so enable the featu=
re
>> for old compiler versions that does not have it stably.
>>=20
>> While it is possible already to write `const { assert!(...) }`, this
>> provides a short hand that is more uniform with other assertions. It als=
o
>> formats nicer with rustfmt where it will not be formatted into multiple
>> lines.
>>=20
>> Two users that would route via the Rust tree are converted.
>>=20
>> Reviewed-by: Yury Norov <ynorov@nvidia.com>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> It may be worth to mention in docs that const_assert! may only be
> checked if the function it appears in has a caller. Whereas
> static_assert! is always checked no matter what.
>
> Alice

I explained this in patch 3 on why `static_assert!` is preferred over
`const_assert!`. Given that we recommend `const_assert!` only when it refer=
s to
generics, the check is inherently tied to a specific instance anyway, so I =
don't
think it needs to be mentioned in the item doc.

Best,
Gary



