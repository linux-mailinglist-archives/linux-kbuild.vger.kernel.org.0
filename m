Return-Path: <linux-kbuild+bounces-4731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 373089D2FBA
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 21:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA7428423F
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 20:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ACA1D12FE;
	Tue, 19 Nov 2024 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHYzFeaw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D372149C7A;
	Tue, 19 Nov 2024 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732049312; cv=none; b=TzfdD1/rZ45XClB2GFMDwLWvw0lZ7DZP/kPed++p9ExIuM+u9bXK/T9Qrin0BmUK5/wVfaaEtpxzK9bSX5p215fmv4cpBxWGFK+V+Gb5ex1QPh0Hrn9VFVrRBWyDgjMMkNvjyh9fYhuN0+zMIigLe0dfVI13vCuPqP7+duJC/tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732049312; c=relaxed/simple;
	bh=vahBI6bpELdMwDIw7a2qG/3RIAxR5+JhRyStJfSfnQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpUJT4+HI+o+k7NEk6aMphVLrJP6TAOo28V9Z7l9ielfJ5RGqlDRusLMTGU3qVrfeQ6egR0VjStnByC+c9sim/3PBzhXg8kp8qH8TFpBEMpVUCb4l2JxAsDrXy5hkRqzO//Ht+1f1fdMIXuVABGwSZLuEPiqzXbCNphK7gqbwys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHYzFeaw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBB9C4CECF;
	Tue, 19 Nov 2024 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732049312;
	bh=vahBI6bpELdMwDIw7a2qG/3RIAxR5+JhRyStJfSfnQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHYzFeawIOkDNoR+JcjvAScu9PDU5sGaL+/bf2hI2i1828FaNPSzdHh7ePQZZc5xP
	 NVqIZsuMxwZqLfE5MVGCHquXXjLVzo9IiKcW9mcpDdeP3FBfsNI3EFfPDei/YidEoh
	 ryMK3cCUTrPHh8yHoM7FoVh5K1+qkPH3W4ElLI96CtmiSLnTTRZaukti2hI5JMyIQJ
	 9GihzCKQ9MYEP0h33ayk5GBufNhlvgiAbuVqd2/w30cOHK50L06xiJvccimyn9Obgi
	 c90zcauD15EldMFJ4hFqH/EDL57vCmz9tIzWiB9qHy4shHKgZO5MNuQRpmBtzuFF4x
	 wCHzb/sXoxvcQ==
Date: Tue, 19 Nov 2024 12:48:29 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to
 a common include
Message-ID: <20241119204829.GA1926309@frogsfrogsfrogs>
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com>
 <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com>
 <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
 <CABCJKufVpx4dsr7A44qA0ydwTEx+3Qy_OMx9Ch6OKa4nzvRj2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKufVpx4dsr7A44qA0ydwTEx+3Qy_OMx9Ch6OKa4nzvRj2g@mail.gmail.com>

On Mon, Nov 18, 2024 at 09:58:09PM +0000, Sami Tolvanen wrote:
> Hi,
> 
> On Sat, Nov 16, 2024 at 9:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Nov 14, 2024 at 2:54 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Nov 11, 2024 at 8:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > On Thu, Oct 31, 2024 at 2:01 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > > > >
> > > > > To avoid duplication between host programs, move the crc32 code to a
> > > > > shared header file.
> > > >
> > > >
> > > > Only the motivation to use this long table is to keep compatibility
> > > > between genksyms and gendwarfksyms.
> > > > I do not think this should be exposed to other programs.
> > > >
> > > >
> > > > If you avoid the code duplication, you can do
> > > >
> > > > // scripts/gendwarfksyms/crc.c
> > > > #include "../genksyms/crc.c"
> > >
> > > Sure, that sounds reasonable. I'll change this in the next version.
> >
> >
> > BTW, is it necessary to share the same crc function
> > between genksyms and gendwarfksyms?
> >
> > If CONFIG_GENKSYMS and CONFIG_GENDWARFKSYMS
> > were able to produce the same CRC, it would be a good motivation
> > to share the same function.
> > However, as far as I tested, gendwarfksyms generates different CRC values.

crc32() is operating on different data, right?  CONFIG_GENDWARFKSYMS
computes a crc of the DWARF data, whereas CONFIG_GENKSYMS computes a crc
of a magic string from ... the source code, right?  Hence the crcs will
never match?

> > When a distro migrates to CONFIG_GENDWARFKSYMS,
> > the new kernel cannot load old modules built with CONFIG_GENKSYMS.
> 
> No, it's not necessary to use the exact same function, this was just
> to avoid adding more external dependencies.
> 
> > So, there is no need to share the old code.
> > Another solution might be to use crc32() provided by zlib, for example.
> > It requires another external library, but this already depends on
> > libdw and libelf.
> 
> Makes sense. I'll switch to the zlib implementation in v6.
> 
> > > > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > Acked-by: Neal Gompa <neal@gompa.dev>
> > > >
> > > > Does this Ack add any value?
> > > >
> > > > Acked-by is meaningful only when it is given by someone who
> > > > maintains the relevant area or has established a reputation.
> > > >
> > > > $ git grep "Neal Gompa"
> > > > $ git shortlog -n -s | grep "Neal Gompa"
> > > >      2 Neal Gompa
> > > >
> > > > His Ack feels more like "I like it" rather than a qualified endorsement.
> > >
> > > Like Neal explained, an Ack from a potential user of this feature
> > > seemed relevant, but if you don't think it's meaningful, I can
> > > certainly drop it.
> >
> > Tested-by is more suitable if he wants to leave something.
> 
> Ack. Neal, I'll drop the acks from v6, but if you end up testing that
> series, please feel free to add your Tested-by.

Just my 2 cents, but it seems rude to me to *remove* an Ack from an
existing patchset on the grounds that person doesn't appear often in the
kernel log.  "We won't hire you for this entry level job because you
don't have experience" etc.

Also, wouldn't Neal be one of the people shepherding this change into
distro kernels?  He seems to show up somewhat frequently in the Fedora
and SUSE ecosystems.

Is the problem here that you all think "Acked-by" isn't appropriate from
someone who isn't a subsystem maintainer, but the kernel doesn't seem to
have a tag for "downstream consumer of this change says they're willing
to put their name on the line for this"?

Maybe should we go full Parks and Rec:
Not-Against-You-On-This-One: Neal Gompa <neal@gompa.dev>

--D

