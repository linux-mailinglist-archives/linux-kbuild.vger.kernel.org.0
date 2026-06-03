Return-Path: <linux-kbuild+bounces-13540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YTjDEEIYIGrfvgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13540-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 14:04:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2106374C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 14:04:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=WPl+e63l;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13540-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13540-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE0F1312B8BE
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 11:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E7C3DB33A;
	Wed,  3 Jun 2026 11:52:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022100.outbound.protection.outlook.com [52.101.96.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5937188B;
	Wed,  3 Jun 2026 11:52:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487571; cv=fail; b=AVSdkjCWq/QlA2BCPTcXz1PK5XPBFNOlxVzq6h97Y91b4M5wDjXYGgmUzd2YnU6YQoG94/xlRztO7uZlQpkVI/kzuaqEjetl+t8KIb9+4HbGyGLCv4UpSvwkyawiBrxRkeAiLAiWX+XS06egwwiFrDfyxKhb5MTSDw4Fl/9+6V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487571; c=relaxed/simple;
	bh=9Zw0Zo9ieCeinr2AsmsztmeX+a0WU+0MRoNk+Uv7WX0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RielikJ18ltmruWysb24RAqQvpb0k9GoMz8xanl/MPKBSQTHs82RXg5WhIojI0GKksymJWx8iQ32aAcRst97DXDp+eYB75fxHVYlcqW6LHmP3om+05OK1/Wt62W9UNSoVer4g4lzI5a4gG0wwjWDpRseQncTrqFeC53VVsvZaF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WPl+e63l; arc=fail smtp.client-ip=52.101.96.100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpZ2KIx1MYvoGqsValvlI4GwlzdPlPmKNY71zFDYLw+jkteNT+8VykQBLD3T3QeH8d3ru89Slm4r8pXmNRYU+VrCUeEVyMobuhw8tMDOO2reTV9M8IUCTEOxt9znB7n093IyYTSMywg/XthAYdcIJ3g0OEmqPN6vcoTsKd5D0pKl5eSBeuvywLXTxuqukdN1wX6dBHuefVW9WXdMW5c7zDBoNk6sDJCesavNG71jDnB68AKxEl35k8/x4uk7CGDFUeF5zjZplcO9OVVad9utyBSV3aHHM9NhlIgRv5nt53WSy6oV8bsk1KF7sL9PZ/S0yx9xHn8VPwb2dT6o6+gRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIa6cRio2Aojtc+ddqqsdZnYF4Nq9trRfWh+c15Jiz8=;
 b=mIdHyMCmPlISt+Tn7LtzviLDKUQKTGijSufZgduPCEID92b4JuLZ6oBP0Nvcxv4VYCz8P/wnAqRrI1De/Rpkah1GwYYmz1b90Tby+csg1gY6kzba2Bp/Ms7ihsHeRJN03XGA96bHFvrtOpjaNgQ2UXp5Fo290k2obJw+FVcsCewAE6c1A1zJlIuc3tEcq26+IKEbwmvLNm/mFwD0J4NHtlXtS8E5id9H4XQwKDwG2+vkj8rsT3eLL6pqnUbnrBsh5Nvd38gRwuYmmJfDyWXCkfZsIA3i6Q1Xbx0ecI13vkk6QY4r/RM7S55bIJ2czBWng92miADrWKwf3mUD5rgHmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIa6cRio2Aojtc+ddqqsdZnYF4Nq9trRfWh+c15Jiz8=;
 b=WPl+e63lYT0ikKwqBbnmJV93mZm3f8kwChi3Ea6wpLEqTJEmS0jaDl2IRvdPtI23pjK0dtOhjAGOl7H+mTurjV4dmAaAqQLA5KXXvg0swAXHTNlVyoDCpnHtIBeHT83uSUOrTIGFRYhWxdMvV46crZb4yCuP+MhZLBkxFqfiH6w=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1893.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:30::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 11:52:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:52:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 12:52:42 +0100
Message-Id: <DIZE5YHLR2WJ.1VOBKWU8Q6AWH@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/5] rust: inline some init methods
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
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
 <20260530-nova-exports-v3-1-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-1-1202aa339ef7@nvidia.com>
X-ClientProxiedBy: LO4P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1893:EE_
X-MS-Office365-Filtering-Correlation-Id: 1839c903-aaa2-4d8b-53cc-08dec1669f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|56012099006|22082099003|18002099003|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	b+qyiO+JjT3OW8/smqaWA62y9ZkVSzV1q41tHfBODpLFEx0jzJ8EQT7dbrIyATAtlJqo/jmlunjYlvUfEjh0ERTCcfrFWlXXrgLUbHAtZO8IHr85BtUKREk2ni9yJKe0Z1qI2Yr//nVDs7rjyXIDOFPEJYykrrP5+y7cglIMu9zEASSzbboiypP7rHv8rdJ0nRpEo0BVYxwWolBr+fS1bExGo0tMgLwUiwtVQRmxQPy8TSqFK6988efUjwliA9A2Ed/icp2rFuFvruX23izaqMF8VA8PxmfFl6M6Vj18G0c++VBMRK8LUsKZrNrfRS6v+XtoQIFDxS3Uf9Qw1bcoPuC9bkTNrN5jDfuiJZF09KWVGSEM1cSa4O/sw0RXfRl43bemMFmrYW45Ge28eDzrm54+NIpIRFMKRDFbnb4mIzOr79nLnbDnkd0ehtFK2/RUEShN8atUI51fcy3nhrczq9ioj18ZHrtHyhSP0h+UHrH10HA4DLNAOj+rgzGOwkHaqUguiEHzEH8+t0q+S+wbaEw3MkyRs13a6p1mHn25kGxTHgNMwRFYbl4NgrfLkMdKPpqQS2JR4CWlW9FtY82Oc05dPZYAzM8NARNivM/sUe9UhAAcL3mc1n+9XBX97fxB6bAmIWM7QfJdmuI/OGNHdhSLDe6PqIXbeBXsgNmPhfy5HKqgEuBxf2FNcjGGW4l825mwA0oqR34bY0o0XqZ+OhQ9lKdAntFsDu4h8lzIdzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(56012099006)(22082099003)(18002099003)(4143699003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REE5K3hpVjdlZ0lvUkdMK3VBWm9zMDFZaFI0ZmdNNGJVVWtuSFVjcEhoUy9C?=
 =?utf-8?B?cXRsS3hEY01Lek5OdnFoTDJCa2dQWm4xU0kxdis0bll5QStORHRuR0VDSmho?=
 =?utf-8?B?QklIYm85N3c0ZXhCTCsvYk9jb3Y0bjR6Wkd4cGZ5bFJLSENXc1BYa3JBZCtC?=
 =?utf-8?B?M1RVbEZPeUU4cEhFNlc1SVh5WG4xQXdnRGM0Wm9KYndlM0RtSHFtM2FQNStk?=
 =?utf-8?B?aS81dVRNVVpuTnhndVhGMWVxbUVPa0docFk2eWJrdWx0VklqSmsrTFkxUVFl?=
 =?utf-8?B?ZGJrRy9PQmZSWXZmYXJFZERtSWw1dGdjZnd2WEJNWE9VZW4yT1ZGaXFWaXA1?=
 =?utf-8?B?Z0VnSUFhbkQxWW1VRTNXWElzaGNNM0F6aENGaHIxSlJJaGFLaUpnRjl1aXNt?=
 =?utf-8?B?SktmNmZPOEd2MGtRQjJwV0U2SGxjUk96cHk3MzZqcHB6RE91bWwyVnRmSkxo?=
 =?utf-8?B?a0hpMVdxbWJpeC9aSXZWYU0vM1V5K2RKRXgrZXFrVFdPUyt2UXRTdlpISWcw?=
 =?utf-8?B?MGxlbW5sWmh6RE9OR0dNbjRNUkRWejNJSzZiZ3E4Uys5L2REOFRCYjUrMU9R?=
 =?utf-8?B?QjdpOHB6Y2dWanpubFpyd1RVLzM5M3pweHptY2NadmQ3endqRmdtV3VQVVha?=
 =?utf-8?B?c1VLYThsdmdlL052ejVwMWhFOG1LcHJSRnRmanJNcEY2Y05DaHV3aEFVanB3?=
 =?utf-8?B?YWJDelZRbEozeTJXYVhSM1Y5aGFrbjN2dXdpVisvS2kwQUJyWFhETUdlaCsr?=
 =?utf-8?B?RG1XdVY0NGsvTDFtbisrazRoQjZJSS91Q2lZNkVYVlA5c0RieXNSWjlUK1RQ?=
 =?utf-8?B?QlBuWHFBN1pTcUtwM2pMRzZVWUJzY3Vyb3NnWktxbXpFd1BmeXYwR3hhRkZQ?=
 =?utf-8?B?dnB4eEYybkoxQlJpQnRidTV1cm41eEhZUDBIb0NyK1BweW83RVpDS1JwS29s?=
 =?utf-8?B?aDdabjdlOFBKV1prRWhSMXNtcERVMy9NZjJtWjhpNjVPR1VDVXB1bnNGa0V5?=
 =?utf-8?B?bytWWDdaOFQ0d2xVQzM0Nnl5S0VQQUs5WDJGSDJvUnpGbTREaE90bFlIbFd4?=
 =?utf-8?B?SFBlcTkvMEh3K1FaVzBucHRPMUhxOElOdFhLNmZDRU5XYXJnMXFHcXJkTHp1?=
 =?utf-8?B?MThsZWRGL0dXUGNkU1N6V2RkQlhxTTZpdTZmTXpNKzRqeW1OU2VmTytLZDFw?=
 =?utf-8?B?dWN3Z0M2TzQvVlhzRGQxTnR4MjYvR1JMRldqM3orZy9FQVlZYmNBRGtxRGNG?=
 =?utf-8?B?TE5aOWp5M0xwNG1zb0JjSGxpWjc2akJ3MkxZV0luRi9oTU1ObEtCbEVVdm50?=
 =?utf-8?B?MmVyR2NGTUlJNC9CenFjR2UwWTE5UlZ6ZUk2Vk1QMC9mRHlBV3E1ZjVML3BG?=
 =?utf-8?B?RFB1Q01Yam5aSGZlckJkQmZES3pRWi9sckI1VThMdnBTbjBrL0Ria1hodzZa?=
 =?utf-8?B?QW9YY242bmJ2Y2RBQzdIc0JmMHRXd0NFOHc1UjAvY0pHdUNWcXhmQWVqd0xZ?=
 =?utf-8?B?S0NFcHQ3eXpGamFwc1ExM0tTVXpCWVRUb1lZaytKTmhJZDJNUjMza1RsTVBo?=
 =?utf-8?B?c2JpQlVUVUM5RWRram56Y3JIcDdRU2xCRUc0N1hRUSswd2YzaGlPTE0xaW41?=
 =?utf-8?B?Z2MzNGhRMG1qS1NhczB4bTJBTDJRcUZPN3V4RUR2eis5QmFNbGJqZXpBZ1Jj?=
 =?utf-8?B?ZlRhSHo3a0RTOHRMajZtdUtVUjBCaTlzeUZyR0tDNS9IZ1drMGcvNG9aNkgx?=
 =?utf-8?B?V0JHa2ZoVjNoemxpb3VJKzIxY0RoeExNcjFGZCtPY2NnUEMyRDJNOTk4K0dv?=
 =?utf-8?B?R2NteWcrbzZvWHZ1a2NOVHhsWjFMaUxCNW5TckZSUlhzWUZIQWd3amJBM2hC?=
 =?utf-8?B?czNMZ2ZtNWpzeURSLzA1ZUpwck83eVpCWU1PN0hzWmRLZ2pNbU9jeEFjYjFi?=
 =?utf-8?B?c01Za0dJY1JSVHo4MlFtSHo5WE0zUTNvZHU5eFVaSUdVT09FaHdNTUpJQkV3?=
 =?utf-8?B?U2FSZGYwVWU3RmdiOCs5UFFZNGgvOHJNYkpRQ2N0bWZDOWI2UndrV013eFJn?=
 =?utf-8?B?L29hRnBMQTZ4SHlubXRybFFKNG5DRmFjdzhEL01hOXk3UVBRM1JuNWlTYmt4?=
 =?utf-8?B?eUNGWFFqT0NZS0ptT05ib3l5enhQS2x4SGZhV3FYeVRlVExXUERSbFA4MURF?=
 =?utf-8?B?SEt6aWJQRk5jcWNxRzdVYllTSmc2eTkwYzc2U2Q0VVoxTXM5RUdqTGJsYklm?=
 =?utf-8?B?RTJIWk5tc3pkRWVLbkFuRHFKUUxNYXYwam1BSFBOd2UrZDJ6TlhyR0dKM0FL?=
 =?utf-8?B?eE1VVHJYcnVsL0VMTytsaE80ci9neTRRVXY4Rzg0UFE3eEVqS242dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1839c903-aaa2-4d8b-53cc-08dec1669f08
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:52:43.2828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJDxJKRVY4HPzIstuaw+9PrAw8VQtaYIHgZbIrw6Weu3llXppQfON5IGL1qTdQGz/o8+bC656svUFxlnU/yNAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1893
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13540-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,garyguo.net:from_mime,garyguo.net:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D2106374C1

On Fri May 29, 2026 at 4:27 PM BST, Alexandre Courbot wrote:
> These methods should be inlined for optimization reasons. Failure to do
> so can also produce symbol names larger than what `modpost` or `objtool`
> can handle.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/alloc/kbox.rs | 2 ++
>  rust/kernel/init.rs       | 1 +
>  rust/kernel/sync/arc.rs   | 2 ++
>  3 files changed, 5 insertions(+)


