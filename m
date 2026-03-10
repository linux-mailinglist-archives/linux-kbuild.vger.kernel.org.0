Return-Path: <linux-kbuild+bounces-11755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JDDGceBr2kqaAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11755-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 03:28:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AFC244379
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 03:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A70300577C
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAF5393DFE;
	Tue, 10 Mar 2026 02:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h+7iMGZq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8750737EFF8;
	Tue, 10 Mar 2026 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773109699; cv=fail; b=bUI5c6gBjaA0JWBusxcTelhLTLRjaoXzyP4Tu93Q/xpQXwvPmstTD5ZoVwwRUNOuzU8Iua4u8jx4EdWS+O7Qsp1ZJ4hTdfhUm8fWdgzMiwZq02gIg96LBoLZ3sPHNfy7hZGQF9FoPm+HrHIYVVEruskAVyTiS9Q6kduzV0KkXhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773109699; c=relaxed/simple;
	bh=YeV1FEgf1ia4yx2N2ULt9zCc+Nkkp4NXW3xkCnHvvwM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NJgvdsLsXBzv79fuGWFpzpmf4wePyo4bvgDwPw3A2SWn37NVgzIZC3qES9f/dMDRpQvN2EuzxWZP+x9MuRY6skXhCqUhWZY0zKp5KsCq036MuSVwYH0z6eVfT7hAbOtfIFsjY/FdHqh89oRDJpU2PPd/PRD5/gN5kKHq0qr9xAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h+7iMGZq; arc=fail smtp.client-ip=52.101.56.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNSnbiqU3ZthjXnUlZmNmWcaNnXYcF4JPdRcRrGsukPRnfxCSg2MiqiMUKSiYCZcnJJ+5f++TwtXTqLSqp9VMqEDCy8gYD8PguL4duMjLwgcsgbKH7JHvCTKly+pojOREj++uK3XLUU4Rlz8HVTyH0IIUqrsyJkcGRqH5pGkWgH/nxYXhQ9ZyNmsyxQAE0GqK6wPVUzI1oHXisVhTP1mE+ZCJ7WZhjT9a9Dy0J3XXTn00J04NYrsoXE4HxrZJehu9Y2RCb4k0uVUnUh3xb2yrBOjC/xDCl2WRQxBPToUBfLIVQ8HhV8WzsPlu48cc8+HidNV8GL77lFnQWFy5mcUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srFa+UmF7wtgdZEGqC1XYq1JQg1OecK7bSoPQrmKwaA=;
 b=RknHeptciuaTfsEGa8ctmTBflXAd/yMj4VeYopOs2Q19X3IGn3jaMdg6qRjKI8EjVf4ZYoagR7OvzzDdkbVSfo+v3jNecQ3fD37GeX6TxGGWiHZXCuyrm7u0P6DC5fPVfMs7uN3E/QyD1STvQLNdihAEUoH9hnsGKbLTgqxoECIORpTysGI92IkbZxE5sLI/ZHklvAhFaRU2AxlHN8W30daBeyhOULfHon9+60zX8jxVRIg/Ii2xIfVPsf9LjNR6SPBIsXFAqa+cxI03WfIOA11j7bCdNwEdfXZ5Rps1G/rIMjjChokvnMTz4xRAVqNUggNIhCEKNQgYS9aMg2CoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srFa+UmF7wtgdZEGqC1XYq1JQg1OecK7bSoPQrmKwaA=;
 b=h+7iMGZqa7fSV6w4TiH4fjMqZcwYmFaXEmzk1rUEO7tFgYxqBn0rZHG0Z5ArU5JTPPoPovhQWI0YcTZRsbbeJxRqNIQDhc+0XVuXA2RU9xem2zt+SGyw3V4deAEAk0ay1b+BPNlGSEkFHm/171oQ/oEeI5Kqg+Cq2eYTUdKMCb8LzEwiWOcFtsZbNfY3en09Z1Fm1KBn5t/7o7JOWMWmHUxFP67MyFNTMIjI04IbXQIfiGGHSaAop1seo3fP/F0tIZLKm202AXd1MorkmuHSpqaK3OWMmpot9wDGVOTFQ7Vir8b6vsAsfOkzO5On97deDml2xbwFooCamYYW1M6stg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 02:28:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 02:28:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:28:10 +0900
Message-Id: <DGYQXEUSVZ0Q.23B895V08LWQ5@nvidia.com>
Cc: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>, <tim.kovalenko@proton.me>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
 <DGYPX7TT8A4E.3KTO5Z5RS17B4@nvidia.com>
 <DGYQ5EYS1LB0.TP93SPR5Q3BX@garyguo.net>
In-Reply-To: <DGYQ5EYS1LB0.TP93SPR5Q3BX@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab29b94-fd54-4cb8-54cf-08de7e4cae3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	iifMcwHZc5s8PWDbISIvJihA7h8/t6K2UkL7X0zEB+c+faZyF3y5deBDMIXpmcGE0SI3hzaaQn0BPKQCTNNuewHmAZk1zHieIxp4itPP5C9pSwPJgKEqR57RUR80z3HS9cgjhAfkJYnUrKcKh3Zy6WAndcPTugcqHLeAW7P8yc2j++VQY2dM5lsJksy2HyqEPbubWH/ecUvJWf50EluFBwldfHpWFfV7+yweDvgeVqFPqC0o36js95UXbEf6SuVL2sLsMyIEo4DnjQjnVp9nO8mVojUHY0VHowQFrWFQ782vk1w+WBj2cIn2oSpoyN84EG27smLPifrov12gwMlBbY/wLwnq7219O8zUlf8xVWxnn76XaOBzBNNkI3WQeEidLOPTpx62S0wUSF9qVGTOR2ICds8P743x1NDYxkny+P9Lhvy3mBaJWxwwHqySOXgcPNKcUBqidlroOc2eaVcKvZLhULVbdSLED735pTJJnJTJKm1V4sMSm1wxSV7wMibG+Tc7QxuoOOdH8NdrLsICR0b6WgtehphF9qjlSp8gPCVI9yjAZY3Nfr3xxCCNDR9BKAeNS5ePrmfVBAvHhGGbfdWcIUhnEwkTHXOakYw0rLppAxwBnydLOY0Ke3Ua7FgXhQrlx9hFychxhp0xD3+hgJq8tU9s1/2E+h0d2lppB9LAzMZXzq9MZXvPioCjzIGdFJtlmlF6TfPV+l7pP+tWLRgFdIxAj+3MuvmdhZZViIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1FtZ2Rtc1RUT1dCWU4wZ0V5c0ZvOUpKVTVhSmlaekhUOEpKTDYzSlI4TEVO?=
 =?utf-8?B?ZEUra1NuZUM2dmpiRjY2cjVFVVJDbVhBUlZIYUZPSlFZTXdCajEyd3RNYnZJ?=
 =?utf-8?B?alN1eWJKQ20rK2Q4SGJWVjZ5MDlyLzFVeENyS0lSTGpPSTQvTnZXVlpsOUxy?=
 =?utf-8?B?bUNHOVRtUVgzSU4wN3R6NU92S0NsdmgrcjFCc1BJakREUysxNGtFZXdIV3ZG?=
 =?utf-8?B?VWd4cjBnSkszaU9oQVJnQ01GMXZvN0d6YkRmbDRuK2Jwak1HWFhDSUFjWDlB?=
 =?utf-8?B?bGlrVTMrcmFLbVJ5WEVRT0srU1lQeSs4ZXFXYVJ6cEJvL3dxaEE3ZHcyNHk1?=
 =?utf-8?B?a045WHR1M2JYVU1PMHVTN1NIOE9YZkU2MjdZNzBJZzl3djNGMjNFYVNDdVAr?=
 =?utf-8?B?WE00cXo0OG12K3poM3R1d1gvR2VpSTV3SDEwUkY4YjRBK1BpZGpOeW5DS1pG?=
 =?utf-8?B?b29uelNjQnNRTVpHYVNBd0Y0d2JYNitHQ2Mzb09hMjNoV1dmdytFWWVSdG56?=
 =?utf-8?B?bkhaSy8vbitmZHA2amNNYjc0WHJtMkRvSGFVWkNjUW82aElERjBDTDFkVkhU?=
 =?utf-8?B?M2dCTHIxMWpIUlRCbDJmdlh5a3krQzVNRU01dTJURzVGS2gvR1NBQlVBekhw?=
 =?utf-8?B?SlhtUnA0cmVIY0gxb3VZS29QUGNqT2lRQSs0YUtsbmlsc1NvSmVwTEFnU0t3?=
 =?utf-8?B?NzNkVVlUQmYwdFVxWHJ2dTNXZG03SERWZmZVYmhFQk40a21ENUYxaXhPbzdv?=
 =?utf-8?B?Z1ZSeHZweGJ5VmFnOEgvTG4vcDBaRlRKbWdCUk0rbUFtYk9XS2VWNGIxLzIy?=
 =?utf-8?B?ZkYwdnpqSmlwalRLb0NSaDdmOUlkdEJIWDJmUlY3WW83VUJGSnNVb3RZdlk2?=
 =?utf-8?B?NEgzaENjb2k0b1pwU255b3VFK0JNY3JLdWJsNmpjOWNyTTdrdFd6ZU9ZRi9x?=
 =?utf-8?B?N1N0N3c3Qjc1ZVNFd1gyam9HWDk2c0RLMEdYdk9FeVRTc24zU3d2QU1SQ1VM?=
 =?utf-8?B?TWNuZHNRVFdHMDM0NnExZnBxMmE2WnNHdUZxWkZpUFJqV24yTlNGaFZHeW43?=
 =?utf-8?B?aFhIY1NnYkgvRnRZNUtGL3lJK2ZEcVJyZ3o5a0MzMkRJK05XaVhnbWxzb3d4?=
 =?utf-8?B?M0xQNHoxRm5xdkkxbHN5NUxGSVlja3RUalhJNkx0TkpUZEtBUnlnNkVES3No?=
 =?utf-8?B?NXE4dXBRT2lQNzNPR0pZcjhnSDRmK3U5RTJjZGJBVi9lWnpyYlpsSW5JYndt?=
 =?utf-8?B?a0RvVUtQTmFYY1RuMHNHNTNRcDFHNzgvSXBlRDNVcnhVdTVKRXRCdjhpdnVi?=
 =?utf-8?B?Y01MaUdsbEJmSC9CM3FKSTBBTkZCREZqdlFJTkZwNW9uQXB5R0FhRDU3WFFJ?=
 =?utf-8?B?MklLK3dOdkpySXEvRUZwU3E5QW4zNTl1Z2tKNmhKcWNxNm4yUE4rd3ltOSt6?=
 =?utf-8?B?QVZFczBxMzFIdUFRSTIyRFAwRkRtOG41a01RSkhZYTFEb0hQcERodUswK0Z6?=
 =?utf-8?B?TlFhamtKb0diQXJGQi9sTHhmODd3SW54OU9LQ09KUFU4ejhaRXBlMGRJeFZC?=
 =?utf-8?B?ZWlMcTQzOXpCOXBMd3hoNlhRVlNIUEplUWZObDhPbHNaYlZKSVhabWZWUGt3?=
 =?utf-8?B?N0t4bU5lajJFOVhGZ1pqV1Q5UHZETmJUYmRCVjhSdFB6SlJIejFacytmRWtH?=
 =?utf-8?B?UWJoVFVYRWhITnF2WHQ2U24vMzdzUXk5Ylg4MWF6MlVwaUc1SkUxeVBxbkF1?=
 =?utf-8?B?WjNMamFmTEIzWVVXOUxUcWhtRUZsQ0FwV09LazZuZXJWeDhQUkloK3p2anZh?=
 =?utf-8?B?aEFxOUszL1E4U2JQZ2k0Q2k2bmJ3ck1EWS9nVDUvckNnektaZnRmNVp2WkNM?=
 =?utf-8?B?NEtzTkVMNHNQK0dTQStsRGc4bG81V1VLd21sNnJSL3FOWmtUWTBNY0VOMjhs?=
 =?utf-8?B?ME9vcXYzcmVKYnRvU2lJazZuSTFJSmE4aXRZdFpPbXZCeTdjRC8rTkpiQWJV?=
 =?utf-8?B?MEFCTHRnRmRiSE1MOEg0bkppbkpEM0lBL3VQOFNoWkFRT3RFd3pJZWRrbGlo?=
 =?utf-8?B?S2wzenM3TnJmc0ZBUnNzQTNYdUhjWnE3emNqN09YY1lONWwrVVcvMEdsMSth?=
 =?utf-8?B?eUpSRTBwaEVYSFpkOW1pTjhJUTViM3N2VzVNQjN6d0xDOXdQU0NTRHBLcFdK?=
 =?utf-8?B?UE1RYndyQXc4RTA1cllORkF1T3ZUaG54MTg1ZlBxMi8xWnE5U01FZ2xjMlly?=
 =?utf-8?B?Vll5c3VoOUc0Zk1XUE4ybnNBQ1U2ays2eG12NkhHNGJoc3VFNmJEeVpITUl5?=
 =?utf-8?B?TTVTK0FaL0E0MHEyRkUxWVhFRmdjbFh1MDhrcE5jTHV6TWtITER2OW9jb0Qv?=
 =?utf-8?Q?uObwjJfIrdpZWb35ciwMVfFw548xjrUOoYE81edJbBE67?=
X-MS-Exchange-AntiSpam-MessageData-1: z7IFjylkeXycTg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab29b94-fd54-4cb8-54cf-08de7e4cae3d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:28:14.1661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHgCP0ndQxT96r5cP5SaNcOWYt+Jmduuez/8QogyttsytcfRQB+pQddVHAkGgeU9cMlTX1loj056I1CwPGrnQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284
X-Rspamd-Queue-Id: C2AFC244379
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,proton.me,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11755-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue Mar 10, 2026 at 10:51 AM JST, Gary Guo wrote:
> On Tue Mar 10, 2026 at 1:40 AM GMT, Alexandre Courbot wrote:
>> On Tue Mar 10, 2026 at 1:34 AM JST, Tim Kovalenko via B4 Relay wrote:
>>> From: Tim Kovalenko <tim.kovalenko@proton.me>
>>>
>>> The `Cmdq::new` function was allocating a `PteArray` struct on the stac=
k
>>> and was causing a stack overflow with 8216 bytes.
>>>
>>> Modify the `PteArray` to calculate and write the Page Table Entries
>>> directly into the coherent DMA buffer one-by-one. This reduces the stac=
k
>>> usage quite a lot.
>>>
>>> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
>>> ---
>>>  drivers/gpu/nova-core/gsp.rs      | 34 +++++++++++++++++++------------=
---
>>>  drivers/gpu/nova-core/gsp/cmdq.rs | 15 ++++++++++++++-
>>>  2 files changed, 33 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.r=
s
>>> index 25cd48514c777cb405a2af0acf57196b2e2e7837..20170e483e04c476efce899=
7b3916b0ad829ed38 100644
>>> --- a/drivers/gpu/nova-core/gsp.rs
>>> +++ b/drivers/gpu/nova-core/gsp.rs
>>> @@ -47,16 +47,11 @@
>>>  unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES=
> {}
>>> =20
>>>  impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
>>> -    /// Creates a new page table array mapping `NUM_PAGES` GSP pages s=
tarting at address `start`.
>>> -    fn new(start: DmaAddress) -> Result<Self> {
>>> -        let mut ptes =3D [0u64; NUM_PAGES];
>>> -        for (i, pte) in ptes.iter_mut().enumerate() {
>>> -            *pte =3D start
>>> -                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
>>> -                .ok_or(EOVERFLOW)?;
>>> -        }
>>> -
>>> -        Ok(Self(ptes))
>>> +    /// Returns the page table entry for `index`, for a mapping starti=
ng at `start` DmaAddress.
>>> +    fn entry(start: DmaAddress, index: usize) -> Result<u64> {
>>> +        start
>>> +            .checked_add(num::usize_as_u64(index) << GSP_PAGE_SHIFT)
>>> +            .ok_or(EOVERFLOW)
>>>      }
>>>  }
>>> =20
>>> @@ -86,16 +81,25 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>>>              NUM_PAGES * GSP_PAGE_SIZE,
>>>              GFP_KERNEL | __GFP_ZERO,
>>>          )?);
>>> -        let ptes =3D PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
>>> +
>>> +        let start_addr =3D obj.0.dma_handle();
>>> =20
>>>          // SAFETY: `obj` has just been created and we are its sole use=
r.
>>> -        unsafe {
>>> -            // Copy the self-mapping PTE at the expected location.
>>> +        let pte_region =3D unsafe {
>>>              obj.0
>>> -                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
>>> -                .copy_from_slice(ptes.as_bytes())
>>> +                .as_slice_mut(size_of::<u64>(), NUM_PAGES * size_of::<=
u64>())?
>>>          };
>>> =20
>>> +        // This is a  one by one GSP Page write to the memory
>>> +        // to avoid stack overflow when allocating the whole array at =
once.
>>> +        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()=
).enumerate() {
>>> +            let pte_value =3D start_addr
>>> +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
>>> +                .ok_or(EOVERFLOW)?;
>>> +
>>> +            chunk.copy_from_slice(&pte_value.to_ne_bytes());
>>> +        }
>>> +
>>>          Ok(obj)
>>>      }
>>>  }
>>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/=
gsp/cmdq.rs
>>> index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee9=
9038ad10a16e1e32d 100644
>>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>>> @@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Res=
ult<Self> {
>>> =20
>>>          let gsp_mem =3D
>>>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_K=
ERNEL | __GFP_ZERO)?;
>>> -        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handl=
e())?);
>>> +
>>> +        const NUM_PTES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
>>> +
>>> +        let start =3D gsp_mem.dma_handle();
>>> +        // One by one GSP Page write to the memory to avoid stack over=
flow when allocating
>>> +        // the whole array at once.
>>> +        for i in 0..NUM_PTES {
>>> +            dma_write!(
>>> +                gsp_mem,
>>> +                [0]?.ptes.0[i],
>>> +                PteArray::<NUM_PTES>::entry(start, i)?
>>
>> Does `::<NUM_PTES>` need to be mentioned here, or is the compiler able
>> to infer it?
>
> The function signature doesn't mention NUM_PTES at all, so no. In fact, p=
erhaps
> the `entry` shouldn't be an associated method at all (even if is, it prob=
ably
> should be of `PteArray::<0>` or something.

I had that thought as well - this calls for a redesign of the `PteArray`
business - but also didn't want to interfere too much as this fix is
very much (and quickly) needed. We will probably re-write this once we
have access to the new I/O code anyway.

