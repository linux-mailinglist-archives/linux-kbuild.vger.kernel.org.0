Return-Path: <linux-kbuild+bounces-12735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAWEEqTc12klTwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12735-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 19:06:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D923CDE82
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 19:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45DEB301039F
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 17:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA69F3E1207;
	Thu,  9 Apr 2026 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oUrFn+oo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021081.outbound.protection.outlook.com [52.101.100.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AE229B200;
	Thu,  9 Apr 2026 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775754397; cv=fail; b=K92Tv9cXLa9j7jbMtOpwA0volmHFQzmEkUE20/IcmamqiW+quED3cKdtKDtmnyWvvKjSL02I9pU286lWn7cxPjo3B7Nri6Dx7LCJAJ23agfv1BenGF4MRYY9F1bhjTMVPHrbzJ5+NW3b9EOmCtX/EMWbBO3oiUWfReAQRE4VqR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775754397; c=relaxed/simple;
	bh=scBGPATeBJKO3mDEv8BK0u7ZOoGJ/sn/f+6v5qM/IsY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AgOZ72jfKT0LG27ijLV4IKWzo3crjvd/DgGFAc1rar+0h+LFNltmD44zdhd/kPqcBxpdJuN53B45IZRsSXTngNIzArKV/MUMeB1iNt23HCVdWMrvBruy3fZSPnkKqpRHm6s3fUKyXjATnhUbyYv5xY/HPvFW0mYbm0PvJA+yCM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oUrFn+oo; arc=fail smtp.client-ip=52.101.100.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr0TOCxfI4dfr4F//dGYAHFjmH5mPWmbA+FCFU8l0Q6CiCTyOyYlcTYy0SapMstk6LULSMt/dD4ZGp1WLvgwMH7fNXefzqg8USnN1HvwU/JOIwlJG9QdWEpTwSp9BAdGQTrIlvO3SlHpsfIDevyjXnYeNQ9JUMYe3LFeM3DjJjR9qQLHMhzMl94OlZ4Wh3fKMB1X9aAYNfBe/Ot7X7EJA0eRCse2Vt7RYeesecvqOD9pgP+e2SZBjun2Sozb5puqfMcy3QcowxWOdwFq8xiwhBcgXXd973vnpxeU/j1zSL/0RUddoCeN7vI+23OqCkoEVESfKyiLPLaepRnzw+FOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiXGMhqWN2+XuO6hJyfvnAi6MTvpojiWNoZWHwbvTCE=;
 b=XfCN7yvHLNIHYKea5mBrwJmU9NyaZuE33bB5rmrXrvKwNIJbZjMvemRvEiGzZMuyIRz4w4lLw93MT5gLpeOAkEeKXau4KtXsRlOSOWOvUs3H0IjVTFc8el3MoOARcKkj08e6j4auKokCwFAL15EkW6EbN5hSsWkoF7bMqXUiadOl5Xx3W/oVy8fQ8bu0c0rJNcYB4HMH/Xd3sx7wR3l26644FhrQAxqkylzWS3CgfklfKKY0J/0OicyqIOi4VBBH84xqfKCAF2Ccv6nVofXax0h9ZZiHx6o6gOiecNtx3BWVz+qzoSmnEn0lrZT2uuSHcQ3Z3UFb+bjjms7ALxe/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiXGMhqWN2+XuO6hJyfvnAi6MTvpojiWNoZWHwbvTCE=;
 b=oUrFn+ooTIH1w8y0PybNuj5ir25Ro4MVQbZLqUbgqvGaB4z8McswYvi7BExI0jAW5PCSyN+33V9/2Vouytjfrd01Cq+AIFInKFKttx1wCuRwePisLkhPxKeU5KMNq4ZikNiL5MhMGNek61d+zXAAckr0bM234b6hG1QKc+PUCCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3024.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:179::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.39; Thu, 9 Apr
 2026 17:06:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 17:06:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 18:06:30 +0100
Message-Id: <DHOSE8ZNA27J.J412X7HM45OM@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>, "Aaron
 Tomlin" <atomlin@atomlin.com>, <linux-modules@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260331205849.498295-1-ojeda@kernel.org>
 <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
 <CANiq72mKuQgK_R=xs6270nwYigzCvJiFJ1PcOB+WT3OdXO7E0A@mail.gmail.com>
 <CAJ-ks9nMA1zqGhHhOk8hmfNgoODQ+D-WforPU6iCciYbPsDD-Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9nMA1zqGhHhOk8hmfNgoODQ+D-WforPU6iCciYbPsDD-Q@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0150.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3024:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f9512a-ae55-48f3-b606-08de965a5868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2gpRQnjDAAIjKqjMJk1B/CaiRBvl89QUrLMsvJLWykhOKujH7tKN0hzl8MZ+VLAJ43qbUKhTU/zwXUGagjBfGOlP9fznWwrOgxt1ybJ3TlEN+PCgpytvpUUFDOlrSjDfuCocghmeXt8lcxAkAYXMiXBmRztNiCnROCD21Sd4TGBo7wut1TUb+Dt4MgBNIJPySaY709jU8Z97g1xbbjLEjhHWsvJK3ZdpuFzPxTyaa9EqOneihuePakWZ7wWCssbb3ImnNRN9taOO9OfFBg3bY8Bz84RMl1g3k0tRrun532wbhiwoBPTYhHD703QD5vGZUWpZ8HZyQdvR+wJtc88C1SB+4T9Kf5N/6+oCgFfKRbQe5cUkPC3CbSFoQEQiRz+WPVtDiom+3PfO8S+haoz8DtqdLi2WqeXdRGj2UP/gqRfzothYEo5j1GJHFUG7CENub2+Iewdk+MK0Gs7NmVi4c1RLCGsIrvitEJ0aUktQfV8qKpm/M4rQ8P+eyQ30DgX1rX1kyE4j64FnKnGXhR21iSgyziH+bTvmi+War8RjXHR1MDpBMf7SfEYoGW9ZDZgNIVbMubDJ1K78Bx0SRtVpLDIOHSwMqIlRn5K1vpL2FowUd35d0p/dr5n3/BNREn0FI8zOk+lEky56xSNbsXH4qRO9jC+2VC3d8e4RvjSjMbpUFSWhTax42LMH0fD9rLTY82JCIrKSCsxBSOxd/a7819YRm3E18840sMOirnrw4xY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpXUktHaTZsdytpTWJBY2Y1eFp3QTl1RDhyYkZRek5tQm82djN4ZENzQ09i?=
 =?utf-8?B?TEdGNTZNSldKY2tDaHRxT0xKemhQSGd6Z24zRnNjbFIrY0g4MTNubHdmTS9Y?=
 =?utf-8?B?T3JhdDYwOG5SNXNwaHpHYUtBVXVRN0dDVVVCQWQrK2o3WEdVTFlPd1ZTVG5K?=
 =?utf-8?B?NUZYVGZ2S1FIbHF4clpNUUZwcnZWUkQ2bXl2N0p3cXJ0dVYxMk1ra1RrN0pi?=
 =?utf-8?B?Z21CREw5ejhLUmdyYjFqNXlkWUEydUd2VzQwNnlvbGo2dHRUK2ZKVEpDWG9F?=
 =?utf-8?B?QkdqWDM3R2ViTG8wN3FqNUkzM2RON291TFYwVlpnTkFEbldVK014RE5maFFu?=
 =?utf-8?B?aWwwNGlnRkoxZzZpMmhrSGQ4Uyt2WWFYTkRPZVNjYWJsaHEyMEJwQ2VNOVFV?=
 =?utf-8?B?dzFUOTlSNHlNOVQ1Wk90Tm85UXJsT1hEWExsUVMxNUNOVW1ubXZtUzFYaGxK?=
 =?utf-8?B?UWRpd3lGZVA2bU91N0wrTi9iNjRSeXc4TkVLSlUvNXc3WlBEZ004bUVuZkFT?=
 =?utf-8?B?S1NXNVZqdW1yb241UU40RStObWdKdkhTOWJJZHdqaWJES0N4R0VyUXYvTld6?=
 =?utf-8?B?djBaUEpLS0F4VUdGTy8rTXVROXpCbGpXbXVpbWVQQjNVL3RLSi9sblVNTm1B?=
 =?utf-8?B?Y3VEU1dkTVgxWXNIYk4xOGdxTitRai9IVitLbW9FNEVjeTI1dGhTOGRuWWJW?=
 =?utf-8?B?dHpkUW9OeDFtQURnRFdTdHhqdGp5UGNvcTl1dXFpN2NIRXZLT0NjQ05HTlJy?=
 =?utf-8?B?eW5DTTN2TUF4bUpERTY5aUdPZStIT2pQbkdMaDBVT09JSVdCeWlkdEFQeklw?=
 =?utf-8?B?Tkk5aVgwcmNxOEY4UWlsUEtSUnIxTXVFNWhUbVkvT0lkU1JPTHBMb1FjbWEy?=
 =?utf-8?B?c09QZEFJMm5IM2ttenQ4N1lRSVJqQWhkU1dOOG42RGVzbkFiTTdVWkNSZXdV?=
 =?utf-8?B?VmlQVmlmbXJKeUx1WmxxYzhjMWJ4eFBvNElURnFLcjhuYllSK05tTExFTmVo?=
 =?utf-8?B?TVNpYXpZZTVzeHZYdnRHeVdXM040SEF6UXFKL2p2OGRKZUR6T2hvdDdnOW9F?=
 =?utf-8?B?Zm1sTWRCaVdWMERqc280UlczTHdWVjhRQnZ6Ym9jM0tOUkNBQXlmWHZSM01E?=
 =?utf-8?B?MzJsTXhHK2loYWZyRnQ3M2hSL2NScUF6b3hUYmN3RG1GR0NxS1pQSEJSYmN1?=
 =?utf-8?B?cnd3ZGhkb0k2eGZBWmhJZDlLaWpWT0hXZHhQK0M3ekVTTUNmSy8yMkRWeXF5?=
 =?utf-8?B?WkZVNDRkVWRFdWlUZWRML1dZdXdldVl3aWJzNnNaVnZPL3pCZjhPZ1hOWXhw?=
 =?utf-8?B?ZkdKamlTVHN3WnhOVjloTEk4MWsrREV0aHM0S3ZjVWxQTk1xSk5mVkdOU1B6?=
 =?utf-8?B?OVlFWnV4aDBJZUxzbzhZclNTY0MzUjZPcS9zSXpyTmZ1N0xwQjBVWTZMUTND?=
 =?utf-8?B?VG1mUllURHc4dEIyV3lKT0NERU9MVUQ2dWRpcWNHNGEvVUVhOEU4Vi9QOVZa?=
 =?utf-8?B?ME5lV2sxRWc0TEk3ZDR5Q1NhZ2hQcEZ6R0tLWVBwdzNscjdCcnRyZndBYWJk?=
 =?utf-8?B?U3EweGtKZzR3Um93RmNhcjFWUHdUWkdzTjB6YlRkUTFlMHNTTmRVQ1V1T0w1?=
 =?utf-8?B?N25sUlByeFpPUkZmQTRLeU1COFlmZnZ6dnU5akJnSkZaYmI5VVlpb1RjbFg1?=
 =?utf-8?B?OUQwYnI1TEdtVnlwdmEvQkJBdmFyT3djZWJLZ1RDNS9uN1BWSEE0dXA0bWNy?=
 =?utf-8?B?TTYzZXM4dTFncDlxd3NaZG12STY0L2NXVE5rVGtKS0ZwYmI0cStFUFZoRTdr?=
 =?utf-8?B?SVhyVWtqYXRDNVcxS1NRUG5ZaWdMRjJpbld5RFYySnlBblVXUGFXMTB0UlFj?=
 =?utf-8?B?cHFJdTZhZzNlUVJUY2Q5bm1KTFpGU2EvSWRNWWZ5bm9WaVBpMlRaY01uUXly?=
 =?utf-8?B?VWVtYmt4d1poRzdacDRPRUNTNzlzN1h6ZXBNUVNHZlR2TFcwcVdmdDNqS2dq?=
 =?utf-8?B?QVozcUZGbEJvalUzY2liR0trOTlNQlFMWnM1TjJOd1BZUW9MVk1Yd3Juc3Qr?=
 =?utf-8?B?VlVZT2tNcmZUMmJnZFZpZW1BWnA4MGorMnpmeTBKbVQzc2FTL3FZL0Y2MGpy?=
 =?utf-8?B?YTB4bjUzcGNIb2YyZFRZWW5JNFhEWXQ3ZlQyMC80ekJIOXF2MlVlNXJGU0Ni?=
 =?utf-8?B?T3ZiUzFMQlZpeWpGejN6aWZXUG1CazVqNVZkTjhyYkNmYmgvd1YrWDhoVzhS?=
 =?utf-8?B?eVRnblVmRGpoUzFVYWYvOE0xNHA2TXV3UnphMWltQVBPSlZiOGFkMnphbFZu?=
 =?utf-8?B?QVhXbmg3YlE0UkYxbkVtdzYyUjRDVWlhNDRQZEhSZXFFZVU1ZmxvQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f9512a-ae55-48f3-b606-08de965a5868
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 17:06:30.8957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4gI/67fyR4WxT7fy+7YWEGnABF+DgtMjcN1qbKNmgiNuUMRMvV3svn798K6iYVjJZutanKdPO5wzktrrDVcDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3024
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12735-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95D923CDE82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 9, 2026 at 5:18 PM BST, Tamir Duberstein wrote:
> On Fri, Apr 3, 2026 at 9:07=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> On Fri, Apr 3, 2026 at 12:25=E2=80=AFPM Tamir Duberstein <tamird@kernel.=
org> wrote:
>> >
>> > Seeing this patch a bit late but in clippy 1.85.0 there is
>> > `#[clippy::format_args]` which would permit us to make the lint work
>> > with our custom macros.
>>
>> +1, that may be good to consider, especially with the bump -- added
>> and backlinked in:
>>
>>   https://github.com/Rust-for-Linux/linux/issues/349
>>
>> Maybe an issue would be good to create too.
>
> Turns out `#[clippy::format_args]` doesn't work for us due to the
> `fmt!` proc-macro.
>
> It seems the handling of `#[clippy::format_args]` is more
> sophisticated than (at least I) expected: it doesn't blindly check the
> inputs to annotated macros, but rather looks for the place where
> `fmt::Arguments` are created.
>
> In our case something like `pr_info!("{}", i)` ends up expanding to
> `core::format_args!("{}", Adapter(&(i)))`, which does not trigger
> `uninlined_format_args`.
>
> We also cannot fix that just by having `fmt!` assign `Adapter(&(i))`
> to a local variable and then return `fmt::Arguments`, since
> `core::format_args!` borrows its arguments. The local would not live
> long enough.
>
> I filed this upstream as https://github.com/rust-lang/rust-clippy/issues/=
16833.

The issue is that by the time Clippy lints run, it only have post-expansion
results. The pre-expansion AST is no longer available.

But if you run your lints pre-expansion, the name resolver and query engine=
 is
not yet available (resolution of macro names happen during expansion).

This is generally tricky, the way Clippy works is it tries to reconstruct t=
he
macro invocation from the expanded result.

Best,
Gary

