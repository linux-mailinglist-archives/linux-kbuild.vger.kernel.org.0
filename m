Return-Path: <linux-kbuild+bounces-3144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC36F95A84C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 01:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78085B22A66
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 23:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8A017C9EA;
	Wed, 21 Aug 2024 23:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FXaiMujx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94B168497;
	Wed, 21 Aug 2024 23:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724282991; cv=none; b=W9qVYrxvSU6erzZvqzDQHxTV5yzcCdVDKxAPeZTE+U4cl5uC8uFykVnLFnbLEp1bBxynUSHwdiMNLpuisl2m3xPmKBOTAtDnlaxYVpI127O/24vLBs2rVbgu6MJfXNoTR8bZcAWmgaFNEFNN3GQMDBusEzKt4RdwzS4JKIEBpzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724282991; c=relaxed/simple;
	bh=N/k9pIkt02mMen0MtDKHy/0oKLv8iaeYOQQ6JCBQ9RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tU7Ehta14AQ9Tcsa8sRhceUEvsvb0UaIlT7QrDL84lF69+EgUSzC84STL2IFTiihqhCCbd64syeLXtRIlIS6KiKVsBzXodXvIFX8hceS/vmh5clPSleybIewAMwgwq6uvbr6Ak74CapsiFdYq2Eh4ii5FKT9kpu/uiyRwnXVKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FXaiMujx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC20C32781;
	Wed, 21 Aug 2024 23:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724282991;
	bh=N/k9pIkt02mMen0MtDKHy/0oKLv8iaeYOQQ6JCBQ9RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXaiMujxKGsbWGwRkg8O548AIYvSH0D28zmJwv2c1WT509PvJCr/c4UnMYE1IgVo4
	 xEjbNXDJUQdhu4/E4vqD7hveigHTCZgkKp19UZNZKGE0Xh4U8OvSRrl85Xt57QK1Ra
	 6doO7pqsGv3JnmHOFCbXpJYj740iY15CzYk/J0Js=
Date: Thu, 22 Aug 2024 07:29:48 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Matthew Maurer <mmaurer@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
Message-ID: <2024082229-elevation-emporium-8118@gregkh>
References: <20240815173903.4172139-37-samitolvanen@google.com>
 <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh>
 <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
 <20240819193851.GA4809@google.com>
 <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
 <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
 <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com>
 <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me>

On Wed, Aug 21, 2024 at 11:31:25AM +0000, Benno Lossin wrote:
> On 20.08.24 22:03, Matthew Maurer wrote:
> >>> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
> >>> ironic, considering what I said in my other replies, but in this case,
> >>> we would provide a safe abstraction over this `union`, thus avoiding
> >>> exposing users of this type to `unsafe`):
> >>>
> >>>     #[repr(C)]
> >>>     pub union KAbiReserved<T, R> {
> >>>         value: T,
> >>>         _reserved: R,
> >>>     }
> >>
> >> I like this approach even better, assuming any remaining issues with
> >> ownership etc. can be sorted out. This would also look identical to
> >> the C version in DWARF if you rename _reserved in the union to
> >> __kabi_reserved. Of course, we can always change gendwarfksyms to
> >> support a different scheme for Rust code if a better solution comes
> >> along later.
> 
> Yeah sure, that should also then work directly with this patch, right?
> 
> >> Sami
> > 
> > Agreement here - this seems like a good approach to representing
> > reserved in Rust code. A few minor adjustments we discussed off-list
> > which aren't required for gendwarfksyms to know about:
> > 1. Types being added to reserved fields have to be `Copy`, e.g. they
> > must be `!Drop`.
> > 2. Types being added to reserved fields must be legal to be
> > represented by all zeroes.
> > 3. Reserved fields need to be initialized to zero before having their
> > union set to the provided value when constructing them.
> > 4. It may be helpful to have delegating trait implementations to avoid
> > the couple places where autoderef won't handle the conversion.
> > 
> > While I think this is the right solution, esp. since it can share a
> > representation with C, I wanted to call out one minor shortfall - a
> > reserved field can only be replaced by one type. We could still
> > indicate a replacement by two fields the same as in C, by using a
> > tuple which will look like an anonymous struct. The limitation will be
> > that if two or more new fields were introduced, we'd need to edit the
> > patches accessing them to do foo.x.y and foo.x.z for their accesses
> > instead of simply foo.y and foo.z - the autoref trick only works for a
> > single type.
> 
> We will have to see how often multiple fields are added to a struct. If
> they are infrequent and it's fine for those patches to then touch the
> field accesses, then I think we can just stick with this approach.
> If there are problems with that, we can also try the following:
> all fields of kABI structs must be private and must only be accessed
> through setters/getters. We can then modify the body the setters/getters
> to handle the additional indirection.

That's just not going to work, sorry.  Remember, the goal here is to
keep the code that comes from kernel.org identical to what you have in
your "enterprise" kernel tree, with the exception of the few extra
"padding" fields you have added to allow for changes in the future in
the kernel.org versions.

Requiring all kernel.org changes that add a new field to a structure to
only do so with a settter/getter is going to just not fly at all as they
will not care one bit.

Or, we can just forget about "abi stability" for rust code entirely,
which I am totally fine with.  It's something that managers seem to like
for a "check box" but in reality, no one really needs it (hint, vendors
rebuild their code anyway.)

thanks,

greg k-h

