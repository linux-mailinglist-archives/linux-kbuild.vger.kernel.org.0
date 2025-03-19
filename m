Return-Path: <linux-kbuild+bounces-6252-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F51A69AFA
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 22:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 198697B21E8
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 21:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FC8158538;
	Wed, 19 Mar 2025 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="P2hu026i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022117.outbound.protection.outlook.com [52.101.96.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076C20C47C;
	Wed, 19 Mar 2025 21:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742420070; cv=fail; b=SQLVjHAFVoqSI0IKCHbaQbQkap5ytRzKcq9P0qACZXOEmsctArbkmT3u6PWjc9a9w2Kavblf3JhXP+aMkiU4t4O5E28cQNQHAdrjsEU0r5k1uJYZp7bgjPXzV3I3L5XYEKdq8gw5Q3I9tgpWYIaUzTey4r8oyayomXXH1swuzOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742420070; c=relaxed/simple;
	bh=QznfKk7kph6RFO4iMP5Whja53EEoED7G+rq9VX4WDuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pJevpRacBxxoapITeKy7uRepkASrkbN5njrj46dpdQlbdA6HbEZT4uPEuImkq3emPjIEfAajCkKm27zJPH1fS7d5CXUGul0qk0mYjamDgyXHmZxUycGg+U8iL0WbrqUl4XEUoBz1Gy3JBwiCHHw7/8nLaPFeDqlfBsd2zmSUln4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=P2hu026i; arc=fail smtp.client-ip=52.101.96.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofxO39YVtXawB7FQKo17x1xYminYYDeKRPese6qfpLL3NQ56zdCqhiGD1+yOvPJ8MneAt7X1TcEnkSTbwEMGzEpUdn5zPCdTAYfYCf3szHAN+Ioe1JDFsp5oCKpyWXc0YRhSOBx1QdL17ZppdIVd7KMKKtwIgwYx4fpG/6eHqzhSpu6dqxGFU7XpxgPcyNXbXja9YpwUM9iKWyak07H0rtz5Syjdmd+SxVkn+svNnR6uUQ467QXl4mTnHiTFoqVxaAoHCPrYp9pNn8/2G0UnQbsBw1ZpFbjb9feHaEbIC+cUG8n/4uQO5B9W3KEpeXCjhCfJJlc45orlC9y4sjPg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6yRp9ybCbZmFcZkpyqH61iVq9KHqYw0ASIfm3V1Yq4=;
 b=tcy36gWPokLFcYKttdxfbiuY57uqxUC52bzKvPNTxWS7U3gPogA57mFFvFEY1TkKY1bO0JkUMV/srUDDzyOduPGr+OjBv6IfpPRoRp2T+pvaHGnrxKFqWlYXjci31NCGX/F7sl5urRCgQ/sm5ZL+h5OFVWrakCEOWni3430nYX4N+f84yMkzuq5KlgmZlCHWRTX2w6tffWTEdHygZDCFTgoP0GGX/5W7GAIaVkmJ29Kd/Ni3wfrKi8FAVSksrg59qHXC5bXwspt+uvnIMiZpI4d2ysBnRE+6o5AQ60Be6BKOkIsYyHsFg9G0hy6TFRcuroFpuGxQvilh6ydWqtIjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6yRp9ybCbZmFcZkpyqH61iVq9KHqYw0ASIfm3V1Yq4=;
 b=P2hu026iTmrb20I0U1nA3KX5UMQ//QAHjBIrz9OkeCECcUzTsohcbgfFeFn1J4pzWYcPB6IzSV0qH7yxHGL7uFOOo4+6/KSboqE9Fe6PKHqPkkuirCGu6dXcD8TKgLYT+LzFBszvxLZHjl1uR2q9tPSnHORB7ZjDALXfYL3GaLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB3306.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:16e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 21:34:25 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 21:34:25 +0000
Date: Wed, 19 Mar 2025 21:31:29 +0000
From: Gary Guo <gary@garyguo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton
 <akpm@linux-foundation.org>, Dirk Behme <dirk.behme@de.bosch.com>,
 Christian Brauner <brauner@kernel.org>, Martin Rodriguez Reboredo
 <yakoyoku@gmail.com>, Paul Moore <paul@paul-moore.com>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, "Steven Rostedt (Google)"
 <rostedt@goodmis.org>, Matt Gilbride <mattgilbride@google.com>, Danilo
 Krummrich <dakr@kernel.org>, Eder Zulian <ezulian@redhat.com>, Filipe
 Xavier <felipe_life@live.com>, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Kees Cook <kees@kernel.org>, Daniel Xu
 <dxu@dxuuu.xyz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] kbuild: rust: provide an option to inline C
 helpers into Rust
Message-ID: <20250319213129.09e268d7.gary@garyguo.net>
In-Reply-To: <CAJ-ks9m=qYHr7Vm+9o3GBm6V=sZUY5o-aKnx5oDF9kK2F-b55A@mail.gmail.com>
References: <20250105194054.545201-1-gary@garyguo.net>
	<20250105194054.545201-3-gary@garyguo.net>
	<CAJ-ks9m=qYHr7Vm+9o3GBm6V=sZUY5o-aKnx5oDF9kK2F-b55A@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0072.eurprd02.prod.outlook.com
 (2603:10a6:802:14::43) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB3306:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ced1875-71b2-4ad1-9215-08dd672dd22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tgzfNNtGssC7Q2WscB8UVBISkII3gIHFw1cnFNWDugWHWaRA3DGDu4AaMaRD?=
 =?us-ascii?Q?sJb7bHWXTr1UCHpmAFie/tkwafLJg4hyZ9Uq3vFcinIorLm+/QN7N2ODUcrd?=
 =?us-ascii?Q?EUcbX9iKWBivjeUGY2JZWu7pyb1mqxHl6WlYA0mI49H3y19EyMfYX0xcEsXe?=
 =?us-ascii?Q?mq5pDT0dRZKH6C1V6/CTfjDaikHAoYZNuA0j/gczl2o3Z1zjU+OH1Ft4xC2e?=
 =?us-ascii?Q?xC8jrQcC3c3PD/7y1oDLrZ0uj1fcrtC/lpTK5uLTviY+hJtumK4y5/lK9qPm?=
 =?us-ascii?Q?aQ9pjG1e1mHVbuW9JjO5aIdc9EbTm0mKXTDEyoF9wP2H7xV+XEogQEWfv2xv?=
 =?us-ascii?Q?rqS95szewj9Q2AtLjzzew2X1wFCX9QFlzEM36E7SHo1B9+vATq2TqyL964nU?=
 =?us-ascii?Q?z+ptirax50jrgzGXzuIaB84pwHaYnvZVoF6Ox8wGCOdK+zh1kpvxjSE55Aj8?=
 =?us-ascii?Q?MPpwR7NmJYbH//umYlUbA4ZlgpGkWUz9tpkjBRccF0kj45sCXCp83eLqcxab?=
 =?us-ascii?Q?8wyw4gBBymhaMBY5cGWBtQfAeXstB4AIfOhA/6DITRr0y86LPAQOn68hagRS?=
 =?us-ascii?Q?GdqJfFcpmoxpjc59RGxEp9Tw96APDdKHn9gj2ZcpFhRZcmD3mYhS7V5VwOWg?=
 =?us-ascii?Q?yjMSgDZhkPYqN5ygdpsonJKq2laHVJ42W7dwI1NgQqvY9IWcNWNvMUimh8bK?=
 =?us-ascii?Q?b+Hjhk4pUKcH8Wqu/ctwtmmZXC70kaQY+gE293DKRpzF3eIJIIcQ+7cNmskG?=
 =?us-ascii?Q?dOBW3iv06LE6VZHU9rXsG94jkO7kAae+RNeqaPMxtFQYxvMhhFu1/k0bm8E3?=
 =?us-ascii?Q?7ZAh/+h+8Q2/OXZYlUyp1G7X7kVithbgMRSnxleDcROlW04j6HWLUzHz3B9K?=
 =?us-ascii?Q?qqH7PZkj3o8D8Yus6BoOCym9K235LrfBe/CeQ0qc5W3CanMkJHXnbq453Kq0?=
 =?us-ascii?Q?IRB5guYSGdMpdYVgIQ0XmvAdsr86KTatb65zf7zTuXhyZmB6Q87z/ch44P44?=
 =?us-ascii?Q?Vqm3wCUvYCnNucgHeARdK/c6I9li8IAXk0aGbaedUU2/ua9amR/LC0NmCnxD?=
 =?us-ascii?Q?RLsA1TNsokbqKDe90iZb/DWThS/FQlWt5Xo4N+JBgmGch0FaJ/ZJ/V5pHLMK?=
 =?us-ascii?Q?qZv9vJSJQqXJCb7Q5jNR8iLjDgxxgYUZmE4xhpf3cXX0Mt8EomCeeKhBkNIb?=
 =?us-ascii?Q?i+do4gWvA84YsLvbWqCcGL9D0g8NF6KNlKuJ/5WI57lRft09JkLXcjmfg6wt?=
 =?us-ascii?Q?NZqhdA+CNUQnnijWyCpYhACK4993peSbhbsMdbaOyzLFwni5TNf2IIP8TlWq?=
 =?us-ascii?Q?EPUnPFifsPDUoTBII7+dIOnyAVf1FoYWPP0GqIhEefYWhxBnMcwLL6hkzd9z?=
 =?us-ascii?Q?xIRD2rRmOncRxoqB9pkBwrOogVTF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Duv4iIXZ8YcmWNCtnAXgqwt6Qq1ZHglKvEABRuMibmozEyeJJ3j8bT4DFcYW?=
 =?us-ascii?Q?kw1i1codkHZak1qJ4sXtHK32E74ZwLtQXlGDGKs1SdTGO6F4BfdAbVe7gb/E?=
 =?us-ascii?Q?yCFRmwNMhLzoreXbWBAvWAp9KAMSzp2RpbM4PeLR7N4Ago+Yy67FgZne3yS1?=
 =?us-ascii?Q?50H+wfuRGVfUi2EK4uvoZKu/tsyfI7t1lStdwBf/B2VXJp6Zn9TMOdk/60kd?=
 =?us-ascii?Q?vgHbA9+4oJkxK6Oe91SOGzy5zzXVywYbR4aYzdQXN4aDAY2aM69tfIub9CkW?=
 =?us-ascii?Q?KTnwuY0Cp6UtrqQBJi+FVWRtEkG2h9EMfd69SpJkphI/LWMCOxrLs3lqImKp?=
 =?us-ascii?Q?tC7bVi5+a3TdKSvE3qBjqrVS//+CLsMjZDwFtAAdctlto9w1wE8X9pRkalfg?=
 =?us-ascii?Q?O7Dul/L5gi6lI79uOSWN7F6Mfzkv8zfRaif46vXM5Q9bADwvOHl70ArDV4P5?=
 =?us-ascii?Q?MyUy8YqTGlYrBEr9F0u7KxkYNERrcOzJs8taXYbFLdmlNt3Fyl1dxY5ukP1+?=
 =?us-ascii?Q?LyZPh/r9w9yE8m5mPKK0vS7CPkKSEzTvwyG9LKUgtzLbBs8Lpn/c6cp4bF7c?=
 =?us-ascii?Q?2zJ5GQDogv+C9CYwEtWGcNLwMkD0xAinGiYDvQvNKgOke16LFREEjnthUS3/?=
 =?us-ascii?Q?OAe028PATxVWsBPY+9yEfgeBugBuUbZXAcSKOk10qwUh+63VxVR7y/PG6iEV?=
 =?us-ascii?Q?e9ONcHCIqo8wIrZdXh2fdoVh5VYojygqbU1q6ralGKJHVl2hXY4VPse/oFFn?=
 =?us-ascii?Q?Vx1CjEXxCUFJpJ3mchS2kjK1vjCjfupMHUz1TRdpVztDTPpwJlGLURVQGrcF?=
 =?us-ascii?Q?3vR/QGPb8jspAV/Vty4JJ1Xl8NuaAQm6ibZgWTi9/C3Q/qG24SxBwg+JTdj6?=
 =?us-ascii?Q?141SWcF12jfq+GxyH8/SjU/MYGLv/v5dnsSzpX2DJlzUHKtjec7PAFTBxUJC?=
 =?us-ascii?Q?D+aNSrbru8bvsY2lmxLxRYxxB1ODSyWzJe9r0LC7daPYzoZw4t/hVmSm4IWj?=
 =?us-ascii?Q?RaTu87aGMirScZYZ7wg6CLXbKDvPbF8k5XhWCIT0F67qYQbw/0vnr3f0HNAy?=
 =?us-ascii?Q?NSE3sG1IdX+Fu2nyGb+VwTz/Gvk+StFzCrL7dtxSvNVw6CdP5aToCzRNb7NX?=
 =?us-ascii?Q?kgWDMuTf/IxnHD3PADCCb3Yd08tFfoxRNGt1co1yMUt7mkusF2nQkAKgaSCB?=
 =?us-ascii?Q?2DsQEFNF7Ru3Z9rVq6FaRcfh/DZB5PRlRFuiCi1aiAbynrEvqG9zT+KSJtmj?=
 =?us-ascii?Q?j0vuVT2YS3nekHmyTwliygBNwVUU+bNGVLY9B9E8JgES4siBKx9dJY9H2wYD?=
 =?us-ascii?Q?/YfeZamjWgEVYqDOprZVMO3ZmoRxvhZB8NE1cMIH1IbLDNip9KYDciLUaKpP?=
 =?us-ascii?Q?2kYvrIKQfzokXmtwaCJfhFNq992T8vlf6iL4BIvdRWqwMYNKNVLfiDT1+iYH?=
 =?us-ascii?Q?AM41BEzOUqE+jxxQSmS7kgA54+ec1DqeNCmOMOtQZkFTVnDPP5w5GcM77O5K?=
 =?us-ascii?Q?iQrujdykqA3dLmhDmwoaL+KtSLIepuSbhZZEPfLli3gwwEnB87aWJFDVdpQy?=
 =?us-ascii?Q?YsUvMki+4dr+Bv97bAxfMNaMfK0xIkEYrHTDoVLosm4xeLDsuyBBT9hzhHY7?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ced1875-71b2-4ad1-9215-08dd672dd22b
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 21:34:25.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A89cN59X5WaItKH36raYB2fUY/6D8qDgvEJt3Gf9yMmTXRaoSKxkDDsjsiCAwnYKv7qqHoh2d8xQhReVwzj4/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3306

On Thu, 6 Mar 2025 18:00:10 -0500
Tamir Duberstein <tamird@gmail.com> wrote:

> > Some caveats with the option:
> > * clang and Rust doesn't have the exact target string. Manual inspection
> >   shows that they should be compatible, but since they are not exactly
> >   the same LLVM seems to prefer not inlining them. This is bypassed with
> >   `--ignore-tti-inline-compatible`.  
> 
> Do we know why the target strings aren't the same? Are there citations
> that could be included here?

I've added an explaination in new patch series.

> 
> >   okay since this is one of the hardening features and we shouldn't have
> >   null pointer dereferences in these helpers.  
> 
> Is the implication that kernel C is compiled with this flag, but Rust
> code isn't? Do we know why?

ABI is compatible with and without this. I've added a short
explaination in the new version.

> > The checks can also be bypassed with force inlining (`__always_inline`)
> > but the behaviour is the same with extra options.  
> 
> If the behavior is the same, wouldn't it be better to use
> `__always_inline`? Otherwise LLVM's behavior might change such that
> inlining is lost and we won't notice.

If everything works as expected, then the behaviour is the same, but
not focing inline can be used to detect mistakes, e.g. when an inline
function gets too large.

Most C side don't use `__always_inline` but rather just `inline` so I
want to keep helpers the same.

> >
> > +config RUST_INLINE_HELPERS
> > +    bool "Inline C helpers into Rust crates"
> > +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> > +    help
> > +        Links C helpers into with Rust crates through LLVM IR.
> > +
> > +        If this option is enabled, instead of generating object files directly,
> > +        rustc is asked to produce LLVM IR, which is then linked together with
> > +        the LLVM IR of C helpers, before object file is generated.  
> 
> s/IR/bitcode/g
> 
> Right?

I'd rather keep "IR" here as it's a more general concept.

Bitcode generation is an implementation detail really and user
shouldn't care. If we remove bitcode steps then the whole idea still
works as expected.

> >  # Missing prototypes are expected in the helpers since these are exported
> >  # for Rust only, thus there is no header nor prototypes.
> > -obj-$(CONFIG_RUST) += helpers/helpers.o
> >  CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations  
> 
> Should this also move up into the else branch above?
> 
> > +       $(LLVM_AS) $(patsubst %.bc,%.ll,$@) -o $@
> > +
> > +$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
> > +       +$(call if_changed_dep,rust_helper)  
> 
> Should all these rules be defined iff CONFIG_RUST_INLINE_HELPERS?
> Always defining them seems like it could lead to subtle bugs, but
> perhaps there's Makefile precedent I'm not aware of.

I don't think that's needed the way Kbuild works. For all C source
files, we have targets for all .o files regardless if a config is
enabled (enabling a config merely adds the corresponding .o to obj-y).
So I don't think this is needed for helpers either.

> > +ifdef CONFIG_RUST_INLINE_HELPERS
> > +$(obj)/kernel.o: private link_helper = 1
> > +$(obj)/kernel.o: $(obj)/helpers/helpers.bc
> > +endif  
> 
> Can this be combined with the other `ifdef CONFIG_RUST_INLINE_HELPERS`?

I want all kernel.o related lines to be closer together.

> > +#ifndef RUST_HELPERS_H
> > +#define RUST_HELPERS_H
> > +
> > +#include <linux/compiler_types.h>
> > +
> > +#ifdef __BINDGEN__
> > +#define __rust_helper
> > +#else
> > +#define __rust_helper inline
> > +#endif  
> 
> Could you mention this in the commit message? It's not obvious to me
> what this does and why it depends on __BINDGEN__ rather than
> CONFIG_RUST_INLINE_HELPERS.

I explained about the bindgen part in the new patch.

For CONFIG_RUST_INLINE_HELPERS, I don't think I have a good place to
fit it into the commit message, so I'll explain here:

`inline` in kernel is not the C `inline`. It's actually the GNU89
legacy inline, which both compiles as a standalone function (strong
external linkage) and provide inlining definition, so this works if
CONFIG_RUST_INLINE_HELPERS is not enabled.

Best,
Gary


