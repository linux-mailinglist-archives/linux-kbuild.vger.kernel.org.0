Return-Path: <linux-kbuild+bounces-5723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE7DA311E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 17:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE633A72CA
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E208F25A323;
	Tue, 11 Feb 2025 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UXo1gGGS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021141.outbound.protection.outlook.com [52.101.100.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57891C5D40;
	Tue, 11 Feb 2025 16:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292188; cv=fail; b=BfDypFldTRjAdOWOQ+2dbJgTaYv18v2/1FE0kbjbN6cfVlAxKa0bL2FGrAghQr2/QRlW2tjHW/LAvyJED5Du38otNaOP1kcWwisVcyBQyvGhN9bL5CGmfGm3iKuLeuajcgQCQ5+iLBJeK7sheI6NYp0cUZaYsgQq51P4haHK9kY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292188; c=relaxed/simple;
	bh=tE/8RCaglshC47kFM0lO+BR3YUOjeBb9INv5OmwgaDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k9OvA625v7ZAqf+c9soYldv/PGS/7rBOW8wOsTOUE7Rmw21SdDuK/ZYROEt+sVIjzsp+i06MTIOZjbyns1LifmgY6khptHUgYpL8g9rMu12mGTrBG2/NHXQwjX5SCSUgOOuqbLpqViyL6yGFlgEknxh4ZXiCasp8ljRuGJyrE1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UXo1gGGS; arc=fail smtp.client-ip=52.101.100.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6kujkfJvb+d6e1HZTa3sIVZecQijV5lWRxO5hwVj8iWWWxb9YJtmSADQ88LKZ5W1XnNyhrGeu9bDA1/KzT4ytY8zoCuvebpsungOrdFXaijyulCM0jPFieMRjkL6d2G4MA5low61rhLNpAmovrdgtLrtUIxLAV+pESCL63ar42lbfAn0UR4e+Xvhu7pUdRBx+wZoVUamH+sh2wWkMwkNQCOZLRfuZVJqrl4Xtrxv+hIHgDf/0csdiUm0Nz5u3FYCKqArdQcQ0VReAIr4s92U3PrPQ4wPyTQgnzESbrCpdXqqu/WlJVhrCn0yrygraoTpz1heMwSQkN+9kFp/O49bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GH8RSls1qRKWpX0XbKb7KdN82RMihHjzfbwTUVUWtM=;
 b=fOccaVS2i6TcV+Q/0jKaWZr4Xqk8MIE1beUINYDWXWKgX8UtQ4wo2L7ffZgv/q9yX20zML+lZCya/0CllbzAdb3XDXO7+w6fXF46+SsdJmep+94hyHApBrnhcNFwzjiEQorU7zw1QwkCGmbUZU4HvlxntiGnCo/T1vaqF8vgb2kGVDDiDP9BVcEl4JczCxwOOnD8rJJj/XHbNa74GvFlBYiUuNTSLAEfGWmoMpLa8hLONLxxOuz0Ao5z76XZw0X0xZNe1sJFXb4f5SQeubSVcJQ/kYX+Kt9mXbOptYdyQAJSFuEA96bw8iAHLODNX2BBSqcDk7ap8BfLJg7zRnujxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GH8RSls1qRKWpX0XbKb7KdN82RMihHjzfbwTUVUWtM=;
 b=UXo1gGGSX8mg8qG0it575hR8ClaSPhFLpzWNgB6bgvwiNWF8cZreD5qCu8FTTodtZg4ZnB5cJA89hOp4nlxquZuJlytW5O7ePh0iYsVqXry8l6Tpfppty6inCCwENy5X2+eUqZX3MY4h30YB2e5RstpmvnQPg0LpRIe/bh7gWYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB2588.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 16:43:03 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 16:43:03 +0000
Date: Tue, 11 Feb 2025 16:43:01 +0000
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
Subject: Re: [PATCH v6 5/6] rust: str: add radix prefixed integer parsing
 functions
Message-ID: <20250211164301.47f8d414@eugeo>
In-Reply-To: <20250211-module-params-v3-v6-5-24b297ddc43d@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-5-24b297ddc43d@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::10) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB2588:EE_
X-MS-Office365-Filtering-Correlation-Id: 730dacda-c826-4160-3ad3-08dd4abb26fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V/zMBh6RK2zwpN7etrInhBsanFVgJRDIdiiht7dwUP4zT+93UDxuOEIX6k67?=
 =?us-ascii?Q?CjjYbC8X44q97fVijW0WgDSYmgojm5Rv2u2VoSThq3o+t3yJX+NoLtplImfK?=
 =?us-ascii?Q?QVsDjn/uqFUb/eXl5zotZU4ywU/psAhH8UatiZOsDbcQJ2y+2zehmW7KujXB?=
 =?us-ascii?Q?jcskOFj8I4s1Ddnts05NNnmFP56EGLDccOFPeabHjQr88r6Ibu8m7uXT5ldS?=
 =?us-ascii?Q?2OvsOxjQC0W6aO2K/DQjttMsuSUy9OwATXTT7biYfXPjS3Pwi7BHfgeDa9qS?=
 =?us-ascii?Q?i6az+vCAQFN02xo7UpEj5XUTkZiNvPZJcERi74U8z3CB+oQo/qtPkGXKxzGT?=
 =?us-ascii?Q?ShEmNjUq5IRCLrIgcW2l+LsgX2PMAAr//LPeGdFJoNOLp9VJhaDaJsTcPF0h?=
 =?us-ascii?Q?FiPaJw+mxsszJK7QNdDdWsFXYab/XKf1veYgwBFb5aVyIJ0CqbAHYOCBuCG0?=
 =?us-ascii?Q?pVkVDiKeL46NtnriOrKyILI7n+qMmlVouLw67JAqTBeow9EiJW5NXI+fS5+i?=
 =?us-ascii?Q?sYRJn8S/x3FLkjM8HCi+09ijv47V0zG28pancAiOrHXwTly0altw7ALpUMnJ?=
 =?us-ascii?Q?cSbYXPv2dBpmAZuA0v6taor5NBscOLheuIGpq8umBW+fY6Z+wlQtmY3/7MH6?=
 =?us-ascii?Q?wIPin7bICqFmvbjaDd0PC1GDLIOBbC0g9wD/kO2YSJ+IMeI7cQ9pLPuL3MJZ?=
 =?us-ascii?Q?EuuS8+Lr9J2ceT+KgEoyHvKyIM9QJsW/LB1FOThe1DLZOCzGPlSqBThmqY/0?=
 =?us-ascii?Q?Lhm6agS2vUjE/RTUUUX0Vz65I64V4Z5d0zdw6SJ3+v9T/3Oymj0Kr00qCXQO?=
 =?us-ascii?Q?+xvSHfRyu4TMXzQ95gPZhyuRNiTpz4VkHEYTgddXyL9Eu3OdCYQ5X/J06wIk?=
 =?us-ascii?Q?/a1ty4dr6DSIHWjpATnGGzn4w4hBFszJvaGFM0w1FWOLi0xKZIX3Q+7zvlXX?=
 =?us-ascii?Q?qY/XV89DwLDOceWJfzWwKC4NPDeLXIHUps4YPOYbaB8zGqlUAwRk3tvSICY4?=
 =?us-ascii?Q?GqYJxDrfzIfdE7YVVegpiiPQIIU6QPp6UkyDmGA5K0kWlNIsZfvHhqhgZu1K?=
 =?us-ascii?Q?RPsoTAQilrCyR1GLe4rrBBYzWddvZHYU0WsaxmUEOme5tW+wnGxngAVSgZ+F?=
 =?us-ascii?Q?CjoUF5SEo3tNBx/xCQ4kgpqvSHYxFTOguv1aorZdJqYg2Jmv4PztAJkzdidI?=
 =?us-ascii?Q?Id0/Dyooy6494gYlRpAIhW05gzTmYCChtYPNwtI0hahVLlLFDLSoZeovcLL2?=
 =?us-ascii?Q?DGEFOQbsPaHH/PKVXOLphIIBRSn/lQH1E3K3DE9eitJELO+6wVJNM7C+oMhR?=
 =?us-ascii?Q?RDxBt6GglExRE8sD+3KS/4KYF3yvSps/VdHZFXtLih9RHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zQYSrTiDevWHmLh90HAhZnrln1eLe6RIjB3JDhBo5oniQoWyeoF8dZ+EA8bU?=
 =?us-ascii?Q?qcoqBWBKdKdq2nweRBGIaE7W9NXweUmimPf8d0OULEgXtrfzb5MOkmb9v4sB?=
 =?us-ascii?Q?giRiCdOj9VXaPuoc13SQqHh5zqbEVnHLGDuA5PTNs2aelU7uUb4Bskfq7ggn?=
 =?us-ascii?Q?8vxtzX7Bw7zxFKjOohDnLtrzzOKnUERfjgH5OUF6r7U5tdPJqxkofW3hGNFL?=
 =?us-ascii?Q?ORMUcGyydQsDRTZfMvhZr+XXk5+nyvNJQ+RbywzyXIhXQW7YT9Tfwxa0s4Ar?=
 =?us-ascii?Q?p0RHkB8Nxat0nlBBnCobs2sJtCW6xPsyecdLx2ENfLVK4jRte1l4H6D6Xt1+?=
 =?us-ascii?Q?mJaEoo1mrqiW8LmdrlOxk8Y9v8fAEIl9bYcBhJ90DC3WgJXz9PcUoYYqQPPu?=
 =?us-ascii?Q?82Ks/MYrzAGPQoipd6yodppT2uOPLdTE9n8h/hSBvT380wxVRJXmptofT6tB?=
 =?us-ascii?Q?ZPAnDCtcru24YEVKeElEH8cB2FeUSl7gtkb1ZU31fuSO6itFPCS6Wtj5vpZ6?=
 =?us-ascii?Q?C5V2vu3UCg02XuZxc5LVgBQW0PSMbppjNflzRl9vsa2Bo/qoMOaMDEJo4mZO?=
 =?us-ascii?Q?3759jVv/PkdDSxXYPc9Ii0+4Xhi3vQZPGdUifvmZ3HMu4DMlWlE51AQc+s0k?=
 =?us-ascii?Q?uZBdEmfFMCj7ePNHHTgq6l2ExniZ/7UW4GUQBhmkIWjrbXJtNUjjEHIFXEYf?=
 =?us-ascii?Q?1sdtNdTetA3YiOId+Zc00zvTvOEA2FxvwmYGVhhiSyYE5K5729218AWl2V74?=
 =?us-ascii?Q?m1BRIaVaysyjVOrSD+S8uq6hNNWo+1pJs4ib1BV9sPTEjAe8LrQUz6ewHcWW?=
 =?us-ascii?Q?gUwWcVzY4YvpG98Pzslu+6+dIuOnjEGYjIpleyqw2zY3fuS0uvV0V3HMr2qI?=
 =?us-ascii?Q?ZkDPvcCJ5I/0VgkW4PoELGMWTtl7y9+gqX895s8BI8V9r/bBUNoo7XNYFnLX?=
 =?us-ascii?Q?BFxdO116L08+/AnAf+5Nqfm0XrFzbo+RS5eFaplq1t04FhA9hRLyLLbHv68U?=
 =?us-ascii?Q?hSqBoH+hzgACKZFj7Jw1TE5TaTJYQ+g9+ooBtfvXZL8pAeAcWtjHHVqwDY33?=
 =?us-ascii?Q?mVV23RMo/r+TuwUNd+AmsH9Hym3jYov/soC7mZOgMFz7d7NvO6SWUllpZ9BY?=
 =?us-ascii?Q?Bn6mV/QaAFM6xx7WogU9QvIQxHYjagRX8J3d8MWXN5leYajCEYQyUwUaIa1W?=
 =?us-ascii?Q?bN1wqXLBzUfFdI9jDpYkuTeiSrPexkCLyB3/nNCEEtP76t9nVaKNbbXGM0QG?=
 =?us-ascii?Q?E0cPqTkxA4yAPSTxsFK132wiaRNdQ5owM80eEZr9Zg6vrAFqzIN7SMY0cSWh?=
 =?us-ascii?Q?yfflT4uo+vkv1mCNItUVdgKjO5WfLPBgUHhEt8qGmfwnEuQN8kk6+mbDujpB?=
 =?us-ascii?Q?hR+q7QatoEXwwVBspdvUZWRS8B7berRCZxBtLQ6o3tSiYbkkMr9z/kfRQea+?=
 =?us-ascii?Q?1BiTAUgnvcKplprVzDELORyY67a25wgDUnhcJvz+XyUZMqHvKoIkWjDdvx86?=
 =?us-ascii?Q?UU7GUNr2QThgw79FquWexCMppUw0LSf7g+abjWcKDqBuGTZ4K3MJV3vHPad0?=
 =?us-ascii?Q?sCEghUwpOxBpoxH253UI8QdiIPE//+YcWHYWQ20g?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 730dacda-c826-4160-3ad3-08dd4abb26fe
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:43:03.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6b3jGjGd/DN4KX6PL8imaRH3nFxxITtJkteq2RhYbt0DvbLoSJZEVQWoUyBKBZ+AfZZZqIwhOCJB7f0/cILQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2588

On Tue, 11 Feb 2025 16:57:39 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Add the trait `ParseInt` for parsing string representations of integers
> where the string representations are optionally prefixed by a radix
> specifier. Implement the trait for the primitive integer types.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/str.rs | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index c102adac32757..192cd0ff5974f 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -945,3 +945,114 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>  macro_rules! fmt {
>      ($($f:tt)*) => ( core::format_args!($($f)*) )
>  }
> +
> +pub mod parse_int {
> +    //! Integer parsing functions for parsing signed and unsigned integers
> +    //! potentially prefixed with `0x`, `0o`, or `0b`.
> +
> +    use crate::alloc::flags;
> +    use crate::prelude::*;
> +    use crate::str::BStr;
> +    use core::ops::Deref;
> +
> +    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
> +    ///
> +    /// [`&BStr`]: kernel::str::BStr
> +    // This is required because the `from_str_radix` function on the primitive
> +    // integer types is not part of any trait.
> +    pub trait FromStrRadix: Sized {
> +        /// Parse `src` to `Self` using radix `radix`.
> +        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
> +    }
> +
> +    /// Extract the radix from an integer literal optionally prefixed with
> +    /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
> +    fn strip_radix(src: &BStr) -> (u32, &BStr) {
> +        match src.deref() {
> +            [b'0', b'x' | b'X', ..] => (16, &src[2..]),

This can be written as

	[b'0', b'x' | b'X', rest @ ..] => (16, rest),

to avoid manual indexing. Same for o and b below.

> +            [b'0', b'o' | b'O', ..] => (8, &src[2..]),
> +            [b'0', b'b' | b'B', ..] => (2, &src[2..]),
> +            [b'0', ..] => (8, src),

Perhaps add a comment saying that this isn't using `src[1..]` so `0`
can be parsed.

> +            _ => (10, src),
> +        }
> +    }
> +
> +    /// Trait for parsing string representations of integers.
> +    ///
> +    /// Strings beginning with `0x`, `0o`, or `0b` are parsed as hex, octal, or
> +    /// binary respectively. Strings beginning with `0` otherwise are parsed as
> +    /// octal. Anything else is parsed as decimal. A leading `+` or `-` is also
> +    /// permitted. Any string parsed by [`kstrtol()`] or [`kstrtoul()`] will be
> +    /// successfully parsed.
> +    ///
> +    /// [`kstrtol()`]: https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtol
> +    /// [`kstrtoul()`]: https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtoul
> +    ///
> +    /// # Example
> +    /// ```
> +    /// use kernel::str::parse_int::ParseInt;
> +    /// use kernel::b_str;
> +    ///
> +    /// assert_eq!(Ok(0), u8::from_str(b_str!("0")));
> +    ///
> +    /// assert_eq!(Ok(0xa2u8), u8::from_str(b_str!("0xa2")));
> +    /// assert_eq!(Ok(-0xa2i32), i32::from_str(b_str!("-0xa2")));
> +    ///
> +    /// assert_eq!(Ok(-0o57i8), i8::from_str(b_str!("-0o57")));
> +    /// assert_eq!(Ok(0o57i8), i8::from_str(b_str!("057")));
> +    ///
> +    /// assert_eq!(Ok(0b1001i16), i16::from_str(b_str!("0b1001")));
> +    /// assert_eq!(Ok(-0b1001i16), i16::from_str(b_str!("-0b1001")));
> +    ///
> +    /// assert_eq!(Ok(127), i8::from_str(b_str!("127")));
> +    /// assert!(i8::from_str(b_str!("128")).is_err());
> +    /// assert_eq!(Ok(-128), i8::from_str(b_str!("-128")));
> +    /// assert!(i8::from_str(b_str!("-129")).is_err());
> +    /// assert_eq!(Ok(255), u8::from_str(b_str!("255")));
> +    /// assert!(u8::from_str(b_str!("256")).is_err());
> +    /// ```
> +    pub trait ParseInt: FromStrRadix {
> +        /// Parse a string according to the description in [`Self`].
> +        fn from_str(src: &BStr) -> Result<Self> {
> +            match src.iter().next() {
> +                None => Err(EINVAL),
> +                Some(sign @ b'-') | Some(sign @ b'+') => {
> +                    let (radix, digits) = strip_radix(BStr::from_bytes(&src[1..]));
> +                    let mut n_digits: KVec<u8> =
> +                        KVec::with_capacity(digits.len() + 1, flags::GFP_KERNEL)?;
> +                    n_digits.push(*sign, flags::GFP_KERNEL)?;
> +                    n_digits.extend_from_slice(digits, flags::GFP_KERNEL)?;

I think my comment from a previous series saying that this shouldn't
need allocation is not addressed.

> +                    Self::from_str_radix(BStr::from_bytes(&n_digits), radix).map_err(|_| EINVAL)
> +                }
> +                Some(_) => {
> +                    let (radix, digits) = strip_radix(src);
> +                    Self::from_str_radix(digits, radix).map_err(|_| EINVAL)
> +                }
> +            }
> +        }
> +    }
> +
> +    macro_rules! impl_parse_int {
> +        ($ty:ty) => {
> +            impl FromStrRadix for $ty {
> +                fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error> {
> +                    <$ty>::from_str_radix(core::str::from_utf8(src).map_err(|_| EINVAL)?, radix)
> +                        .map_err(|_| EINVAL)
> +                }
> +            }
> +
> +            impl ParseInt for $ty {}
> +        };
> +    }
> +
> +    impl_parse_int!(i8);
> +    impl_parse_int!(u8);
> +    impl_parse_int!(i16);
> +    impl_parse_int!(u16);
> +    impl_parse_int!(i32);
> +    impl_parse_int!(u32);
> +    impl_parse_int!(i64);
> +    impl_parse_int!(u64);
> +    impl_parse_int!(isize);
> +    impl_parse_int!(usize);
> +}
> 


