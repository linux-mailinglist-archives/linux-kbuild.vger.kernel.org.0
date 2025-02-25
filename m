Return-Path: <linux-kbuild+bounces-5906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A16A44419
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 16:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130E1189BCB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 15:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B5926BDA3;
	Tue, 25 Feb 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LpkhGqzi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022093.outbound.protection.outlook.com [52.101.96.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9CF26B0BF;
	Tue, 25 Feb 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740496464; cv=fail; b=uo5gKXyh+45OVzUUqwgAzo7BJi/O/2kcVVRJb/abz8q68MsQp0jzZCycA8QgGzzymIgHgNI++UBnTs63jEPUSKMvH2ZUMO/61v7U7oxYaSm8roTpQstjlkUcHIZ2N7K+7KJNAkW7gJwg98WmheePqnNbxT1p7MnEgNmwWFKg+HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740496464; c=relaxed/simple;
	bh=nCm3y2BCgmf+rZYs7jwlUu0QSkOkUZ+3v1bJdP/LGY0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VzQ8K1t8t2mwq1Py/PtT+PQSNM6655wV6eJv0u2ftogpATdiiD6eYH1UDTcJKZGkdNB9pc5Uf/hDqIgkb2c7aLZCo4Lf3jmPk5zNl3/o2M2b1WCOESvY4AmlU/orU2zCjzJsq/8PkQUueS125IIuADrzxx3yPgFtElmtjHyeZp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LpkhGqzi; arc=fail smtp.client-ip=52.101.96.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s127KXY23PCztTtwDNck6smIq7lM77IPartacTaIJa1Q5L1n9yG4tSTDXNxyVLy8yfRBBWSnZ2HUda6UEzkKoivtCMnZzAuHqLBu6a4yzEAB98I5lhgkRwbeg6m0DvyKcEhEhGk+LHMH9kZ3esbLgI66mZIZrxrC3jKn5jYLsmCgSrxxo53xlu29aRo43hcLAzQMIIrnkjuc9cNYIgaI3SP/Z6sutmoAQzM6rKBpmR4yogS4p+eTezbmE0VuyT5CnO2ku3dz+7O/A22yWqy/pHm7r+1GR6Nb2qmeWltXFWUghE2p9L3xGxMvQtVn8IKOTEBs5Aj6qvuyoZCZYBTl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcE7AJS4cGFVEcpTM8sZpDw4IcrXvlwvhRPUbIcJN64=;
 b=m5I+Qs4pyIE8OpGURK99enAencIha+ptyI5+Oe2sJ1aoXfJg/uA33xzEbnf7RgZf0jOvsNj1nTqTyq9WdH9kVrtdH/lJZTGA2HzEFobeZQxcK8Ks0L/lQyf2mBZpQu9oC3gRrwMQ8ECA2Hy3zeUX2imuM6ilrandc2vBHUxeMB4EHBnTDbm3ZN+FB9JyokAdW4m03L6qWPeYGnLy9YUUY133tVLiD1pj3wZQC0c7o9NtQr6vENsN9LSmXkqBA5Uwe8O/qkrrwTeIqu11a1ozgtDMJOAE5ITO6SBa0S/SZuZCnaPOnjB8dRwwkUvWDAyVs8XP163DdBgRwPHKky6ZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcE7AJS4cGFVEcpTM8sZpDw4IcrXvlwvhRPUbIcJN64=;
 b=LpkhGqziLzPNo2Dwl6LqB7GAkUMCuRlcIRvTe4INPkSullVbeJHC1QVF4d033oIjvbt4N+t+c+baPnSX5SV9dHFEpjHAo8RmPfpwdjBSA5OWKwmfyU33ayLeWR4xhBHmjjPfalaENwVfJN2VQ7lPZ3yIb+fZsSKWWqPTMbeD6eE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB3121.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 15:14:19 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8489.014; Tue, 25 Feb 2025
 15:14:19 +0000
Date: Tue, 25 Feb 2025 15:14:17 +0000
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Adam
 Bratschi-Kaye <ark.email@gmail.com>, linux-kbuild@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 linux-modules@vger.kernel.org
Subject: Re: [PATCH v7 6/6] rust: add parameter support to the `module!`
 macro
Message-ID: <20250225151417.7805b697@eugeo>
In-Reply-To: <20250218-module-params-v3-v7-6-5e1afabcac1b@kernel.org>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-6-5e1afabcac1b@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB3121:EE_
X-MS-Office365-Filtering-Correlation-Id: c99edb37-c7ab-426b-623e-08dd55af137b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YTexDWIx3h5ufp9xcwQA5h4vWfNeK4GLtM0LfCnizXww9AlqBSj27kCRThiI?=
 =?us-ascii?Q?OZ4KMRTJXmLrW/2VNHEfFPQg04jxJbr9NLjRqW30aQDnU4dGBJ3KvbKDB23w?=
 =?us-ascii?Q?rSNq+BIRszxoRhmgd73M95A1KuwXtjwNAXbbAwlOPACKT9oSSEYLmpk3UsaM?=
 =?us-ascii?Q?q1y8z5zGpA+eh5e093liyP/U0VvimBZB7qrS6gpETo9k09Tu21aDMGAUtos1?=
 =?us-ascii?Q?0s6/7YMCn1+oj1ySdGvTf5hwpd9vXaHqX5Esc9u2QKW3fpfFjD4sxh+2O6lt?=
 =?us-ascii?Q?muHPpgH26dTQlAmxw8DpCJ2S9OfUVJkNd75Gb0hYkDC0BSJhYg+xFTHejxY0?=
 =?us-ascii?Q?g0Trapl5F9e0plttdVt/8JNiNPLqHmZeZO8mtcWGcqQjp1GdEJLMI+jI2hLL?=
 =?us-ascii?Q?kAimJfOFZgwxXDd2hyV6UlP7D63ghj3OY3vsk7FL2pzBdn90VdkxTYrgHxdN?=
 =?us-ascii?Q?7n5iwCOrcXDDdFiA5jtqJYeuPDIKQ5S9+ca9+XwU/z0QMTMyrE2dwbVjVvK6?=
 =?us-ascii?Q?UW9oyjp6n8ipYqbJJKygYnqN0NVYb9XHuvR8njtyGBeHMoZndr9VM2HkGfDP?=
 =?us-ascii?Q?H//fXLEgnv5/KlnWzIG35s1ucyTpILzSU+LP6zIHqMH0lCrvBUhKLlIvBbYU?=
 =?us-ascii?Q?FvJ3NMeNmiOSSKV/QO26RxmQ7X7v/vGXQz+JdKuZtt9g9XBQFdGWrryRI+NA?=
 =?us-ascii?Q?eUpEnix3fzi7gRW0C6kPhqaEyypITUpu2k55mQULHfx2zSyAcB8g4XGjEnW/?=
 =?us-ascii?Q?ViAqsv8FJGjDPo+7raJHnlDaLEOPmXWmRmD/aXRRvfwWNAmeS5b7T3JLZw2R?=
 =?us-ascii?Q?dwBoLX8z2iXBFs5OlyZ+YK2oWgg5DkUDz2RQPHD14zeq8mOeDXUX2mFMI93O?=
 =?us-ascii?Q?v6NpmruKuMX6DkIycl/1uKaeGEP5m6HUAWJA4hL9oO/W1b8w8Ap0K3Jd1Mjv?=
 =?us-ascii?Q?/o4V9V3CAVf8/ydOLzdZBdLZfdxTiT2fb4bbjBpxKK7VjZyLOWFze6ZQiwi4?=
 =?us-ascii?Q?Rv/wlUeDdTpOEA6vUTSk84Q8FHCubWZT3l9Sx66Zl12anLv6knRrdZhXXrXk?=
 =?us-ascii?Q?YkPpZ2dzVtyn9gBOk+zFiZt/DQgAu70ahK5M8Bl29DAeiniD2dmpjnz199vN?=
 =?us-ascii?Q?aATZ5wvlvNdohGLWnMqAzb+wZyaOU5vRQlouGBz6zEBgyrExyX7608NL+Ae1?=
 =?us-ascii?Q?r1phnjzDMbx4vEgrB+t3FWRdGUvtTPcY0/yXTnysJyq5b4UxpurcCydOPL2A?=
 =?us-ascii?Q?8LDfKOWezL1aL6Pruj766JToHDyxQp/pdmfp8k6tHf5KHSzNQA/v0xdVzSNO?=
 =?us-ascii?Q?nm/AV+SvuScC+PH4Rtxr4V/C/BxqycFFfnZxdP2wywhsL8cf9nx6vpvy18B8?=
 =?us-ascii?Q?OWsBwH+ng08hQeeOeZHcuPZGZULj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vm93QmPT/hISMs6yvqdM8TlCpv3rt8tkZ7eQO9Gf7dhEWwJRk99liU31gWqi?=
 =?us-ascii?Q?UUzI822qgs0F9ztQYk1dXaRI8dZyyK8PEiLXd784YJWRSr059z239mh1nRCt?=
 =?us-ascii?Q?0tCmnC+Sj8RZeECi4G1WuSvFnU3ujmd+cTeTKi7fBZlLFs1bHw5+Uj0K8ZQH?=
 =?us-ascii?Q?XgzBi91IJVIGs5kIEbby6M1p0meaz8JgZEYd9gzbvZxJOq7Xv7L0v47zic91?=
 =?us-ascii?Q?1GLmFOLgDVbEZsH95V3csK5yQ1+McO3zF/4ZOardho2uIISv7LUAAerxUlhH?=
 =?us-ascii?Q?2XjZth69XFXyUKkLyQJjbhnQ8ByKZ06eUaNCKfWP5HdEHJ8/GyU05GznoyVr?=
 =?us-ascii?Q?P7C2zrgagSqdFhcQopWreR15L5baCi1k6T0zdhn4yQQkJz8FKPwgV/otPO2Y?=
 =?us-ascii?Q?WhmRglqJAHVbFVcYlXYxD9t++b1Z25ug9m5T80RoiMddk4KCW7M9W5878eNb?=
 =?us-ascii?Q?jJFfikM3Rqccg5a7yfnrfAWWULbWnq7V0O+EXglOrxxdsFL1bByuReLI45X/?=
 =?us-ascii?Q?otFo8ympeNNV9Ll4KzbfY7x0wnOWOlYHInS7y2hIE47aKyvGtrTcn31usYxF?=
 =?us-ascii?Q?t6klVBa0Zc62uGX8Fj6q0UKfdeMxsfwnBTrmvRJoSejPuJExoc91SXOeWu++?=
 =?us-ascii?Q?crFTa6ascjLMm+5NccSegwGB+HDSU7wvpDp3zoU+8obFy3k4BIg148mtCCe2?=
 =?us-ascii?Q?sjfB6ObfQCk36zMVxadmQ/EvxJ2qn0GA/aKYQMFF/ne7YFlcnmPqMIb6yH0u?=
 =?us-ascii?Q?laGg5oQT2eT4yBxYzXo+dkfGrM+8w1y+kVBEyAOm4p/Y8ya6n8fa88GpV3Rt?=
 =?us-ascii?Q?RMTIshg13Pa0W+ZLj8sMEr/8EX3VM0rF09kvsRTFq/xuk/wrsXIiPa6AM+ED?=
 =?us-ascii?Q?eZXbcmWYlvpEdW7xv2RUPn6Gf1fjcEyrSz7QKGdT9uateVQcd7/9DD3ZRPfq?=
 =?us-ascii?Q?LEM6X9l6EiUgmDciUkhvozmr+LFa8Juh8IJjCnm+pSLnzoIP3DFfD3tbbtLl?=
 =?us-ascii?Q?rmB5aYp96qQul5tRwHon8eLQDlFiH+ZZGUSUl+ChgEQUnq8ML3Vwc9gq0J87?=
 =?us-ascii?Q?ZqbDCLWqxLsnytP92NPZbASr0DMB9rAU1dgd3GtVd3Vd9+Ocuow/oWmGAFKr?=
 =?us-ascii?Q?zkJjtAozR0bk7b3P6CkBfhgfRPz1bMKzIKtiwQcpiiMg/vejvRqXc6Z6h7zW?=
 =?us-ascii?Q?ooa7UMm2hTcE/WW2d726uT1O8oE7Xb2IwnUc6AEEws6jdgD33X8kEEyNlq/m?=
 =?us-ascii?Q?UnbFMrZve0Wl1n1zT8ZRLXN3oPI22J0yJdgAVxFNifS7mM/G+y8iEaVz9rR0?=
 =?us-ascii?Q?TNi/Xtih+WGC4+YUovAEomd0O/HkrEDW+F5m5lqtvccnwJ2lmoey8tzfSi5q?=
 =?us-ascii?Q?1QonmpSqx+M46OWkK4TtiE0VfOdbu108U8kP6gwSmaTGSf2ivSw1FtrWiVdv?=
 =?us-ascii?Q?7g/rwt3hBr+yVOW8I3B/T/IR6NBfIZ5DNIvmEpLq4ivz1jedMtk9KrCVQI/i?=
 =?us-ascii?Q?bGmuZO+5nWcRRuGev4lTQDb0YrYQGZK3TeGLOWutUZzndY4mdRqCNNTPZjHR?=
 =?us-ascii?Q?cpsEL/FJV8P8tYc6lWn0Rx+c2BeSLAIyb5jU3opP?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c99edb37-c7ab-426b-623e-08dd55af137b
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:14:19.3135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59vNpvOG64pDqikdE0OYe/rAME8IV35UNuTQ2OFVIrbMuTJuEKZEOnUmKYwPS4LLb2SHnOnpQ2KVn1AGK8JxHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3121

On Tue, 18 Feb 2025 14:00:48 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> This patch includes changes required for Rust kernel modules to utilize
> module parameters. This code implements read only support for integer
> types without `sysfs` support.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
> ---
>  rust/kernel/lib.rs           |   1 +
>  rust/kernel/module_param.rs  | 226 +++++++++++++++++++++++++++++++++++++++++++
>  rust/macros/helpers.rs       |  25 +++++
>  rust/macros/lib.rs           |  31 ++++++
>  rust/macros/module.rs        | 191 ++++++++++++++++++++++++++++++++----
>  samples/rust/rust_minimal.rs |  10 ++
>  6 files changed, 466 insertions(+), 18 deletions(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911a..aec04df2bac9f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -57,6 +57,7 @@
>  pub mod kunit;
>  pub mod list;
>  pub mod miscdevice;
> +pub mod module_param;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod of;
> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> new file mode 100644
> index 0000000000000..0047126c917f4
> --- /dev/null
> +++ b/rust/kernel/module_param.rs
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Types for module parameters.
> +//!
> +//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
> +
> +use crate::prelude::*;
> +use crate::str::BStr;
> +
> +/// Newtype to make `bindings::kernel_param` [`Sync`].
> +#[repr(transparent)]
> +#[doc(hidden)]
> +pub struct RacyKernelParam(pub ::kernel::bindings::kernel_param);
> +
> +// SAFETY: C kernel handles serializing access to this type. We never access
> +// from Rust module.
> +unsafe impl Sync for RacyKernelParam {}

I wonder if we should have a custom impl of `SyncUnsafeCell` for this
kind of usage (so that when it is stabilized by Rust, we can just switc
over).

> +
> +/// Types that can be used for module parameters.
> +///
> +/// Note that displaying the type in `sysfs` will fail if
> +/// [`Display`](core::fmt::Display) implementation would write more than
> +/// [`PAGE_SIZE`] - 1 bytes.
> +///
> +/// [`PAGE_SIZE`]: `bindings::PAGE_SIZE`
> +pub trait ModuleParam: Sized {
> +    /// The [`ModuleParam`] will be used by the kernel module through this type.
> +    ///
> +    /// This may differ from `Self` if, for example, `Self` needs to track
> +    /// ownership without exposing it or allocate extra space for other possible
> +    /// parameter values.
> +    // This is required to support string parameters in the future.
> +    type Value: ?Sized;
> +
> +    /// Parse a parameter argument into the parameter value.
> +    ///
> +    /// `Err(_)` should be returned when parsing of the argument fails.
> +    ///
> +    /// Parameters passed at boot time will be set before [`kmalloc`] is
> +    /// available (even if the module is loaded at a later time). However, in
> +    /// this case, the argument buffer will be valid for the entire lifetime of
> +    /// the kernel. So implementations of this method which need to allocate
> +    /// should first check that the allocator is available (with
> +    /// [`crate::bindings::slab_is_available`]) and when it is not available
> +    /// provide an alternative implementation which doesn't allocate. In cases
> +    /// where the allocator is not available it is safe to save references to
> +    /// `arg` in `Self`, but in other cases a copy should be made.
> +    ///
> +    /// [`kmalloc`]: srctree/include/linux/slab.h
> +    fn try_from_param_arg(arg: &'static [u8]) -> Result<Self>;
> +}
> +
> +/// Set the module parameter from a string.
> +///
> +/// Used to set the parameter value at kernel initialization, when loading
> +/// the module or when set through `sysfs`.
> +///
> +/// `param.arg` is a pointer to `*mut T` as set up by the [`module!`]
> +/// macro.
> +///
> +/// See `struct kernel_param_ops.set`.
> +///
> +/// # Safety
> +///
> +/// If `val` is non-null then it must point to a valid null-terminated
> +/// string. The `arg` field of `param` must be an instance of `T`.
> +///
> +/// # Invariants
> +///
> +/// Currently, we only support read-only parameters that are not readable
> +/// from `sysfs`. Thus, this function is only called at kernel
> +/// initialization time, or at module load time, and we have exclusive
> +/// access to the parameter for the duration of the function.
> +///
> +/// [`module!`]: macros::module
> +unsafe extern "C" fn set_param<T>(
> +    val: *const kernel::ffi::c_char,
> +    param: *const crate::bindings::kernel_param,
> +) -> core::ffi::c_int
> +where
> +    T: ModuleParam,
> +{
> +    // NOTE: If we start supporting arguments without values, val _is_ allowed
> +    // to be null here.
> +    if val.is_null() {
> +        // TODO: Use pr_warn_once available.
> +        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
> +        return crate::error::code::EINVAL.to_errno();

This is already in prelude, so you can just use `EINVAL` directly.

> +    }
> +
> +    // SAFETY: By function safety requirement, val is non-null and
> +    // null-terminated. By C API contract, `val` is live and valid for reads
> +    // for the duration of this function.
> +    let arg = unsafe { CStr::from_char_ptr(val).as_bytes() };
> +
> +    crate::error::from_result(|| {
> +        let new_value = T::try_from_param_arg(arg)?;
> +
> +        // SAFETY: `param` is guaranteed to be valid by C API contract
> +        // and `arg` is guaranteed to point to an instance of `T`.
> +        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
> +
> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
> +        // access. `old_value` is pointing to an initialized static, and
> +        // so it is properly initialized.
> +        unsafe { core::ptr::replace(old_value, new_value) };
> +        Ok(0)
> +    })
> +}
> +
> +/// Drop the parameter.
> +///
> +/// Called when unloading a module.
> +///
> +/// # Safety
> +///
> +/// The `arg` field of `param` must be an initialized instance of `T`.
> +unsafe extern "C" fn free<T>(arg: *mut core::ffi::c_void)
> +where
> +    T: ModuleParam,
> +{
> +    // SAFETY: By function safety requirement, `arg` is an initialized
> +    // instance of `T`. By C API contract, `arg` will not be used after
> +    // this function returns.
> +    unsafe { core::ptr::drop_in_place(arg as *mut T) };
> +}
> +
> +macro_rules! impl_int_module_param {
> +    ($ty:ident) => {
> +        impl ModuleParam for $ty {
> +            type Value = $ty;
> +
> +            fn try_from_param_arg(arg: &'static [u8]) -> Result<Self> {
> +                let bstr = BStr::from_bytes(arg);

Why isn't `arg` BStr in the first place?

> +                <$ty as crate::str::parse_int::ParseInt>::from_str(bstr)
> +            }
> +        }
> +    };
> +}
> +
> +impl_int_module_param!(i8);
> +impl_int_module_param!(u8);
> +impl_int_module_param!(i16);
> +impl_int_module_param!(u16);
> +impl_int_module_param!(i32);
> +impl_int_module_param!(u32);
> +impl_int_module_param!(i64);
> +impl_int_module_param!(u64);
> +impl_int_module_param!(isize);
> +impl_int_module_param!(usize);
> +
> +/// A wrapper for kernel parameters.
> +///
> +/// This type is instantiated by the [`module!`] macro when module parameters are
> +/// defined. You should never need to instantiate this type directly.
> +#[repr(transparent)]
> +pub struct ModuleParamAccess<T> {
> +    data: core::cell::UnsafeCell<T>,
> +}
> +
> +// SAFETY: We only create shared references to the contents of this container,
> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
> +
> +impl<T> ModuleParamAccess<T> {
> +    #[doc(hidden)]
> +    pub const fn new(value: T) -> Self {
> +        Self {
> +            data: core::cell::UnsafeCell::new(value),
> +        }
> +    }
> +
> +    /// Get a shared reference to the parameter value.
> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
> +    // held lock guard here.
> +    pub fn get(&self) -> &T {
> +        // SAFETY: As we only support read only parameters with no sysfs
> +        // exposure, the kernel will not touch the parameter data after module
> +        // initialization.
> +        unsafe { &*self.data.get() }
> +    }
> +
> +    /// Get a mutable pointer to the parameter value.
> +    pub const fn as_mut_ptr(&self) -> *mut T {
> +        self.data.get()
> +    }
> +}
> +

