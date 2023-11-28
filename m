Return-Path: <linux-kbuild+bounces-177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F27FB398
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 09:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA8CF282260
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 08:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE87E156EE;
	Tue, 28 Nov 2023 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ao6BfKKi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A4036C;
	Tue, 28 Nov 2023 08:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B45C433C8;
	Tue, 28 Nov 2023 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701158729;
	bh=0Sd6/InjMmJxbg/WRoT45JmnNSyw/cM2gU/plxlLlnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ao6BfKKi7YES83Ny8zylvOjAjoiJj5W4xlyz/eWe85KivPIuytnW57Q55hTSC4b8c
	 kzfTY4UBr8bJ4G80m8V3tdRTArJn2ZhrX4DIALTciWeCmSquOmsBFZumbXBBP1wiOp
	 3uB72uKQE3l3VGMy29RzF5cAIOr4J9JWf3ca6Oy0=
Date: Tue, 28 Nov 2023 08:05:26 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Laura Abbott <laura@labbott.name>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
Message-ID: <2023112824-dispatch-wooing-39de@gregkh>
References: <20231118025748.2778044-1-mmaurer@google.com>
 <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
 <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
 <2023112314-tubby-eligibly-007a@gregkh>
 <CAK7LNAT-OcaCi6tqPRgZxPXOV6u+YbaO_0RxtfmrVXPzdrio0Q@mail.gmail.com>
 <2023112312-certified-substance-007c@gregkh>
 <CAGSQo005hRiUZdeppCifDqG9zFDJRwahpBLE4x7-MyfJscn7tQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo005hRiUZdeppCifDqG9zFDJRwahpBLE4x7-MyfJscn7tQ@mail.gmail.com>

On Mon, Nov 27, 2023 at 11:27:07AM -0800, Matthew Maurer wrote:
> > > >
> > > > > With regards to future directions that likely won't work for loosening it:
> > > > > Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
> > > > > teach genksyms to open it up and split out the pieces for specific functions.
> > > > > Extending genksyms to parse Rust would also not solve the situation -
> > > > > layouts are allowed to differ across compiler versions or even (in rare
> > > > > cases) seemingly unrelated code changes.
> > > >
> > > > What do you mean by "layout" here?  Yes, the crcs can be different
> > > > across compiler versions and seemingly unrelated code changes (genksyms
> > > > is VERY fragile) but that's ok, that's not what you are checking here.
> > > > You want to know if the rust function signature changes or not from the
> > > > last time you built the code, with the same compiler and options, that's
> > > > all you are verifying.
> What I mean by layout here is that if you write in Rust:
> struct Foo {
>   x: i32,
>   y: i32,
> }
> it is not guaranteed to have the same layout across different compilations, even
> within the same compiler. See
> https://doc.rust-lang.org/reference/type-layout.html#the-rust-representation

Then you are going to have big problems, sorry.

> Specifically, the compiler is allowed to arbitrarily insert padding,
> reorder fields, etc.
> on the same code as long as the overall alignment of the struct and individual
> alignment of the fields remains correct and non-overlapping.
> 
> This means the compiler is *explicitly* allowed to, for example, permute x and y
> as an optimization. In the above example this is unlikely, but if you
> instead consider
> struct Bar {
>   x: i8,
>   y: i64,
>   z: i8,
> }
> It's easy to see why the compiler might decide to structure this as
> y,x,z to reduce the
> size of the struct. Those optimization decisions may be affected by
> any other part of
> the code, PGO, etc.

Then you all need to figure out some way to determine how the compiler
layed out the structure after it compiled/optimized it and be able to
compare it to previous builds (or just generate a crc based on the
layout it chose.)

> > > > > Future directions that might work for loosening it:
> > > > > * Generating crcs from debuginfo + compiler + flags
> > > > > * Adding a feature to the rust compiler to dump this information. This
> > > > > is likely to
> > > > >   get pushback because Rust's current stance is that there is no ability to load
> > > > >   object code built against a different library.
> > > >
> > > > Why not parse the function signature like we do for C?
> Because the function signature is insufficient to check the ABI, see above.
> > > >
> > > > > Would setting up Rust symbols so that they have a crc built out of .rmeta be
> > > > > sufficient for you to consider this useful? If not, can you help me understand
> > > > > what level of precision would be required?
> > > >
> > > > What exactly does .rmeta have to do with the function signature?  That's
> > > > all you care about here.
> The .rmeta file contains the decisions the compiler made about layout
> in the crate
> you're interfacing with. For example, the choice to encode Bar
> with a yxz field order would be written into the .rmeta file.

Ok, then yes, can you parse the .rmeta file to get that information?

> > > rmeta is generated per crate.
> > >
> > > CRC is computed per symbol.
> > >
> > > They have different granularity.
> > > It is weird to refuse a module for incompatibility
> > > of a symbol that it is not using at all.
> >
> > I agree, this should be on a per-symbol basis, so the Rust
> > infrastructure in the kernel needs to be fixed up to support this
> > properly, not just ignored like this patchset does.
> I agree there is a divergence here, I tried to point it out so that it
> wouldn't be
> a surprise later. The .rmeta file itself (which is the only way we
> could know that
> the ABI actually matches, because layout decisions are in there) is an unstable
> format, which is why I would be reluctant to try to parse it and find only the
> relevant portions to hash. This isn't just a "technically unstable"
> format, but one
> in which the compiler essentially just serializes out relevant internal data
> structures, so any parser for it will involve significant alterations
> on compiler
> updates, which doesn't seem like a good plan.
> >
> > thanks,
> >
> > greg k-h
> Given the above additional information, would you be interested in a patchset
> which either:
> 
> A. Computes the CRC off the Rust type signature, knowing the compiler is
> allowed to change the ABI based on information not contained in the CRC.

No.

> B. Uses the CRC of the .rmeta file, knowing, as was pointed out, that this
> effectively contains the ABI of every symbol in the compilation unit, as well
> as inline functions and polymorphic functions.

No.

> If neither of these works, we likely can't turn on MODVERSIONS+RUST until
> further work is done upstream in the compiler to export some of this data in
> an at least semi-stable fashion.

Looks like you need something a bit more fine-grained, as pointed out
above.  why not parse the structure/function information in the .rmeta
file?  Is the format of that file not stable?

thanks,

greg k-h

