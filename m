Return-Path: <linux-kbuild+bounces-3025-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0759539DC
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 20:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7992A1C22616
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 18:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2B4481A3;
	Thu, 15 Aug 2024 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uyh4s9pc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020118.outbound.protection.outlook.com [52.101.195.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC4664C6;
	Thu, 15 Aug 2024 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746246; cv=fail; b=PHwkmdzup+Yxi1JqpYZQwc8YGEH57wBeH00D/PS9lXiEEHav0D7Doa9t/S4xmjCwwbBgaKFC+Bi5qqx+LT/cmNcJMLPRdJkl4XhlRgekWRBWEUAOdu8ehZ0i1Nu1LK4jsIJwA10h8zpJgiwIQ4DSCoA9Evk/LqLJv9bu5BvE+oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746246; c=relaxed/simple;
	bh=aR148PXGSN71ubmA/kV+zQwnkgBGyfBNAaC6Bh4v61w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c1OnjoD4z/hPdB9s02DQSzJRuvpkwEja0mRJsZkLVlgrS20ohi7mWZztV8NQoWtU533WRKzFvJpyYPuStSEG5QMZl4cyMlbqGOpJsCjibQ477B0PtYKwD6ib8ItZyMkYcw8CWlq1ylA5ywOZmDgbXo3qU+yKpeOBC8nfQhe4GSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uyh4s9pc; arc=fail smtp.client-ip=52.101.195.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NspDaiwdAE26FrHPIbAtPXd2T5xgNZotR+z9jjNj1RKIvSD9V6LAgVxZ3VslJ9aohLCB45YjNXeaA7xWrY1xSj6SO9Ma9v0zhSrje0V/N50HkDQrfblbq+tPskEcHD+g6ZVJ8HPaL3orV/EAmjpWsZM+Di4lRM2IrAv3+R+Byv9YCyzVV5pDgkccESZBpM+7rdu7xO1F+sULp9usPatUyR9KKuW0FrTIWrdnQeo4vNCOVRWC2TP86gmVODG1RM+H3o3BtUO7AVFQ5bU3zGRkHeZFqY6BuOIBFzSWymIb0o2JH74JviUtnABmIun3QFPTe3cMJRYtsy+ouhMl6YtcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3ktZKm3V9RzrJonM1mdFRdhkHJOp2mhrg+eQLr++5w=;
 b=vjEzuqOhXrtJx59St31VnK7Su8tuyZ/O+QmFyIFERejZIf4cZCI2nlNKtqMEtIq3LAnqXxTiIk3VwjlvlPVQh5VSD6GatfogJWY/GkTeHzveGKlpok6AvJsrkaBNQ4ufOJeqboxmwmo56ot6k1a4e7qJBy7Lu9MnFKVVsNXsj2o8m1hBHYlf4UpA+9Usp42u65p1ASpqXiifJVNylenrRqRi2M+3wxy5VdHS6UwLsuLMmD9ttwD+bs7jyoIRrjwWdkSGCpKNWLVPFnv9MCs2RwRVnkZ/LbMYol29V7UIN3/COpC0iPbShLHjFyV3YOmKkh86Qw+Mp8VLW902UxeQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3ktZKm3V9RzrJonM1mdFRdhkHJOp2mhrg+eQLr++5w=;
 b=uyh4s9pczAFtSEOM0z7+kHht9EgOdgDhukp9FMIsSWxZMrxTZsgBOEJSETCrf65q26vcZMtVoMp2g1tN3Cd1TzgMUf7HBHf/D8g0MzsUK/ohOGCGqefgqByPzhUWvWFT8aLmO0mcVyW1HxmsQw7gF4EdZWk52BiHQGE5b6uYGMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB6151.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 18:24:01 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 18:24:01 +0000
Date: Thu, 15 Aug 2024 19:23:56 +0100
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
Message-ID: <20240815192356.4c88b8b1.gary@garyguo.net>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
References: <20240815103016.2771842-1-nmi@metaspace.dk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0274.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::9) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2c4129-9ec8-4db5-07d1-08dcbd576f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JhkYcUfX5pEKJjS7yI7ljKrGJLC8pISaNypKYznKs3Hok3NHAkVzs2AclKpv?=
 =?us-ascii?Q?2+bdBit9lhoZE8rrWa0/0aE6kdy4L+r1KhObsaXH8dqn3tylslQ8IV6f5ox2?=
 =?us-ascii?Q?uxjZVBtdpsULjLKneTglydT7aCarJ/5Nt/jLy/rpA/32bXabyV/rUTWy3gdF?=
 =?us-ascii?Q?1ZsTiqdh2JSY9ueCe3DAHgEqIb4sTcs3N+YHLZeELOFbF2RN+rbfJp4P40El?=
 =?us-ascii?Q?E9df/+AHb7J/P/0kWhXQxs2xQWBA2JKAhx0ELgJVhHxKwoDekjnFexgSfsXh?=
 =?us-ascii?Q?c8Qg0QbxvrIgMlVU7Rj+5QfR7W4qQsPrWM6Sjhjib8hWIZDHo19WCZZ/+c6D?=
 =?us-ascii?Q?zkwT5421qSxeCosGxE1EsLPy9JOuQv+rUTPNAoBMMPE/1SmZkErGJk2UPI9R?=
 =?us-ascii?Q?juvsYwhgAc4gQ49JhLZviUR+0Iumru63V10hUfbxMYBDlKEqoeqmwR6x66MA?=
 =?us-ascii?Q?eLyCqZwd8knGf2tKU+A0MKqm60lmBt7w31gnFhjHpsmdqSnKBvCRxOSIVBX9?=
 =?us-ascii?Q?CFHo9lQbk0glQwkIqdWQL9dYfn4TBvC3DwInNW5+5dDF2OxtxzAvbbVcF7pa?=
 =?us-ascii?Q?FDamSh24NRT5tbO7H+NvzE3m2bWHzNkqcAaam7Me8IRWr8KtSvkB0V4+SEfC?=
 =?us-ascii?Q?uc+BHTELIQa29SYdCBrHA56P8+FFRzX4B/M+c2cYSr8doJ6kn5wGLVqJUzcF?=
 =?us-ascii?Q?wyOvY5oSY7k4xYf3xB6RfsxC0gbikp5n8wGLdoanwbhHptuGAqj/PBLXgiM7?=
 =?us-ascii?Q?qO13kBIYsRuy10rDaOymqydaC5q3N4JxC8jmfNJTacsLseiDDu00HNP5yvID?=
 =?us-ascii?Q?/oabApUfla+M7dVqC8EJRE6HMdHGwANNHBLQXm+/QW4b440gFLja7IyWndx1?=
 =?us-ascii?Q?ipb6jP1MSRM6kML3ww8H8uoX0VH/eJiGPB9RZIq7kWkKSGeMHlrbQAQqZkIH?=
 =?us-ascii?Q?SCX3ooNUy5n5p53TQ5OHtu8G9L9bQnzcfWrl61AJ20H0iYG3KGz2uOCkkaEa?=
 =?us-ascii?Q?79t1SaFPU+xuQt+App8u2dZmHobDnRVP+XS5KlDrgGxdL6f9QtrKvRS+uItq?=
 =?us-ascii?Q?UVHfbBI/wd70W+0GtUXllUpbMAwUuLcLwcSTL16O1iN3fbCVXvIQzBh3eqc4?=
 =?us-ascii?Q?nqM+mFmzG7Ib+YOSxAh8t6+CQfZKnyVpp/R+Qe6NMuo+Aq4VztR6cM9DWeS6?=
 =?us-ascii?Q?Xfr00FsWnlOYvW4J70X62j43gUJ8Y3DMDPBK3KMapfe3yQyJC5TRBEP2O0vW?=
 =?us-ascii?Q?lzmH3ib82ZSSuEhl78lsvRRzEzwcJawC5hwHb97TGztrzekS8eaN+j1TG3g5?=
 =?us-ascii?Q?q5k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H11uJ0L+zD3/IX7aT03T8h+1wnpVq0dnBpOotMofHc4HDxoudxm5RfITy9HC?=
 =?us-ascii?Q?BNnMy12xapVhneTSldXogxpNTAUR6Wo/uhqbMrhwnTwN8hE4BO8MnUT1dZVl?=
 =?us-ascii?Q?F5Ib/2jxGccqd6Yq6B05wc1647N+K3SYU1bhYX/5MMKjahGrM7EjRH7Mwpcq?=
 =?us-ascii?Q?orS/d538e2uE6JM7+oyeoDwIezJdf9edCaaP0+W5LoljLe6Wqe0O4+T7fZxb?=
 =?us-ascii?Q?iP8V6m5J9gawmg31OMVEMJu2PA4CkNpbiQlF3o/bI0bB6LdeeES5w9dfo1IP?=
 =?us-ascii?Q?cI6+4BnksRmicwVpSAtkncVwm+D0Vky28F7Sqe7/E2YJCwiU5odi1p5KNuSH?=
 =?us-ascii?Q?wZGYLOSEjIketICnPgQMbqbOtgr6sfA3bgSvXWfOPH0wYAryf1Q0bbiosf4K?=
 =?us-ascii?Q?rzAjIdRLelUA1gaGFtBejjivW8gud2MBME00AfvhXQlg6CRn35fM6Xpjm92m?=
 =?us-ascii?Q?wTBreV95sx7jXMX2Z1bBxH+YRBf3xwtSWSArDPX17lOBXubILdetc4gH++pd?=
 =?us-ascii?Q?Jg6TXfekzHqtivlcNFlhmPTZzPqVUIVAalK4z8DnRLLRHfOGVOc8DXc4jv4p?=
 =?us-ascii?Q?KpLMV+EAU2awkG8+Sby7c4bXBBH+W5G6cfTbknZcN0jiqHprPxMtFZkCXT22?=
 =?us-ascii?Q?9eCFNxilVEw/RwEIG0/5n4lXURcu1+WHkFYyJmUFD1vRFG1Yy2BNdP7x/LBH?=
 =?us-ascii?Q?Zn1bz+zELAvZcA6GjFmxkUJFxgvZuPm2SqQ4KeKQqcg2i6sPNhmnq3iTwsri?=
 =?us-ascii?Q?EfA5svg+I4H4zLCnstVOy2boa9aYYx7skwe5tcH8b0MEJ9G8odKAab+P1cPn?=
 =?us-ascii?Q?XeWN1f1QDiN7oAaSxPHRXl5SxSRVwq6KT7cn4oNjU64PZHuqncjodTRaOeu1?=
 =?us-ascii?Q?PAWBVqjeimARt5x4rkSoZRQ1LbHW//R/SrfiE+hte90v7gb0Iiq2JuzbcEUb?=
 =?us-ascii?Q?SmSn8RpEJq+xA6ySdV+YXXOCmOvI/4cukbn8onFKfjfxLoQ7lych7YJqYIBV?=
 =?us-ascii?Q?BY+L2MIhzNu489BezAThOfmkArm1CUInZgBTzj+dFXTL7oggJ7biOARbPKjl?=
 =?us-ascii?Q?JrOq3BXRZm70WOCboRwVoQ2vV9V0dsBlLqJSnL7iYLgSui0ADvC5v6rqTN41?=
 =?us-ascii?Q?oemwCCogEzl+ztIXdvMfy9pCoP+Fmk3+2PNqLZPM6gnrMm8lsIznD+XxtkI1?=
 =?us-ascii?Q?lQhsJ2cpB6PZQ+aP3NQEHXgNXv/elmn3kc3yHZPGk1hqx2co8FTtdJOQCp/s?=
 =?us-ascii?Q?iRbYmijUcQTjkzMuD+4thcbl967gdfcOy1wiFBJpwa44cpgRUFKdonG/LH0/?=
 =?us-ascii?Q?2Wf9PINW0cgBTWFIBvkOJLZXRm7QIM29ahWvHWcKPmbjZ0EvaFt5LM3/QHIw?=
 =?us-ascii?Q?Nb7joOIvQrpWtVQNUgfT8A7WXiwHIxEwk+T6vsA6+2g4GdTfNYQiqV8weHH+?=
 =?us-ascii?Q?kGKzMBPAvInIYSG1tuinP71l3P+rO6V0Vo8qg0vlUSy2/GJeIGRCMMfs1D63?=
 =?us-ascii?Q?IFBRV8356SUsb3vdfbRFskPfjMQnn6889mp9UeqviNdDPecsTsSN0oe3EZay?=
 =?us-ascii?Q?oLWRdFk6eRgbdFH35t1M+sZWbjkR0vvkItNZQGdr?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2c4129-9ec8-4db5-07d1-08dcbd576f6e
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 18:24:01.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BccVSlw1G6G4vpr8LNA4xhfsG3cN+15cEXHnHKfPEPz/WzPZ0be8Z0PHfr655S8/dp3dA05liKYHRh422jiMDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6151

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

Thanks, the include approach indeed looks cleaner.

Reviewed-by: Gary Guo <gary@garyguo.net>

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

