Return-Path: <linux-kbuild+bounces-5493-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E56CDA12BC1
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 20:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BE343A5E76
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 19:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D35A73451;
	Wed, 15 Jan 2025 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CUCYwXRE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020115.outbound.protection.outlook.com [52.101.196.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1401D47CE;
	Wed, 15 Jan 2025 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736969710; cv=fail; b=n/dOr/Vg0vH0tuWsT9tSzw4piJwpwKyu9h6OB/UFjp3SLWdOYX4qtSWMiQNtQiWRvzhN1AFApYmx8fLyCJPBjSH7YTFAc4fnNACKxFKl05XQHN01/GoyKguqmBend9ZZi7L6Y15qE9NNtDxTGvQHWGCQAYZhu3vaGkdTNJW6Uuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736969710; c=relaxed/simple;
	bh=c+oUgdIS+vdaMf9JtVDqtPWNUwnsE+I1yt/y+WCknls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QAWe1q4bxaggpfVSQeYqtgXB6HDHCmQ5t5v0oD07Got+qjc8nig2/yqxscuAKzE7xfDP/iJTXb+LllRCV8H0v+zpdxLfL8a90C9hlKUBA1Ohh9N3ZLkQ0PEFhjKRikpBrPp0b/+JkQFeIz+mC5EhZyIZiH+EToNHg6pO3EuoKSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CUCYwXRE; arc=fail smtp.client-ip=52.101.196.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDYDxQShNwCV+WJo0DqS/wE36+I6KPrhNAETXEHO8JG/tf6XCXe96wh89Ghi/xzPYgNmUCKLCHui5mivvnZG4jG9rDEiuR/g73QEAqjIaG+n88GjJwYH+P3mAQAV8/fuvO5UhwvuvRjVpmzjUKS06jAzuHLbI2uSOCgGwOplXsdyBiuCtmXJCtNkkw9JVzcZD5xdUWfBoDU4IV4fQPF/W5GSoekJ7DDSv2c/ErZhFDu0sbzLKUcGicP7B08YZvFlznZBx+T73SpRppNkPV/k7IyypucTTB/iyvISL5RHDeDnDoutGKd+7sh5W6h2CXWd3Cr0MqkGO52o05GftM27Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDxbtg+D/FKkcogGeVOtGACOGdBXP5piiqC/xvyKJu0=;
 b=KZoroxhn1UYOJRX+t9V5VOztT9Et1t0j+P0uq2HXMNSFB9HGjMInXqRhskyu931ZXs9Ht6aPa9YbeL3F8pdQnh992ZSuTP3N9IOsdrO9kQuNRVv1LOYit69iVoC05xqgdfsq9wtcnWuJNtZ+6xoYZeRjFP0KWTnZxougsFlZ2xeQPvidspvFfk7K2ylg/i2xy9JtoweBaJEXSDDrdwn1qkI2tURkAqpKCDmX1s9vEEpQulyad22rNSFiaUc2EtEchT0l80nDpA8hIGgtXf+ui6bvR0uKNpKQ/1KITsVZyZrnyrAuofw1TEqN8Wozy5yGYzI04NsniSeJEAszThkDrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDxbtg+D/FKkcogGeVOtGACOGdBXP5piiqC/xvyKJu0=;
 b=CUCYwXREj5GVzjseSE8aYm11+V4fqju2bvVsKJMhxGY5gSYM0GHMlaQYMcQdu6yxX3n7CdX9kz074rsjN/kIQtmm9xNep7f6jfUD1C0Ua4utYhK0h2IAUQYp4mLVyOR7kEsGQ0drP9pBPTKh6WxX0yp02YOvzWKSMnRDV/BSdUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO3P265MB1849.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Wed, 15 Jan
 2025 19:35:06 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 19:35:06 +0000
Date: Wed, 15 Jan 2025 19:35:04 +0000
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
Subject: Re: [PATCH v4 1/4] rust: str: implement `PartialEq` for `BStr`
Message-ID: <20250115193504.4d7c3367.gary@garyguo.net>
In-Reply-To: <20250109-module-params-v3-v4-1-c208bcfbe11f@kernel.org>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
	<20250109-module-params-v3-v4-1-c208bcfbe11f@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::36) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO3P265MB1849:EE_
X-MS-Office365-Filtering-Correlation-Id: 22190e5c-509f-4f72-0cda-08dd359bb70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N0it6B/x4+ljOK+LmLRuwkUFBxViDPYczG6fG9QiVS5r53LkfKKFr6pNA/by?=
 =?us-ascii?Q?SBjdq/YpZyGWeeVipxHSNue+YEtbm9wttHS/dvOAOlUfBfKFhLRWM5bgBdXM?=
 =?us-ascii?Q?HHWZRVAAmwmF7BeJOPrpRS0yn7koTkA8/PEdFimSfhCUZg0yN101C+ZhDPXf?=
 =?us-ascii?Q?bVp00/RaDLrJuZMQGtZ2sgNUJ/P1h24fr8erB48QjqIBamcgPm5kelzE8up2?=
 =?us-ascii?Q?4joBNSRCv4HsUHQGErJQYIS4WRjKBwdgcOucigh5HGexKGozKCucsaqIorcL?=
 =?us-ascii?Q?JRPOKC6NgaQ0TOUlFM5BUL7mrcDuapn5ugKi0PGFmMFhWqCkcuHxgBU96ogY?=
 =?us-ascii?Q?JjTQOnXAKit751VjGjnJ4JtCsUa547GGHLcdar8LLehWY3dHwoNTdev90b8z?=
 =?us-ascii?Q?jQV/gx3fHvOdCP6A88tSn04Vb3Dn327Yaw6xaNiup9jTU6mnIwd1Zqzcun+7?=
 =?us-ascii?Q?/Cvn0cr3gUS0AnmTCjJNyyPMu2J7YdLFIw3DpJEryh/ufYD2wAq5+I1PPUPx?=
 =?us-ascii?Q?Ns5pTGWEWwEg35Ysk6yv1PhclaLaBAdm/JX2eMVsa97MjgHP2FTsQhk2sWWJ?=
 =?us-ascii?Q?gPufl3zaQml3qu/ddSR4k7BVdfRBtuPxaAU2E4SUcdsAeDDVv1Qdeg6xWxYH?=
 =?us-ascii?Q?AeVcD2/CZ1YKWGBqsRBCuy8WD3NIS0jW5XBSteWM1F6p38BoRvuZVvCeAJ8V?=
 =?us-ascii?Q?r70qd765K1TokF6LId5TthYsQ30xVWkhgCBV58nHHGQK7tw4z22iB84s8aKC?=
 =?us-ascii?Q?TYdA1Nt4Vx+V8+r3AlT6jKLXdHPAvHjIiXCAnzk7IZ1Fwn9u7lwXdtoTegDP?=
 =?us-ascii?Q?14vo4fPagHucuvYKl0JKvuhZ2HR0ATcU2y1hmdzllv9/Uv1WBnSYfT8UeZJy?=
 =?us-ascii?Q?aAdbqh2k2zF/JoiSCAElH4F7h4SeGeYmOKzsND5BqvqAJA1VTkdTJ43oavF6?=
 =?us-ascii?Q?d0vfdyv/ELXO4NToB4/nIAWNljQQY+18cwSxCK+g5NaMhWULWZxu0iNqonMp?=
 =?us-ascii?Q?3qQd+7E/3nVQvK97r1Qjpm6QUst2xsEZWF51bVHvqfnf2LJONo4/prxco1JB?=
 =?us-ascii?Q?Kgilbs8xPHSWDBmfOYikRmPmcEMbzwKQauaFOtGVhRS/00oc2wKcQnRr6cHy?=
 =?us-ascii?Q?gCpU5/E+OPCaDj5vfMwyXnJaBXHZuLWHnlQfT8b50D8s/oz3MTDNO8bk5cnM?=
 =?us-ascii?Q?tASmXCpT57UEwPgibdK5iIldg5ZKuYKJXsQCQ24DSciPYfXhWAtg1//sTeTg?=
 =?us-ascii?Q?wjftZ60q/vLMFXIV0PPaa/Pj5sfkeRb7vccD5ABesv46/9HJafvMV2BWCq8F?=
 =?us-ascii?Q?lr04IQDv1FVrPP4pzw6B1ajeqWiXsxUY9QE5UzEyrkKmXKkqNappMLEWgRr7?=
 =?us-ascii?Q?2iiKZBL9IYpi2TFUv7JhOSobi075?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cGc3JSMywOV1gVkr4TxXtea6tQYmskWFPwhUJWfL9gYz7VKTwMjreE1m0zZJ?=
 =?us-ascii?Q?MxbDqHGKb09ARPW++viK6l46FAbz7V4FCZ79w+h9HpwfFcYf8OiTDVymMzA+?=
 =?us-ascii?Q?CuY2AhIImlUF/te6j8w9MmnPgzW5C3uTbKv6qJ8Lh4znxwz3efEWnl3fHTRO?=
 =?us-ascii?Q?27tPbMwzmsxCi5yEnc6Ny+N5VApKmXJ7/HGS7yTS7wDJryvnN9yiqP1jd0vy?=
 =?us-ascii?Q?H6irHZdEO9u4796Dm/zmEfJIv2+aSzuthoGA6FL36/wfoWK1+3SAwZa2dZeZ?=
 =?us-ascii?Q?qjD63v37gA+VD4q6jhm/WRvDM0j0SV2aQsig7nc5lFainX47EhWRV+3PgTP6?=
 =?us-ascii?Q?2o0fGg4jUfLxs6KmoeIhRcN7uNDNfTyrv9LYvjKqljzelgBJyvGckEcW8ihx?=
 =?us-ascii?Q?u9EIWibWXzPPOn9iZ8iJUq65yRaZPSYhrk6IqLtt6e1fpRPYC/0kSes0Gbxz?=
 =?us-ascii?Q?yhk9PUPCHDWq5tgY23WduSGreujLNwi+CCSOsp/I4Os3b6v/PeqSFPAkgRyn?=
 =?us-ascii?Q?x3DZeYSP4SCXtoVBWT4O44G2YEOQYtB7+8zj/MWSHM3eUPM4pCdytDPC8PRv?=
 =?us-ascii?Q?8mG/3/YCk1ppvKD3upZlTh3+JBPXelDjkbRWZGLAnxyvFnjHMYiQ2pbvZxxN?=
 =?us-ascii?Q?somHXU/LOfrM0e9VmVRR7KpM6ZCjAaViHkuQLnHgg0t5za5/asKbJEBPaoyD?=
 =?us-ascii?Q?TqS9AHiH4phJikGsG4g7SSgwY58AR4xZ9eCZU54epgWWk4Nsu/u9txRlHOPT?=
 =?us-ascii?Q?Bi3j1qX0gRAffMtFldv9CfCgE2+9B13Tf2HFFcwS+7GUixyJDjF4EtX/i88d?=
 =?us-ascii?Q?nhggcTB9M/xWidQSx1hhioe3oR2nP3lyYaSSvQ4eGx7lOtsRc2QUt8Q1W9QR?=
 =?us-ascii?Q?aEtEoosDwFqu/+4FMXCD+E3rKilmqPHRQJT/throgBtcjv9lvcqOnRK8SJ8H?=
 =?us-ascii?Q?RHgoTG9fYIXV3rDsIv1oKFwCh7hEihjtlNLYC2lgyGBY+e0SpdfjwUHNs4F9?=
 =?us-ascii?Q?TRsYy2CsodqiCuxU5qbpunHrFbMp7ZxyUeEorkg1O36ydUW7m+U8IHhoGEZ2?=
 =?us-ascii?Q?0nn0cVZ7IHDMiK7agAjKXGUtXVwQcPcocGlC+ox2eRwgrkCO1+taypHjRccU?=
 =?us-ascii?Q?n+hp7mhq7JBCbz0uT907ZG+EkbkVCeE0Y5MFlNuo0Z1jgwCeWJdBDQtmzet5?=
 =?us-ascii?Q?4tfi+hKNFyJP/94Uxmjx7IjcfEFZsqGjLuIrYdiyAQhT6HMTb6IusS31UUrw?=
 =?us-ascii?Q?t4+8kSj9XCX/FfGbjsy54CSTYoETFzjSDEPBmpDnQRAUUPlotmKxUaXVzomK?=
 =?us-ascii?Q?eGEFBgEiPY/cDunq3bb+Yv2PZiVEK96Hqy4F+2J9qr478bfPhn+0tBEEqE25?=
 =?us-ascii?Q?N5NN9hwAUcdvbix3Na/ybuQjadUvdy2c7zDh64uzbVhoCm1cNwJJ5v+cbfcl?=
 =?us-ascii?Q?sl1OdjTfQIfVm+fBQ5I5fTRAEfTladL3jQpsNEjFZP/G5ySAhQcNC0ATsuet?=
 =?us-ascii?Q?KneMUttbQam0iWQ4dJ0VE/MQu0TQBpIn9tdG7Z6MvF+cUBtfM1OpTl54b+7z?=
 =?us-ascii?Q?YDYna6aXj3cEhYEBWMZkRs76rtXWxcfPEM5et7ora+Ma9s+Y+vUYdlFU8zcX?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 22190e5c-509f-4f72-0cda-08dd359bb70a
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 19:35:06.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Kqr/b/DpVXCrkjPL0poTpRXU0qHiTc77+LBXbr7VWZJR1Q7zijHnLmD8uFHGmxAOcz4d1KtZpnymbgfn6X8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1849

On Thu, 09 Jan 2025 11:54:56 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Implement `PartialEq` for `BStr` by comparing underlying byte slices.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/str.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index d04c12a1426d1c1edeb88325bcd9c63bf45f9b60..c441acf76ebd1f14919b6d233edffbbbbf944619 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -106,6 +106,12 @@ fn deref(&self) -> &Self::Target {
>      }
>  }
>  
> +impl PartialEq for BStr {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.deref().eq(other.deref())
> +    }
> +}
> +
>  /// Creates a new [`BStr`] from a string literal.
>  ///
>  /// `b_str!` converts the supplied string literal to byte string, so non-ASCII
> 


