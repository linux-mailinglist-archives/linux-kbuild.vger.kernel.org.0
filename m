Return-Path: <linux-kbuild+bounces-5494-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB5A12BC7
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 20:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12E0B3A5FBC
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 19:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4351D5AC3;
	Wed, 15 Jan 2025 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="B8B2qIle"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020093.outbound.protection.outlook.com [52.101.195.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EE1D63CE;
	Wed, 15 Jan 2025 19:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736969731; cv=fail; b=hVWLZXiJcyi3yxv13And7lZ3Ab7Hgsvu0bQBR3lFkpgbbBuFAMeggIG+LfCU4arW8OTaEczgyIF7u6oB7hALq3ktchu1VxxSS9GY1OWO1vOkGInpcVuuudCrXVDqQGqftMNHy06dudc3Fvs4jGYxfGm2vXVi7eD28Kym30Zb34I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736969731; c=relaxed/simple;
	bh=sl2CJSxTewmGYuF7R9aML0bDYgbNourPfXny4GRfOL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jXbPyFRuXXvmmWdiOyDxLlYweZnM5EH/eMfZ/mBPFNNzXg2bfhvSrpcZL9LVqOqWXbQneP+VyJWBncevMt/T0tJXFZR9QAUoac5VFHXAFyovP2ujs3z9nn+9IXOCKIRG5Dt0ExeVyXR/WdzXFBWmAXVIo/ILkcTdYb2R08JTEH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=B8B2qIle; arc=fail smtp.client-ip=52.101.195.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0uE/+tIxN9kknJuIMhWuVs4SR4qAS03s7vD6d+NyPwBNprYU2owLgaUVZUlYs1L1Y7+IV3oYYyVxBetTWoUYk3drb/yF/0nHRj21o+pd/Rs2FlB/LanKHe33aw3fnrS/q7L4Fzoae0IPAO7fLwhRChwD9SFVlFTzBFsmeo33KkE70y7JGkCqDcah5gCP2N65WrdLAY0NoEL6qnwepY26S7PmdrgBT0HGDfCFoNR30DLv/L+U7yO7Jfo4jS9KzGlCMF5u41d2Lwmv49tNoKsXBK8ilkSFgHyAtZkS04rGY+nocmDs0HOL2blAjG0CZrZP6p0dt9khVoIMee4fdWFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpatoyU4O1i+ckyp5+qqUorzjR2Fb2q89h21QkFHLy0=;
 b=wWNBDT+HixxE1TeNvIWm245o1o1rw0Durd8Kx/SLKj4wwYL6K4kxGv7zHYe1U3mme2dBZNcqGLnHr7jCV0779A1eXbXOFsOGGwpdjVTU5rRvGQ7M4VB9jBdgdghNUY4jvuvM0e0ob8U1XyVZmtxnLdzp1PIXrcprUvk+L8s9PUtelt15pM57TeL2Zio4hmeNyU+ho2XN1QVv3r6j1HVgvw19UtZJw5ZguHUy76qPVkb9O2EmD8q3N8cEnwejgDmpbbl3dW06dO4obJ/jLJuQHD0XjxCPG6P9A+WW3wX/yqvfJGBGHxGjZWkjFmhO1orI1e4rxnThpKkRdPBMBdXcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpatoyU4O1i+ckyp5+qqUorzjR2Fb2q89h21QkFHLy0=;
 b=B8B2qIletoFF1xAJLDAJSPHLJdfwXv8P7WvCJhswPLetOFRfPtmn5BvTKVesLwLhWNax48ACVmob4PHJzyzLPgW2Pc+lee2cq++rax40aPvddhHkTixO+mFAOvNmWDRzAEFoxBTn4lJ7aYVCS5m8xOTzbyiMXMHa2w67B0NLr4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO7P265MB7924.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:410::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 19:35:27 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 19:35:26 +0000
Date: Wed, 15 Jan 2025 19:35:24 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice
 Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Luis
 Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, Adam
 Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Petr Pavlu
 <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, Daniel
 Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, Greg
 KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 2/4] rust: str: implement `strip_prefix` for `BStr`
Message-ID: <20250115193524.5c07a472.gary@garyguo.net>
In-Reply-To: <20250109-module-params-v3-v4-2-c208bcfbe11f@kernel.org>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
	<20250109-module-params-v3-v4-2-c208bcfbe11f@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::27) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO7P265MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bf6572-95c8-442d-2231-08dd359bc334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8zuUrBx7br/coycdLb1WQF3f1QrWKHcozTT9kd6tzZ+6hTtv9mZnT24EBkYV?=
 =?us-ascii?Q?6whA9knVP8U+4UuqBxYhpOMWiU1l1MgIvvJS1wrBcYidNoamWo9oYE9kWEsE?=
 =?us-ascii?Q?cYZbO5d28vzqxc1dkRZy6d8EC4RFp3p53eGC0+SR3Em+e1KzC96Xzcm4ZCE8?=
 =?us-ascii?Q?/FkpMi/ZiJXqqP7knAFSj2d669f8gtxdR6Cz6z4g6pLZDRUPYRaP10seXpQL?=
 =?us-ascii?Q?bb1S4AD99dzk/E2jhkJYvimYrtC1FwFt8kEkcle5816s/aaaf2Tp1/YLjq3u?=
 =?us-ascii?Q?bQeg0nsHBHVZYjw8Uy77J9i+VeJIg5d55KMedgii+PzEGc926wqXJ4ElHX8r?=
 =?us-ascii?Q?Mm+LTVNsd11IctqfBX1mtEaSQvwvM6EAFvL5iF6UTvSdN7CCWETK+wFRdeeB?=
 =?us-ascii?Q?ZfX2UUwFSuaisoOi1bNhLsf2Z0Q4nxZKzx7nwfaXxf76uvG78ZBapEDvEAtZ?=
 =?us-ascii?Q?xekg3ki11udjQjHlyg9rWqUtIHsgd9QCpoCGK+LDQyBrALYOtea+xZxFfgV0?=
 =?us-ascii?Q?4/5mR9LEkaJ42qhL/48zXYWLpETViuFlQtPnLgBl2QqKLIzFgNu9DAj3Z4Bn?=
 =?us-ascii?Q?0eQDqVbl5XhIS9ovqweFf6Jok0MD12Nmv6GYVxbkMhSqvDJjdrdTG15ag+0c?=
 =?us-ascii?Q?+67xsLpfOwCuGXEHaZr5q6whmEUUS6GXjtBBrXnwyTuq2spILWQ4/jSWtnt3?=
 =?us-ascii?Q?yle+KvQ/kOeHSlT1aXBzCkXGYS7lCuyJiSJo/yogLSgXZ/KrcOM6pkk/zGSn?=
 =?us-ascii?Q?qoM/QrwbDjDpJjagBdKedUzslo/xAPkBwZF4jeUB1M9+3OxoblaZBO6X2Gom?=
 =?us-ascii?Q?HPZDQ08UcJEu2f6G3CwMxAH1GwtbKJ+52pMcHA4PeFdBIYDvAsRWdgrofven?=
 =?us-ascii?Q?2jVXWmBeg4U/aRMsMs0OrpDv/6GSJGCwxXGlF3IG2pYrdgXZDYgDuEqX95z/?=
 =?us-ascii?Q?ZJCRLlP9GCjkdoPbQpgolRAYs2KDgHf0WZajkhlXDiVLaPMRvuiqMuUdz87L?=
 =?us-ascii?Q?z+aRS7GzpOoT/Wozs7faMo8bFsZA7J+JU7z3GJNllPx54ih46Cpf/zdMq3m+?=
 =?us-ascii?Q?2YmMHjYHHH24sdwrBV3RApM+MPgfrBqltpIWllDvC1VAKY4WmA/jlwx7y9uv?=
 =?us-ascii?Q?JiBgTu+fk8rOHIuYfO8G/rg44VzgEK7Eq8s+tyyCBhYd9YSDT1VfK05+LSfy?=
 =?us-ascii?Q?M4arBSuwZJDrRJr4cJTy7fFK9pNmzDx87cgqIOaTYsbWSxF0ODo1H9FZkIbc?=
 =?us-ascii?Q?LAIw7OutlQWV4of/25kEXK4ws8FFFihaRMVWfVJgn6I7r6zyqMDNjhvptx+/?=
 =?us-ascii?Q?5o2uoMOwdkekxgtC1WqrWLyaca0p79Ls1VkAn2TvlH0fIcvNImTcNIANF9TR?=
 =?us-ascii?Q?9x16QIAn3Ebe4Pr/JULHpN4zZihA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O/dIRbYAFT4x67vrnN7ijp5lpBFK4W69cMx+pLnMTQP4CsWTsZDSx/HsAVWT?=
 =?us-ascii?Q?2287FA2PMRdAR09vNXVLwV8NhcY6akq4g1xPknskzuvZdmXkblK3YtA2DOD3?=
 =?us-ascii?Q?wKrHaLhLZY4mOluPCbiNrazkZkZApVodEpH4rdRC8GkLNOrMHC2BugVOdXVp?=
 =?us-ascii?Q?06zAUlHS78BO/B1XpuFO/8NLQ1DXFgqKtT41UHP/pIIthaJLZf1G4nHwpowQ?=
 =?us-ascii?Q?Exz3N+PwGTGibRVjp3mLYFRDZTIEFzCE3r00h82xrNapm7fUAPOweNZCyHKL?=
 =?us-ascii?Q?18TIkHTcNkDKcaQZK2N9zNK/AQHx35Fjavy0smbR+QR5VAntQM1dwiCU63fk?=
 =?us-ascii?Q?qmgA1K2umCkHdtIIx/Db/cJc6NeeyJphPW8QPnnxAQo59X55HXxjPBvgesR5?=
 =?us-ascii?Q?X647DQAcgLu2vLPQUKLW/mrjfngqqSbXr4bZ1N9u25cSeP4Zrrh0vuMZiG/F?=
 =?us-ascii?Q?oPx4sWA0At3SIrWtOJdw4O4ygdyulaYDfPKuIclKYk6xKlZZkMR5aS2lUPW2?=
 =?us-ascii?Q?Lssda7giLBP7BIBF/3nkHOSzihoDVlUnc7aM2zdkNtOhBDdpc6QG7B8AZcRZ?=
 =?us-ascii?Q?Izp7omMIZsKZdd46e54ML8cKvIWk4ykMIpV6FxfKWYim1DUEJpeYJi83y3sK?=
 =?us-ascii?Q?f8ZDiknyopx9z3F1BgI1vSBxZsIJb+5PA+HCWJonaNNdpZL5YSw58dhvl0AB?=
 =?us-ascii?Q?LvNfhhKoNh/2Xphlfkpai/ylzH1HtFBwKz53Va/YtcYAbq3VTtdekIKh5WSy?=
 =?us-ascii?Q?9LpqRab6e+lcrx//AVchVVHGEFIckD5fDQj8uDBmhaW8tQ6IQv2N4mnAmNAP?=
 =?us-ascii?Q?ItY/Eu4SHnFU9X/N7tuRnL5+AO0Bc5bmxdQA3eaXsZe+KRA/sJczdWP0qPLz?=
 =?us-ascii?Q?zR1z5t/umjRSLfoH/9eJtARcn98qALN9M+iOU0tHVu7TNGyH6QhubS72XEmU?=
 =?us-ascii?Q?6nmjXlfka+tLUxNF5q+lbA8ivxhrf5h0t0qoyFSMRVXH5WBXI7LcSjFurDTk?=
 =?us-ascii?Q?BHUHbrYTAVc6ieLLt03k02xm+A0ZA+Ozb/EdPMbBRGD8N2Nr10/O2tqZmE7+?=
 =?us-ascii?Q?f89jyLE9PoZN7Tg/Y4KaCcFf4jLl9reKTfq3SR2Z1zdvcytlaA6UCODuoOWG?=
 =?us-ascii?Q?q6K29/mTrhVAu60LeMz+aPnBIb+25xSUtZqDcr/DzRXNY6RvOdhNyXaM/91w?=
 =?us-ascii?Q?XvLJiGGswbm0VX7wbp2raKenEsrUc/LPt5k4z4WkkVMMBxYOv6FCmuJ2LMXw?=
 =?us-ascii?Q?KuKECpDMRkxsRmiiGwv42nq6BRZPs6SuVz1NcBsXboDKgAMUD1+lWMjiU3lW?=
 =?us-ascii?Q?iPs7cvTMRBo0P8zwgWPkBn3bQiHfVs9cEbISLYTraV7VFFJFSRcZ4ohfxbkC?=
 =?us-ascii?Q?UPJTKea4QiRIzX5gyeg+xh4Ydp7FBOJBSCJlnkwLbpahLgFokQVhw+jBmX4i?=
 =?us-ascii?Q?gijZAHZtgXQJhk5kdnJvtZrhbNlxZtXOmyTf7CULBRmo2P+EJvD+fkZ+ETrf?=
 =?us-ascii?Q?AtmY0XKwkIZg1uaAQKZ4Qx63maWgEFZjwtqNBNzzdjRjPRvB/clCFCtqs09m?=
 =?us-ascii?Q?BmkzZLAWoYLV2frPWjn02zfcn8uQf1r8ikjy9yC8siM6itPr0nNjFyQkZC1C?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bf6572-95c8-442d-2231-08dd359bc334
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 19:35:26.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUITVa+2hHS55AKFlao/n2NRi01hJhKvq1GOCCaIFBCCV1AgNAZhyjk0XdrkOS3zuaSshJkd8cFkUzypyeEgHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7924

On Thu, 09 Jan 2025 11:54:57 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
> on the underlying `&[u8]`.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> 
> ---
> 
> It is also possible to get this method by implementing
> `core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so this
> seems more reasonable.
> ---
>  rust/kernel/str.rs | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index c441acf76ebd1f14919b6d233edffbbbbf944619..9c446ff1ad7adba7ca09a5ae9df00fd369a32899 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -31,6 +31,22 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
>          // SAFETY: `BStr` is transparent to `[u8]`.
>          unsafe { &*(bytes as *const [u8] as *const BStr) }
>      }
> +
> +    /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
> +    ///
> +    /// # Example
> +    /// ```
> +    /// use kernel::b_str;
> +    /// assert_eq!(Some(b_str!("bar")), b_str!("foobar").strip_prefix(b_str!("foo")));
> +    /// assert_eq!(None, b_str!("foobar").strip_prefix(b_str!("bar")));
> +    /// assert_eq!(Some(b_str!("foobar")), b_str!("foobar").strip_prefix(b_str!("")));
> +    /// assert_eq!(Some(b_str!("")), b_str!("foobar").strip_prefix(b_str!("foobar")));
> +    /// ```
> +    pub fn strip_prefix(&self, pattern: &Self) -> Option<&BStr> {
> +        self.deref()
> +            .strip_prefix(pattern.deref())
> +            .map(Self::from_bytes)
> +    }
>  }
>  
>  impl fmt::Display for BStr {
> 


