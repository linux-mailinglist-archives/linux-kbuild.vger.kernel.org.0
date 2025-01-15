Return-Path: <linux-kbuild+bounces-5495-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D190DA12BE4
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 20:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 085BD1887E6B
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 19:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9378F1D6DAA;
	Wed, 15 Jan 2025 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xDIPDpbl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022125.outbound.protection.outlook.com [52.101.96.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3F71D5AC3;
	Wed, 15 Jan 2025 19:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736970156; cv=fail; b=VpenQ+l9Y7OxQIvJ5yzM1jVspRijaUwWCVPU3B8wk/iirPlDaN+0hDW64FGKb2YO4PXcsRdng7cxFPjHeehjqrEhRLx1wzUpgXajBIMdv5wLW6IZec5wtSk6jjPmYJg+AqBNMDDBVEqj+YodjAy+ZpejhO1+Ax1CWASlgGUhqWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736970156; c=relaxed/simple;
	bh=3cVDv46WhssFxWTBRQKQgO6hvO7CsBbzK/Mr9berkZM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NNbH9TNP5i6WylnSDU3yHf2ccxGXIexshQJjsu4OLDg/Jml9HiLLhk5XWCik7bpFlRo7hW1wi12Hfvsl/fiBKRmMYpOYtN8YkaMMPey74mQfZZTSg3H+BIR3LS+GMtDzmtPwQqrUpafy0Nb/pjvqEwc5gxJ+SBDlDQ4R9lYpb0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xDIPDpbl; arc=fail smtp.client-ip=52.101.96.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1MW9XEt3xI/WUwdc2m0xkmXNvWCzTXrA6eY4YunqOk/dyJ3OgYDVXoqFde1xpAmd6pTtFc6FgnSXIJxiG0C2+cT2Bkz1Z6HvXskM2H5arLXPa9jUEwCgEq1ieZYtklpBzA9//y41y4pomuk8rKvjGranCKzavoz1qSTcS9muIAZSRuAHSKb9sD0x54S+38Cw0vpqrKMqCEmpJ78jZsQSnO4H5LpoI/YsI0b2dtNIucCw8wiJmpU4ZwCPpX2R+jO2yNwkq6dHdjsjr1oRzz1Drq/01pPiwX1dQ/pDWoyQ1xdqficosu861t8CgIM4X8AtVloB2Vc45zsbzM6gVf2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lYbatbeqIuDwdjhewBDe9mfh9q5h0/eFIbz7WRo1O0=;
 b=gXAkYeQO/LBGgakTXMi0LwfEHfHAR9iRI9Zeay1fuyQ9zbVBXiGygSCTeNueb6xl/SIlU9hgK4dkQk5IHShTaebjL3HsqrLUTdh+In76jCWHyM6ivOfk+/Jrrt/sL91KV2tPdpuqUqh8sPvqP2pqmLo/s6Eul+SfIOx/ye81Fv7Gatenze7ZHIBNwmVPLdnS/5aCv9P4JsWr9ip1yntaUpQk6GwN9MiXU0AXHqm+0Phgu8ZzIZefUptBOMZYMd2u82EAx8qjR/aRe5lGIUUJPcRSOChUQjvJRWkBs06zcIjSD6SKyKVuS8sY/6LgjsQly8AuPmDe9ek7tI7yFYDD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lYbatbeqIuDwdjhewBDe9mfh9q5h0/eFIbz7WRo1O0=;
 b=xDIPDpblOsue23Vypi5+MySalLSL06L2i/TtJZBXoOMbuWbLIEdhAJIW+VBpJG9nS+2qPFvK3y4nR+36jzS9Oj0M1WPlOMOVERz49wQBpfyshqfk070y9tH3f/oapV3KM8n2M64Pt0QKMIAzWAUNqgz/pRELpGyGMFm96cKd+vU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO3P265MB2092.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 19:42:31 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 19:42:31 +0000
Date: Wed, 15 Jan 2025 19:42:29 +0000
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
Subject: Re: [PATCH v4 3/4] rust: str: add radix prefixed integer parsing
 functions
Message-ID: <20250115194229.04cd1068.gary@garyguo.net>
In-Reply-To: <20250109-module-params-v3-v4-3-c208bcfbe11f@kernel.org>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
	<20250109-module-params-v3-v4-3-c208bcfbe11f@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO3P265MB2092:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fd9302-fa1f-4b8e-2e6e-08dd359cc052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kglXaiiiHCSlqGtCRlQvX4SOx6WVh1rTWcOsHx1W147iNTKqTKKc23ZW4/f5?=
 =?us-ascii?Q?heOsEEpAuczhPgkSBHTP+39lu70Z8+veTM9EzbqddCCWv6z2PRWsUTA7Dn9K?=
 =?us-ascii?Q?QSpIzx/4NZJYIyxqco1f37/K7N7FJYDG5uOwVVnALvIY7J2d8btHbZFf9XOo?=
 =?us-ascii?Q?FsrG56urAyQDFiZm97nCl5dAtOco44M0Ttj6cDTSXKr0oCPwROLaGLqlrB+x?=
 =?us-ascii?Q?V8K2mAxDwRt3dTipafeVF6qvzhHL95v6uH4OPMYrFqXPDEP9Yic2MOaUtzAT?=
 =?us-ascii?Q?eJL3YLFGq8V032F3UzKtLTFdU75LzexeCZcywq7GTw12yraRiraHyjyvDpBJ?=
 =?us-ascii?Q?3gtunWvxVb5HtGDoWfZrpDHpTxxSz6T9WRLt+mc+E88j/BoF/MLAXMDMyyGy?=
 =?us-ascii?Q?AEWOy8CKcbPM9TYJJ7AolF9caY50tlR+yw32KNTf4MHNX4gJe8jWHvz+4HpK?=
 =?us-ascii?Q?aq/Ap7GAvyGJ3GxdY6qujglLc0W1Hskut+u5ycViMWDYsnKzzQCAC7Zz6VCU?=
 =?us-ascii?Q?LTGQKKUuWnutalsoXxJvPxdszIw/+Uadg6xYhTY3xXw02IZ8X8W2yldev+lj?=
 =?us-ascii?Q?aa34ThRo2lSyxuhSsQ8EMavq5vmKJsY34I6+N+tg9PsOz6U4+BGQIolUuUBI?=
 =?us-ascii?Q?RMvtFqeu/jd2vuBqtBfj/qrGbAqCMINCIHBYrxewpQ/ubOW8lWLa2oAUho2A?=
 =?us-ascii?Q?p272S+BA2BISC85holkd6wFQ8h85KXpwrxH/zcE5iDMuVd3VsTjnaZFrEZ3v?=
 =?us-ascii?Q?3XlYrA5R4TzKpIpZdKSLiQ3RqWGcRLn05nLrD0jkNR46BHwFq2hyo79XrlgV?=
 =?us-ascii?Q?8RjU5nauE5RKndfCrO8OuNTSDTQiSdASlUmNJKWTxg5S3EwVhOVKL2c/QbYT?=
 =?us-ascii?Q?x2i6yCzT5g7xiZ05ul8DV3xegTuqpbdYxuBqtXL9WfvABpN32CHN2Cwxyodx?=
 =?us-ascii?Q?x/I4z/Uk28JtowhBToA4VgwBiTxlnymxw7QvLFtnSqWkvmmnO6K5BjPCfTxY?=
 =?us-ascii?Q?k7JTIr6yIaXQLTnGqvPj9v+DrREm6l4C6YYpWSe9JYyah6lx4VL5faHPSWRf?=
 =?us-ascii?Q?T/bEj6PNoivUh2ipnKPbJ/iNjJVEVKrUBz12czZK6r3Qe5c7bCIJ0wV3xOyG?=
 =?us-ascii?Q?Su0Z/x1U8ModqKmrpAXhXyc6O7AB+BBn1+AuhLXyaGRSBEZiLfFOJnqfVIuO?=
 =?us-ascii?Q?CAYyNuC97aZ6c5/xUOQWpiQX2ANUea9VSfdUwXb2i69wNHiCioH/XsrxI96L?=
 =?us-ascii?Q?00RjR+1kAkwmLodwpmxP6xRG2nMhdmhf7AgDsXfSvEOQnIHrozoB6Vinpdaz?=
 =?us-ascii?Q?/PlAj+NS7O5IrMfECRSx3FyqH51T3VAimj+62Pk9TE3NCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?45YE3EgA6w8uepbjPlC57BIF55YgftP1i/NrqdnBJIMDu9mAN4mnBRv59NuD?=
 =?us-ascii?Q?J0jdCYmY1F238ZE48ySBnO+V1EKNzfWcxJ3RCecU3Xo4Nn979Ht4fn72dJcm?=
 =?us-ascii?Q?AApbjU2X+3196Gr89eRKqxwoL3cMJgWWsiF62F468a8AyRfYEio0VXDX4e4A?=
 =?us-ascii?Q?oBbv8n5KMJSiZvCE4engULzqK3DXgfL5e2r9rW9nlVtB5B1OnfFb2Yp0PxaD?=
 =?us-ascii?Q?48Vk7tKHjfrN3QORYatxAhekLZx6LJNiviC74t8l7y4MRjQjimeKLZe5PB0e?=
 =?us-ascii?Q?jKuTjU5vlV0TsLzS/UUou4aaFO7+4lAGEg9z5P2afFSJhap3mGJEkM+lDwIU?=
 =?us-ascii?Q?LgppN6rJ4mNk8rNqdIEbMOjYesbCcdwtcRacNcm68DcvrtHZoDoIXc7ZFpJt?=
 =?us-ascii?Q?dRjc87k6Trk2/NzPMPwX3FZZSefo2u6aU24gDLm0+A4WiaG+Ml185oW9dDyR?=
 =?us-ascii?Q?cf+wAvH1reK7IeTTQ1q46t2dAyl2TZU+p8xyAGEWA4kDNyUd083Y3Yu31mYz?=
 =?us-ascii?Q?iYTVM70gkL7XTkdjHKeL7iXhyNNMWomhxxZ51maXxNMUNCjugO3LqzzU5vIt?=
 =?us-ascii?Q?YRUNtjlKXDPNjADGo7C2Bk1rLC7fsuI27SyCI2ZqEL64wuzUtcGByzucuDQi?=
 =?us-ascii?Q?fx/B1PzFUjmUaiTZHOAneXlFd0TPBPJBuAj+reL/t5VvNjCVJUCQ5kZ//qQU?=
 =?us-ascii?Q?jqHYbuKGlRQTOH9dMi/dkCm/1KPDa4rJbcpinDZDQYhG0W8HM1jkJN/M9oM7?=
 =?us-ascii?Q?uek4sO0vhREf6BHu/DyETHLXT5WTn6qKLa/e+TYypE1sZRmM16adLSOc59rm?=
 =?us-ascii?Q?6GcRbKLT1x4OoR3ZU+kJPDm1HEW+hymQqz6DzurbG8l7Uc7GLYyTOT0jMAUq?=
 =?us-ascii?Q?fo6BWTGdDhS5RRoSwtOWGIhKeL4fkk984huje/alNfeVRctTz37QYiXm6V0Z?=
 =?us-ascii?Q?Ki66fC4VNow6dQxM8nqCvaf4rKXnMQnqGO6WYqMF0Ifwb65d7Gsat0otGjPR?=
 =?us-ascii?Q?iGDy6oxS2AcVYE0tHyWchtPqYzDCEs5My3AVWv7KyT/IsQdKmpYLStCKNzHi?=
 =?us-ascii?Q?cW0+G2VtdmaO4GGQbiGXLqbGL4rmKSQ6D9C2WXTsIGOqhYMv7VafrGEC1fR2?=
 =?us-ascii?Q?0Ciu8u/dSSykFrG8MYOqvTHV7sKQb7WWbAJEZOLoBIVffIkukmFeZIkwUa7+?=
 =?us-ascii?Q?c6Kv3BQ5BeQf0eHSDbD/bX5HY1tsHrleHnLK8I+xCnjUVarqmLaOjayOBrSR?=
 =?us-ascii?Q?PPQOduMN6pGnN1oUO5NDwovsi5q2lZTqvcZZj5tXlIOBrIlMcZl+w70ciWFD?=
 =?us-ascii?Q?OqYCoc5Qf1kaYVBrQu1YI7+YsCJop/6CMsmjS+8Kof8Z5/CJ4TJXojJs90T0?=
 =?us-ascii?Q?RH1TFHNBTnvtuu+pq4DJw3pvz2Y7M0QT0uf33GljKOO15cMLKGmsS4ESGQ0L?=
 =?us-ascii?Q?b0KXZkynwTXjSFck8VEJ0lu/ZQAxTZw+c4WAzdkkuJV/j3E1jYwzbmfF9+Ha?=
 =?us-ascii?Q?U4WXgWufPsGjyIg49xnWMD+sATSMp08ofGQoHb8BlxA1km7kpiF1OrGUQp53?=
 =?us-ascii?Q?lBR5anhCRyywtJoMxXN4mybH7k7vR/v2IkWnh1gbxT52vZa3wc+aOTMbzpNz?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fd9302-fa1f-4b8e-2e6e-08dd359cc052
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 19:42:31.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44y+62XBdTDTRj4YnBWKyA8H6EhJyqlW60+/wx807K4+jgYtwnqaDr1zPRTFnnxaT5ySyx91NctGZNR7z8/AwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2092

On Thu, 09 Jan 2025 11:54:58 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Add the trait `ParseInt` for parsing string representations of integers
> where the string representations are optionally prefixed by a radix
> specifier. Implement the trait for the primitive integer types.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/str.rs | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 9c446ff1ad7adba7ca09a5ae9df00fd369a32899..14da40213f9eafa07a104eba3129efe07c8343f3 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -914,3 +914,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
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
> +        if let Some(n) = src.strip_prefix(b_str!("0x")) {
> +            (16, n)
> +        } else if let Some(n) = src.strip_prefix(b_str!("0X")) {
> +            (16, n)
> +        } else if let Some(n) = src.strip_prefix(b_str!("0o")) {
> +            (8, n)
> +        } else if let Some(n) = src.strip_prefix(b_str!("0O")) {
> +            (8, n)
> +        } else if let Some(n) = src.strip_prefix(b_str!("0b")) {
> +            (2, n)
> +        } else if let Some(n) = src.strip_prefix(b_str!("0B")) {
> +            (2, n)
> +        } else if let Some(n) = src.strip_prefix(b_str!("0")) {
> +            (8, n)
> +        } else {
> +            (10, src)
> +        }

This can be done better with a match:

match src.deref() {
    [b'0', b'x' | b'X', ..] => (16, &src[2..]),
    [b'0', b'o' | b'O', ..] => (8, &src[2..]),
    [b'0', b'b' | b'B', ..] => (2, &src[2..]),
    [b'0', ..] => (8, &src[1..]),
    _ => (10, src),
}

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

I don't think we should allocate for parsing. This can trivially be a
non-allocating. Just check that the next byte is an ASCII digit (reject
if so, in case people give multiple signs), and then from_str_radix and
return as is or use `checked_neg`.

> +                    n_digits.push(*sign, flags::GFP_KERNEL)?;
> +                    n_digits.extend_from_slice(digits, flags::GFP_KERNEL)?;
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


