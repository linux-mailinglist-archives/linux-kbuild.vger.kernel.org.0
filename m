Return-Path: <linux-kbuild+bounces-9509-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA60C46D0A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 506F83B05D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DA430F939;
	Mon, 10 Nov 2025 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CRLW3euM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020141.outbound.protection.outlook.com [52.101.195.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9572F747F;
	Mon, 10 Nov 2025 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780416; cv=fail; b=tcqqUJiRbXU/FGkYI9mz7VsvMDcASaWgqHdbt0Pzew1bnjtR3QPRZwODMy0HH0+ymf3bK5Yu5NFQYCqrEUNijx4ktHicJ+/rdYEQMpNPMyBMKUtmnAPVJqJ9RW3vcRMItlUfMpKPK2VDiDfO6u0VZKWNbyB3kLs3QBq6BJbj8EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780416; c=relaxed/simple;
	bh=etfPx9c1Gh+Izwb7Lhj1XPxmmbiDuqY0cdKJtGr+3Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G86nKyT6F6088KI2O9YnRccnig8duIqSjs5iGheG0Z6dJGXSLx7OPefEsr+Ev9lUQzAtKp/cAe0TH/I8aaMBuPKXQrBa1xCmbjgtHpQgDmC3zhMp/Reu70LB3Jm/RbfSd8cm+3TNl5TwqSqKKJSbHsifxyQp3WtlEqRk9HxjTRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CRLW3euM; arc=fail smtp.client-ip=52.101.195.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2Ch91kXji0gN+kA6YS9WhcunFMq3WW3eX+I0U+oK9yHJwm8HjF9W//ke7fDkIScDSw0n5OoPOOQym9ZruotH7BeAdDv5+AAmvkqfJUOC8hx07FCbX+YGKbcM76RstgCvF9UGD00ZwElxNmwipalA2EU/E+D8aIiXE0XztQLNuhbIMPltZdzryX1gZ4uVTbX4kn1nOOq4rhZdwKqiqg5qzjStWxisKOZziV837yPZs6IuHohSJKBXimmCnH15hnOPV+YL/EzGbXo0ht8LSjXjAgnsGpWJT1G0A6JHXivWNYp6Xrhx8LLCcfDsZ2SL5u7usSeatbb1REcbGxOJkcdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFcS25dsPUjURjIC/xiLaRX/Bge5Hh9SSdBe3mv1M70=;
 b=zNnZItRUGNiJCUprgoLOULRKBy5Y044soI/VwMZbDafiNT0CoW7fXK6MiSEClajijcYDyUd/Cwm7gLqBEZ2ffg+sm8X1mZUoi4K7V6K1zM3Ywow/i/mcjAwBsKWC8rY+gjO1rSbd1qjTWJ9Zqh7T4EGe0Cn0x0xO+2O1RJkOEU0Pl1639wBgjBCuyJ8GTXee7bidvgvec3GZveaGcn1eWfyMiNUJ1qFEpVWAgwcmbcaFVU3miTz3WE4UdUNWJ8B5eWcacLfHnkF7rkZV6cJDCZAcvx7HDyUEeK76B1h2K4MlJ2PO7ZqPqfnOjVY1BNMm3iCivHnCGX/cVq6sYYW7YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFcS25dsPUjURjIC/xiLaRX/Bge5Hh9SSdBe3mv1M70=;
 b=CRLW3euMz3l5utBjj5VQTaWxdt/xy8qRGBYpRFV3c+neinfq6lmFc/Lp+/wrytAea1iiKw24eajYHUg/7J8HlLKyscz+x3sICygMyCBToAqC02iacLfmZvZHvfl0L+DNZD8VDIR5EZdTWl8CPGvGuSdF+D+pFxZvd267nVxRmAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB5163.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:13:31 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:13:31 +0000
Date: Mon, 10 Nov 2025 13:13:26 +0000
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
Subject: Re: [PATCH 13/18] rust: quote: enable support in kbuild
Message-ID: <20251110131326.309545df@eugeo>
In-Reply-To: <aRHQA6FEoxACerIQ@google.com>
References: <20251110095025.1475896-1-ojeda@kernel.org>
	<20251110095025.1475896-14-ojeda@kernel.org>
	<aRHQA6FEoxACerIQ@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0387.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::16) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb38fc3-0170-40c7-8f18-08de205af1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9B2V6WsSOyT9H5ZnZGWt8Z34leIVc+a67vhl3xrU9bLa/twYP12BTB/NQYjI?=
 =?us-ascii?Q?JBOt2/jFUS2XmS/Cw6SLLxd6lQD5ku2SEntpklLee/XUTEteaGqi37eiVnn2?=
 =?us-ascii?Q?cGBzRsZRIR6fVZZ19kyGTsYDKeGgrGhFjwqynydmuEYOc/YuuAZmxVFyXNUk?=
 =?us-ascii?Q?qnaVjma99u2tFc/V1XeU6qp+OYt8hCSfggU3pbGB10iZVl+lgtjIEz/qQjUa?=
 =?us-ascii?Q?94h/rRa8CuM5xT6wMJBeHWdcwvQSLA/4Q6YqyghPGi3o8FGKbL23A/D1/Led?=
 =?us-ascii?Q?Qt9pg1/ImsnYJiItrJomaywUrprCr+Q51OEtTI6il/EO8jmE8QuqOt1M9SBZ?=
 =?us-ascii?Q?8ijIXFBybA0jPkNnkz9zBVmjoXfr7tHcPZj2gJoULDTTVxDtxjcZu7llvNBH?=
 =?us-ascii?Q?/tCv0PnltNeZBsmn31rn1tq3W6ZbpGvlQS62iwN3wsite9kqspggy1twfga0?=
 =?us-ascii?Q?gkl+vN/ZnIQNh/Uzu8T74pggWuLZXXig2PRizMTKEikB4BYk678LEgwcFchB?=
 =?us-ascii?Q?ELzpkLvipjzKWViQeHEoDGijrya9N3VMzxCoDJU9G4lYKmNKz+qm3brhnG5r?=
 =?us-ascii?Q?CKAoQCYXZ0IEjMioWorCm+94yWOdzRj9WIDOX/hFu4gTp/sNgV6lGdms/EIw?=
 =?us-ascii?Q?h9B5Ny84mwXUdXX8htdI7HCY9X9HJhzO13dLXuryrda1mj5HN00o2PemIUqY?=
 =?us-ascii?Q?omLV623HjKIEU+5D6cWyN7O5tCxegWDojPlWjd7qB1LxkqGhqA4/YzZ/AVj7?=
 =?us-ascii?Q?D3RdKHFN1B4L3y9nGNvmyhZtnVnZzruMjoO0S6iRqI//Bzg52BxgYu80tl9k?=
 =?us-ascii?Q?wg+Qo89czmPEQqbldANTZfYq4qbmIHkOKQkG+TkEC8cJ4FTtpoS77LfYSnIq?=
 =?us-ascii?Q?DA1Gb4pgweMO0bV5jdYFFikmaeDv98pPHzrtUD1rHITskc4g0ruIGe6dCxCF?=
 =?us-ascii?Q?D8CSrxWGs9cNisq9Xw6D7RQdubCCJ1ARKOxnKHo9GPXw9dwTntPvgSWGxwUK?=
 =?us-ascii?Q?tgMEv8FY1UAaV0S9kdSS/S7RooagrOqDc4SYTKPEEA1XxAtRATeC9GxCmrBt?=
 =?us-ascii?Q?VlY+EQRbURmmkSGDAjgXsmhZtxJzIAIv6auaLxJDuT0tvGqtBg6HUHciuiAh?=
 =?us-ascii?Q?kEkw7cf8r6ZHABheDi18IPvciWHgJwmZfMVRmIh3NBk9W6hIw3+BRM60SDvD?=
 =?us-ascii?Q?VVuCOT3JHa6n/cplWeiNG1ALseHvbfv9hfoRnD6MnjBG3P9num1bXaOxTg6/?=
 =?us-ascii?Q?Du3OjQ7faFZMMVW1FpT40zh48GXqw0beF4ULX+XN2cYUMYJLk8drrkIDZuu5?=
 =?us-ascii?Q?r7iW8rmllT89Lfj49ztM8RD0jeCwv67g8lsvGsFZV+R9lcEYIWEYNCic/2sC?=
 =?us-ascii?Q?cibhMQ7EizAgl6hOI0lv0qvGG/vQIF9qVt8NJ/uKs59RXvypjDUcfd/S19t9?=
 =?us-ascii?Q?paURFe2Oqo4Y66lIXGlYQbhXT/xkZnKS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cYji9fEzMD7SANqAOxUUoaIhK5ClRjt4lO64Wbb3GxM8NGHHxmGjPhJ/lz7x?=
 =?us-ascii?Q?QShWQ7iknlBMfm2KlZD5lMz8jISiSWsUkO0tYnINXQV0UqNHKZCx63ii49EE?=
 =?us-ascii?Q?eGPWZHIVvPFeAzLBACLPvie8RQ3qWAcn8UlKvELxRIhHJiP+tvv4+/oyAuf2?=
 =?us-ascii?Q?xDnAof12kHhpf0stU/ndcg9Adjmw4Fn0NXXWZgwbHlhHhdiCfIuNhX6aPJFg?=
 =?us-ascii?Q?LbVtOE/XHc3FQpZd5E8xbAZT8BmxYfdSNRk2hJS0r+p76fd7mhNMLwV0OjEG?=
 =?us-ascii?Q?8VvqAQtOr48Iz+dFMs5TSwm7XYIaZrZ+mWWVVc9XknjtRv8kVlbbKUgIzltO?=
 =?us-ascii?Q?/1GPKS8Hu7xeQP5lSYf4fkQUAovNqxGISX75Y4LSydmkEh6wo14Lxxxqu2dz?=
 =?us-ascii?Q?kwbo5s+di2ZqE4nG//qcO+9TD/0tTMPRADvAcOwXpg5f7oLgCXso1Sx2Mx1Z?=
 =?us-ascii?Q?JC8yXn5qVCveMkNrwPCphdxrtoIXzNlf7hyVqTB8PImyrcyuYxFLZcOtQrzc?=
 =?us-ascii?Q?GCSv57TuwxQE5zgaNFQvnp3X42k/9J/NKafu/Ckl+Mn1w+C7jrb4biGoLMid?=
 =?us-ascii?Q?E4XFbyeXRieq6iHPBT79EaA9Lfvlwe9x/G+nb8jVlz2SMa+APt0AleBVMZYT?=
 =?us-ascii?Q?F/l3OwDlq4OlV0E2DZMQ1SF67g+XzwrYlrrvK6fMCrrFayWiyF1Yk6gW2kjJ?=
 =?us-ascii?Q?eXEqOnQQhlAB+baSjj0oa+BFy8IM5KCilADZKRiVe/tX+9qmlWwa+2mTuKz3?=
 =?us-ascii?Q?7/nicrNBM48psilfgtI4F6IdERKDd+7lVa5mO9xoO5fwSkhnI/mxs03Okjz3?=
 =?us-ascii?Q?CwSmFDrkOIWO+FMbVkpfTyIfmMVX+bU3fBlKgnFRou6Vc+Swot3mvocFypt+?=
 =?us-ascii?Q?e/PDKLUc37juhpY0s4q4+mKxCR3WqjPJO7oFMc23nLZqOwPGq/TRMZe1aRfD?=
 =?us-ascii?Q?HSHnCKrhvMLIVqjhZcMATePYH61Iq8BzS3bYjLF0I4qMgJcmb2bHhYYMkI4E?=
 =?us-ascii?Q?ETOl3ZZvqalqim5ByfOyKLBczofyW264YmqFmlCAKpfyQD4VsNQhWC3uny7B?=
 =?us-ascii?Q?Lr3nvOS3VPsBCvyq8ZI9VTYPeAus+WN5APu8EMs9HgaE2by4OChUED9cmhQz?=
 =?us-ascii?Q?3PU9lWPhFNpODouTqddmAYQnaVKMxjRztbvOiSa5Al0Y4KRlhWv4D6iByPmf?=
 =?us-ascii?Q?bDT/bxLtTyvFoFT0WZtU8UsUK0hs2L1cc4R33WliAEi7EWpCAVnrUocvBwiA?=
 =?us-ascii?Q?XSYCcwXxBNEfBPenty6txG+StaOkSaXol+4XPL/3fU5D+ac3CStkyMKeopbE?=
 =?us-ascii?Q?+Anua7jTceCrzvqNRvsugH2i+y/sHCX81Z0RAXVVEM4UTfsp1Qu3Z4x7MFIY?=
 =?us-ascii?Q?11NTiCDhG1qNv3E4i9+NR9mn9mQm5/IsDKpMmNnlfdCTpYpKPXrnlOwch1Uc?=
 =?us-ascii?Q?yb0g3wHhLI2BTI2xePgg4M5rfLyIizSQca5INn4ucq2CGeHtADU66Qk+SUjl?=
 =?us-ascii?Q?2Ktlo5jnZLVFLCOeOGFUsi7yaFVqK82BSYCggC6m5ijNzj9jXl6jnGDRSBOB?=
 =?us-ascii?Q?vCLLrg7rjR3ojJZZHoSbPTqrq6LTPG//oh6R3EiV8YpTnuEmIHsByJ6ZcVSE?=
 =?us-ascii?Q?2tHOcNc9CKZBXnY8937hsD3VseCI03x2xeTKu9uA7T+m?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb38fc3-0170-40c7-8f18-08de205af1f2
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:13:31.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDk+CeIpbWceqcnYzaMrLcfpQlExDrbzhMGa3sWiPhPPq0U7zomO1VdtsHLP1xaK4IisGGdYCcH+BHyTqDgbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5163

On Mon, 10 Nov 2025 11:44:03 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Nov 10, 2025 at 10:50:18AM +0100, Miguel Ojeda wrote:
> > With all the new files in place and ready from the new crate, enable
> > the support for it in the build system.
> > 
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>  
> 
> > diff --git a/rust/Makefile b/rust/Makefile
> > index a614a23023cb..801a8cbf3bdd 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -199,8 +218,8 @@ rustdoc-clean: FORCE
> >  quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
> >        cmd_rustc_test_library = \
> >  	OBJTREE=$(abspath $(objtree)) \
> > -	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> > -		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
> > +	$(RUSTC_OR_CLIPPY) $(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
> > +		@$(objtree)/include/generated/rustc_cfg \
> >  		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
> >  		--out-dir $(objtree)/$(obj)/test --cfg testlib \
> >  		-L$(objtree)/$(obj)/test \  
> 
> This change seems unrelated?
> 
> Alice

This is to be able to skip over edition flags for `quote` when building
the rusttestlib?

Best,
Gary

