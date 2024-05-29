Return-Path: <linux-kbuild+bounces-1954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F748D3FC8
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 22:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 078B4B26091
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 20:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039A71C688E;
	Wed, 29 May 2024 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cClOVvbK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (mail-lo4gbr01on2108.outbound.protection.outlook.com [40.107.122.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04122A48;
	Wed, 29 May 2024 20:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.122.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717015551; cv=fail; b=dE+Rb436+uMuVC7fqIV5pLh4TMx9xJ/FpQ+Ji473Aubo6nn+N3b3I4zGOdQxGUYi/iNNM5GfZDkgJ+cVqikhzD18aHSV0ZBVv6LoL3lzZ6Yo38a2LcANhOrSC5v9TGPlsEPG7Gw2eh2YL58flvuzG6bE2VNTTeMerlpjKbq2CgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717015551; c=relaxed/simple;
	bh=RWVZmEUjZiDTJ6EvTziW9BztnehyxPC4NUgSoPOsWa8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tazTqW7igYqVUoKnb9FOaY6hnGXzfDirD8M+YnFaxhI5KLpZqm3BAUpheKF1vlpEw6KE/gwCU/V6wBUoRv8o+OO8ZrYo4PmMQj1F7pgz3B922ZSw3he6rENNM1jOKK8B+j/EiQaJWjuVYMuUQ2szpnK4lxQZWQJfHUPw4w4gV3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cClOVvbK; arc=fail smtp.client-ip=40.107.122.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rr7azrQVovkeN1VntBnr7diqy3A+9nnEdm2/kzeCzGIo4YN6XmEu2DNRPwP5VPp1iQ0eYhdusojgpf6g7+7zYf9vxAQMwAWF4UAITk5tJzkQ1XCPO24eDCewiVN0ghxJOlTGkuI9e+Qr/lF6jJ7WV1E2iHDK/KkeEjtwIYdvr1KwCCHKfJMzP3jld93zx6PNpIGtn+qYlqZTGjcGV/v7bpV2FOfJNCiw+vwgjY+s1OMTy4Ab8z7jHnUbKh5P75y7Ik9ZgKY1Y3hIRQ3ABeJOhVqh1Bn3l3xR938GIG9Iz3aOsq2HaZE1zEP2Dt/sgbjJ4P0V6BMfUXRK8NULADkBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGpvFoGAeQ/uDBuz4FynmhTkDhc4IgqKmmMyzHbWzlQ=;
 b=MKJB6ZmzMbOvZx4yTqKSTF8o+vIysSmOWbnT4Huglg3HgF5EtPfgzhIBlYBcnaKnxTiv7ypJKUFKXV/venQX0V8926CYGyOzjVDk4N4aKfmKPPgjFTF1Te54UW5kvPWTSyoiKGUvCfxfAs5qCOExvWoCZD6bcZDe3DSlGuPfvZ4lr+n73dLrz5kq+w1atcwt8z/G8Qu02ymAsBrSEChgTGravTGyJjDKoEbYYRD4z12ErD0ByboJq7t9qepyZLeq+DjJLiXeKV57lHiuVX4oZiELBvrMm4wULVE8kV546RMYyS5OQBvCPUpH4sLJ00TMCb9VlUBnvOALM3AJ5mwP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGpvFoGAeQ/uDBuz4FynmhTkDhc4IgqKmmMyzHbWzlQ=;
 b=cClOVvbKoLx8jK11PrQ9MdlP48uL3ZRrX7CzPcrNn14oEw4QCX7MgYB12HDy71le89thQI3xlhMWZmT3W8vaUh+2oVgx9o9sFH3P56rppg3u9hBctKnvMuLPZQTikE942GvccAsnYrnzVGsEnOCJj6A17hsWrmX17u9K2MiTDco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB5141.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:281::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.33; Wed, 29 May
 2024 20:45:38 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.7611.016; Wed, 29 May 2024
 20:45:38 +0000
Date: Wed, 29 May 2024 21:45:32 +0100
From: Gary Guo <gary@garyguo.net>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton
 <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice
 Ryhl <aliceryhl@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
Message-ID: <20240529214532.7804a7d2.gary@garyguo.net>
In-Reply-To: <20240529202817.3641974-3-gary@garyguo.net>
References: <20240529202817.3641974-1-gary@garyguo.net>
	<20240529202817.3641974-3-gary@garyguo.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0636.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::14) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 68599b3c-c649-4392-f705-08dc80204c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|7416005|921011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hIaFve2/qwglkHKD4QhkmY9NhhQCC14VblasrWoSrks/6XScZ5a13CX8nWCC?=
 =?us-ascii?Q?Q2LAECX3239ZU5rBTU+HgVyoUx68cR68MSs/eXrE9T7Bk9EiPHal5aBDsqbl?=
 =?us-ascii?Q?/EX2FpMJmwq3Z1K+YO5iWLuryqZqWnkUYrM/hvQ+oqYKF2NkxODjgaiE0sRO?=
 =?us-ascii?Q?j8O46YKomsFltNnxoGnzFGyizOn9AT6su9hkiYhy+7ohWPlFIntL8ZIgv2XR?=
 =?us-ascii?Q?BwN0RwLL18RJnZv4maNO9tp3r06y6sRLDI3LfeGjqynGnf2KhrCts5z4er/t?=
 =?us-ascii?Q?m2dyWfEYELAr7WDPTHjMi0d8x++TToSGbOAVMEo86Z/hdLyxxGOpnXoHSqXy?=
 =?us-ascii?Q?qclgGT5iuZTpTWDflCpQG+3Uu6xuwpa6eKrHFXc6v56IBXvQQgg5kIEXhRjX?=
 =?us-ascii?Q?AHtnWMcDdIAgH1IVJbU6BwAiHTr22Ndvj1Taq5wFH2QcpzYG2M6mUD/WEeco?=
 =?us-ascii?Q?9rwhdw0Yhc8mTYzGqMCzO8OExqeQbK+5ozU9mQ2s9meA/6csYHJYJ6Go0U0Z?=
 =?us-ascii?Q?GrIxk9Q0ZKueox6GYlwL3sg3UE5KTLL0TQJnBBYNZ5mg/QkY/HXS5EcvIzOs?=
 =?us-ascii?Q?M0ECObmaLuC/snGQsYomc93U8xfa6wLicHO0c4NwvItQsn5sSb0d1reG0H9Y?=
 =?us-ascii?Q?ibkZW1ic17APubwHa3z5JNGwNfns1pETWcoR1Sz/Uj3DW9r1j66P8oRcrrzn?=
 =?us-ascii?Q?b7kYjtLZex8xtMtxdV2OPt0cr1GMsnENTqUvBVNkT3hkqWOWwQQukkmFk0oP?=
 =?us-ascii?Q?WNOVWWbwkg2CrBai+W+ogopC2EvUEaGVlVw6n0Iy9/Jki4pgShu2Yz9PUFYp?=
 =?us-ascii?Q?ww7HQ1cMS2n9ajsZOfoVZAGbyN2LtIlUlY+RD52CT1RrJDBup1DqWRNZS2Zy?=
 =?us-ascii?Q?DdVON7bawBuR9bd6N1TEmdBjr8PQ42Pu3xL/er39F12RcCfrCcj4R49hOKHC?=
 =?us-ascii?Q?04pOvXF12txi8/7kt5GGmIN6+wl7wmq2GsWx2Ox1tKCK9StANjLcmaZIt/9+?=
 =?us-ascii?Q?mA0jZ+GYh6Y7W4u9UflrByNZ6eD2lcETuCCpUPxk4gJ7P3E5vWQhBwdzH38s?=
 =?us-ascii?Q?UEWMZpnHiZkeujtRej1ljEXjaxAPP4ClSyxOSr0h6iGFytCjGBI7qGaOLmi6?=
 =?us-ascii?Q?bfecPEVKop1tkIBXWVEu39Q/KBPraiytrbU/HMSj/b8nEBsTSMf43Bbff+d0?=
 =?us-ascii?Q?l+5XnyjOYhTv0PTEHozAx8+PzwaoRq7mN03ViCSEtX/FE3kTdETpXZDK5N4x?=
 =?us-ascii?Q?WrvfflTbJTZ/Gmq09rojB01z2C+4i3F1j4gUVWPjmaQPI8eDe83roYCTmtAu?=
 =?us-ascii?Q?ZibwpBOfaAbHAeDklh/ywXky?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tEHwKGZN6FLshT11w2OKFIG0rLEUvHmDjU+Qjtl6tyhhHnFGKN4ASE2mPJfW?=
 =?us-ascii?Q?B2vy4GwAnHh8TItEGcdnhk10su9hSyzMWZO9cpyoAhkZzCqJquxs0o2vvqlS?=
 =?us-ascii?Q?uO/hmCoLoGdIULvXbB2l8d74fnJ8GFI6QKM0GyucQqd7t05xA1z7nr+qVgP3?=
 =?us-ascii?Q?9Mj68vAQY/gjUjlJkYPLm4d+xUKfKE88fqdbLZUpovs7+e9V/liDoc04vawv?=
 =?us-ascii?Q?AITwKW3AYS3dGA8IgBh7YjMgAQl0bENqHO0brxRkbC8rIumHwLVUdhZd/lHy?=
 =?us-ascii?Q?UBOIio1D/BGFUuGpHZWyVC9mrIO9UOzhtEkjn3LyGOUHCFBZNtEPKTbj7Etg?=
 =?us-ascii?Q?Qp4IFbeQru1wZ0D+QkUMe51vlUKJ1lSpUB6D7mCao5KJxNlF4V1+htdjUfKm?=
 =?us-ascii?Q?So6Q54dqOApckFcjyCoRmSVkTUcF/iCxcDSblXwLV50QHlZYXq03Bx3mDQY2?=
 =?us-ascii?Q?kr5fDQZcnW+O5hUxTRpQzMbTZJdfwi29BsMwlg+GPyV6vyqe47xPhFVufqiH?=
 =?us-ascii?Q?9X7Q6QRx8d641w6wpaxq3z2rFJ1Zi5XtBWg2SufMdpRlzoPfw5Agiv0E6eOl?=
 =?us-ascii?Q?7FPA+GVpe/sPA8Nc1WGBKxRQAQUre2x9+2RAHBUcFZ72y+7JKPjyrV7J3y6s?=
 =?us-ascii?Q?KWUWOVo7PqcKiXkJ/8gHodcDr78DQSxmAJUpauigO+NaUz4TMyVFew7ZIa2B?=
 =?us-ascii?Q?wmYTflBoUPueRTcBIeGsAbARbp7vEyT2P9TIU0sqjXdd4tSb3vSfGcAmYBME?=
 =?us-ascii?Q?NCTChrDssCt3eljRm/qRiIGYyps9k9SC4zyoeogAVF62njdQsnjnsunJnktA?=
 =?us-ascii?Q?ruxmUvYKV3aOBPLjwoFsfAPqN7YZsBb2KgFT2IjR4XLsmrzuiUy5g3KCKYoP?=
 =?us-ascii?Q?SRj37V2lgPSRwYt9IB1BZlddj+f7WzGOYepYZPf0FKPah/+7QCFAYP9roGy/?=
 =?us-ascii?Q?M3EFb8gxdxaUPsb6CMFiorBSH24wqWK8r/V4FARThmawyZnOakvwcMHuPJpx?=
 =?us-ascii?Q?UQENpQM1ho5OJQnSx2EWCshp5LbA/7dGLPt9nY6iVbNjXP4iYNi7LEQ+LTQT?=
 =?us-ascii?Q?LzlbEJ6o/aKWrVProre9JQJaoGv4UmFIv+/ro1hFBKgiPBya6v2+FCOnVGOb?=
 =?us-ascii?Q?mGTZBtjOiZSwRSMjC7J+7G/KfwYDgKW8FKEGJAeOfQgOPjavd31vbW+1VJsU?=
 =?us-ascii?Q?sgCa+kZnbiZscGRfjAy21QdqXGTymeb3qBxLIkgH3d8k4eILQbclGXKEupEO?=
 =?us-ascii?Q?7N5LVD/3YB3ZB9re0P8MVmvp7Yzga/Dq+5mZNnqFYeEAu7X/CtfvaG94XDk9?=
 =?us-ascii?Q?fHT7mrT3dbNt3ksWDEVyQ9XWu7aD2K/8IXwADuBO+4SKTSOO3vfwbp0LVp92?=
 =?us-ascii?Q?bOrA76e+5GV5KhjrLE1tlRFqB2+IpWN3h1HH1wRSlvUmT1pEF/JL2NO1KSkp?=
 =?us-ascii?Q?njhhfqjeS0LOwAJAbWxXqkLoeMl10bw/fxPkHOPWqwoX61H9XVPZsTfKFBiP?=
 =?us-ascii?Q?7OqgC5VkQON/HSXg41qDKDbtdRc/ywKeR2J8ziQcbiJjmCMqYkug2nCJBI5p?=
 =?us-ascii?Q?9uGaR013kiNNPvq5Ok69Xaw/HGANLTpbhFmQX/BGegcjuee2Hm7fd1Kxy74j?=
 =?us-ascii?Q?qS2e0axGBfGfDeJ6W6ix1o0KF9PcaFy4Pnk3q4kVbhhN?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 68599b3c-c649-4392-f705-08dc80204c18
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 20:45:38.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVnfyqsSWgJrMcCt177ruDh7olROktsOLshTd8+iy+RUz1HsVsLdjZhI8GNCjdxGPH32FKdEG3HSU+k8pNFVcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5141

On Wed, 29 May 2024 21:28:15 +0100
Gary Guo <gary@garyguo.net> wrote:

>  Makefile               |  4 +++-
>  lib/Kconfig.debug      | 10 ++++++++++
>  rust/Makefile          | 34 ++++++++++++++++++++++++++++++----
>  rust/exports.c         |  3 +++
>  rust/helpers.c         | 41 +++++++++++++++++++++--------------------
>  scripts/Makefile.build |  5 ++++-
>  6 files changed, 71 insertions(+), 26 deletions(-)
>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 895f4b696962..3abf96f14148 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -32,18 +32,19 @@
>  #include <linux/spinlock.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
> +#include "helpers.h"

I made a mistake during rebase and forgot to include rust/helpers.h in
this patch. The content is

```
#ifndef RUST_HELPERS_H
#define RUST_HELPERS_H

#include <linux/compiler_types.h>

#ifdef __BINDGEN__
#define __rust_helper
#else
#define __rust_helper inline
#endif

#endif
```

I'll include this in patch v2 but would like to get a general feedback
before sending another version.





