Return-Path: <linux-kbuild+bounces-13576-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x3R+CeqAImp8ZAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13576-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 09:55:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BDE6462E6
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 09:55:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=Xink6u7q;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13576-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13576-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7215D3074905
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 07:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C094481242;
	Fri,  5 Jun 2026 07:40:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013054.outbound.protection.outlook.com [40.93.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03AB480DD6;
	Fri,  5 Jun 2026 07:40:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645252; cv=fail; b=sNFZTyfGcVXf8ZH1+v1Qee2eIqHfOsvSSzuPDcJOMzae55miqQRgNgJqPy/PS1CPUOB8eJ3IBPze39io2CmgQbOrjOiTs7cYVTSl84/cIoaj/Xe6/VYcCYRRND/nvhxAC6khsHoRVZ2b9tG+TLZ6lUFGdQ+yDEMVQKoT/Ocj0t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645252; c=relaxed/simple;
	bh=2988ZYANi7lfICHZAhiwIZLi2f5BDTG6zSkmDDRQZ5E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JVEHOz65e08SCG1AvXK+YJVWaBE6gjtdcuDq2aLELwb6B2u6u1vKXYjIXt/VPRHjOw7qJQxxyWJAEslBqGykI2JEEcZAD0stunT4p8Ij1t7MvFh8G0bHNzKVjF1J7Wj2WgkqoCKqPHHyj9ZZ0Z4jJ9RGAc896ER194sxKAR7FbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xink6u7q; arc=fail smtp.client-ip=40.93.201.54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+X+lS1u5SEzYPwUPIVQ1jC4KQbR9gthMMVqaXYtU8dLDbBgXeBx7mOqW3EkQAlxjgodVQNeHVIwfvhF1ulfPpquW5t2DXQGhUyYkMgC6dbqZMn4WVMP5CVpDzSbS1NV/zVMUuvRwEG/GCOBJSvg2u4NwOm9opkbdEAWfq/dkjUBHF0FvxPoQ+2CpD45hKNyCcsPjjc47pjbuDZl8YqxE1f+C50E9Xv/m+I/cBpFaRMw1xFojguk4WhoqO09hS1JRyhwoWm1G4ROUH59o4/Q/HHbdgSdcOEkPGpDrIf/3nOLwNYCu64a5iX3pBV8+kJsxMEHduiXOigPugLXnxI0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwtD6IJVuCyMm8dI58B5B16+sIe96JF1iHm4brJFlRA=;
 b=ENwOEn30kfxOF8xSSy0AcKFYHDhTIogPOQPTEjg5Mt0ns+E97OTj9zHRjx8d0GkwgP0Lm4euL9zobzh2qjf/XyLhKRZNfaZpuMTQ4dPZtN9TAMGcwSzN9pqYoz/LCiCkOoIfNmiLtsH5Pi7hnL1K7J1iCuwYXQUNkkY5CqH6z/0OzXCjx8gaUL1jgtwsAyiHVDDsFmJrqzFD8UEvuRnBE6z5aWGVp+8PCHI2drjlE4nQw3WIMuJynMuibIu0cIgUfwGBQes8bgkYTHsm/yAZT/vR5u6kV2E4OELDKrYWrT1pr+at1bGNFsLgqXS0KAWMDgMl2Plxfp6c8oSTIQdI5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwtD6IJVuCyMm8dI58B5B16+sIe96JF1iHm4brJFlRA=;
 b=Xink6u7q064UAbwLW7eH1ZHhptXntOnv1uuBUzSV562IlKqkRLqhC3m025NsY+TTNg8upcnRgnwR8fexz+U5h97cTPFV8KI72JgLjBABmc8C+s0G99y4PxTcOeO9ME6SmMwxqtqP5J8gUz3Q8A1HfIJFjsueCbu3wT+W/d8VaVT2OCPzyOgjirZYf9jcB5V76d3WlyBKGbM/pRokCA7VeLnFSQPYGl7W0ArZPuSfQsLlR/X6tDskI5jNXnB/5a+CAgEa3vAagJOu1S26X4w4J/bOxn1n14UYeaLt+WxYZ9vNWffjFAXO2PWoEyLjOMmvelU4iIqTuFOZVbSa1cTrvA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 07:40:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 07:40:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:40:39 +0900
Message-Id: <DJ0Y221N4EVO.M0UZDI0FQGGS@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
 <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
 <CANiq72nAOpowra81qOHHCw6EVyWVTymDoL8xPdpjT=xc3eS5bQ@mail.gmail.com>
In-Reply-To: <CANiq72nAOpowra81qOHHCw6EVyWVTymDoL8xPdpjT=xc3eS5bQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d7c131-158a-47ae-0c61-08dec2d5bf34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|22082099003|18002099003|6133799003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	qPIQ39dtZcdnLknGT4tIAo01fmkBOBO//y/u+WHA2NNkX5oUvkP5ekbkQ1yrU5xr2m5QNgyvKEvexLwzTjSGo5hUJoWaGui8y7+VBnO5dTtRTzDZiDLMfLluqTuRaEKVW0ujQ+48mFaaIpkW+jK6WKED8kZCIEOVa0USfzABQOmpENpRDzg0yZSh7zppuK1BSPE1SLjtENoUUOPf02GGvziSDWVqqzvLd4WAXOsoTulRgPi2ngY7eu7MEmjI81X5wVx/BZkZbJsYFqEnSZ+5AdMuLQSApLcnltnymjFHbOojaFWg+4+CdvydjGvMPGJWRRPu+tNfg3nX2JOdjs+D57HTB6o5mJknzy5OQQzuxioqCctciDul7IeftVBZGCiyE4Ha9shJ9bZKiwBWbYXtVS4oSWwLZUUWDW97C6RNs1t0fyp8RSSOB2PB4R+EZNQmbqkdjRvXlIrMsXMsqB/iLTyL4eK9/hqupFY5P6XAiZkSaQnwP8eVnYhRf63cl0upj0g/xfEOmRlrL24EH7HER4CL9ZZxDMbI8Bj4x9hUIBWOeOjXllwrsYpZ4bC3izYrN5FJlL7YIYlLm57B9AMoNuUZF8nQBNLNI8QrIDPLGvONJnmFX/wLu4jQmDVXcoo7QEBMtNfhadqf2HzHPdPxxMpjL1Di6TuvHh4tXUPw9cA2Sq+CdU9tAFLnWSq2E75L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUtCdGJjNjh0K1hhRlNMamM5T2hZQnl5VlhocHZOdngwT3NqVmVCM0tNUHZ5?=
 =?utf-8?B?WGF6TzNPaERmWTFHcjg3YTBrQjlXNldKQ0J4Q3pXeit4TnlsRDF4VWtJd3lM?=
 =?utf-8?B?SS85SzBnQTZpcGRRbUJMcFZWeDJyMzhCR2dtakRNanRuaWZaYmFDZzBkbDRm?=
 =?utf-8?B?QXhGb2JEYmM0ODQzQ2g3b296OTlNa01yQ2g1YzViMVBGK0pvZ0ZOQnFqMHdu?=
 =?utf-8?B?REI0clZ3NGVtbDFRTzZreUpsMml2MFpLUm1TaExZUDd6WVd1TW1hZ3E4N0tF?=
 =?utf-8?B?L3hkNVZENGhpbEF6T3F4NnhkT3o5My9KM2VWeGNrR3BxY1lxazE4NlVmZEZy?=
 =?utf-8?B?MExVY1NwVlZqeFpzMk9XN0crSW92TnJCNDBheW5BTW9Pb2pFbFRWVC9uVTRT?=
 =?utf-8?B?NndFNk5QZ1Vld1hOVjkvK2RkTzArTW1mb1hWeHpaSVhxTVA3UEVVRVBRSzh2?=
 =?utf-8?B?b3JibEcrTHNWK0dZN1NKWmJ0TlN0SStRRUFLZ3lXTWprZlpXaG9yNjF6Tk1G?=
 =?utf-8?B?bUlBUEU1ODBBY29PZGRlUVpUdmNlOCtINTZTaGZ6aStVRXlLMGpoUHdNU2Mx?=
 =?utf-8?B?U0FvMU1MLzh4SGk0SXNhdWFmeXZWZkVZdVgxY0ZkRGZISFhTYndiYnhybTFk?=
 =?utf-8?B?c2ZhejBTNW5HZSttZ05lcjF0eGRLekl5RmxSemhjQUxXWTJQa2NiTFNVNE5o?=
 =?utf-8?B?SmN3bERWWkVuQVNCZTRnVUkzb0I0aDhxOXV0MjhsVDJ6NVZnYmpFakNwcE5r?=
 =?utf-8?B?K21IbTRWTk5ycGgrQTI4UVhUWjBEWFpaV0grTUhQQklScWVKdkVwd2lGQ0Zk?=
 =?utf-8?B?NkZxMjBYMHV4cWg0NWdSeWdPOWtrTUE4UGZWOXhUV3ZVUkpvclBZdG1laHhp?=
 =?utf-8?B?NmZZbGVlclJ1TitDQms0VFR6bmdjNllLL3N1dHRvdlhpQVFuNUlxRjlWKzU3?=
 =?utf-8?B?bWtQWXlqSEdSQUJyYmJUOHEvanQrZ2VvY3RWdmdwSUtZSnM1cWcxa0JjbVM4?=
 =?utf-8?B?bUhuRXZYYmE2bjJkVEJ0WWNvVDAzeWZ5anZleXlPNFNUNGsyT01aSFA3YXpv?=
 =?utf-8?B?eHdJM3VkRC9oVnFOZE9zK3NFSTQ3S20ybjlnMzB6dC9xampndG42aTk3b2F4?=
 =?utf-8?B?WFRiTWgwMXpmZldlWUJtZDhaSHVxQW5WdVhhS012RmtZdFdPMDh4Kytod3Q5?=
 =?utf-8?B?UnVpcHF1T0IzQ2RMczV4MzVhekRDeDkyc3FsYkJmeW5qOGdWVEp2aU5vZFk5?=
 =?utf-8?B?bkpwWDl6cXN0aWFuNEdNcXFLYjd5alZXYktMRlRxWENKeUJ5a1lHSHdOMjRq?=
 =?utf-8?B?Ynh0WTlyQXpZdGIxTjJCSTBXU01BNG4vQ2trdENEUXU4ZHBLOVo1cnd1Uy93?=
 =?utf-8?B?c3BlODZZbmN0RVhSYzNGQVpRZjVlLzNxYTZ6ZGw4VzhvaTgrYnJIWWxQM09o?=
 =?utf-8?B?by8xbmJvY0xCYlpOeHhURzAvaWZpam85MjZiL1VaYXBjQXd3RStXUlhnT3Qx?=
 =?utf-8?B?M3o2bEgzL0JzU2MweTBBMkF6emxmakp4UTg3RStyYWI2SUQvL1JhdFVBRUdn?=
 =?utf-8?B?VUJiZ200elJiSmR1SnJUMzFLREd3ODBha3VOSHk5OVR2OHBnclRJUTJxYU8r?=
 =?utf-8?B?SlBJMDEyTSsyUWVISk91ZUltY2liVzVJbC80dnRCTlFkQmpOVW1ySXBack11?=
 =?utf-8?B?ZXdaQkhIaW5nOHg4UWFxck8zODNqNzRqcmZJWENNTksxQThBU2RoK0E1VE9u?=
 =?utf-8?B?V0FXYXA1Z09WVjV3VUh4Umg5VnB0cDlUL2tkS0xKR2ZnMlN4S1Vlb0RDdktQ?=
 =?utf-8?B?Mlg4RnRZTTJWZDFpVjNVaDJuTUJpdVhVRXNtaU5Qd0p3MHcvY1lpNkxoWVRL?=
 =?utf-8?B?bUk5Q1Nad0Z1VnhtaFMvOGROL29nNTJGQlJKa2U4NmwyaDhmNVArT0greFJJ?=
 =?utf-8?B?QlFpMXhuZHRGVDRXRGhsWmhKV0laSG9ZUXVjNHNPSFJ4N0RuN2pNRkJNT1Ju?=
 =?utf-8?B?SHZJMVJjZUxGSjgzMnVHenZlSGdnRnlyTUR2OWpReHQ2YnRTajdFS01tQzdp?=
 =?utf-8?B?dUJLSWxGdkZiNzJ0NjhqazY0VzYrV0VKQWl6dEh4SXVGaUIyc05BUHJsbE43?=
 =?utf-8?B?cUloZ0hoZmZhZXcvT1J3dkdDMFM2NFY1VTJkQ25LRjZSOHlwUyt1R05KSjEy?=
 =?utf-8?B?TmNENGlKUGVnZ1JTdnlmRVVFeVZSOExDazBzRjVLTyt2WktVK1FFMmgxVlAz?=
 =?utf-8?B?ZFdDWmorTWJKd29IbUlhQlpFaFJaWjFhYU5rMXZzT21KcjdmS2JMcjhXQzZ0?=
 =?utf-8?B?R1RxdmZJdlgzTW9mbm94MnRJbm81dkFiZ3BUMDlJZmpWeTIzUTVwNVhKekFD?=
 =?utf-8?Q?/IQYlwfIPMRp96o5RbVJsgzp0i5KFIlC08J96bUBfBjqh?=
X-MS-Exchange-AntiSpam-MessageData-1: lEcoVxU/qdf1Ug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d7c131-158a-47ae-0c61-08dec2d5bf34
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 07:40:42.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MDy8x2byjjQBZH2zXD7CY2cJYaqRZevLiPDpuGX/JIyUcuJkx+FvrgcoylV/zSkmN4+j8mMtyTTpu0/L9BMsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13576-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:joelagnelf@nvidia.com,m:miguel.ojeda.sandonis@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,Nvidia.com:dkim,vger.kernel.org:from_smtp,nvidia.com:from_mime,nvidia.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18BDE6462E6

On Tue Jun 2, 2026 at 2:00 AM JST, Miguel Ojeda wrote:
> On Mon, Jun 1, 2026 at 3:50=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> By the way, I think a `.gitignore` entry for the generated header is mis=
sing.
>
> A few other notes:
>
>   - The `exports` rule' `awk` filtering is stricter than the one we
> normally use -- it is fine if you don't need `static`s etc., but I
> will likely export `T|R|D|B` when I replace it, not just `T`.

If I include all 4 (I tried to align more with `rust/Makefile`), then I
get the following warnings:

WARNING: modpost: drivers/gpu/nova-core: _RNvNtNtCs6PUMngfe6Jo_9nova_core13=
___module_init13___module_init37___UNIQUE_ID___addressable_init_module: EXP=
ORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: drivers/gpu/nova-core: _RNvNtNtCs6PUMngfe6Jo_9nova_core13=
___module_init13___module_init40___UNIQUE_ID___addressable_cleanup_module: =
EXPORT_SYMBOL used for exit symbol. Remove __exit or EXPORT_SYMBOL.

So I've added an extra filter and it seems to work now.

>   - Similarly, you don't use `EXPORT_SYMBOL_RUST_GPL` and the "dummy
> symbol" is a function instead of the simple `int`. Is there a reason
> for that? i.e. the ones you want to export are functions, but using
> the global one (even defining `EXPORT_SYMBOL_RUST_GPL` the same way)
> would reduce the divergence (so one less thing to think about later
> when I replace it).

No reason in particular. Here as well I have tried to align with
`rust/Makefile`.

>
>   - I noticed touching `nova-core` and then running a build twice will
> only build `nova-drm.ko` the second time -- you may want to use
> `--extern nova_core -L $(objtree)/...` like we do in `rust/Makefile`
> instead of giving an explicit path to `--extern`.

Yes, getting the order right is a bit difficult. Moving everything under
`drivers/gpu/Makefile` solves this, thankfully.

