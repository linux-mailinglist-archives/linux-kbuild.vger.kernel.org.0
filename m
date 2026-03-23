Return-Path: <linux-kbuild+bounces-12166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHB9FBhGwWnpRwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12166-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:54:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A992F365A
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F3A73044BA5
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 13:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99273ACF14;
	Mon, 23 Mar 2026 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="APO12Q98"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022126.outbound.protection.outlook.com [52.101.101.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88F3A0B3D;
	Mon, 23 Mar 2026 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273584; cv=fail; b=gDuqpgZK+D7JJ7iITrdTRkHlRxwRwYuy4XqiOAhKyajD6Y+yeYF17i3jIl2luYCesZQ9wnVZqXXIlmyfb90PGGKhEDe70v9gbtfqJtjRojsJQwxDP7yqPicnSVsMRU/lOt5xnxKp+kKZslfyu3iVdPVAAjybWXCdEPxaJz85CgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273584; c=relaxed/simple;
	bh=SD7M4940r6Oci/fw66OG+UtIVaEh2QoqKeor4K9PKmc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=MoMw2snGkO1xN3uDZVYsAxqB2BTA+gwvVeaOordwPN2/PuB4dIskY1yff1v7LOecfNIyigbb1Ogq+SkWoT3gTRkbTC4v+XKWU/A0FAzFGmsKYUcPK+5+dy/pxg69P6HPZoDBUY3Daovbf7abh2HejuZqCkqGz1ea3NxKrQB2YX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=APO12Q98; arc=fail smtp.client-ip=52.101.101.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6BqtY082Bwx2Juogn6QTZEHcuVMwexWZGkNhHuQMVesBzHM/1MOjX1jBOKnJjnpnU2AAlEf9OGIB4Ay1QnUuKcBcqKVzDqF5JNBD60JdEXEQmHjCW5bXvoTDyjxbQg2vexan2PJq8C0BKN7TIwE0lLlFJqtufDlaFStTMTlHp4L4jJh9N9Raf2YWul351Xnr3biJadS6lZ1Dq/340S4Mv4HlvTez6V1Q0NXpUQV/x2lIYYSf0HoA9CGSExH2pAG8v4WCCwFFV9IuLfKYZ20K1shiv3lEgElqpddcUSepqV0jZ06Khfb0+yATsIqFCjQHgKYj+5Mj0t2Qpbn11fx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUa56aA2mNgvORmn7DBwqAQkuIjeCKaLL21N2CAe0fk=;
 b=RVFowQRaUpSWQegLr1ECUxzNqsGWnykAvlkmS8toeN7NqRoKexxQ5v+WUy7SXfgeluOkoZISTlV8UA21b33b4hQlvkBAYfd+Ysz8FdLMpxXequTprovGW4L9ndmwPA5WB5abHx5RMBssvy/vzR8+db6vmlM9o9K1c0K478kdpsq4rWQKrYbjdSs9YizOSpwe0V+unWnMfCLO3wlpFPPhBLUggm6JDkTFd1tEQE9N6Hd3N2j3qjaKs+PYMeuKt48YHjeEdcfX6lHSAX08ogt1H/dYTuNi2+6dbmRzpzV7Fkto7iRBsZRofcM9Drw//KbwAWFpPsOvkmASu9nL5gaa4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUa56aA2mNgvORmn7DBwqAQkuIjeCKaLL21N2CAe0fk=;
 b=APO12Q98CLXyskaOSA7lcVN0bHUu+ErYl3OxU8wtvF4lSIAtT0y6Zhp/AuZnDrS9fSfTRZ5+sBtofVv7J7J6RXs/mj5Ygqyamb65GiTyIokhFbdkFn13b+q8Xl0MjfrYDYC+faiysOZJy6fUt89NFmkxxvZSyoZzVuCM/BRUSCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB9088.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:273::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 13:46:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 13:46:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 13:46:14 +0000
Message-Id: <DHA7HNSWMM5N.KPC9AUN2HDHR@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>, <linux-kbuild@vger.kernel.org>, "Aaron Ballman"
 <aaron@aaronballman.com>, "Bill Wendling" <isanbard@gmail.com>, "Cole
 Nixon" <nixontcole@gmail.com>, "Connor Kuehl" <cipkuehl@gmail.com>,
 "Fangrui Song" <i@maskray.me>, "James Foster" <jafosterja@gmail.com>, "Jeff
 Takahashi" <jeffrey.takahashi@gmail.com>, "Jordan Cantrell"
 <jordan.cantrell@mail.com>, "Matthew Maurer" <mmaurer@google.com>, "Nikk
 Forbus" <nicholas.forbus@gmail.com>, "Qing Zhao" <qing.zhao@oracle.com>,
 "Sami Tolvanen" <samitolvanen@google.com>, "Tim Pugh" <nwtpugh@gmail.com>,
 "Kees Cook" <kees@kernel.org>
Subject: Re: [PATCH v2] rust: allow Clang-native `RANDSTRUCT` configs
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Christian Brauner"
 <christian@brauner.io>, "Carlos Llamas" <cmllamas@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260323130224.165738-1-ojeda@kernel.org>
In-Reply-To: <20260323130224.165738-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: c9049805-f6ab-48a0-ccc4-08de88e28db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	luowEBWEO+ZAcZU7vpDHwVke3gbnq3sJLnQvZq+/O/xHGfXNBlAj+NmZf6ltXsHm31mZ+Hgbw/XnwertGsAL1uRhhC9YglRdd4uDic2NH99FkIPF72xUhNMp9AIq63VDoNJf/6lsUKxmnhWvwRgqNnL7jMgVVmRNGj7513EZjzd2WSQhlT3nf3AOkKmg5vr6xtBHWcPzX+sSLMiRPKHYc+RTU00aExWZ33uDg8eS7hxZqijHr+0Z4wGfpndIxqwNHpWs1d9sdIvmMCmpYWNQ3NLsqdOsBlPg6lFIPQrmh76he7JLaxdnzC2NQSfGSg+NLXKeDNuEi5FgOs251SzdOjKCG0KxtBcqWAYE7Wnsv/QqVOJkvIotbUtWFhYd2/+Mkmj+NBG5omQxNJhAreLQFaz/DXYeucbIAM9HhjpdBnXpbwJv70Jz/pIvcPc80v5iHmYMyTceJaO/3TfwzQqqRcpCSgBfd0mNrL3lCL7ZrqGEqwYRsC7bnkNXhr0Uu2RaCAZXdqCU3TlXqSWj6wsFSn11beR5xp0DHDKEK8yZVJ+y83x7ItlMdwyEupBc8SSEqfdsKwJi/OTPz8Gls992YExOnGlAMia4dpWpQ+8JIYxykR7HT4DXtZ+lFESKxxH27R4OCvNqcpO0t9YuC7cvqQrScaxrXZFHHMf5qobms8ApRc069CKx9XjJwr9uIu34
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnZ4V3ZuY1BNUmlSZ2RnRnEzazl5QVlXN3hFU1R2WithbHlzUk1PQmhhNjBk?=
 =?utf-8?B?Z2x5UzhHMUwvcHFoUXJrOVAzN0NYZk1mRG5kSHVRSW5sOVJBMER3amw3dDRx?=
 =?utf-8?B?Q0NPVmNwYWQ3QnpxQmYwOUFHY0QwdmR0TTN6NzhYL0N2Q3VzNmdQdnZzT1Y4?=
 =?utf-8?B?Qjkyb0xTU1VaUWpFeG5rbUF4SzU0U3FqS0xZSnR2MFB3MzRvVEhZeWtIYXI1?=
 =?utf-8?B?SXZIdlI4N1RkY1AzNnZSV1JLSjVqeitMaFkySE5ZMXI2SFhiMDR0M2J5ak9h?=
 =?utf-8?B?elh3NzF1S281SlkwTkFCQ01WSGFkZzdlZUxaV2w4OG04eXdlRkFWUUhtcXBD?=
 =?utf-8?B?amxUNGZGY3lOMkV0U2kycUlrb1VObHBQbnQvVDNWVm1iU0craEhIeTdYNEpQ?=
 =?utf-8?B?cVh3TWZOYmVyQ2hNN3BONE1KMjVtS2hyQStCQWdXSGJJZVMybnlPRThHcWJN?=
 =?utf-8?B?YlBMNGUvQ1pUeVBWNWNQajdKSURlVVQwUG5KTS92cW5pczc0SGJMcy8yM3N0?=
 =?utf-8?B?U0dWaEpQclh5SHpyb1h2dGJXYWtPNlpPdU5zREY1TVZOTXlqQ2YvVnlVTzBu?=
 =?utf-8?B?cVlRSE1TRE1CSWhjWHQvTDZsNG4wb0lhK293WUdkOTJhcGpMTno1Q2dQQ1dC?=
 =?utf-8?B?ZHlZZ2dFRU9OS0hlS2J1MlBZc0F2MkwrSk5qUmU5ZHcrUVh6R1Fra1BiSDkz?=
 =?utf-8?B?R2ZoWHBsN0d2cC9neWRuOHdldzFGdEEyQUtnTTBNZ1VpdklGeGdraTZKQXJ5?=
 =?utf-8?B?UzAxOWR0eFlqWFNNOWs4Z0NxMzNobXBYeUtIQkZzdkFWZ1htTmk1Tm40ZW5J?=
 =?utf-8?B?cHFoRmxLTjRYVGZpYUV2UStOVFVlOVN5cXNjUzVURkRZY3ZGVmJhZFpGYmov?=
 =?utf-8?B?bXBia1l2Y01IbVBHbHkzTi9pbnBpOXVaT29DMkZ2dFNBWTI0QmZ1SElhdkpt?=
 =?utf-8?B?MXY4VDdDZWd3VG9wcGVTQXFzNmJkbmh2N2xKWDFXK0QzWjJhVUdwQVFEOUdW?=
 =?utf-8?B?Zlo0QmpNbGN6aFcvZmswVHFVby9DMG9VNGRoRkRLVU4xL09yYnJzRUJNOThQ?=
 =?utf-8?B?U0VtY1ZTbFdNRXRHbmprRlNUZm9pRkcxbjZIZjBKbUxqR0Y1eFlUY1Ztdmpn?=
 =?utf-8?B?aHpOSWo1WlJDTUUyeUdxQ3ZMMGFBZXRqZnpxcTZseUlGbjNxMUx1blZRNGxF?=
 =?utf-8?B?ZTNTOXJrT0s4ME5XMEZqVEpDL3FnOVp0YXZyS1N2Sjlsb0pnekg5MWN1UWNz?=
 =?utf-8?B?T0ZucFN4cHBWemZMWDl1M1FGVVorU3Y5WkZSeUFwYjh0aHdWVlp2QjZlSzBl?=
 =?utf-8?B?WW5zdVkvZFZYenpTakNNUUNZblQ1L09SZmNCcnVxVHJySHRoRmZwSjV0akp0?=
 =?utf-8?B?QlpjQ3Q5YnBJbFhvVlVpdnFNTnJZVW1LUE80ajFkMmVPaUQvK0RRSnpwblY2?=
 =?utf-8?B?UERqYnRhNjJMR0pYRlk2SkhEZXNmdkMzOGtBdmxpdk8vcjk4cjVrVHNBNFNG?=
 =?utf-8?B?RWY5WVh1OHFDMTVROHZOZzZZS2dyTWllcjVUVzYrU3hNbFVEYlBSNzR0eEtI?=
 =?utf-8?B?dkVCcHV4aVpmcU1FWGNYMDVzTm9LY2xmTTNhaWtRRVRzRjYxVUx5YjVKRzlL?=
 =?utf-8?B?TEZtdi9nMkpOSHVCOC9uVTVRWEo4QXVCeGhZR1k1YndncExQa0FJd1NsTFgy?=
 =?utf-8?B?dm9SbzkrSVErRTYzK1ZvRnFMenJNdjExb0lQSDR2Q1hCVXdEODd2YVJCb2dJ?=
 =?utf-8?B?WGlYc1RJai9HYVJTaDBoeCtPdGIrNk1sQzFKcWxHaWxibDJOSmkzMUY2Y0Mv?=
 =?utf-8?B?SUt6VWNWLzk0bUtPdzRvcEJOTXNoeTF6OUJSdHdmbnJjZk5VaUFjZDd1eTlT?=
 =?utf-8?B?OU03dEthakZFL1VoMFowQ1BIbnNQTTZ3emxzTXo4UlB1WC8wVUVCcXJMNFEv?=
 =?utf-8?B?L25OWHcrYnpUYVhBZGdFcm5pajFLZkVuTmtRT0FMOW80QVp0bFJ4WEIyeTk5?=
 =?utf-8?B?MlUzemNIVmV4SEd0aWhLUTA4WURVRDg4RFBHNE9FelFrUi90N3JKSmx2L3dI?=
 =?utf-8?B?elJBbTcxRHVtUTZoNWkybm9uYzFlTVJtcmNMcUNKL2Z5WTM2M0VPeGUvSS94?=
 =?utf-8?B?SjhJMnExdUh2RCt6SzU1TFh6QmFIMjV0WEJCdTZ2eDFVOEhIankwS2NwRkd1?=
 =?utf-8?B?N25TZU9tclpqOWRWYWJGS2U1cjVidjc0SHF4SitEaDA1SDRmRGcwS1pTaCtC?=
 =?utf-8?B?RDFKc2FKNDh4M0lUL3NTanM5OFN2MlNTRWhGbzZHdm5objRScHZNbEt4bHdF?=
 =?utf-8?B?WkpuT2NsaHJzUFhjMmFwNGFYMkw4b0kvVjRlaXZRRzl3TmxWbE4wdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c9049805-f6ab-48a0-ccc4-08de88e28db7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:46:15.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2q6m6t73PPYke/B7phbucemcgLGI9PCYSs4nJ92ff43fmfHPSxAak8GTkueO9GHF+9Z+85geR4vP2MardAivng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9088
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12166-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,gmail.com,google.com,lists.linux.dev,aaronballman.com,maskray.me,mail.com,oracle.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74A992F365A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Mar 23, 2026 at 1:02 PM GMT, Miguel Ojeda wrote:
> The kernel supports `RANDSTRUCT_FULL` with Clang 16+, and `bindgen`
> (which uses `libclang` under the hood) inherits the information, so the
> generated bindings look correct.
>
> For instance, running:
>
>     bindgen x.h -- -frandomize-layout-seed=3D100
>
> with:
>
>     struct S1 {
>         int a;
>         int b;
>     };
>
>     struct S2 {
>         int a;
>         int b;
>     } __attribute__((randomize_layout));
>
>     struct S3 {
>         void (*a)(void);
>         void (*b)(void);
>     };
>
>     struct S4 {
>         void (*a)(void);
>         void (*b)(void);
>     } __attribute__((no_randomize_layout));
>
> may swap `S2`'s and `S3`'s members, but not `S1`'s nor `S4`'s:
>
>     pub struct S1 {
>         pub a: ::std::os::raw::c_int,
>         pub b: ::std::os::raw::c_int,
>     }
>
>     pub struct S2 {
>         pub b: ::std::os::raw::c_int,
>         pub a: ::std::os::raw::c_int,
>     }
>
>     pub struct S3 {
>         pub b: ::std::option::Option<unsafe extern "C" fn()>,
>         pub a: ::std::option::Option<unsafe extern "C" fn()>,
>     }
>
>     pub struct S4 {
>         pub a: ::std::option::Option<unsafe extern "C" fn()>,
>         pub b: ::std::option::Option<unsafe extern "C" fn()>,
>     }
>
> Thus allow those configurations by requiring a Clang compiler to use
> `RANDSTRUCT`. In addition, remove the `!GCC_PLUGIN_RANDSTRUCT` check
> since it is not needed.
>
> A simpler alternative would be to remove the `!RANDSTRUCT` check (keeping
> the `!GCC_PLUGIN_RANDSTRUCT` one). However, if in the future GCC starts
> supporting `RANDSTRUCT` natively, it would be likely that it would not
> work unless GCC and Clang agree on the exact semantics of the flag. And,
> as far as I can see, so far the randomization in Clang does not seem to b=
e
> guaranteed to remain stable across versions or platforms, i.e. only for a
> given compiler Clang binary, given it is not documented and that LLVM's
> `HEAD` has the revert in place for the expected field names in the test
> (LLVM commit 8dbc6b560055 ("Revert "[randstruct] Check final randomized
> layout ordering"")) [1][2]. And the GCC plugin definitely does not match,
> e.g. its RNG is different (`std::mt19937` vs Bob Jenkins').
>
> And given it is not supposed to be guaranteed to remain stable across
> versions, it is a good idea to match the Clang and `bindgen`'s
> `libclang` versions -- we already have a warning for that in
> `scripts/rust_is_available.sh`. In the future, it would also be good to
> have a build test to double-check layouts do actually match (but that
> is true regardless of this particular feature).
>
> Finally, make a few required small changes to take into account the
> anonymous struct used in `randomized_struct_fields_*` in `struct
> task_struct`.

Can we avoid cfgs by always wrap things inside anonymous struct?

The comment says "This anon struct can add padding, so only enable it under
randstruct.", I wonder how much bigger the task_struct will be if this beco=
mes
unconditional wrapping.

Best,
Gary

>
> [ Andreas writes:
>
>     Tested with the rust null block driver patch series [1]. I did a
>     few functional verification tests and a set of performance tests.
>
>     For the rnull driver, enabling randstruct with this patch gives no
>     statistically significant change to the average performance of the se=
t
>     of 120 workloads that we publish on [2]. Individual configurations se=
e
>     around 10% change in throughput, both directions.
>
>     Link: https://lore.kernel.org/rust-for-linux/20260216-rnull-v6-19-rc5=
-send-v1-0-de9a7af4b469@kernel.org/ [1]
>     Link: https://rust-for-linux.com/null-block-driver [2]
>
>         - Miguel ]
>
> Cc: Aaron Ballman <aaron@aaronballman.com>
> Cc: Bill Wendling <isanbard@gmail.com>
> Cc: Cole Nixon <nixontcole@gmail.com>
> Cc: Connor Kuehl <cipkuehl@gmail.com>
> Cc: Fangrui Song <i@maskray.me>
> Cc: James Foster <jafosterja@gmail.com>
> Cc: Jeff Takahashi <jeffrey.takahashi@gmail.com>
> Cc: Jordan Cantrell <jordan.cantrell@mail.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Cc: Nikk Forbus <nicholas.forbus@gmail.com>
> Cc: Qing Zhao <qing.zhao@oracle.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Tim Pugh <nwtpugh@gmail.com>
> Link: https://reviews.llvm.org/D121556
> Link: https://github.com/llvm/llvm-project/commit/8dbc6b560055ff5068ff45b=
550482ba62c36b5a5 [1]
> Link: https://reviews.llvm.org/D124199 [2]
> Reviewed-by: Kees Cook <kees@kernel.org>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Link: https://patch.msgid.link/20241119185747.862544-1-ojeda@kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Ok, here is a rebased one in case it helps. Nowadays we have a couple
> more instances in Binder.
>
> I ran all the KUnit tests (nowadays we have way more compared to the
> days of v1) with a bunch of debug options and for a few architectures.
> Also did a run of all released Rust versions with x86_64. It would still
> be nice to get more actual testing like Andreas' did with his driver,
> but we will probably only get that if we actually go ahead...
>
> Kees: do you want to do the other change directly?
>
>  drivers/android/binder/deferred_close.rs | 29 ++++++++++++++++++---
>  init/Kconfig                             |  3 +--
>  rust/kernel/task.rs                      | 33 +++++++++++++++++++++---
>  3 files changed, 57 insertions(+), 8 deletions(-)
>

