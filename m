Return-Path: <linux-kbuild+bounces-12963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKZZNnJ182mt4AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12963-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:29:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A54A4C7E
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5887303CF8B
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 15:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB6F2DF3F2;
	Thu, 30 Apr 2026 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAZhZ/ei"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8BC2D9ECD;
	Thu, 30 Apr 2026 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562549; cv=fail; b=Fprle8lea+ZInJoAvHuaREsAcpvfRJJPaBu6wxxgcInDsKuwAuGwLAJaQ7vyOw9GWUSPItf9YpGdFKSNhSUe8+kOz2s4LYx//z081gphzqrVPWxRv0+jTO10rxDX4RNdd+KtgfBzYsris6+1+Lho5s8JyaYTeElEluP0StUY8Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562549; c=relaxed/simple;
	bh=110Xmdz//1NV278iMAYxQ7QmsA9OP2v/3FPdYg6/B3g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=od43aAyqvyL8c0rq4QLWZq7a2enanB53M398pobfiCwtQlGX0JODzv8w/i9rQrY6sXZBiK7MhguHZ2NgE+74QdbM2Tnh5GmJT8w0I+hc1RlP4gun7yW/HmKaFvqRRRhsDBa1TtUJDSV2IEGQrYsxMYvyDnxSXrsfVxTFE9CwnL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RAZhZ/ei; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLfjyMM3U/H6Rhh+2+8eDB8IMARst95gJqAQIREs1oRFaefnq2qPFosmu2Hd7JOLsVlHjGfcf2vwykzNJPfLfnQ6LnkhWw3h+aoRT5hrlJx7wHz05Ww7te5K1Kjm1rZsR/EdCnVb6hw3iqPxIKUAHCutACaVAqFGoCRogOmhBzEnY0g8t9np+1Nze9LFZqX3Apw3OE70sKFQtpMMWJZ8aY5L9U5EtTTG3ViRn0kUEQYkzm6SmJFT8PTR2x3vfge4t9565yP3RdeEgLmvbBALciClsO74O0UkvMBmc8vDM4jQZwW1O/3ZVF+ent8mxmALZK9Ao4OXJ4MfJW5EGxObtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIiJQue+9KOyVuLfs+OeOEFlEFOZ5i/P55WwHiR9cZk=;
 b=KDpeaxq9coJtWKC6WayXmuEISUr3CbntBvGXNxVsIHNl1riw+XuTVdlBmVNwcqlIVAXHFblHX/evMfpivbtC4p8ZBfBMcz32AxGdXvq671ZJ962dkeFoNeP7FDXe54ASH6Z22kSIJmkm6paa/J2OKeUo2Y7xA0H09izmpnRuWQp2IgIFnX/R9gIKB4KqWA5gzuZNr0ZziMKGzB58O4N4bawmXggLHE4aYgmtWzcTKmEDgQpjcj4LhGH6fcWaURDe6CO6OF9iUPx2j4yYCaWY6CfBWSWLMB5XG08r5ujW1woWjm2U++pMoGsTO/GMyTbZtD2PaMvJrODGAMvKqLiznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIiJQue+9KOyVuLfs+OeOEFlEFOZ5i/P55WwHiR9cZk=;
 b=RAZhZ/eiuxnEX2Ore/hC/VFCrMZnIAi4tFgL9on0OWY4BW63tHr+G1xt6RjfzfdG3uzOwfL31jpIx2owz5EQzI0kMU2GelAlSOiw5W0hBmzPfaIYkQdv8iLDSTI4ik+m2gELfGqTRUIEAuQY/UydC1LijJGxJ9ML6HZVYIzuxExI/lH+VeyIJsUW/+4jEkhQuWpOI5rOPA5kwAhhEvfh9qMOUC1gao/mhfs/hhLCuvtrwzYYCF49O2FQR3IELNwYvwj3SBfRTk+WmkASuwgT+XsV+Lgb2ZfxtMi38LdNbTSAmqMc4XUoqzm2zQkxcpoQ0Wuafgr8EeK5iVYanA70ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:22:23 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 15:22:22 +0000
Message-ID: <7a33e348-4a08-4f80-aa6e-c684b4d7f1c6@nvidia.com>
Date: Thu, 30 Apr 2026 11:22:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] gpu: nova-core: export Rust symbols for dependent
 modules
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-4-7ca31664e983@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260430-nova-exports-v1-4-7ca31664e983@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: e05f4f3d-9d33-44e4-afc2-08dea6cc467c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s9bdy4gp4hmfhTXMA4PF4bS+ozFUO9iOgJ3mJe1LlqFOFFd9yAVb963pCtZR3hpa0v8dK0GIefXASia4H7bS3C9oY14tD+2RexcaZqd222/DteBmDq8jAK5Wl/XutJfCQD6ibVNjP18cpNKoUqbIUv3qTpLADOrX4QEy10SGNQhcUAWkr/V71KPWV7GN6dUpe5WOIeGrKjA2JlEgZVeDqje97O3ey6TFBfuzGxUhR5UXyarvk7bqXg6HdL3gnvlUzXXe/9J0gy8RyicUw+6bWmJkipSorzXN+tc1leQz+5NdxbcxZZNjHTYWnujN8qOowrhP7IYk9bUa4VHVjHVL8caGkS4w839slppXn4UbLtfNWmA5hn5Rmqu/+cOlhyOlSc2Ad76+/S5m7N6sSw0okhfM4tSSsFNQ3qJh4ggVRXIHj6QKRE46S8C2sm3R6bNXmpM93Obve+cbifOg+qiDMRHA0f9rn50mNP1DSSrk5TV0UXJOUR4eeR4azzH8DgBv+uuCC6zvrXEJzPYZplqqDGNFboZ938dY5waZLpayGVuV2Xq6hHE/ecmA1axkFE+M2kDJDjG2yiy2RI8IY2S57BuNPZOmRxiZnMRYe2Tc3X8q8o9a9nwBRJtRstmlo/A5Zbjvn3PW9n3N/tK/3eHma+JhERYtfRjDk6q6QKKdbK11BxdMxrqJV9/tA6EcKe3+YQDBgfxarxo6CHp4xnxf1vAKsGliUqv4YzhaaOmuPHBO1aXMx7TLHJJZ6i+cOVzOFtH/QyEwXbYkq/HvCvgL5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3FscklGZ2tNcUdWdnJoL0orVU51RXlsZ3ZNWUVXWXprVktpanV0OVQ3bXpH?=
 =?utf-8?B?OUgvSk1qSDYxQm0zQjU4MS9YTkRqbk8xdXFBdlN0VkpjbDdDRm9ya2JLZk1P?=
 =?utf-8?B?TnFrUDQvTExUOUQraU5nQmFVQWxtL2VGL3JJdHlBL2R2WHY4MDdaUUNseW9n?=
 =?utf-8?B?L2FraVFjWENwaGJFc214YUZVZlZkNmRneHRRWXhHOC85YmJJOHlKT0oxY21B?=
 =?utf-8?B?MVkydXAzdis3THRBSHRlN1lFOXdiS2FhVmtPSnplaklsU2ZmeW5NVTQ3QlZ3?=
 =?utf-8?B?cVVOU2hwOE8vNld4VUhzN0M1QkN3OThYTHkvcXpXalNTcnZIZ2IzUk9ROFpT?=
 =?utf-8?B?SzhIVEo0cnBmSG0vclBmUkxHZWtwUkVTUzk1VEpjVHhrakc2ZWI3L2d2M04z?=
 =?utf-8?B?UzdtRVUyN3BkeUc2MFV5cHlIa3MwQTBYSm5kRDhiRFoxbDRUMzJ6MTRUSkdE?=
 =?utf-8?B?MWR3MzBSQi9DdFkzc0VUMGVVaklyLzk5UGFISER4QitUaTJPZjlScDBKQ0ls?=
 =?utf-8?B?VWhnU09TSzNzbm1BWnJUZURYSFhsTHlEa2RYNU9RZGMvL2dEZUdUWUkzSTB1?=
 =?utf-8?B?MVRrWEtIUmNxVHp1ZWk5bEo4Yy9kK0FPM1JveTFFcndhMkxqL3orTEpwT2Zs?=
 =?utf-8?B?RXJ1c1FPZXBHdm0zcmtGaUxKbGdlekU1Yms0dTVqVjF5NHN2c3k5Mis1UkFH?=
 =?utf-8?B?a21JSFhhSDZoL3BEYnBOK1ZHYTBlc3UrWUJ0R2NCRnR5cFVVcUxBOS9aUzVp?=
 =?utf-8?B?TTNheU9kN2FWbS9pdFhUakNyK21adUFGUU1NQ3Q0S2d5YUtCMkpiUEN4eFdB?=
 =?utf-8?B?WGRONllRSkV2VkNKbWNmNzFVRXU4MUR5NzJacDRzNnNGT1g2czVOWmRRRzd2?=
 =?utf-8?B?c1B6OWwwUVA4YmxId0NkL01WODRhblFrK3ZDY0dKc3Z5My9qczJXQnpSYkIx?=
 =?utf-8?B?blV4a2xlZk50MGJ6eHB0WUIvVDRnanNOcXVSRmJjZngzcU1PWUY4YkRTRG1D?=
 =?utf-8?B?ZnpkaTU2NXFaaHRIQ1BvcGR0SWVyT0szNGlHKzVSV2twNzhqeWFlNDF5U0I3?=
 =?utf-8?B?QmljMS9CdGI4QjJRM05sOHh6QmU3Zm9tQUdoWW9KaW5EV2p2SUZmT3R6NkJi?=
 =?utf-8?B?MzhKV29PeStFV00wVzAycEZxVlplSjV0WGZ5ZmZ4MS9pckUyZjRkc3l4NFIx?=
 =?utf-8?B?OTdxV3J4OXE3NlJ6RkREUW0wZHhDOUJWd1hDcXE1VmtSZFBzT1lzOHp3eVps?=
 =?utf-8?B?T3g5Wkt3Qll0bHFyczIwOVc3RFVYMjYwVlBTQmVxNnJWRzh2ZkR6UmY3RlRO?=
 =?utf-8?B?TXlDWXNpbGt2L0NKTHk2bHExQUVwYkhyQmdLZ05MRFlQbnV2R08yRnlZT2VR?=
 =?utf-8?B?Wnp1M0NGbXdoM3lOVmpuTmhjS3FHemkzbjlQUVFTd2p6R2JQbWh3WlRSeTJB?=
 =?utf-8?B?ZEczUkRlb0tGSGxBTUhRMklnWlk2cHdsL2N2bnpWSC9mM3JQNkxqbEpVcXNi?=
 =?utf-8?B?N241NHBNQkx0Qk1lQUhDVjRIMTlyMVRxNk43d2xuSUhnTk94RFhVbk5zVUFQ?=
 =?utf-8?B?eFo5azVqZWhTdHYrTzNEZW0xejFRcXJ0RzJHVXZKWTl2OTdJYkJzTDQ4T2lu?=
 =?utf-8?B?aHNJeU45WEE0TDkyMHlPVEpWQlZodG5KUWtKNy9jMEtRdnhoSlN4VnJGZGFq?=
 =?utf-8?B?eENDc2FPOUs0OUVlUW95NjJpNkEzY1hwTjkxVGg5NUFWd0tKQ1pGMk5Kczln?=
 =?utf-8?B?ZzU0YVlBWUI3SmlTVkpEc3FVTHJWQUw4L1hYN0EvZjhiYUNpeVJ4aFMzRlpV?=
 =?utf-8?B?aUs3NW5hblhJRWVxS01UVkRVekVEcXNUZlp5aEkxTHIvQldIRXRlL2l3OVEy?=
 =?utf-8?B?RE54aGJMaFVxenZ3Nk1iRFV0TWN1TEtLYXUvRVNLeTljc2szcHI0dEFMR2p6?=
 =?utf-8?B?Z0o5VkJyaGZORFMrcVdLZC96UXJKVDBLbTZyWGU0dWVSTEluTExhRGtYRWxU?=
 =?utf-8?B?ajlGN2pnc1laMUZpaVNDQ2N0NUFIMlladHdML00vby9Kb3IyaEIxd1hlZWlR?=
 =?utf-8?B?R01EWm5aVVZjV2tydk02amV2Q3dkZTI4MXZVekZwL3JvcW1FSWpKVmNBMEl6?=
 =?utf-8?B?ejRMUTF1d1pXSVh2SHhtQkZCLy9sVWNjYlh5VDN1eUYxdlJhcHRVOVN4Qlls?=
 =?utf-8?B?ZURJc1kyV2dGQUFrcjVWWDRteEEzQ3hZRTBNRG1Mb3pYTytXV0lRV2h3Ymlo?=
 =?utf-8?B?Q0x4NFNWZWI2akkvUWVBb2V1cHlXKzg1QVJsd01wMDFhSStlTEREeHVWTXdU?=
 =?utf-8?B?T2dhRlJ5K2U5K0J5YWNwZlZmVW84WmVFT29PMk1KdG94VU9LYW1lZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05f4f3d-9d33-44e4-afc2-08dea6cc467c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:22:22.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BBxAFiku+IOlrDH/qccj5mqSfGbLu2jBQRfbCmr3QRbTDHEAmbxljBTxEkl4oE1H4GxCBbDU1TJUgKW46Q8Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245
X-Rspamd-Queue-Id: 346A54A4C7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-12963-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim]


Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
One comment below:

On 4/30/2026 10:55 AM, Alexandre Courbot wrote:
> Export `nova-core`'s Rust symbols so that other loadable modules,
> particularly `nova-drm`, can resolve references to `nova-core` at
> runtime.
> 
> This is done by generating declarations and `EXPORT_SYMBOL_GPL()` calls
> for Rust global text symbols using `nm` and compiling them into the
> module as `nova_core_exports.o`.
> 
> This is a workaround until the build system supports Rust cross-crate
> dependencies natively.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/Makefile            | 22 +++++++++++++++++++++-
>  drivers/gpu/nova-core/nova_core_exports.c | 11 +++++++++++
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
> index 1f794baadc86..f9aaf19f2477 100644
> --- a/drivers/gpu/nova-core/Makefile
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -2,4 +2,24 @@
>  
>  obj-$(CONFIG_NOVA_CORE) += nova-core.o
>  
> -nova-core-y := nova_core.o
> +nova-core-y := nova_core.o nova_core_exports.o
> +
> +# Export Rust symbols so dependent modules can use them at runtime.
> +#
> +# This is a workaround until the build system supports Rust cross-module
> +# dependencies natively.
> +# Kbuild uses Rust v0 mangling, whose symbols start with "_R".
> +rust_exports = \
> +	$(NM) -p --defined-only $(1) | \
> +	awk '$$2 == "T" && $$3 ~ /^_R/ { \
> +		printf "extern void %s(void); EXPORT_SYMBOL_GPL(%s);\n", $$3, $$3 \
> +	}'

I am curious (in a fun way) how this (Or Miguel's later approach) will work with
generics. I don't think we have such use cases but suppose a module has a
function foo<T> which is expected to be called externally outside the module.
Suppose the module itself does not call foo internally.

How does the rust compiler know that this function can be called externally if
it resolves to no callers within the translation unit?

Further, as a result, how does the above extern get emitted then if foo never
ended up in the object?

Probably Miguel's future infrastructure will address this? If so, probably the
limitation of the above approach should be called out in the code comments and
commit message.

thanks,

--
Joel Fernandes

> +
> +define filechk_nova_core_exports
> +	$(call rust_exports,$(obj)/nova_core.o)
> +endef
> +
> +$(obj)/exports_nova_core_generated.h: $(obj)/nova_core.o FORCE
> +	$(call filechk,nova_core_exports)
> +
> +$(obj)/nova_core_exports.o: $(obj)/exports_nova_core_generated.h
> diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
> new file mode 100644
> index 000000000000..1d3f1544fe8d
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nova_core_exports.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Exports Rust symbols from the `nova_core` crate for use by dependent modules.
> + *
> + * This is a workaround until the build system supports Rust cross-module
> + * dependencies natively.
> + */
> +
> +#include <linux/export.h>
> +
> +#include "exports_nova_core_generated.h"
> 


I
-- 
Joel Fernandes


