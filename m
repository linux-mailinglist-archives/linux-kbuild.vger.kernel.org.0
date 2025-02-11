Return-Path: <linux-kbuild+bounces-5722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405EFA311D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 17:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D51F116151E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B409325A323;
	Tue, 11 Feb 2025 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YbHGVWOs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022087.outbound.protection.outlook.com [52.101.96.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A092254AF0;
	Tue, 11 Feb 2025 16:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292017; cv=fail; b=Y3EH2HN5dkNPkVO6CyMsm26gBMC1I/LK1LUdBpaJLJeeZAV/jSJv0mNVwBIarAFDIrJO0BGkBAP1voyemYDqfwEn2Axs1RdmSyw7KcM0KwWSEv7xwe7AUZiwHuN6I80yJOPlQd0Jdwfa1tBN39J2cPwY0xFT+I0xc21Uythudfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292017; c=relaxed/simple;
	bh=574mpSqUHXis1Yf14xkL3B6Th22By5kTXoBuD+sLJbg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CFpAlQgJ54lsY4t30zHz0s/sq5KJmSFM4cjnwfcRm6eErVI5v1pApLyimYAQQ+09Z4GSDUZgoF+GCDYyyv21fwD7DfDYL4tis3VOexFvefi2kTxAW41QulLkTaivWoEOCRUHlvJ1FUQjwjHH0cGxn/2nV8PXL3Gr9mJID2SkLns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YbHGVWOs; arc=fail smtp.client-ip=52.101.96.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqL0eFTsSPu/GG/JDP58ft3YBNsf2wN95ruZE4LJg8nWOa80zU18ZC1BofypQtASAVFKVdkW+SlQeayNwn3YBe52SDdyWNiep4MxwkGcYNWisJYd1HGhAYVVkakybS5za2qHgpKwI2yEb6XHeqkGqWXlrfz0vahf9++oPi1v/uVnIeB7OkG2yMt1Xfok7/bzG1Kii74x76zZPyoU0NnJvgn/7kucYO0RpkRz7e3xFZ4pPbrFvHqOGv8ZvJfSC1+duUD5nAJkqv5QvOdwmsPedxdWzuEOa14+HrWvWCcRKvV5CTyKZp/6kEgENSNPpOxGBu1oJ4SuiNUwwmO8LbQfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKi/uCq/Rq4YDy61JhuVuf8nZIr+Gt+rWw+6f9lJyak=;
 b=BZK3r6xcQZXUDNQRIHwVfJXVKPRbdLaLNE3RWs0up9gI4RwSZBQwOXwSMjabAJduN9Xepp3I15cCSNNNOiucmNJqGkp96uV4do4aUoyrTZcWZWcH9jd8JJpnnoqjnjrtp9xOi0wiypWCIvGa6tnhhTDy/iEhuWqWgFghmnQtsZomJw/QZV2/AU23iXzOCQopGNpVF6FQls7w/FBSs6dBqANYnsZu+FXDbP3z0f3+PTmXadj1VijJDXhVmexWDMoCpyKbsuZbDlD5Vo0srTrMJX52HOBJZu010TxV54MIRVAAPdpEeZbsJ/vAHZpITYTKXudAatkKJ0is4LiMK3ayiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKi/uCq/Rq4YDy61JhuVuf8nZIr+Gt+rWw+6f9lJyak=;
 b=YbHGVWOsbRqTT0ewY9iE76acan03cFU8UyYgIup7BJ92cgDf9cCThrTMZ7SZ8vD0+BwNREXChhpDXNfeMKuCloofKX5r+X2Cpy+DQxCEKHh7YHpoYBPT7orkf7ByaipIH1oqNLlpGLL7ganisoO/fh5jDc3sJdnz79SnqcV1COQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO6P265MB5904.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 16:40:12 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 16:40:07 +0000
Date: Tue, 11 Feb 2025 16:40:04 +0000
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
Subject: Re: [PATCH v6 2/6] rust: str: implement `Index` for `BStr`
Message-ID: <20250211164004.6de768c3@eugeo>
In-Reply-To: <20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0531.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::26) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO6P265MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c51f9c-51c7-4a05-5562-08dd4ababe08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5G9ZqBTYEHDnvQ1tmaxChBVWPp8FuBhCIXfu76eTbbcp8cvhuDHfVuFk2nuY?=
 =?us-ascii?Q?QbFhhjjoeyc/4EuiwxErHSWDjNbHRTb7H9cGh/VwH8HKdjKPqjWb6D/eE9AB?=
 =?us-ascii?Q?oCT+7XH1Uw1M2KMKGrAFFAQ+4h2XPoX4lPzGr+SUaMtU893OMAhOVZHxza4V?=
 =?us-ascii?Q?PFhVFZA3cx6+gyKhSKCGm2Ah0fxmZrJNIjKjqpivmYrmS7LtTfW3WtLRVUxf?=
 =?us-ascii?Q?VD8FLa/ZHx/NnUfv5V/s7qCyi6KDX1cWs/J4cGzWVdGqwowa9llz5D4dbKY4?=
 =?us-ascii?Q?R8AdpplyiDmFzTZG2Lyy4S/7VHpLgSWYKrW2XElj1fqomKx26T051ddtJVRu?=
 =?us-ascii?Q?E3kDdpZN2XBQ+gBOemdh4EiT5K6eyCJEGRiUqy7mRKNe3q8cKN5XVYBloJwJ?=
 =?us-ascii?Q?3Mwj1DHDh+gPG+LI4jBTX71u3cj4wjlRv5apUYNpqCNRF/637eBPTlICnVgn?=
 =?us-ascii?Q?He9LEJBi9awCZb25agB89xO8jVV5xjJy8BoJWNhyEb1I8ePQRxQjGcbauY/g?=
 =?us-ascii?Q?Faz2hB4te9Da1Tn9LQleKMHGA1YzUiRvDUIwJSmKyawwzdzCTprm35sMgvDe?=
 =?us-ascii?Q?9N3n7vmGBCIB2OQPmC+VqtT8sbH0Vm+fIeLsB0Hft3P84VpUf3Ush06OuGvl?=
 =?us-ascii?Q?bKlPCAK3YVcmkZqb9RF7WZN9gJISBg5q54fXXA7UlN/HWzBq0OZZlWmHzC9c?=
 =?us-ascii?Q?j0ZA1z7cQWZoshXV3jK4YwIFnKERgX6mfK60dcbZUOJhYLNrzbCnHKtj4B2C?=
 =?us-ascii?Q?mGDM5FmyulySE2dyudcJI3FeXO8QHegtoinVXtcIE6J0sCrkYFjKaRcoGwXl?=
 =?us-ascii?Q?t5daB2VN+c/92GnYQE6XgdQqEdb/v83JduAc5cjJtG+MYfN3Pp0wNPmLHZNA?=
 =?us-ascii?Q?fCmMxR2bHTm2qbo2dtwlyMFX2ZMUozRYV0PZ5MHf5/KiJldD8EafMTmWUI/L?=
 =?us-ascii?Q?AXzHPlNEzTQuKMymDTW+NWfAA4kV9W9PjfblrEnYETj/oFtvrWpzXr0y9gzO?=
 =?us-ascii?Q?aDU054no62uDczxLMV+LY3onubGA6lRlU2i9/Jjp3wlhIUfTuEemkig5IVLS?=
 =?us-ascii?Q?j6IHTKhlFUndtK0aR7XahKTRS841f07KxuF3cW6cHPGNuXmFbzxYu7qLJH9P?=
 =?us-ascii?Q?2zWXLy8DXJiUWNHPSC9S1nPtHeBrrSwnhb5717MkvHDr38qs74sGw+rb0Us6?=
 =?us-ascii?Q?/t+ZF7G8thzZ6HsYjalkoZip5XXQagCEmENJpIclnuuzJVTuJk76iSAnYT5y?=
 =?us-ascii?Q?tlsp6Jgwd7fu6gEDcE5nMqDX42RWchkiqncGz9j6gdNRrZjo5QXVB0/DsY+0?=
 =?us-ascii?Q?eB1ylAswtmwWE0kGSKhHf1brNGYsDZZ9pQteV2Zg/aADHXKdswoyJqv5BuKk?=
 =?us-ascii?Q?JQg0Bq/G7XGezYtW6w7Vl3Ct2Z/f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rcyI6kX+0/vNJjWfpxJigwXxz/yDQ5RPib0N+/5bJgee3TXl3nrwAq9RCly1?=
 =?us-ascii?Q?AjsU2ZygJHHdQQgXgd1R86Ii3+2DdMKPUb8pi9zvOjIfi/0uuar1/sqe2OwP?=
 =?us-ascii?Q?Bxys6ehYZOwtbi6KYb8k+qDoZJ4pGSq5mF+1UvFn85M4N+xeKLCnTOxDEDoM?=
 =?us-ascii?Q?5yiq8HbpFSJCt7MvVdPs2QfUesgpFc5gK/1b4mofTkehcKdJg7BVEHiJESwe?=
 =?us-ascii?Q?Sjtxr5hMJcDncJ7PO6oBkVn/kZ/xUj5YwM4EvqTjUmBP1PMDVCrCchYJy+Ki?=
 =?us-ascii?Q?8xKElTSqKKHSo7x5EKjPhg/4HtmOl7EdmXrFl1DENHqC06bdPfUXfgi3mGK2?=
 =?us-ascii?Q?t8e4PLid+JIk+3Ft1Nw3hYOQlEwCehaxE6Yj0peCICfqcTb4P1d0myncYDWZ?=
 =?us-ascii?Q?CszPKIEZKjd4DK7fvccwVSSC3OcYSHTqXukTozDe93BHl5vmGQrD4BTuZusM?=
 =?us-ascii?Q?yF1+Bfd14MN77rJ58nYObSLlMOXTakK82/bLxTx8agfOdgpegjXCYmk2dOKB?=
 =?us-ascii?Q?HJX7dpW3QIjkUmQobh88W1t1465HQ+12AWAL1K2WS2BG9RkuHBYQnozN7T6X?=
 =?us-ascii?Q?wnmD50hGqzNb7NaiIgLkK/YOOkMClVEfbecrwsOOAlUk6Tgx3jk4pbdZ+NLA?=
 =?us-ascii?Q?JSpqbAmAAljM4DVljZf0dh9XOpN12C2RiEnrZpgrXkRIyoaVeBsw/762sJG7?=
 =?us-ascii?Q?qe39h2vwvI0mXq3xUWam8Arf3n1v0+cNUCljaUbJ2Wuh7G+ekmVHgKtu3X5j?=
 =?us-ascii?Q?NvnaTFfpp1u4nVDesAap+wrm3avw4XNX9MF43WxPStGR1OUUHSol4rT5ImO2?=
 =?us-ascii?Q?KzRLbmZnxrF2jb1EJAFN4rw/Q1EywaVLmOwzREernrEkgRWUKBPpC9Yem/hM?=
 =?us-ascii?Q?bTWJcdN8VPLB0sVZ4zeNm0WijZ2LN11TXKFTR9nG75Jo5Xtyi9htDcboHTd7?=
 =?us-ascii?Q?xpqZsonZxJo8GlKu+yv7lARfqc+WkR+nTbBs5kpwlOta35kPhz2YQZKqWWpB?=
 =?us-ascii?Q?P27o5DxVwvRM9WB6IYI/eOAoqUfTSPJm3gn3Es2SOKJ53MqSBMsrEgdBdnZT?=
 =?us-ascii?Q?24YLzIuNEyFQ2xyNsiAXjpgEa8yvu0Ckxbiu83rTTYed187jBkvMCg2hmVDH?=
 =?us-ascii?Q?m+U+R+2V4jE2dATLg1AWoUkqaaXY7n7nxRSwoK7V14Iy4vY/sDx+HQ6taIkt?=
 =?us-ascii?Q?cevZrbkgj366YCYrPlFqy3Mr9nKdWWet4J4KJscPF2crGE6NAaBVC2n4TDQy?=
 =?us-ascii?Q?gW7BcITGEUAL5D0dOQ0roO2m2M9WBtOMrGeIjmfDkkYHMFn21zf7iDk5JrYj?=
 =?us-ascii?Q?IuLOVlNYhr8OgHGN0F49NuPVr3UwYnHnK9CWH0S+UhmiNFUnQmX4uvC8gn01?=
 =?us-ascii?Q?MyVva6fx1TKzrUW+y4LrlNNVzyq3mvAvyj4j7FJ1RXzLmpFicxiEKXBkC6UK?=
 =?us-ascii?Q?vDOtTcL6exhDXp941/G2b20TQNTEtgFasXxLbIIRq5INHO1WT4fU8IH1+13W?=
 =?us-ascii?Q?5+zG5JGJXkTHoLymyRxwrik0ABOhL/q3H901GF2H6Rcln9Acgd2STaqor0IM?=
 =?us-ascii?Q?IXP+3NuFIDeSjkEx+0ScXPCBjUgdnDVBnN/kBVna?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c51f9c-51c7-4a05-5562-08dd4ababe08
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:40:07.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIZSEuIOPreTMsghqg4dK3cughnrfw6hJ9R7s18DGRfbXwbEraGVaKml9vY4szbLAJ4Yli8upRBJ/ladALenOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5904

On Tue, 11 Feb 2025 16:57:36 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> The `Index` implementation on `BStr` was lost when we switched `BStr` from
> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
> implementing `Index` for `BStr` when `Index` would be implemented for
> `[u8]`.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/str.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 002dcddf7c768..1eb945bed77d6 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
>      }
>  }
>  
> +impl<Idx> Index<Idx> for BStr
> +where
> +    Idx: core::slice::SliceIndex<[u8], Output = [u8]>,

I think I'd prefer

	[T]: Index<Idx>,

here.

> +{
> +    type Output = Self;
> +
> +    fn index(&self, index: Idx) -> &Self::Output {
> +        BStr::from_bytes(&self.0[index])
> +    }
> +}
> +
>  /// Creates a new [`BStr`] from a string literal.
>  ///
>  /// `b_str!` converts the supplied string literal to byte string, so non-ASCII
> 


