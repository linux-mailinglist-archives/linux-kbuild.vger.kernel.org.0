Return-Path: <linux-kbuild+bounces-10912-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D8naMttYeWlnwgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10912-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 01:31:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6169BAA3
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 01:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9455C30078EF
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 00:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF98F1C7012;
	Wed, 28 Jan 2026 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aq4Y44gV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012005.outbound.protection.outlook.com [40.107.209.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7662E1E505;
	Wed, 28 Jan 2026 00:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560277; cv=fail; b=Kb+SueqBB5YDG2XoMf2HG7LtspKerghp/HW4Bq6lEwAGMDgU7LCyrWuo4FJq/pPPYl/Y5qgWusGAE3tD7Ts0ZaPxZ5oEKpIXIsRv+VtTmO2L4ClpGzX2D3HoyqzmuRxN5IYDsHwgSejjXsC06BbJai8iV75OVU3kkbCzpnhvMuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560277; c=relaxed/simple;
	bh=sKPaj+ym7hfHBOTY46G0K/Gr9ZTm4+xnPGTEr7A4gBI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kCukQ8OUBsirimtEdycJfONSruOvOgE8wHl6sBKOCMDVGoGKMtLIu5c3b1VN4hE7W7h+p2XXGYnx9sp/EQHpYTf6vWMWJN+QpbncQX1G5FVXnxxXgJ7kHTQnlX6eo64Ev9uewsoouDJZYR6KNHzxilSltu+wjI6kcnWwNbzNj2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aq4Y44gV; arc=fail smtp.client-ip=40.107.209.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARWPhq+4laHG+IHd0hOZtOgJKc4eRa4xV6rR4gteAJCehLLViy7bTq2iKScY7WMYAkRUdB7dj6BJWN58hmFjIO2LKBgljkG3MCQ1ZNoyIj2wqHNHHTdWblJ9Pegg/2SdVv/WFjVo2u6OvjHnrIB4qvw2yHB7fOvSwoCvnMy8c2xDTYK0v3x0kQMhDE6QM4RenqSN2wHyPg1bMFhHno2FzVYmIqDxUPxnTA/iDNQfe+s21g8ojEusDrOK4M6/0gm+O5l2ckgPNzCVTz1QcE6vsyX9I097/VWjuqTyNLmctnPtRni7roszVunQus/E+gf6iapA/lngwJZfNMSoUD9OfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXGnumuDdpFodus38JLMafeIiz1CT4NjfVqcGtXGep0=;
 b=nTlGD0ADCRbgu1ZVBnk8fVAhJTnFCetu8vpPHufMdNK8jCXdczpGeMojZdGFYGA5hgB0weCsdN+E13riM69SI8nvK6wrkQ+cdFumtKBImPavHUIOIAr41N3yxyopGa6x6J9+zDKjbNiGt+D7tTCk8CRpsG3IP3bS1+D3TEK07clWV5i0+nIUzbKFYlAlYoDZo6HViV5Khg7awrBlwXApg7zISXWtzR7CK4yGaTlqjkpE7TZIlhMRJ6xWcgoa+21wPK6MNK7MRxbNqmoZgIVd+mMbOCWlbjS1tWgQYo1J+Fv4Y42o42ZWQB3hAk0c2OHpPewhKys2w3XnXHOUtfJx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXGnumuDdpFodus38JLMafeIiz1CT4NjfVqcGtXGep0=;
 b=aq4Y44gVYFoqVcJdGDDjce3zPQ4W0H1ymoAJFoXQ0+rkHPVCZ1t1QSungLCPtGO6kZ+zI7FS77Ugy1vMHhV0spH3AdIomedW70B+95GBi/s+rcMPAKQJMaNxkxlsYxd4tXQtp5VS6oQV46z3Sm+8EX1l6nshqDjnmv7Js8VO1X6t35Iyj1oMNnUIKxaP/Pb9imWQGTRgmA5bL2xfC2iIHoc3WCW0cqyhzioDyvnV7Ohen+xUARurQlHpxID4TRnaEl1sXPUtwFRt67SityJUsSZXUNwaSo1hnGU8iRCf2IxwzY/ZBkhjP53Jpk6ak8UyG3j0R9XMhaN57uFyJ7GEog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7891.namprd12.prod.outlook.com (2603:10b6:510:27a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Wed, 28 Jan
 2026 00:31:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 00:31:06 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 09:31:02 +0900
Message-Id: <DFZSRE43IHOU.2OZNE9IFIO3UB@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Masahiro Yamada"
 <masahiroy@kernel.org>, "Kees Cook" <kees@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide
 CONFIG_FRAME_WARN
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org>
In-Reply-To: <20260127172330.1492107-3-gary@kernel.org>
X-ClientProxiedBy: TY4P301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb0c46a-ef86-45c7-1bae-08de5e04865b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkVIRWhKeWRBUVNWRWV4Zm10Zm9lR3hlTjhoaUN0bThNa1VCREZvMHkzYjR2?=
 =?utf-8?B?YmtsZmdmKzArSnFHMktLNFV3Nmo4VGdwNTZLRkc3bFNOc0NHSW5PZzM2MHY5?=
 =?utf-8?B?a2JHT0ticSttQzF1elZHWi9xeHl3VTlQSVJZWml3d0pUOVVWVDVaUVk1VmJp?=
 =?utf-8?B?cEE3NER2a2hWT0ZBczdvREdpcDYwZWswbTJwd0RpUlRiN2VWanpsOGVCN3Ju?=
 =?utf-8?B?ZDl3K2cxRXVsSmRVaVRBYnZKN3RhZzg2eXhxRW51UCt0cmFtcG1iOXlTM3Qy?=
 =?utf-8?B?OFBjWXZVQ3ZQWndMVjFLamhZcFBkR3o0WjFwczI3YzFRQTcxQzhaa0lTK21L?=
 =?utf-8?B?Rlc1aUxaeFlBTnNPckpHQU1ZKzlZSk11N1lSTlMvVEpLRFRWSGx1aVhMMnpR?=
 =?utf-8?B?ZHl2RXVrclVnK21neVYzZWhBOG1sMmJsb2QxbTVNdmZCdmQ0V1Q3OXNBUXVm?=
 =?utf-8?B?MWhSQ1ArcjIwMmYrbE5Dbm5wTlFFVTNIbkNHenBlc3lZeVBlVjNSb1JaZUhF?=
 =?utf-8?B?NEZLbC8wZW5wTzdIRTBWcHdTTWVkODdnSzQ2TW1OczJONWxqazY1ck5uYnRS?=
 =?utf-8?B?K3puS3FOR0lXTEQvc1FvaWhLUWJ4UllHSGtmTUEvb2M4YmV5cC82dFN3MDQ1?=
 =?utf-8?B?VEpoWHpWZlp3K2RQRE9uZjNSS2s2Y2g2Vm9NcUJlOHNiWHVTYWtiTWFMbTVs?=
 =?utf-8?B?Q0lNVkxka0Uvc0V5UVNHaGlLeDBYR255Kzdtekhna0FBTy85cFNidzk0SzlC?=
 =?utf-8?B?aTVzTUpYcHY2MFRiYlVVWWVvZnAvV0F2My9RYU4yZ3BscmdUcHJyeTMybHdz?=
 =?utf-8?B?RDdja3d4dHdiYURnN3lyT2RPdTBadERkSC8zdWVxd1VGQkdxSDFLaTY4d3FO?=
 =?utf-8?B?RjFSenZyRzd4S0U1S2RKeGNiUkVFb1YzdXRlQzRIQXJpNC8wOGhKazZza1dI?=
 =?utf-8?B?am00azVKdXlvUmQwLzRURngyNjkzdGV5d0FIMmRBbS9yTHV1azhHN29jWDN2?=
 =?utf-8?B?WlBlQ3B1REFRa1hPNi9ZaDdMWStBbWUxL0NkVmtEamVnL01GNFcrUS9mV0Fk?=
 =?utf-8?B?VkVxaDh2SFR5K2NjM0JTSnQvaVBYR2dSSkMzQTQwcEJMN3JEdWVOVXYySzVQ?=
 =?utf-8?B?T2tvMHM0YTlGNktqVGhKalBIRVQ3WTNHTzA3NWVrdVlGRHhFYWIrSW5zSnBT?=
 =?utf-8?B?OEpoakFqZDNtRnFBcUd5YnZyU2U5blRGNTgzV0RSWkhKeGVqUWFDZ09QcXBp?=
 =?utf-8?B?V1d0Ym9jYnRRU2hmOWYrOUpGMEJBVERwZE9BVVRuaEI1UjVoelExVjQxbFlv?=
 =?utf-8?B?OFBIcjVISXdpazhLWWwzbnVSYXFjYWNmUVp4ZmlndEhUNHRFblgvQkVPL3dR?=
 =?utf-8?B?YmIwS1UrZ1FoeUZpbE1lS1F6USsra3ovZTc0cDkveUtuOGRmVmNLRFZSRTZp?=
 =?utf-8?B?M1FYU1hyY3gvUS9YQWdPKytKYWdOQ1hNU0E5VG5pQ1RFZ0dza29rcmhaREVW?=
 =?utf-8?B?TkE3VVp2Y0hUa3RZd2NYanduM3NnQlJHL2RlcFpJL1pLdVcvVzhvc3JQLzV1?=
 =?utf-8?B?eHViSnRQZVNma1Y4VDRoQmNVNXNLWE0weFdqdHJwMlBrVXlnZGVnZnNGNWtl?=
 =?utf-8?B?YnQ1bFpZM2JTWUJwMnpnU2NLQWJaUTZxR251d2FLNVNzWU85bjk3RjQvdGhV?=
 =?utf-8?B?T3plMHRtTUFrbXppaGlLTDEwanAvaThiMUVxRWxhdWZuQ2xvQ2MyMHlHeVJM?=
 =?utf-8?B?NXMyWUNKK3VWblJrNUh6bzRUcU4xSnI0UlI2V0pBYlZsNXM4ZnFoS2JqMlph?=
 =?utf-8?B?WVM3a0d0Qi9JanA1bGFzS0EzWlVKa0lGZzZ6VWo0dWtRZHFJdGlUdmZ2MXVN?=
 =?utf-8?B?Q3lnczZ6cDAveVF2eEZwMUM5dlNidUhHSFJKRlRhZjUxUHhHd2p1cVZWUnJz?=
 =?utf-8?B?SXNKdGwyaUMxK1MvRllISktDNzJXSUhYdVRQZm1aL0VNRXdRSEhTdGNEWGl0?=
 =?utf-8?B?Z3I1TnVUYUpvQkJPUFk2YStqN1czOGtjNjJXSU5hNlBSTmN1UzloUUVjZG04?=
 =?utf-8?B?Zkx1KzBBWlpFSWlsSEY0REZ1Y2kxMCtGVXhPV0RWZGkvSWJOMEVKbCtaNncz?=
 =?utf-8?Q?AHT4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFlrM21kOVI3SzEwOW1OQlg5aEpVM0FOQXg0cXh1Z3JIZWdhRkhyWFRyTHBR?=
 =?utf-8?B?YUNDaGZwRndVNTZkMTdwQWcyb3JuZHh4SzJuYjR4WTJmR2pCVjBJOVhQTUwz?=
 =?utf-8?B?eWlpOFBEeU8rTUtpKzRHK0lJWUZEYVRtVFJUdmgxVHV1VERXU2lCLytTTUdm?=
 =?utf-8?B?NGlQSEtjNDlXUkxrWmpja3h6d3hjRWQ2MzZwbmUxaGJ6bkM1SFJ5ZGV3MElF?=
 =?utf-8?B?WDNqQXJrVTRYVkpFeE9VTHdhdlpRVldDbStnV0ZzeDdrOUZxN0s5cVhTODNl?=
 =?utf-8?B?Ymtsc2R4QUdseHNQQ3pEYSs0T2hmYkppMy9ZVXdiMUZvKy9RMlFscVlsclYr?=
 =?utf-8?B?b0t6OXhsYkI2RWcycklUUUdkTXlINFNLeEw2YVZwVzNuZlVLaTBsSksvQjZk?=
 =?utf-8?B?cUlwYmpwUjhtQmRNVDNUQjVJbktBTGNyNUI0OHZDZWg5NGxvR2tHeVRpdGda?=
 =?utf-8?B?VEx2K25Gdkx2QnYrY1NEMHJENk53K1ZLcGh6QzFJVzEzVlFpdlc1L2pxMzZM?=
 =?utf-8?B?aE5zeDgxR04rYmVzTVV3TExSMFRKYXB0VGp4QUE1Nk5xTlVlVm94QVAzL3BV?=
 =?utf-8?B?QkRzaUF5elhtaFlaOVY4WlMzZHM5dUowOXpsVVg5OVpUMHJTOW1qV3hTS0VP?=
 =?utf-8?B?U0VpZVlTMFIwZjQzaUdWa2lrT2hUL0ZSQ3ZNTVgrY0hIWHVHVHl1Y0NVbXNi?=
 =?utf-8?B?MUlwRGFDSGVYNkc4MVU4MFI1Y0prTTZTUEZrQ0ttalp6MXV5L2x3d1E0cmgw?=
 =?utf-8?B?K3JTM3QzM0kzQWJnb0tERTJ4Ny9qRGNpZDFyaStFSm1QdEFmMWpYNjFha3lT?=
 =?utf-8?B?Lzc5VFFxdWpQc3ZNMjJHdENqVnFJbUpHbUk5azlxMERudE0zQXY0aFdheVJi?=
 =?utf-8?B?QTAwazEwR0hMZ0puYXd6ZEZicEVxZkJ0TU1WcFhGUnFkTzMvRU1uQ2hBb3I5?=
 =?utf-8?B?YTROcnUyUHFiN3d1Y3RnZjFWZjZzVEREL0RwTVMwZ3h0RXJYTEZLdkgrVnNX?=
 =?utf-8?B?aUhKMFhZNW1oMFlabkgwQnBqYkRMTlllWkNwbndBcEg1VEZQRnVxMVcvcFZL?=
 =?utf-8?B?TmZoQ3AzdHI2S29NZlhsaUR2QUlEb244RFQrYlYySm9FRHNLRWRHb1prUjNr?=
 =?utf-8?B?K3k4Q2pmVGwrcW5FK0llWjVQbEEwWEphT2Nwb2xiV2FuYTRpMitpUTBiRU9w?=
 =?utf-8?B?bzl2Qnk2ZVQ2VmxETHpiMm1YcUpYUGw1TmxHSUlNV2lEdHo1TFl4MkdpNWpr?=
 =?utf-8?B?REhlVHBRS2F3c05CZ0JJN1FHMjhlTUNZbUh5ZjRqU2U0aEN0bTRvTCtaU05t?=
 =?utf-8?B?YklaV3JxY29GVW1VYXAwRUNWMEtvaDVIQS9jZkYzV0xEVStKS2FjK2V3S1Mv?=
 =?utf-8?B?SzhoN2VhQnhyRlYyZHdjdFNudVBjdFh1ejArNkJJNS92aHhHSk10Vmc0Wnlt?=
 =?utf-8?B?UTZoMnc2VGswK3hSZmJTVnhXK015amptbnQ4WUlrQ25KMFNZZnllWWUzMERQ?=
 =?utf-8?B?dXZhRUxZbWlYSjRQZ2x1WlQ1c3hFdE10TDZqbE0ydjU4QW5jMFpzdDR5bzZX?=
 =?utf-8?B?YUFuV1NGdkdxS216Qk96bnc4d2lLVWYxaDFlZXUxQzNxdmplYVZPVDFtdGRL?=
 =?utf-8?B?MEtQeWVNaWo2TmpGRy9jRWhjNWxHaUFsK3ltcUExaTV6QnJneWt5a0JhVm5l?=
 =?utf-8?B?cDNHQm0vUHVROTlzdS9xc2hHc3FrZ2hSSi81RzE2Q0ZGVGFUdyt5bWhHMkhq?=
 =?utf-8?B?aUcxbWl0SkZYQmhjYTNxbDdWZ0U4Tkl3bzE2enhCSUZIRkdRZjd1UGpSSXNn?=
 =?utf-8?B?dDM5YnkzRzltRWxiSi9MYjF3YnBraDN3SkVzeW1kQ3d3bzVGSjdVNXEwNTJC?=
 =?utf-8?B?TDVvVUx0WjJyNnhOKzRydFpGcE5Oa0I3cFVVdDVYZHJ0WHVvNjN5NFNnRFhu?=
 =?utf-8?B?SWVaL3BWVU12R2hPU0tDdHpvYjk1ajB6d2U5MEpRbGNTaVIyaXYydHpBa2dY?=
 =?utf-8?B?d0xjSElGci81SUw1amNGbS9hS3FraENBZkFndGVuZm1Uc0dOeCs3MWIyQncy?=
 =?utf-8?B?UEwrVTlCN002ZjJmK0VjaEpwOEU4OTJLcXlIbnZhaC9XK09qeDhjSDFEQnJQ?=
 =?utf-8?B?d2h1QzJkeXBVbkVTcFppQXhoOHdRN1V1Ty9nZExkTXRBN0IwZTlDNFg0VHZk?=
 =?utf-8?B?RktKb2ZmZXNVVHBoQ2laSTVnN2JYaWxveFAxU0xmRmc0b3d6aXJoL3RWTWJO?=
 =?utf-8?B?Ri9wQ0Rpalg2RUF1UnZCSnE0b0tzV2tCdk9seGVXZGVXVHh5YWVDcDA4bmFX?=
 =?utf-8?B?R0VxT0ltNzFxWnlvSHhJQjhVT2NITkJVWTRhaFZiQk5naElhL1l3WjQwd2lY?=
 =?utf-8?Q?OC9xHfdhkd0MPNoux+JlVG84CTzSyj6siD8HJt292wcCi?=
X-MS-Exchange-AntiSpam-MessageData-1: 8Es3ne33PTrQQQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb0c46a-ef86-45c7-1bae-08de5e04865b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 00:31:06.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKsbKioQib9E2KUHYalSKRe+b+EIgsjKsBEqtwar/aDz1XIS3/7fn9cYPkLWAHSs3YcVz1NRN7wFx/CMORc54A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7891
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10912-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,weissschuh.net,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,garyguo.net:email]
X-Rspamd-Queue-Id: 2A6169BAA3
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 2:11 AM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> klint is able to analyze frame size and warn on frames that are too big.
>
> With `register_tool(klint)` support, we can simply instruct rust to turn =
on
> `klint::stack_frame_too_large`. This is a no-op if normal rustc (or Clipp=
y)
> is invoked, but will perform the check if klint is used.
>
> This is an example of a bug caught using this option:
>
> warning: stack size of `gsp::cmdq::Cmdq::new` is 8216 bytes, exceeds the =
2048-byte limit
>    --> drivers/gpu/nova-core/gsp/cmdq.rs:453:5
>     |
> 453 |     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Cmdq> {
>     |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^
>     |
>     =3D note: the stack size is inferred from instruction `sub $0x2018,%r=
sp` at .text+32778

Initially this error puzzled me a bit since the objects directly built
by Cmdq::new are not larger than ~40 bytes, but then I dug into the
constructors it called and found that `PteArray`, a large struct, is
built on the stack! We need to convert it to an `Init` I guess.

Super valuable tool!

