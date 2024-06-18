Return-Path: <linux-kbuild+bounces-2210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7FC90DC2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 21:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F11E1C22BD6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 19:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A2B15E5C7;
	Tue, 18 Jun 2024 19:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrsCiClw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E71BF50;
	Tue, 18 Jun 2024 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737463; cv=none; b=boR2UcCW9TuKPBFP8vrU85eXklAnAIyFMVdHBwJD/m648wJXD2cRHQxFtVadQ+qln4LHggwIq8tLxvjuH4QTu3SxkFVYaMWb9RkGyoGjt2H6suJ/Ugr8Zxy16DisNywhZoOz4f5sU2fAYLABxDfxMCrgswospWuEz3V38gtJh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737463; c=relaxed/simple;
	bh=fJOPYun2JD6QA157Il6JHmdOZCbLeRXz3p5HA5JVDQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZyFzNwq76Qk2zQOazoDN93TkC0+EVpOwVtgD4w+7yknkKJP+WMW/1vIngmqlea9rYjuybY70LNpCtIEk81JNhdolck+cTedfCWgUNGCR4/G7++3i0JLOS6VlcVni8R+JeCCxPSvFdMTiGnvjKcnmLmasZsjzHhb8zoPbNiipBus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrsCiClw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F827C3277B;
	Tue, 18 Jun 2024 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718737463;
	bh=fJOPYun2JD6QA157Il6JHmdOZCbLeRXz3p5HA5JVDQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KrsCiClwJPeYSihyM58XGFKpFhiWa1ilslZoEhj8kxQeR7EEG+AlCSmgdR9cyN4G8
	 BwHFwCB2Ca+7VPyCaJzQ5Zu0D779R5zjuPXfl3wmMVfZmfI1Ndj7mBwE+eQxjz5piW
	 Hqis6SxPxzfbAOjP5JPJntaCSFQnjPqIElGXrybn1L78ZuBgr3YLf0YbkNMMgDOl6D
	 Tt7NRSfdWhR16oxrNrRRUQkdqyzPoPkgkDj/Xzp16J/MHOhlxKIKb4YqcfYceay7Pd
	 eMPCYzczyhzAkdpCrr5Yk2YdFSVh56xUMbcTXsuoNWpbbbubRWVIQZAKVf0fotxTFi
	 1p53b+WGHTOLw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so61308371fa.3;
        Tue, 18 Jun 2024 12:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpbWoxWFVBWYbputz2oQGr8aTScMV4jW5PuZ0C7Frs5O90VItO7rHYHlSFtAOcEGrbhnGVjiu0EGTmCEP1DI3CDQ5I+Deide0Ug5HA8rqbGQHO/WjHnUy0gATVw5kQhWrpP7S9NiBPEaWsTAnMa++saANUnytHdhG0Xx2RlG9i4w5vhfpJN2fyHzVfrCXlWSakTvbD6MbD/T45BhtYuLn/J0bC/CGCa0ba
X-Gm-Message-State: AOJu0YzVr4OSpBbKhRmqeAY3qKBCE+ZYwmt9rvhrl6YQdq/+Za4A8x46
	oE37bZTMDbPiNnSzBoiF4vIHcmfVXf3honVWTFFQ+LgJvTQ/SuMwmiL/D8fapMR6l2vt7C7WUqO
	skNk+6f+W+qhTuac63TZuwF7W0uI=
X-Google-Smtp-Source: AGHT+IHdEQ8Lqi2PjHPIy8+3Q4dGolDkRreSfyx1lVIeSo7oLPFlD7sR6usZ9IvZQdaUPxNjDKG2i0ZdQaXg6Syga60=
X-Received: by 2002:a05:6512:12cc:b0:52b:79d6:5c28 with SMTP id
 2adb3069b0e04-52ccaa926f4mr342921e87.52.1718737462037; Tue, 18 Jun 2024
 12:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
 <2024061842-hatless-viewpoint-5024@gregkh> <CAK7LNAS_OsXeoDRoMbdXUGY=-jhuoHgo-L6W79n+Kb4G4xEBwQ@mail.gmail.com>
 <2024061828-tricky-playtime-f844@gregkh>
In-Reply-To: <2024061828-tricky-playtime-f844@gregkh>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Jun 2024 04:03:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9qgk2AxtMUMiOw-jYZyjmj6aVDPH25aPa4K-1jQjOFw@mail.gmail.com>
Message-ID: <CAK7LNAR9qgk2AxtMUMiOw-jYZyjmj6aVDPH25aPa4K-1jQjOFw@mail.gmail.com>
Subject: Re: [PATCH 00/15] Implement MODVERSIONS for Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 2:18=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 19, 2024 at 01:50:36AM +0900, Masahiro Yamada wrote:
> > On Wed, Jun 19, 2024 at 1:44=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Jun 17, 2024 at 05:58:19PM +0000, Sami Tolvanen wrote:
> > > > Hi folks,
> > > >
> > > > This series implements CONFIG_MODVERSIONS for Rust, an important
> > > > feature for distributions like Android that want to ship Rust
> > > > kernel modules, and depend on modversions to help ensure module ABI
> > > > compatibility.
> > > >
> > > > There have been earlier proposals [1][2] that would allow Rust
> > > > modules to coexist with modversions, but none that actually impleme=
nt
> > > > symbol versioning. Unlike C, Rust source code doesn't have sufficie=
nt
> > > > information about the final ABI, as the compiler has considerable
> > > > freedom in adjusting structure layout for improved performance [3],
> > > > for example, which makes using a source code parser like genksyms
> > > > a non-starter. Based on Matt's suggestion and previous feedback
> > > > from maintainers, this series uses DWARF debugging information for
> > > > computing versions. DWARF is an established and relatively stable
> > > > format, which includes all the necessary ABI details, and adding a
> > > > CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like =
a
> > > > reasonable trade-off.
> > > >
> > > > The first 12 patches of this series add a small tool for computing
> > > > symbol versions from DWARF, called gendwarfksyms. When passed a lis=
t
> > > > of exported symbols, the tool generates an expanded type string
> > > > for each symbol, and computes symbol CRCs similarly to genksyms.
> > > > gendwarfksyms is written in C and uses libdw to process DWARF, main=
ly
> > > > because of the existing support for C host tools that use elfutils
> > > > (e.g., objtool).
> > >
> > > That's cool, can the C code be switched to also use this?  That way w=
e
> > > only have one path/code for all of this?
> >
> >
> > As the description says, it requires CONFIG_DEBUG_INFO.
> > We can strip the debug info from the final vmlinux, but
> > I guess the build speed will be even slower than the current genksyms.
>
> For people who want genksyms (i.e. distros), don't they normally already
> enable DEBUG_INFO as well?  The problems of genksyms are well known and
> a pain (I speak from experience), so replacing it with info based on
> DWARF would be great, I'll gladly trade off the DEBUG_INFO issue for
> stablilty!
>
> thanks,
>
> greg k-h
>



I do not think gendwarfksyms is a drop-in replacement,
because it relies on libelf and libdw, which will not
work with LLVM bitcode when CONFIG_LTO_CLANG=3Dy.

His "Let's postpone this until final linking" stuff will
come back?
Then, vmlinux.o is processed to extract the CRC
of all symbols?


In my benchmark, this tool took 3.84 sec just for processing
a single rust/core.o object.

I'd love to see how long it will take to process vmlinux.o

And this occurs even when a single source file is changed
and vmlinux.o is re-linked.




--
Best Regards
Masahiro Yamada

