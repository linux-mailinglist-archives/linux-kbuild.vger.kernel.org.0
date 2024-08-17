Return-Path: <linux-kbuild+bounces-3071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF239558EE
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 18:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EAA91C20E29
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 16:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9866155307;
	Sat, 17 Aug 2024 16:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ngTXmOiZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020080.outbound.protection.outlook.com [52.101.195.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C5B1547F2;
	Sat, 17 Aug 2024 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723912013; cv=fail; b=rKIr8oWKYwHBf4NBaJbJ2xKsaoyc7yog+srrY8IOPiWs+i7bZRCopgOeKYqfuJioNd3CvboOSym8LZKlbxTeoHqohEekavB5EnblmtmpREnmfUQIKTjZ9LgyMMlLB9pbXFnVf91T6cr9/wN/VHa2vz9O1dD/Es8V+x6tlvd6PzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723912013; c=relaxed/simple;
	bh=2t4YGS3UwQtyznwHZT8e84No/M+EiJ1Bc40mRoi9qCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hD+NNAq+ALA/2tdSFaRroB8EOn9jOE98HcP/xBDmUUzG2iVkiv8JLAscGyT1wy+2+d6CFn3ssKhBkc5MvP9QOcii9YB79bLYLUiBYW38p0YFhoORPkqkyFTQafZDRcn1lpXiK7UzD9O6DZ3cedtrUXRM+sQwct9gWi2YkI3jhVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ngTXmOiZ; arc=fail smtp.client-ip=52.101.195.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exTPcxH6qVKbqIA0pE6g7Pvc5x6MhSfACaIMvRFYRclD+XXL7U4uHvy1/IDGpfjK6N9AluPQao1Nx2finq4UahrmOwavX/BenacnT8fZu8fr0EPh8/GWAZYpodw8gKXUuAMzhGIX05cfI3GBFVU9utRcLW+ojFx/c1HWNH1Zmlu4vyJEv5TdFFT99hog38e8/6J82+FxPFFSWa5LGWCPRYnHfR8jLc0dofIsWfRtGKMZRXHIlx/i1zlzu9PstFfoLqlJJCCKIROgBR+X+e2vvlfrXbuMZSV4HB2+ZvW2DYWcr1qhOTpuMiOaxMAmuHzy6JlVlOKM+6dLnbvoibnBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hEjwk1zn5OhOxkXZZ/0eY/0iDOQIhMBnYq/jhfjYzM=;
 b=CV88qyKIuXsXzdhEZ+RKbF4bC9MZj8q2DiToHDJlCVrF3PQEoNL8qcWg8vUwQWbXR42SRC40RfELEfsTLGUd6OfEWs/Ww6HLXUBeHzYW73EAVH73A7PrgCmJ2ohduI9cwC5syJyH7jKwxxVfBA5K1Undg8aU/boyRl6QjDyZincl6DD0f/3Yrg9NJIhaQ2Bje+xkNNj4fFC0S/STxqdIBLzJu4spaIT3T26UH0ykiihTdwq4k7pF2B8RzcrxDg5inzF94FFGd0FvFX7ufhPwSRYbkPoFZ9MkyuEv6vxmF+CnN8pZHBvI3l7UCWjw+JgkipFLyJT72dz/TW38oUW+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hEjwk1zn5OhOxkXZZ/0eY/0iDOQIhMBnYq/jhfjYzM=;
 b=ngTXmOiZCbqJk4NXuiclDeegHu79Wek8d/ViNcAAYC71YmUlvb63PhqXzAqxIBPFOasouWnAAA+4BAuRQKBOQRjWgbZZ6i+hYz892fFdNMhMYRAMCJb4M1lQ3GmBMsul4NKkTa2pjEQPWZF0uCkeip8McZodPa0K/5O2+e3y+PY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::14)
 by LO6P265MB5997.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sat, 17 Aug
 2024 16:26:48 +0000
Received: from CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4038:9891:8ad7:aa8a]) by CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4038:9891:8ad7:aa8a%6]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 16:26:48 +0000
Date: Sat, 17 Aug 2024 17:26:46 +0100
From: Gary Guo <gary@garyguo.net>
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Andreas Hindborg <a.hindborg@samsung.com>, Boqun
 Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice
 Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Sergio =?UTF-8?B?R29uesOhbGV6?= Collado
 <sergio.collado@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: rust: split up helpers.c
Message-ID: <20240817172646.1ffc75bc.gary@garyguo.net>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
References: <20240815103016.2771842-1-nmi@metaspace.dk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::14) To CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:15f::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5186:EE_|LO6P265MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d61d9fc-d180-4406-1789-08dcbed96484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1MEZSQudGnU2blnKGicENWhVp5S3XWres4HTGqDGXIMUQgClyS4BtkMhKUsD?=
 =?us-ascii?Q?FCZGf++aMwipJWdS5MaHJNekmyQ30LrNsEfcPlgYNnNV4akwCgBCmdXgSLI+?=
 =?us-ascii?Q?SIa2QwatlgTRwQDXNno6Zew6uKIbLgzt5TIfpJtEWzl3Ky6Esdynn2KPOX2E?=
 =?us-ascii?Q?0omVdqZv01aCkncTsIKELwEW54TzkdDlPosWlhOwO9QvN2frjFa2gmR8xiuT?=
 =?us-ascii?Q?UvBfgAyHxWV0kXqkw3AcmDpOHJhLZNXX/M6MCjP7BixfsAZbOTo+ps9suXZu?=
 =?us-ascii?Q?rYjOWq4NAoOr+ES1k6UZebPNejQl0IR1PlxbihEksZ7gFuJyW6lX5FN7QY+U?=
 =?us-ascii?Q?ns2mDyGmykVPstdLjlh3w/drIuegdJWAHcCpvtORgOHIauHrBJJqM7srcM15?=
 =?us-ascii?Q?fF1h5x6ZEJ7G15SLdAz2EbxqfSMOIs3F/OtEY3KCop774foH2d+eOhg1lAFe?=
 =?us-ascii?Q?DfYL0b8qXfp3v3It3sh9h46GaOQeq8EUrGP/WtRSqim3yIl6+7arK7+fweln?=
 =?us-ascii?Q?28zpG6oEQznKaVRMAgk6n781cnZtwsBXluA7BuhID+HG9sqMD2el2pbwr6t6?=
 =?us-ascii?Q?/2ESSGnDScRpd1T0Xf6DmgBoPL0oHpuEObzDV+vgLo/B8BXptVgg6hMbVpzJ?=
 =?us-ascii?Q?Ydu7jqZRGN5jbhgxP6Vi05B10tI5Nvptv5rX0BQyRmFckROlA17w5QZHwBdd?=
 =?us-ascii?Q?nGnvaETIvI7wsPAKq/EG5KwrWGx+xxc0+bMjgv48E36hheOsnw/U9thOTRxc?=
 =?us-ascii?Q?zhX41EEPvOOK7iil7MKUeQ1nFymXjy3InH1JKoRT67wykqEHpm5ggiLGaNGn?=
 =?us-ascii?Q?NIgNEyYcFpD/GLuDb+/UDcjDKtmL+8rxqFwq3fTgCFbjAPXZIR8gfmz1ctTY?=
 =?us-ascii?Q?UUK8/k2DqtBPlYsGXCzvaFwegxvjH/VYNuyZjWToAebiIH/1rHNThOIOJgll?=
 =?us-ascii?Q?ExEqVGAj4BHzU2iBaAi3mWSfY3dwtS68oygngrz8/3JzjmhhBjGNx4IJZcAW?=
 =?us-ascii?Q?KWmvhjxm0fcsgwfF/ufW1cZpR2tIxKOgiDiXz+vkYh/wjRMdrhA3DdWmUyE+?=
 =?us-ascii?Q?RoMOCfBsjh8i5nKgtwAc4m7SOEzST/fTSLhDvx7rggAuTKbixhIjtWxqzQRQ?=
 =?us-ascii?Q?dv12nLVZ9fzN5OA2Qic3XYAwA6l9zVfpVV44RTf1AGIZb3EW9Ph+/5/vg7pD?=
 =?us-ascii?Q?mNwdFVOv+ZOqVnMZrn+rNdfBxUtKlmUMSQiV3XmNaVOyK281WqZOA0k0frIr?=
 =?us-ascii?Q?nqH8ibxUDUD2M1lne8UziAmFWVbxGb3n3wDz3H4aFYL3dPshwYorOLNm2Yl5?=
 =?us-ascii?Q?scY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPV84uNo9udDvCJ1IiP4sUtaTB9jchIQbHoIiJ0+C8jqsw+WgZt2BrxxHVOH?=
 =?us-ascii?Q?LKeetf8w3dpqp4V9Q2V4K5OtDWvx7U3DzUJcBTZEp5MK9L22L1mT3nNBEiF5?=
 =?us-ascii?Q?hs/8/rvPUSkEX1xbFUnXTChqSpuODHA3dYlil07X1LXw/agOvlW5WLJ/RcOS?=
 =?us-ascii?Q?g3SW3jWmQW82nDcW9Mtndr+AVcIGPXY3iNuNW9SH5vy9d6faaTNvh6HqMI0j?=
 =?us-ascii?Q?B8pW+pybn08GAjrP+LwyFN8VZ635OTHH/HyEbFG6B+p/qHdnT72HebXHHVN+?=
 =?us-ascii?Q?PA0EFIEzZgv9XVmNgylYYQ7Gcz4HHLH7VeWGNHUmzPG2P32rCC0Afm0NnxF9?=
 =?us-ascii?Q?+her4ux/1jLVQzyF6KZCsyFu+5MZDNuEWws6VxZdZwQFE4aZuyAhD9N6pScH?=
 =?us-ascii?Q?SQKSIa4hrtHIR0fV/2Wt4F2MgYkDDALnq/lChda9/zVhsT8VjHel5kTONLVA?=
 =?us-ascii?Q?HeWh3OD1LEYh7gcscPiindgIi27PbSDxY+FMEqEirj62NjxQQ5z8gPx+M8og?=
 =?us-ascii?Q?zYyt/9oBkd9y8xelC3WqoV5Zd3PWbOAru4qUPPehv8Uc1fO5IqYGttuLxFGe?=
 =?us-ascii?Q?ivKYzZRJVrXfAFsKEj3lyjR8MYGQa8GpnvHJG8RzBkLkIaoPDh4b/vmo/k5Z?=
 =?us-ascii?Q?VNiJNsy/rVDtiHmjecW+o8KVLwby3xxG5Zq4z3iaW6YmnylUIx8e0BpLXVlc?=
 =?us-ascii?Q?8DjPNdGFYOOBWfKH3bxmxRrol/r7vwc5CwBavCVvheK1dVxjH4Epkng7kUk7?=
 =?us-ascii?Q?vu+MVf38b9SA3MxWuqYy4M5+O1C4hpxpbD2WWwwd5G0HsGpacQzc/rXp/i80?=
 =?us-ascii?Q?HyqXKWiNOiUKzR5p8ORfXWIFedTRxK0Jb93CvSNdQ4Q112QDDF8HBuuUj1ac?=
 =?us-ascii?Q?Bb/u6plR0Rtx03ANh/bNEzWTTaaqsCsAM9q85DXhPg4XvRwbLMPsdX4m7iVY?=
 =?us-ascii?Q?dqUTTMq3RJppyDz4zAKeW+82LNQiW7fUG9UjXRiYWfM6lUiaitobwkjHPkds?=
 =?us-ascii?Q?jRUeAR0cfGRodshXZfukAFnTg0vqxXe5fZ3MLEF4wkENOzFGFOPBBNKip4DE?=
 =?us-ascii?Q?1HAjazRW2qhbN4NqTHR9I5dfep6UWabS0RcNRT2NVdZ/lWy8BSlQHpt+UK1k?=
 =?us-ascii?Q?UTjmrF+kkO556/th0X/LW6QFWAntDVaccJC+0TQMh5wGCpufpAp/YCpQO/Vb?=
 =?us-ascii?Q?VqAf7SvEWnFuKBBV+KF9N9YV47Dyg14TmJg41WzuJXAAnJrDOOftIctFDtbi?=
 =?us-ascii?Q?w1nWGwOT1YQ13iNzFcNgmwpxP/IdIG1L6F6aTh3hZXWV2nSR6s+vthXkfB+e?=
 =?us-ascii?Q?SjFNIdYoYqi2fa8K8JRwAadYje6g7lzE38mbIOPwQ5I8UmrjyH4CwaCblsD6?=
 =?us-ascii?Q?lUaQGZ6JX9+VG6vJ93EMBC0emm0DRvCsZy1GGe53q5UDmkJbNdpWJD5zsC6V?=
 =?us-ascii?Q?5tnHE9aNaenefv5ZitlHHg4oiRxFJcNJiljMHK0OfLmU6gKQVFFcogDlWYXW?=
 =?us-ascii?Q?WmaGASbypT42weAprY58nD9eE1doDEGuh6yeJpXTiXoYUbdzDiCYMW4i3+70?=
 =?us-ascii?Q?MKYbWVJcfhdogqa+SF2nTOf8g4ZZd+RUmXCrE8Sn?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d61d9fc-d180-4406-1789-08dcbed96484
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5186.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 16:26:48.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1p1xqQmmkQgEZpws5blArQI8n6J6gFVi23IeDa43W9qg6M5kqgiGbww32Zr5KjWboe/DtBL5C/YgdF1ERaqDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5997

On Thu, 15 Aug 2024 10:30:26 +0000
Andreas Hindborg <nmi@metaspace.dk> wrote:

> From: Andreas Hindborg <a.hindborg@samsung.com>
> 
> This patch splits up the rust helpers C file. When rebasing patch sets on
> upstream linux, merge conflicts in helpers.c is common and time consuming
> [1]. Thus, split the file so that each kernel component can live in a
> separate file.
> 
> This patch lists helper files explicitly and thus conflicts in the file
> list is still likely. However, they should be more simple to resolve than
> the conflicts usually seen in helpers.c.
> 
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> 
> ---
> 
> Changes since v2 [2]:
> - Rebase on 6.11-rc3.
> - Use `cpp` instead of Makefile scripting to concatenate files.
> 
> Link:
> https://lore.kernel.org/rust-for-linux/20240507210818.672517-1-ojeda@kernel.org/ [2]
> ---
>  rust/Makefile               |   6 +-
>  rust/helpers.c              | 239 ------------------------------------
>  rust/helpers/README.md      |  17 +++
>  rust/helpers/blk.c          |  16 +++
>  rust/helpers/bug.c          |   9 ++
>  rust/helpers/build_assert.c |  25 ++++
>  rust/helpers/build_bug.c    |  10 ++
>  rust/helpers/err.c          |  22 ++++
>  rust/helpers/helpers.c      |  18 +++
>  rust/helpers/kunit.c        |  10 ++
>  rust/helpers/mutex.c        |  10 ++
>  rust/helpers/page.c         |  24 ++++
>  rust/helpers/refcount.c     |  22 ++++
>  rust/helpers/signal.c       |  10 ++
>  rust/helpers/slab.c         |  10 ++
>  rust/helpers/spinlock.c     |  27 ++++
>  rust/helpers/task.c         |  22 ++++
>  rust/helpers/uaccess.c      |  17 +++
>  rust/helpers/wait.c         |  10 ++
>  rust/helpers/workqueue.c    |  16 +++
>  20 files changed, 298 insertions(+), 242 deletions(-)
>  delete mode 100644 rust/helpers.c
>  create mode 100644 rust/helpers/README.md
>  create mode 100644 rust/helpers/blk.c
>  create mode 100644 rust/helpers/bug.c
>  create mode 100644 rust/helpers/build_assert.c
>  create mode 100644 rust/helpers/build_bug.c
>  create mode 100644 rust/helpers/err.c
>  create mode 100644 rust/helpers/helpers.c
>  create mode 100644 rust/helpers/kunit.c
>  create mode 100644 rust/helpers/mutex.c
>  create mode 100644 rust/helpers/page.c
>  create mode 100644 rust/helpers/refcount.c
>  create mode 100644 rust/helpers/signal.c
>  create mode 100644 rust/helpers/slab.c
>  create mode 100644 rust/helpers/spinlock.c
>  create mode 100644 rust/helpers/task.c
>  create mode 100644 rust/helpers/uaccess.c
>  create mode 100644 rust/helpers/wait.c
>  create mode 100644 rust/helpers/workqueue.c
> 
> diff --git a/rust/helpers/page.c b/rust/helpers/page.c
> new file mode 100644
> index 000000000000..b3280c80b283
> --- /dev/null
> +++ b/rust/helpers/page.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/gfp.h>
> +#include <linux/highmem.h>
> +
> +struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
> +{
> +	return alloc_pages(gfp_mask, order);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_alloc_pages);
> +
> +void *rust_helper_kmap_local_page(struct page *page)
> +{
> +	return kmap_local_page(page);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_kmap_local_page);
> +
> +void rust_helper_kunmap_local(const void *addr)
> +{
> +	kunmap_local(addr);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_kunmap_local);
> +
> +

nit: there're two trailing newlines at the end of this file.

Best,
Gary

> diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
> new file mode 100644
> index 000000000000..13ab64805f77
> --- /dev/null
> +++ b/rust/helpers/refcount.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/export.h>
> +#include <linux/refcount.h>
> +
> +refcount_t rust_helper_REFCOUNT_INIT(int n)
> +{
> +	return (refcount_t)REFCOUNT_INIT(n);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_REFCOUNT_INIT);
> +
> +void rust_helper_refcount_inc(refcount_t *r)
> +{
> +	refcount_inc(r);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_refcount_inc);
> +
> +bool rust_helper_refcount_dec_and_test(refcount_t *r)
> +{
> +	return refcount_dec_and_test(r);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);

