Return-Path: <linux-kbuild+bounces-9508-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D139DC46C8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8EE614E11DC
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BC2305968;
	Mon, 10 Nov 2025 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="k/4BODtF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020072.outbound.protection.outlook.com [52.101.196.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368A1E2307;
	Mon, 10 Nov 2025 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780258; cv=fail; b=ZgViZAMiwF/gmP1lLOW7njI9eLlSqOReHfi9K5SKnuiLMyT/2pfEL48Le6hJmJsk2hvaDaN7CnglhiNh3WKkKYzGumm2/mWYUmOKoHXwSFPrslDSxQHrwTSJdAHamRTNthW7FoDXPHRpHYAAKNcvLx6M/uyHz7SWslQ6BFh0a9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780258; c=relaxed/simple;
	bh=3ECap9LzS26rXbX7ANIF3wJzOUP/GsmskrjULA1rZZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WwsaGmEF224+Mm3Inroi8u6R4B11bOgCTvwnjSHnLCpXEwhlAKQd8Vnmak3/8r70E7y2JEnFBv2zXB5H+YWzWrc3TuGaen6IS+ZI+eP01lzOlwaNXwZzIQ0HnXJKQ4MhGG9hXyhzzNTVUYG3vrPvEtrDe5I5YUogZlEDLatz5FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=k/4BODtF; arc=fail smtp.client-ip=52.101.196.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R12tibH25ClJze85+pLehFTjD1v7RhHCVqnavbZ64zPskvW39ovZuxuR4xnCviHM5qvHmZNEReiNPvhsoHD9QoSlHD4CbBFrqiEf2oWpyR2zko97CG2odNwFPSxnfOFgeYLSvYPGqSzTvTIrR6og2WdWANR4+wI5Wt7UMZjyxNs2+DDASuGxbyS7IiCXnNj5TGDrVVPcKHF3f7Wt2xNzGDpcwhnoA51MHljrMj4uIggTuOEnL/bA7/pn9rbw23euUGhFNNllfhklWptn0MRlY1966P45QQ+3Hq1BOOlZVhhKI+D5juJwWhqClYiRfTHggw5tEsa4ked0rPjnI6qJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKU3EbwUf7OJswM6CTPfABk1N0BxtNMgwbZwv7WHazE=;
 b=TemdrBmuhhMV+vrPo8wKujh4rJ5Ir4Bo4FZ94dJPdlUSTNumff4v24NONByu4e+0+/XN7edTeyAnvw/1L2z7TKvhTpeyG1pCZWx+9oWdPHuTfmwBELwXPtekIM4JXhtOlz1ECK0rxv7ZPa765Hoa4o7e1MxRJpvUA4L9MF5l0vemyeO4pVlFn576dyy9dG/gDUTP5rgzovyV1e3Yyq51hlaEafshw02KMP111heURf9L3PkSPlTgzFP4Q6riscg+3ijVTmC/CDlHfswATx/fLEWvnirzv3g26IEV8Csj/C/dOCNYGSzl8z8l4WEyduKhJMPFUFCe7LKn9k5Vm+5DkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKU3EbwUf7OJswM6CTPfABk1N0BxtNMgwbZwv7WHazE=;
 b=k/4BODtFfH/MON+HDoLyBQJ2qtL+bdOEMZzpNmxFIDBQ9NHtv0nFKfXzcwuX2OK4dhniExcsTDy6DGgPQR25atOkIV7779mNYuVXcGTUrV6dApStTvso1IdZAmxyorXlEAmTByRW+wDVIPQo9GzUZDq5QMxMrntLg4nYUjveypE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB3352.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:10:52 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:10:52 +0000
Date: Mon, 10 Nov 2025 13:10:49 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Boqun Feng <boqun.feng@gmail.com>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
Message-ID: <20251110131049.18e2f5c9@eugeo>
In-Reply-To: <aRHOnGyLx-bEVqcY@google.com>
References: <20251110095025.1475896-1-ojeda@kernel.org>
	<20251110095025.1475896-10-ojeda@kernel.org>
	<aRHOnGyLx-bEVqcY@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB3352:EE_
X-MS-Office365-Filtering-Correlation-Id: e50bafbe-a303-4e36-7fa6-08de205a9323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xu+7N/ToHZMKlLUzlSkaIbGaY48LrnlZDJlOHYkHNYY+1MR60L5kKcgxqTSI?=
 =?us-ascii?Q?59nl6d+PZKOEO3eWIVaMPnvZZw3j3OjlqBWwnWECr4QvJUmeRqMBN/A0qySq?=
 =?us-ascii?Q?hEOcix2qY/F+aa6JyXUmJ7FbOtJnTiMm5WkiPjUfIOSrUzMqTKya2nKBdL9v?=
 =?us-ascii?Q?vPHAbnyZkWdIkikWcUxbdsqn1qA+/brz1D3p7jzah0yTRkibpoTwg9y3I5YF?=
 =?us-ascii?Q?KiUAAIF97Pt5IY9DO6r5DqN3NdGFRe9SiwuJWa36BoS6xkXUbWQzJFm3u85D?=
 =?us-ascii?Q?E9bH+8Jw4Rfj+rH81qfbpA5VEAtDJNOSMDAiguearmDUhjviGBjxNcZyr4KZ?=
 =?us-ascii?Q?1SCTIifNvvP/0r/GO1IbzMiA0iV7BtwV/p7IC6ht3RaXeSNu9JXE2m3SbL1o?=
 =?us-ascii?Q?9nCfl85eHlRWA7UHY9ognOLOPXZUHk3fAc97ruGeocVUCsd74V9S0sWhIPTq?=
 =?us-ascii?Q?OL3dySFmPTJNL43Asrw4VfNCdOO2rruql/Rh9C7Cku4bxuh6ilC5H/RzEnng?=
 =?us-ascii?Q?V1LE7lQ3y1tx6aNHZuEa8tv+grVtSx1C4emh4pZc+uq4rGkTUHu4HQGMq1dw?=
 =?us-ascii?Q?+ouy6GXn2kzjqNlV6r+ZH8uXSmJhX+rDvaqlOVyASZQA3yCte6Cs3C/BBzQv?=
 =?us-ascii?Q?SrE85eAxBlgWZyKPFksfMwaiqgftQD4hpQnUhs0A/GhgtlPaXfFfnlJhiqtu?=
 =?us-ascii?Q?XwxY5JVnm55N/ozoxlJrVlOHY2UensXcj2pZeQnf0oi2V2qQ425cW5coatmK?=
 =?us-ascii?Q?3KKUHHBGQATmJpdls6jQC/s+U3n/FNqL6Qvb2bXb6dF9keKUw87JyvPS/OR/?=
 =?us-ascii?Q?nvWqhvD6djwxQvJbs6tnNIJJgK5gDe7NIk+gsjQXvJ/6Fjb8p8TyC0Ju/oae?=
 =?us-ascii?Q?QxLE7a62RRWSiMfisoCcPb47VgQn27I1iF2HXsqBtFB0YJuLvyj39LANQdFb?=
 =?us-ascii?Q?bJtwtGDb1i/iMtGJ1hZha2OXkzNflGBp4rGRDTuoFadGQpNgPVi5kpFevbF5?=
 =?us-ascii?Q?lemR4vCYYgAyqugGCW5/7XfnhetPjwD6JP+t8qUh6WM6EG+F7eLL88Kb0yKO?=
 =?us-ascii?Q?nE+lTRs8+CuBfvEfB/qXU+WQGcAHkAmBnI1wuapxLFBBoU8f2lDd6zFqh5fo?=
 =?us-ascii?Q?7yicMrviTncC5mJKHv7JfKr3QEO/CZzb8u8Zbr7xBAJmcSITec+J3F0VzsrJ?=
 =?us-ascii?Q?An1k+ySKC3WnwG8vSaC8N4pVwIsOWpomQZxFh+Fwo+yMzZV/cBskU7epjVww?=
 =?us-ascii?Q?UiBQlAF09rceCG290YyGISn6Wd5kwj5/hNZ2VVGEHOXkggP28MGY5RXg7cnA?=
 =?us-ascii?Q?JPnybEm/6Fh8ucboDnrKbjdvORG4t3VCIkMP6xDKEasT33mgEM/izhFd4xQq?=
 =?us-ascii?Q?qHkCbsoteiQmHikjeT3VikS6ZW5ZSqU1lMypRK0AzjTqWVWgYrheipwukrDl?=
 =?us-ascii?Q?5y0FrSVDM3hitNWekJ/IGYqydX3ptoAS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V+TvocKCHGX7NRwyIY+ADgZkFNW8FczvMOvnTNCBwKpw3nryirmF6OVMDoP7?=
 =?us-ascii?Q?mkYbvyYWama2RsfeRSV1je65WCruu1b1oqZh0w9tq/3qMu76TKIatSABftDJ?=
 =?us-ascii?Q?smmScQ1fpx6h4F0yqSUqldj5AZaFSt0fI3pl3PEimZXRf/omdM3wOmUehbDh?=
 =?us-ascii?Q?zbcnAi7Bwh8Ol0DHbYEzrOCR71gx4pvNoa00HVT+WIbMGPPkIhmRth6ipc3M?=
 =?us-ascii?Q?4rPoqAgHY1MZhtFkckbLfYWYIRMchDpFzh09lyokjHk3tSnsI9jSf7ZXQPzl?=
 =?us-ascii?Q?tGkYlbLmmJZbVNa28AW8F7CatOOhwjIXRdJxkf1W//PY0Vbe02pRofrdbUHu?=
 =?us-ascii?Q?KMp+7KHB7T9HGyvuneQzRe5cPiOPXbHh/MmV35f/ZPEeBcS4InczUcD0hPxL?=
 =?us-ascii?Q?/3IS6wT98ZeKtTttrp24rV54Kn11MQGE/zpnO9mVkcBD+Q4xqAFrluyjshgL?=
 =?us-ascii?Q?6dv3dur8/+qx6MATFtYTYQo3h3waMXo+yha/v/iKlZIMRixTRmPDbZPfycIY?=
 =?us-ascii?Q?XQIzj6McbZuoyby5OF8zNYurtkPTb2Q/6NhkhzFjkyZPXJJ+W33Xs9RawGOc?=
 =?us-ascii?Q?7qyFDbcS7b/8oIfVtePdSaJVMzvajFLyfLldNa1KGRdZA/0DkfliNFdc1D18?=
 =?us-ascii?Q?3gCCf97nhJ7kYwgt7q8hgmRSScLtMmLRZeMuTlAMuG7rP2bXyWAL8kMut2cv?=
 =?us-ascii?Q?nL1hkbPsFgo2o6VdZ7NG++MG+wtGsvGNQCtfHCc31a/d9zvGJG2hG05VOKJU?=
 =?us-ascii?Q?wjIsj3aXksFikiwqutK2X8IExkCCw7tvRx3kLbKNW/s3Xaa2HGMi2NPLpKg2?=
 =?us-ascii?Q?SFfXf76n61zo9zSuVg3WBP42SvTYQ0z412Bz1gQC/mR55VDAyhBPTShMUsjf?=
 =?us-ascii?Q?f5ROP7n/EXiJs/Oc/zPsj/xfvJJuAZWnl10k/t6SqtCaOgtRRMh+yhuR7xzv?=
 =?us-ascii?Q?d4NqFEI3wLswzezZL3a8CeVubjHM+7Hs73bvhH1StWPHjC/cS0Q7KKufEb9J?=
 =?us-ascii?Q?IPRprsPW9Z0tJeBJNZite4JFLc5jKTSiqo8KTqynBIEbusJ0c9nrW8QECfLS?=
 =?us-ascii?Q?qjceuFrPjGFVF15C79E+V/sC+jnBCKqWMgm5jwa3dsQsYyAjPbaSD3fg1esE?=
 =?us-ascii?Q?UfCj/Sbw71LYsUQ/CIHpGrPeqon1YkqlTq6OzmlJgs3p737QsTXKtNBmKSvJ?=
 =?us-ascii?Q?C85h0qHi8OB17GCmCklV68mcQb3eqSKvBRqg5JPK60L4wCtp6iR7ca2ELq+T?=
 =?us-ascii?Q?RT4DAEwJ4iSIwD96iiGECgzJgrmPBkfeDx21dTpzpo5hBNPyyLpsuEPqPtCk?=
 =?us-ascii?Q?8LuhW8apdw1gjOYJPCUI8Dotp/0k3YVkHM6qjmYI0towBilDFIWpYfYqaPXa?=
 =?us-ascii?Q?HNsAn9FgIqazWkLla1wAaQTgqlZyyfxqfQJyHhDp7VWP0yppAeNducUrr19y?=
 =?us-ascii?Q?eGWca2uC7oEaA+YWAlnhOYxzssn9f7qCNyLoi/7OOz+hJB6+gZsNZhEyE/sH?=
 =?us-ascii?Q?lf0yDSvqdjmTaMv9InfPwdB5NCxBdeSpzoJbnSIL7uWY9+7sxaMLJASYsU2P?=
 =?us-ascii?Q?zA8hTvq0W+iJ8effOaaHlXHsDCZ8p+LNtEwnBc53U1Z9FZQ9hT/0RJHptG5a?=
 =?us-ascii?Q?ufXvo5wQZqaF/fQYmjZfd0SfOA6FCsgS71aWIojOyQ3G?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e50bafbe-a303-4e36-7fa6-08de205a9323
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:10:52.3048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/uDrSQS4JgHZoCkUFabjJwOZ1AqkQmsUPOpMk/YOQo1RZCjb0vRGG8kgiKGRgMdtGpkhZ6u0sLPctqBKixMEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3352

On Mon, 10 Nov 2025 11:38:04 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Nov 10, 2025 at 10:50:14AM +0100, Miguel Ojeda wrote:
> > With all the new files in place and ready from the new crate, enable
> > the support for it in the build system.
> > 
> > `proc_macro_byte_character` and `proc_macro_c_str_literals` were
> > stabilized in Rust 1.79.0 [1] and were implemented earlier than our
> > minimum Rust version (1.78) [2][3]. Thus just enable them instead of using
> > the `cfg` that `proc-macro2` uses to emulate them in older compilers.
> > 
> > Link: https://github.com/rust-lang/rust/pull/123431 [1]
> > Link: https://github.com/rust-lang/rust/pull/112711 [2]
> > Link: https://github.com/rust-lang/rust/pull/119651 [3]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
> >  Makefile                          |  3 +++
> >  rust/Makefile                     | 32 +++++++++++++++++++++++++++++--
> >  scripts/generate_rust_analyzer.py |  7 +++++++
> >  3 files changed, 40 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index fb4389aa5d5f..6ff887523eee 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1830,6 +1830,9 @@ PHONY += rustfmt rustfmtcheck
> >  
> >  rustfmt:
> >  	$(Q)find $(srctree) $(RCS_FIND_IGNORE) \
> > +		\( \
> > +			-path $(srctree)/rust/proc-macro2 \
> > +		\) -prune -o \
> >  		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
> >  		| xargs $(RUSTFMT) $(rustfmt_flags)
> >  
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 9eea6563ef35..a614a23023cb 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -27,6 +27,8 @@ endif
> >  
> >  obj-$(CONFIG_RUST) += exports.o
> >  
> > +always-$(CONFIG_RUST) += libproc_macro2.rlib
> > +
> >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
> >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
> >  
> > @@ -76,6 +78,17 @@ core-flags := \
> >      --edition=$(core-edition) \
> >      $(call cfgs-to-flags,$(core-cfgs))
> >  
> > +proc_macro2-cfgs := \
> > +    feature="proc-macro" \
> > +    wrap_proc_macro \
> > +    $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macro_span_location)
> > +
> > +# Stable since Rust 1.79.0: `feature(proc_macro_byte_character,proc_macro_c_str_literals)`.
> > +proc_macro2-flags := \
> > +    --cap-lints=allow \
> > +    -Zcrate-attr='feature(proc_macro_byte_character,proc_macro_c_str_literals)' \
> > +    $(call cfgs-to-flags,$(proc_macro2-cfgs))
> > +  
> 
> I don't understand this. We enable the features even on 1.79, but we
> only pass the proc_macro_span_file, proc_macro_span_location cfgs on
> 1.88 and above?
> 
> We add the appropriate feature(_) invocations on older compilers, so
> should we not support those things on those compilers?
> 
> Alice

For 1.79- it switches to any polyfill for byte_character and
c_str_literals using cfg no_literal_byte_character and
no_literal_c_string. These feature gates are stablised already so I
think turning on features on makes sense for this scenario.

For 1.88+, `Span::file`, `Span::line` etc are stable so proc-macro2 can
stop using polyfills. These APIs are not gated under specific feature
gates before stablising however. They were gated under the generic
`proc_macro_span` feature gate and only renamed to
`proc_macro_span_location` during stabilisation. So in this case
there's no already-stable feature flags to turn on. (proc_macro_span
feature would make these APIs usable in 1.79, but that's a
still-unstable feature flag in all versions of rustc).

So I think the implementation here is sensible. I believe Miguel's
patch is also pretty much replicating the logic in proc-macro2's
build.rs.

Best,
Gary


