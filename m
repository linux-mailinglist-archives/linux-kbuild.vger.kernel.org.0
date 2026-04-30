Return-Path: <linux-kbuild+bounces-12962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPNpENFw82m42gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12962-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:10:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D2E4A477E
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF520301E6FA
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 15:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738442D949B;
	Thu, 30 Apr 2026 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KZ1OjbPV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9112C21E6;
	Thu, 30 Apr 2026 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561686; cv=fail; b=aKygoxX0fIjt6VCFA2WwGfaTEeugS5HTbiU2UOKrKp1XMSqs+dV3J79+DSy9oGtEqvBfuNA640wNx0NZW0q1NB2NEwMW9ayUPsMtWoP8I7ItSUPyCO0pdMsZF5hCjs8PavOtiOANDqVLB4JMVxUEcjtAVXu7cCICcOajoMPDfZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561686; c=relaxed/simple;
	bh=QAxYKhQ92KmEvh43AwP6xP9Sl5ysgzi0lvZ/49BOgfU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NS6FS1wvRYso1lfTTSI3ZWaW5hYxvSIsZRmefpjWPZwn9H4tQuLVz4QNlopwagVxKaUDCi4hQ8AA1Ec3cUod725ZeqIjcubAZ7rWFoxrRMV7JPaes3Cvw5gAEHHnitga0ywzIOsOqpv5Wc7nan92waFzc+efWFLYCIsfIXNwiEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KZ1OjbPV; arc=fail smtp.client-ip=40.93.194.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjmBnp0oSNwjhUaMDG5HAVgNRDbQEOANikYd7aAWvULs89CnNi50xYOT2st4G923WgqVnQ1jH8UsgKf1Tp+tI6zfqeLV8UUlnXEXKuDjgqlpEcXtAkAzlC0P6l5bSDT42/BKGFIxu7CoSf81lS1Mf5Uatn7HkAT2zlA1mI/tkpS0dxe8jx1CRb0csJXHPT/EAZpASnsnxdazmV98HAHCJnYC7CJZmiMbRMiE/Zdlp2U5x44q7MieeuNU9kLG6dTkQEdFZrA0dEiXgvDyZe8jZwQmWTXFsjAtTekhqZlmC4fzv7xq4k72qW6hSTlt6VrUDhTP4CPQW/QWkNj2pN3Qqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Hg3fOBZVfMrABJZQp2A1gyqbxQsodwl4y+RnQJOvC8=;
 b=ScfyfJlBzgaT4DBD26LgNQ+VwQTGrzJRk5u0AtPyQxPZH7aRzTe6UxwtvRccFcytSnXH8Nh2OG0k217PIe/fQSIOhh1/ZtZ/xsH0/psfmlY5Q39aGB7OMiWWRimV6BOyLJ6zfSRtKzy6DZ/DVpDIUSS+tVYKdhU6wMYMC4CX/0JAEmgVnuQb+TQMNn3XbNNCUnsE3ht53j8om7OnGXnK8emTwbs8CPd9UaITuxKAX2g+DwPJPXJjE2h9yzWYb/AM1JdkNsQ+KwqV5GEZQHMvm0U6dfuUoK33i2B3EsaGD9XQmVtDWEs1dVlq/5Fsp58PHoXg6hJV9zb7tptcDvwlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Hg3fOBZVfMrABJZQp2A1gyqbxQsodwl4y+RnQJOvC8=;
 b=KZ1OjbPV5N/Ib1RTmTAzjy3LURKEeAMaSCqjNVfsTWmZhFHpvr1MeEUoam/D1HJ2UDmFXiHOSICfiBw3adx2Dw/qF4SrCUCXt2fs5O1QWpVjf71MJNmmP8kBS4lIg03HCaU86Dl7r17IQ+VebRDSOoGr42wrt4LZpeeqEiceTu7tRmEoLlNv6ADevELOgsH/oh6UE7OKl4/+G3odc7dF4c1gRPAcURQgKtQguZK+jtXqh7OdWoxdNvEHP1o63ouY0YND3zg60dX+w6arbZ7QqUXgHDurK0Bwhu7GmSYEJl5WU86NI8ZcXCdiJP6dLhXHYx/xCweMnQOsKIgUsfUzaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH2PR12MB9543.namprd12.prod.outlook.com (2603:10b6:610:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 15:07:55 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 15:07:54 +0000
Message-ID: <e0301888-940a-49a4-8a3a-47960162819f@nvidia.com>
Date: Thu, 30 Apr 2026 11:07:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] gpu: nova-core: rename module from nova_core to
 nova-core
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
 <20260430-nova-exports-v1-3-7ca31664e983@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260430-nova-exports-v1-3-7ca31664e983@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CH2PR12MB9543:EE_
X-MS-Office365-Filtering-Correlation-Id: d88b2331-b5db-44d9-e7ac-08dea6ca415a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ch8XNb99ytvJZnYFSSZnZ6Sq/v2eOR1H2p04Gml7FhwkaNDpEVhmZjPBc3FzKJFjG5oF8B1srkGoN5A/bB7Zeyn4x3D2cAYc+CoPNK82XioOzsYFjHpF4lPD2ZMP8wWW0V9t6yUHIF+GSMslTWb5s9Gxmi5uc9ECweH3uE6Fu79BlDAFoWCoiaY5rhPqlVG0/0FE6gDD0l4BNNwJWoNYlt96oAJt3Kw/3v50J+wQ6lzYmp5RV+nfMpxTXiUQg1xdx2EZsMYb/ka7MqUbVB+LjLiquOdAmfz7R9sdEqBK8RUsh4/ZWW0Y0GaR+lwYQ2ZnN1r5vzmHVRfl75XEyh5esEe+Gb2iIWWZb5hlMPZTKU3MXxNJOx/2akHEdEnPJhnuQOHQGEtP7A5a9dt+rJcjAbOEKZSpLNAlP3/NxnAMdo/j8gwxRYlwxN7cqdA96vl2qifqNNQvdVNnoDfF8ZxrXbr+Nlxksxfy7siwdtKoVxw7Ad4UcJdckFmr+CVKk6yYD7drh6bkZ3yNihgwyT2N5MGrJBBk0uKBSS6a/ZoQcg8TB3mii+/0imiA/DVjCfjSrqqSMQbxwrQCH6A7JoA9KTK3h7bY3CeBTWlYfgmPUiUEAxKoi8+R6duSTbhsbwgBEd4QgNcZ3djNpIA1BVZUxUWqzp2XN7NtksjcwPBvvTACtO3CWfXaEl2n+kmM8+lBuREHCR5eyAcyHfKwMwHxLGVgpwDp/st7OeC9JikAT71DECJlDLwwv+oe9De//yi6LqtZdTLXoWWRPOS348EP5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzA4Ny8ySGlDR3VVQkc4SlZsMUhzMFN4NU9yRmkwYVR3dU94Y3dhVnV5RHI1?=
 =?utf-8?B?by9jL2FCWWhEWHpNSHA0THlqaXRjVUhaZVNTRllucDFJNC9EVDB1TnphZUxM?=
 =?utf-8?B?UUEwdEhwVkFKTFdhZHBHZmQrOXNCUWYrTzBvdGI5eGZaeVNFaGR5NkdOMzdq?=
 =?utf-8?B?Q0RPTlhybXhVRmhrelIxZjZQK0FLQ2pJWW55V0gvTWl0bS9VbkJvNVIwcUZ0?=
 =?utf-8?B?M3N5NE8rcjBqMFlmZ3FTZDR5ZC95YS9Xc0l0RTZKbk10OTlSOUtUeGhjbThq?=
 =?utf-8?B?MjZvd3NmSlhJQzRDMy9JdGpwQnVGVmg1cDI1ZjJMTkJHYlZZbC9kWVdSMzF4?=
 =?utf-8?B?TkNYNk81VXRMWERNYmpQWEpqdEwwdjNNdTFLblBQUzBubTBLS285RjNqOWZ3?=
 =?utf-8?B?V2RPSTVWT05Xd3U2TzBHRjN1MEVyQW5NaTRiSzl2SmF0RHhWZkEyaTVvajk2?=
 =?utf-8?B?THB4SzlTV25yN09yMEpTOW1pRGM2UnMvYlRveHBqaTQ3WExLUHYvOHE1YTJW?=
 =?utf-8?B?OWtmcmhUT3J2L3FWSmEzblNUY0xtNElweFVpaHJkYUVJU2FpdGlZTEF3SFUv?=
 =?utf-8?B?U2pvUDh3ZFREMGkxbW5wU2JYcmNyTEo3ekFOWVNDSGNrYWwvem1mM1hTSFBR?=
 =?utf-8?B?NFh5YndtVmVJWWdWYjdtSjlCWVNWQ3NVNTNZbXFqTGYvNXVhZVpBOGxpRGNJ?=
 =?utf-8?B?b3VPcCsyWHl0cWovc3VHUXU1Q3FycnJCdWc0SytZdzF0SDlLV1RGYWV6b2k2?=
 =?utf-8?B?WVk5NmhGbUVEQXVUNDNQS3NiUUlMY01mRW9MWlJVSHUySit6N2NoT2IrQ2ZC?=
 =?utf-8?B?R1A3M3JXK0VpdUdESVFMVDkwNGpOL1RYY1NXYXhiK0hIK1RCa05JeWxPRVpW?=
 =?utf-8?B?Mkx5QnJMYmorQTVoa3ZtTGJzRTFTV1ZwL3IxOVJGMnFIU25maHBNcmFoUGpC?=
 =?utf-8?B?TnZKNENMYytiVDYrVVZGOU1SLytXVmFqYU81RmlZazMvd2tRclY2UndlYlpH?=
 =?utf-8?B?Vm55MUR6UzY2UVRkUk9DMlBaUVkveW5xRW9mQmo0OEVRWmtMbnJFYm1rRWJJ?=
 =?utf-8?B?QWhza0cxMWRkUU1IREJGZmp3L21zclIySXA5cXkzVHJGT1V5SG0wRFI3YnlD?=
 =?utf-8?B?MUpxVWpIQkpJdGt0TmhJU0VxM1l4dW1GQ2RQQW5KTjFFUGZvOWN2dDBoWnR2?=
 =?utf-8?B?cEswYTAveDNYTTQ1VW1YYXFlb0VWeUxRUEpyUERNMGhyYkFxMnZ4UHgwckgz?=
 =?utf-8?B?T0JxTVlhRTFwV2dOclNwUWs4bCtGNldjVVF1UUtzMWxmUncvN3lhWVhUbDhm?=
 =?utf-8?B?UzhaeWM4QmpMU0REVXozQW9RSWwzR3VjWk1FUnZpaVREcVdoZTRmdzcwVTZh?=
 =?utf-8?B?YVRVTmJBcVByVGVOcUNCYm1IN21XWEtIVDE2RWp5TTVhN2k3ODlMUGxlN013?=
 =?utf-8?B?aHV5Nk1ranRzV3kxNDRZNlYrZlc5WE43RUVjY01wVDMzU3VmMXc0aXY5bGRv?=
 =?utf-8?B?dHdhM1VZTS9ZVm5CTlV6Mk5hdFZFTlM4Z25SNHFKMExuc2EvV1l6V0xkQ0Yw?=
 =?utf-8?B?MHRtUTJpMU9NdzlyekkyVkptbnZKcGpoL0k5bzJ4NExMVVRwaXBCd0J4VGhh?=
 =?utf-8?B?THpTZ1BqMkwvaFEwZG1kSVprSzhVYk1Nc0htMlVtT0l4Z3BKQjFxVDhVY0lC?=
 =?utf-8?B?ZUswQXlVamJGaTdMamhxTUE0ck41ZTdScCsydjIvN0FmRzY2RHhqdFFhZTkr?=
 =?utf-8?B?YUNEc2hKeGtQK1MyZFRGZCtXUnBvaHZmcWJ5RHd3c2svRUdDbEpRY3hyc0pk?=
 =?utf-8?B?cXN3dDRFRE0wdm1QYllqNlRzVEdSTTdQTzZWVGszMXZqcENiYU5wTDNxZ3lS?=
 =?utf-8?B?b1ZuckR4dHgxRlVmK0ZDZzFUOVJFM2pNSC9kNWY0WllhbzZxVk9kMnFReVZi?=
 =?utf-8?B?NUJPS1JoaUNqMEdSaEhFOU1saDIrS2VCRVJseHVLa3lCM2tMSEpxaXlLb0hw?=
 =?utf-8?B?NFU3Y3FURmd1NnRpQm9Bb3pid3dyNUxOem9WYzBmclBuMTdRRitPemJITmpx?=
 =?utf-8?B?NWZHZFY3Z2p4NHlUdE5kNHp0NEhndDc0WlJRbmM4dEtGRDNleUtucEQxMmpn?=
 =?utf-8?B?cG5PNlp5QytMemtrdjI2VTZmZWtJWElmYjNraVhZZHBxeHJ2WTdNTk8vUzRM?=
 =?utf-8?B?cUFxa3ZYcGJkYWJPcmxyR24rNXJsUUJTNEd3K2w1bklEZm5lNU1KcUNzSUFy?=
 =?utf-8?B?NExiQ0FOajdEd0FycGxncFpjaG8wZkt0Y043Q3gycU5KNlI0cHl3WUpsWlAr?=
 =?utf-8?B?SVVrT051QjhDL2h6Y2NvUUVEekNIMjFIUnBPOGhFdUlwMzJUV01GZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88b2331-b5db-44d9-e7ac-08dea6ca415a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:07:54.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QpqY6WU755U1H4glcSrAG2rKmtFobdm1qcWdlJak+vgZbCn/oXQacoX7S6comFQ/y9M3iten3CE+k5CruMbNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9543
X-Rspamd-Queue-Id: D6D2E4A477E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-12962-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]

On 4/30/2026 10:55 AM, Alexandre Courbot wrote:
> Rename the kbuild module target from `nova_core.o` to `nova-core.o`.
> This avoids a name collision between the module target and the Rust
> crate object (`nova_core.o` from `nova_core.rs`), allowing the driver to
> be built as a composite module.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/Kconfig  | 2 +-
>  drivers/gpu/nova-core/Makefile | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
> index d8456f8eaa05..f918f69e0599 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -14,4 +14,4 @@ config NOVA_CORE
>  
>  	  This driver is work in progress and may not be functional.
>  
> -	  If M is selected, the module will be called nova_core.
> +	  If M is selected, the module will be called nova-core.
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
> index 2d78c50126e1..1f794baadc86 100644
> --- a/drivers/gpu/nova-core/Makefile
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_NOVA_CORE) += nova_core.o
> +obj-$(CONFIG_NOVA_CORE) += nova-core.o

I think a more descriptive name would be better than relying on dashes versus
versus underscores, that's super confusing, how about:

> +
> +nova-core-y := nova_core.o
> 

Lets make this: `nova-core-y := nova-core-mod.o`?

thanks,

--
Joel fernandes


