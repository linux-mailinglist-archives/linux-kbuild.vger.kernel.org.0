Return-Path: <linux-kbuild+bounces-3058-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6E955631
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 09:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA2581C215B5
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 07:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03358140369;
	Sat, 17 Aug 2024 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ppWBcpSc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5713D8A3;
	Sat, 17 Aug 2024 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723880483; cv=none; b=bBoNpIYyXp0Qu+sWEqyZVLfURofXPChG5rCS6icFjLs8dzzuGYpiq34Nd0W/6b9Z7ik8oKvcuFCGoh6Qb5oq0xxMcMI1wPACoefE434XlY5nBPjgm+yJOBveHttSyYSWYXX5q6HWid2sOAxHMtnYicZRluqGKgmW8kcRr1vE/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723880483; c=relaxed/simple;
	bh=ouOiNakR9AJKElEYsRFF7eC3ZWKxqzpdD71OQFANQC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZCKtJ2nLKxDT9exYz9uCFckgCwSmLueCoKwGGx3T5obXyxH0b2CDOXU/8XEzyPHMFFYnhfVNzCRq7XFgDyYQuUY7I9eJNUDwwBzOrzvXUrsToHGgOXa5gzyouzp0XOZKy6mO0L/kyJS961/14m4VkqRMylulKlkhV/r626UtYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ppWBcpSc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8537BC116B1;
	Sat, 17 Aug 2024 07:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723880483;
	bh=ouOiNakR9AJKElEYsRFF7eC3ZWKxqzpdD71OQFANQC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppWBcpSc6rrRBk/5O16TwTf0NlH3xqMdKThzt5+5neFK1l5kW4C21h2A2ekvaAjPJ
	 j5PIgKE8iLMHUGRwOioEVlY0Ds50UMOHNGOGc6uiqboS6bwSNJTiRGBCf0YfM2inEb
	 jsNXjODIGAZVEwVLAh0lZiNSoSH/xsVCZSUMvu3I=
Date: Sat, 17 Aug 2024 09:41:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
Message-ID: <2024081705-overarch-deceptive-6689@gregkh>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
 <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>

On Fri, Aug 16, 2024 at 08:50:53AM -0700, Sami Tolvanen wrote:
> Hi Greg,
> 
> On Fri, Aug 16, 2024 at 12:20 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Aug 15, 2024 at 05:39:20PM +0000, Sami Tolvanen wrote:
> > > Distributions that want to maintain a stable kABI need the ability to
> > > add reserved fields to kernel data structures that they anticipate
> > > will be modified during the ABI support timeframe, either by LTS
> > > updates or backports.
> > >
> > > With genksyms, developers would typically hide changes to the reserved
> > > fields from version calculation with #ifndef __GENKSYMS__, which would
> > > result in the symbol version not changing even though the actual type
> > > of the reserved field changes. When we process precompiled object
> > > files, this is again not an option.
> > >
> > > To support stable symbol versions for reserved fields, change the
> > > union type processing to recognize field name prefixes, and if the
> > > union contains a field name that starts with __kabi_reserved, only use
> > > the type of that field for computing symbol versions. In other words,
> > > let's assume we have a structure where we want to reserve space for
> > > future changes:
> > >
> > >   struct struct1 {
> > >     long a;
> > >     long __kabi_reserved_0; /* reserved for future use */
> > >   };
> > >   struct struct1 exported;
> > >
> > > gendwarfksyms --debug produces the following output:
> > >
> > >   variable structure_type struct1 {
> > >     member base_type long int byte_size(8) encoding(5) data_member_location(0),
> > >     member base_type long int byte_size(8) encoding(5) data_member_location(8),
> > >   } byte_size(16);
> > >   #SYMVER exported 0x67997f89
> > >
> > > To take the reserved field into use, a distribution would replace it
> > > with a union, with one of the fields keeping the __kabi_reserved name
> > > prefix for the original type:
> > >
> > >   struct struct1 {
> > >     long a;
> > >     union {
> > >       long __kabi_reserved_0;
> > >       struct {
> > >           int b;
> > >           int v;
> > >       };
> > >     };
> > >
> >
> > Ah, ignore my previous email, here's the --stable stuff.
> >
> > But this all needs to go into some documentation somewhere, trying to
> > dig it out of a changelog is going to be impossible to point people at.
> 
> I agree, which is why I included the details in the comments too.
> There's also an example file if you scroll down a bit further, but I
> can certainly add some actual documentation too. Since the --stable
> bits are not really needed in the mainline kernel, do you prefer a
> file in Documentation/ or is it sufficient to expand the example files
> to include any missing details?

Ah, I missed the examples, I thought that was a test for the feature :)

Yes, it needs to be documented somewhere, and usually documentation is
in Documentation/ so that it shows up on the web and everywhere else.

> > > +/* See dwarf.c:process_reserved */
> > > +#define RESERVED_PREFIX "__kabi_reserved"
> >
> > Seems semi-sane, I can live with this.
> 
> Is there something you'd change to make this more than semi-sane?

I can't think of it, but perhaps we need a check somewhere to ensure
that these symbol names do NOT end up in the main kernel tree?

Or just keep this whole patch as an add-on on the end that is only
applied by the distro kernels and is not merged into mainline at all?

> > I don't know if you want to take the next step and provide examples of
> > how to use this in "easy to use macros" for it all, but if so, that
> > might be nice.
> 
> This should already work with the macros Android uses, for example,
> with minor changes. The current example file doesn't include macro
> wrappers, but I can add them in the next version.

The Android macros are a copy of what SLES and RHEL does so that's good.

And yes, an example macro would be nice so we all don't have to reinvent
it yet-again like we have done already.  Consolidation is nice.

> > Especially as I have no idea how you are going to do
> > this with the rust side of things, this all will work for any structures
> > defined in .rs code, right?
> 
> Yes, Rust structures can use the same scheme. Accessing union members
> might be less convenient than in C, but can presumably be wrapped in
> helper macros if needed.

That feels ripe for problems for any rust code as forcing a helper macro
for a "normal" access to a structure field is going to be a lot of churn
over time.  Is the need for a macro due to the fact that accessing a
union is always considered "unsafe" in rust?  If that's the case, ick,
this is going to get even messier even faster as the need for sprinkling
unsafe accesses everywhere for what used to be a normal/safe one will
cause people to get nervous...

thanks,

greg k-h

