Return-Path: <linux-kbuild+bounces-12541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJK0AJ1BzWkkbAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12541-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 18:02:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7237D9B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 18:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC989322E813
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0723644D5;
	Wed,  1 Apr 2026 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZDFzZzej"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021119.outbound.protection.outlook.com [52.101.95.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C8036D9FE;
	Wed,  1 Apr 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057806; cv=fail; b=oSKEFf9FxeQhoiTPgH1fyjN5u4+QrFeaYE8hl8GCsUS7vZfwE4kHi/UBXsaxg3/giUby1mGbAL2KknDAAx4+joWYfVON5k0uzvSO3FrUWE6YKXuTfkvDDqNidqtjlYN4pmhXNPXJtV++KEqywAm3CPdscFCvUk7oqXVCEm+VgK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057806; c=relaxed/simple;
	bh=1V0GwvuS2zdl89iDXmGSGMMvQBksIDNw3T5eANlpUB0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Pf7zVNxxvIXdxzugSTJwQvGURYjsMU82D563F5XfPIXrbK4Pu5h2YoVPuuvkeG9RsJPVQX7T1L2LI7RwkvYlaVA+Yo3YZ1g6cmgxlZGHiyeWZqPPDUH31Y5KEFfGkU25kRuZv1Q9q1n4nEss8WUXs4h5jScwJ6A+g1TF5+MWieE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZDFzZzej; arc=fail smtp.client-ip=52.101.95.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG6tXZDBvorWDfvTNtWEtZiDNVkFtrm61PRT6mk8f9T9s/c2YFMaek6qW5ETqIizsUqMUtCJHHa43IuG+oy+ROmYjbjZV82B4f67YsEmucbFrUsrNgJWWsipo2nFT4a2gBmRt2BXkNhlqUlNzK12WVWe/RHpC76ikxTyWJFM0Ix2RrRdWC+A8Bnmm6/jcEvUHEO+5bDPCVBZBhpRoQM/ZvzupGu1ewHLyxqBpZT1wMcXbsSRa+OSf4sTqopVZMH0awn0uZHmrY0mLiqi42R0PXCpQWIInBYzqHeUXSv+H1jD8u7lmC/GvlyN9UqXzJWqNQP6Ai6WnDe8fIDAVhFeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V0GwvuS2zdl89iDXmGSGMMvQBksIDNw3T5eANlpUB0=;
 b=FS+nyiVWX5DPIgjZbD8zh+x88DBDZQfLkSM04IRVX5kCJ9Uq1Xp5CPuF8FPriPcayiMBankPgQs2FzuKtaSS9Fc7d2moTxfSlwj0u0L7UabXU4zCWwmeceN/iiVpMPXW8gJSRiTH0trNkxoYgcorhsGRqdIx2+1WCCQG1y35gKRaXgWsalT9GyCfdfn0WwS/LVQWUMUKxBxzqo4r5A9lz77SdLdWmHUbKDrhJ3B1WWiED/qXxuAbfQsjZei/EEAlpFZkqeM7VzJNm23JrclOA5T494Eznw63IobqAtUPUa3nGnfz2O8Jb/3AoDH3OPzPt9umViYlJtSlxbKzjxCP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V0GwvuS2zdl89iDXmGSGMMvQBksIDNw3T5eANlpUB0=;
 b=ZDFzZzejYIREyTAtooGJJKWJHa5tOAE/Ir3urnnMmLJ1ENDZKKiSoTjKwDYv8Yh2R+bOpKQwo0GHUWlp2bVZHtK61UQwI2OdTThPLyekoky6aiNjy6dZZ9o9AiJNiP0r/tppL8csowEdY+ebSyqSE3/dz4263YGTCUZLVlNbAQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8797.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:36:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:36:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:36:41 +0100
Message-Id: <DHHXH4LMU5QT.18SOC1FSR41JL@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Aaron Tomlin" <atomlin@atomlin.com>,
 <linux-modules@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260331205849.498295-1-ojeda@kernel.org>
 <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
 <CANiq72=wsdJf1_qwAADhmKA2i7y9U+3WOm+9utE2rv52_eqnpQ@mail.gmail.com>
 <DHHANEJI7LQ0.3PGBQH34QK0DJ@garyguo.net>
 <CANiq72=8d03wo3_28Q91DpHs=LF8D5N3pmuZtAsr8gLuco5hKQ@mail.gmail.com>
In-Reply-To: <CANiq72=8d03wo3_28Q91DpHs=LF8D5N3pmuZtAsr8gLuco5hKQ@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0431.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::35) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 701daa85-4fe1-431f-ca0e-08de90047934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	55MgyCsUtR9uM7LdoP/etNBAAi239uS7PqHN8a2EuL0sueB9zQovNuIGAW2nNKfkiMaW0eExqdngzfhctFR68bDGl4yqSr3pUrNLGreZiwfU5rvzEEbjESiodOYMUfI6SQMmTm1LVzA3cxF3HFE2jSlPRfM3B1kaHHJPQ4ZiUv7ZgJ/Cg5V1X6qHUmh/MqLPmu2UALC+jYkCt0WjWhKMV76TlGf/GkyXNeAK04c1jOaE0EcO6KMFtU7g+Rbk7MsEC58080MyYTl6R5kaCVbiRbkOlE6+4hkKz0Nz9HjazYy9aap2QmEYvAh187Jdx4XM8+uXk+XL6QdJJ9Y6ifn5XS0dfEqmggzx7fnmMgImlqgH/EMP2W40xZB6lr923SBCwRWELye/8yZT0xILGaL/Khv7E42UJ4CF4smOd7Os/X+rEk++uTck6mnv/wVFQhQMpCyfknPD67ndUgDSqNe1FEZUfFZZwnIM5wINXSz53HH78n+rGqAJYwrySPibk0bkZvKdvpjBKAsS3DnHw0gxIjqtAfkf4qna3+1GEUEb4V37uEo603n3gS8d/YVEquYZmrJPegi8M3ce5gMR+SiSelXMv0EC7VOEsOa0Vv9H6PByOG52EaOIM4xTxHmL+ODKy3VF2vzs/teI23hSZpFV/e1Xi/vDYnO/pDCWAXO9YQEslzKSwEbTCsin5QeuEXRBPKkv12VK9k8N6JYrZUeUXNEXCaZTVwTSIWNg9NK65Lk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzFDdjhld09nMFE2N3FIdmpjTVlqdDFXdk5iU2xWenFPVlQ0bnMvcUFvTitR?=
 =?utf-8?B?aHk3eksyTkptc1J6ZmpZcVhpUGVURzF3bVJsTWlpbVp6M3ZaZ09mQmRxRTcw?=
 =?utf-8?B?cTZ4YTNHOFR0cHdkemNFYVk0NVdXckJQSzIvTmZTSWZkTlQzVDJoYktEOFZF?=
 =?utf-8?B?UmRZVG9uaGxrNlB6TXhHMmcvWEU3RldDZ0R2MDIyTmlDWGx0eEszTWpyVXRP?=
 =?utf-8?B?U0toNDEwc3lUVjJIYlJ1eWVidjRVYnhKOHdBQ2NnWWpjR1pPWGVMQmxsMFhU?=
 =?utf-8?B?LzNHOHpNTnpvOUp3NmRXeHlkN0JDSmdCRXErcGpKcDdkU1Q3dUR4U0ZFaXYy?=
 =?utf-8?B?Q2VKTWxIU1UwUHd4Ymp3OFJ4MUtNSXY4U3JQaDVnOURSVVJQR25JZXUxcExX?=
 =?utf-8?B?SEIvVjUyY1hZczAwYzJmODFLVE9pTnBqby83NHkzS3E2cFRuVDhzWVJPQkxo?=
 =?utf-8?B?UFFRMWE5WmxyWGlBdHYvRENoL3NKWVdLQUFhTDg4bWk0Um0vbVljc0tXT3dv?=
 =?utf-8?B?VzVpWmxuQXdsVkxVd2pqZ240SHhubVNPdmxxd2VqUlVlVEx4bnBpa0M3T0RG?=
 =?utf-8?B?aGdobnFKeDhtZnFXT0U3dHhBaXA2UEt4NGJlNTZmdTJ1RStIRmthUnF5VUNh?=
 =?utf-8?B?WThQZmJENHdDVS9ieEd3T095S2NudzIyTnlkdytYeUtQcUZmK1NVREZyNmlZ?=
 =?utf-8?B?T21JZkdqMnBLU2h2SU5KTUV4bHRlWTFQdyswdU1ieGtoS3ZjMVUyeW5iR1E4?=
 =?utf-8?B?M00vTmJuTldkWkY0RlNpQmprNEg3ZTNNYnVvN09hYTlLcTBtRkUrRkZDc0kz?=
 =?utf-8?B?S3RnSUFtb1ZPN0FwdWdoVlRqa1ZjVVlveUJTVmFqSFBZQjJUQWw5R0xZK2pS?=
 =?utf-8?B?ZkxpQzV0aSt2VW12VWNYdXBob3h1TmN6UTJjQ1VLbmoxS3V3bmF2RzZ2Yk5G?=
 =?utf-8?B?UnFERS9LVUcwSGlkRk5rUHpYd1EySFh3TEJ1MDNlQ3hKLyt3QlhmYUI0eXY3?=
 =?utf-8?B?N0FHVHVTa3BFZXVZMDdTRzBta2R4MEFIcis0TW9KR0lrYXE2K0RnRU1lYkt3?=
 =?utf-8?B?YmtMV05jSmpGR0JUbkZTd2pBODB3RFdkTlByMC9mT2R6TjNNQzk3RkFLTVQ3?=
 =?utf-8?B?WEdDYXpwNE0yUGZYWUNLendZbXpTbmZCL0NxL3c0YXJYS1ZFSldZL211ajM3?=
 =?utf-8?B?VWFRaEdGdFdvKzVFTzVkWVBCK3h1UkFBWTJBUStObWJwMWRBL1IveHlra3ox?=
 =?utf-8?B?QWNRV3YzNW82cWFWTUs4WVkzS0FmZWhla1lCN09JN3NQSFByWlVVSDJ4QkE5?=
 =?utf-8?B?NGdQbXdnVVIyNnpRWG1YN1o1eGpiU002WXlHU0podGZOVnBROFlBd015TUkw?=
 =?utf-8?B?WkZ0a2M2ckFIYWU2ZzVoeTF1OE1rSHlWaTRDUW96TVJBbDVrRkpXV3VuajZF?=
 =?utf-8?B?TWp2Qzlmenh5VDUyN254NWc3ZzdLcUtDSy80S2JTcVA1eXdETHB6SVFGa1Qz?=
 =?utf-8?B?bkZZN0RCS3FxMjlzS2Y3WkZPUmNYOXVhLzdEQXZPS296YkFCQm1qaVpxV3hl?=
 =?utf-8?B?SWhFYUZqb3c4OG9iaWNFbUorZFk5R0FSWnNXdlk4U1ZzSmlrL1p0a3RPSHA2?=
 =?utf-8?B?WmRyYXV3N3FPazNXUktBcFoxMnEzbUxNVjdXSzBFYXZhWWE5a0VpdzZHZHpo?=
 =?utf-8?B?eC9GM3gya2hWMmRyenE5RGRzc1k5cDJoZThhcW80WjFMVTVnRjMydC9SSDkw?=
 =?utf-8?B?dmNZR0IreE9CTnBRZVdKNTQ2V1hGSTdCM2hVeVBVM2NPZ3I0UElmY21CK0ZF?=
 =?utf-8?B?ZzNISzRveXh1VkhkSFBVMFlybUlHYXpyQ3VCV002eVJOTDlFTGZYU2xTcHNx?=
 =?utf-8?B?eEM2RENQT09IL29mOUI2Njlqb2dYUlBOb29haVkxWlA3NThMQkRJSldBMHAr?=
 =?utf-8?B?UjVvVXlJd1luS1JVUWtBK2U0WTh0RTlWblE4OWFGcU1uR09vVnJKVWwwN3Nz?=
 =?utf-8?B?aDhHU0VvU0ZTcm44S2xqQmNDM3lQSTNQdmpvbUF6eEpXTHV4WXgyVEdNNTBO?=
 =?utf-8?B?U2xQWlhmUDlQdGVWbXNyYVhvQUJSdk5KSHJpNnBDS0hQeDRYWGR6V21QZTRs?=
 =?utf-8?B?VU9ReXJzN21UazF0blk1UHRCWCtSaFllR2o1Tk9mTnlMeWQzbVpoRFRxZU5W?=
 =?utf-8?B?SmU3Y2hyWGRQNDd4ei9Kb01aK3JKb1NkWEM4YXNwRHZFYlo2Z1FOZ1BaMDdI?=
 =?utf-8?B?Sk92NVRhdEZZMHhmNGo2ckRjelFBUlBrNVRqRjNxcHNDVEhNcUtMNXVidFkv?=
 =?utf-8?B?S3BvZXpNRFRwdFltRmpwZU1mZDJxUnpkSmg5dHRHaWxBTk5sWjJHZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 701daa85-4fe1-431f-ca0e-08de90047934
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:36:42.1709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z94J+C6R2CZ/wMVeYWJl9rr6l43Kk0DtsahILARr6rsL/0H3wC6WzdIFE2r2MvsX0Q/E3JDrBIpTu1iEKt9n2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8797
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12541-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,garyguo.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 41D7237D9B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 31, 2026 at 10:53 PM BST, Miguel Ojeda wrote:
> On Tue, Mar 31, 2026 at 11:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
>>
>> I mean the lint is kinda useful, and I don't want to disable it just bec=
ause
>> it doesn't exist in older versions of rustc.
>
> Yeah, personally I like the inlined way, i.e. I use it myself, so I
> don't mind enabling it everywhere if people is happy that it only
> applies to some cases.
>
> Another consideration is that the issue linked mentions that they
> don't want to mix inline and not (for field access cases), so that
> could be annoying for some, which is why they moved it back.

For mixed cases I suppose it's really up to personal taste. In that case we=
 can
say it does have "false positive" and allow the lint.

Best,
Gary

>
> Either way sounds fine for me.
>
> Anyway, if we enable it, I should apply the other suggestion too, put
> the Cc: stable@ on them, and switch to `-W` here and remove the Cc:
> stable@.
>
> Thanks for taking a look!
>
> Cheers,
> Miguel


