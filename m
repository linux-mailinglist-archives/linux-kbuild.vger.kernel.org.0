Return-Path: <linux-kbuild+bounces-4215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5650D9A728A
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 20:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6F31F210F5
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 18:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346431FAC29;
	Mon, 21 Oct 2024 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEbGYTxx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD8378C76;
	Mon, 21 Oct 2024 18:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729536143; cv=none; b=gubEvG9EaSsM8tbMdud7LXYtSvWZSC8vsDNkjGqIIEFxTPJBon8WxtkcxOt49aI+egDxoqodjBBSogE1+Y4nfTChseB/m8hOeTmtyiaQvB/19n66TbfrbYfWPqmFjIybfrI3iZ3ajZmR6gm3xV1AGtkDthovzBJz1n/PGNBdWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729536143; c=relaxed/simple;
	bh=+Kbb0jjPLJku7s//6K5y7oK+W9M6LaWWpBk+mjyOwhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjudWIbZ6zIR//xe9fPAa86vBKbHI5U5Yqk0WsLttRAo41LBsXg9AMRDcpkFojZjt5Zn1uSU7PS3nXlAQ/mqkuJtaHfR/qN2s1o2fxIv3oaxJrqDStTt8Osi9QxV2ozVGXI4HVzY9FBEk1QySGxWhmOaFXaxrAXLTE5xKjPOfEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEbGYTxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4736C4CEC3;
	Mon, 21 Oct 2024 18:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729536142;
	bh=+Kbb0jjPLJku7s//6K5y7oK+W9M6LaWWpBk+mjyOwhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEbGYTxxFrxOUpy+NhAU5qJbFy5aAySrcV3700i5r0hSFxp2unWDIL6LMYeMjvHqG
	 kWmIxTkKyvu1e3RCrNmSkr97JFXnHHojrfnBtnMJYI3MDcJ+/bfcfZ63nPJSJRW9Jf
	 7QdFppDbduYt0cXFKcGV+54ShnXddnPhL7K3a87y8WUdHunrdinI/cVqTwprV9u9Ab
	 Xq9Lwqn2G69GVnquy22IbtHz50nvvitGCd9T/ECBKzifLSfmIxkSpWEBiDzb1/e59c
	 VWsSfTjpDvSsMisSsTfA+SlMVZC4hub7lnfQs7r5h4x88OCjNIj4IrrQpzvjbFE2rh
	 yze2YJgOUNpEg==
Date: Mon, 21 Oct 2024 11:42:20 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org,
	ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net,
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v6 1/5] export_report: Rehabilitate script
Message-ID: <ZxagjKghm1PKuwRk@bombadil.infradead.org>
References: <20241015231925.3854230-1-mmaurer@google.com>
 <20241015231925.3854230-2-mmaurer@google.com>
 <CABCJKudqG+8-MdxXRfdu7pYe=UniiiAV1P4QnbP2c1R3Q8DC=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKudqG+8-MdxXRfdu7pYe=UniiiAV1P4QnbP2c1R3Q8DC=Q@mail.gmail.com>

On Wed, Oct 16, 2024 at 05:29:21PM -0700, Sami Tolvanen wrote:
> Hi,
> 
> On Tue, Oct 15, 2024 at 4:19 PM Matthew Maurer <mmaurer@google.com> wrote:
> >
> > The `export_report.pl` script was broken [1] a while back due to a code
> > cleanup causing the regex to no longer match. Additionally, it assumes a
> > `modules.order` file containing `.ko` in a build directory with `.mod.c`
> > files. I cannot find when this would have been the case in the history,
> > as normally `.ko` files only appear in `modules.order` in installed
> > modules directories, and those do not contain `.mod.c` files.
> > This patch makes it able to report symbol usage counts for a build tree
> > with modules and MODVERSIONS.
> >
> > Since the rest of this series will change the format of `.mod.c`, this
> > change fixes the script to work correctly against a current build tree.
> > Given that the regex no longer matches the format used in `.mod.c`, it
> > cannot have worked since 2019, so updating this script is purely out of
> > an abundance of caution. I am unsure who uses this script or for what
> > purpose.
> >
> > * modules.order in a build directory uses .o, not .ko files. Allow .o
> >   files when parsing modules.order.
> > * The .mod.c format changed [1] how it expressed the section attribute,
> >   leading to a regex mismatch. Update it to match modpost.c
> >
> > [1]: https://lore.kernel.org/all/20190909113423.2289-2-yamada.masahiro@socionext.com/
> 
> If this script has been broken for half a decade and nobody noticed,
> does anyone actually use it? If this is dead code, I would prefer to
> just delete it.

I'm in full agreement, please trace back the history down to why the
heck we have this, otherwise chuck it.

  Luis

