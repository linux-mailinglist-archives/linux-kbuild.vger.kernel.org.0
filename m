Return-Path: <linux-kbuild+bounces-7053-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6CBAB06E4
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 01:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080929C79B6
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 23:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4B822FF4C;
	Thu,  8 May 2025 23:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjxuE3Ma"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A19372628;
	Thu,  8 May 2025 23:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746748792; cv=none; b=OY46nQSVp0XSERlyWZ1bEpyUYeyT1U8eQz866ZhKxukUXuSBOPhtaG2tYff3cFHVBw/q+A35WxAQIG7Pw485gO7QSzdfWSXQZjFH4zcIRvLGagMwu0WYi8p7SvXWEGoauGAqmw04OW4VdMg8Dd+k7Xqe5PXC4BZdOaiDkW3zVjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746748792; c=relaxed/simple;
	bh=avRAmG5hREbE1cMABo+KJNWPixB85ErvDhA3zrJGPAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBOFP/+X7A2ug8C8sHhnWFAsZi90Z3wLoQqbxz1rjS84lQr6UyVOOvz4Cp4nTZdxP1fFafc+PKES5TTQhKH8dN/S4u+1ByVbF4UA6aOphUv7wbpZ4dW3fCiomCsvqIJm1JyYWmiAkn4cE/qiOKDHKPvLbATTIo+MeRg4Nk4239c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjxuE3Ma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06FFC4CEE7;
	Thu,  8 May 2025 23:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746748791;
	bh=avRAmG5hREbE1cMABo+KJNWPixB85ErvDhA3zrJGPAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjxuE3Mae7RW76OmV7hsizwR7noAPvXp/aY05LbcZfIDqaTATfPrqGelVe3tS97tQ
	 HfYL9lH+fStr/u7b74eaf15E43kif+3e8J2QK9rmBAZtEhJgflxt03o8q1yTSF0Tdo
	 o43eNewtkVzcbraIZ04MFoPWFxfDz+R7QUbsHkzTlbm8Vwt1zTevLa7+4DNnlk/7Yj
	 qTzM7J0DD83C7RJg3daSBVj1nQxQ5OBpxRbVIeU3Ssx9cnJj+VPXuZax4u4V2gKe74
	 8N+3Zs4ZHOl+b+CcK3oMtIO0m/H83naESh0y6brHgfGtPMWuVf/kDhLVuwukrA8CyL
	 l4vubc2RB+a4Q==
Date: Thu, 8 May 2025 16:59:48 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Detect changed compiler dependencies for full
 rebuild
Message-ID: <202505081651.EAF0C6B@keescook>
References: <20250502224512.it.706-kees@kernel.org>
 <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>
 <202505031028.7022F10061@keescook>
 <CAK7LNAQehmFgB3kJtrkVhUKM1NEXGQrfJ3v3piToh7YV7-3ccw@mail.gmail.com>
 <202505080953.789B3381@keescook>
 <CAK7LNAQpGXmWNhoE9wLoP01dn2o7KjhedoqHXm474CoCgwHp2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQpGXmWNhoE9wLoP01dn2o7KjhedoqHXm474CoCgwHp2Q@mail.gmail.com>

On Fri, May 09, 2025 at 08:13:18AM +0900, Masahiro Yamada wrote:
> On Fri, May 9, 2025 at 1:56 AM Kees Cook <kees@kernel.org> wrote:
> >
> > On Fri, May 09, 2025 at 01:44:09AM +0900, Masahiro Yamada wrote:
> > > On Sun, May 4, 2025 at 2:37 AM Kees Cook <kees@kernel.org> wrote:
> > > >
> > > > On Sat, May 03, 2025 at 06:39:28PM +0900, Masahiro Yamada wrote:
> > > > > On Sat, May 3, 2025 at 7:54 AM Kees Cook <kees@kernel.org> wrote:
> > > > > >
> > > > > >  v2:
> > > > > >   - switch from -include to -I with a -D gated include compiler-version.h
> > > > > >  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@kernel.org/
> > > > >
> > > > >
> > > > > What do you think of my patch as a prerequisite?
> > > > > https://lore.kernel.org/linux-kbuild/20250503084145.1994176-1-masahiroy@kernel.org/T/#u
> > > > > Perhaps, can you implement this series more simply?
> > > > >
> > > > > My idea is to touch a single include/generated/global-rebuild.h
> > > > > rather than multiple files such as gcc-plugins-deps.h, integer-wrap.h, etc.
> > > > >
> > > > > When the file is touched, the entire kernel source tree will be rebuilt.
> > > > > This may rebuild more than needed (e.g. vdso) but I do not think
> > > > > it is a big deal.
> > > >
> > > > This is roughly where I started when trying to implement this, but I
> > > > didn't like the ergonomics of needing to scatter "touch" calls all over,
> > > > which was especially difficult for targets that shared a build rule but
> > > > may not all need to trigger a global rebuild. But what ultimately pushed
> > > > me away from it was when I needed to notice if a non-built source file
> > > > changed (the Clang .scl file), and I saw that I need to be dependency
> > > > driven rather than target driven. (Though perhaps there is a way to
> > > > address this with your global-rebuild.h?)
> > > >
> > > > As far as doing a full rebuild, if it had been available last week, I
> > > > probably would have used it, but now given the work that Nicolas, you,
> > > > and I have put into this, we have a viable way (I think) to make this
> > > > more specific. It does end up being a waste of time/resources to rebuild
> > > > stuff that doesn't need to be (efi-stub, vdso, boot code, etc), and that
> > > > does add up when I'm iterating on something that keeps triggering a full
> > > > rebuild. We already have to do the argument filtering for targets that
> > > > don't want randstruct, etc, so why not capitalize on that and make the
> > > > rebuild avoid those files too?
> > >
> > >
> > > efi-stub, vdso are very small.
> > >
> > > Unless this turns out to be painful, I prefer
> > > a simpler implementation.
> > >
> > > You will see how .scl file is handled.
> > >
> > > See the below code:
> > >
> > >
> > > diff --git a/Kbuild b/Kbuild
> > > index f327ca86990c..85747239314c 100644
> > > --- a/Kbuild
> > > +++ b/Kbuild
> > > @@ -67,10 +67,20 @@ targets += $(atomic-checks)
> > >  $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
> > >         $(call if_changed,check_sha1)
> > >
> > > +rebuild-$(CONFIG_GCC_PLUGINS)          += $(addprefix
> > > scripts/gcc-plugins/, $(GCC_PLUGIN))
> > > +rebuild-$(CONFIG_RANDSTRUCT)           += include/generated/randstruct_hash.h
> >
> > These are in $(objtree)
> 
> Yes.
> 
> > > +rebuild-$(CONFIG_UBSAN_INTEGER_WRAP)   += scripts/integer-wrap-ignore.scl
> >
> > This is in $(srctree)
> 
> Yes.
> 
> > > +
> > > +quiet_cmd_touch = TOUCH   $@
> > > +      cmd_touch = touch $@
> > > +
> > > +include/generated/global-rebuild.h: $(rebuild-y)
> > > +       $(call cmd,touch)
> >
> > Is this rule going to find the right versions of the dependencies?
> 
> I think so, but please test it.

The patch was white-space damaged and wrapped, but I rebuilt it manually
and it mostly works. There still seems to be some ordering issues, as
some stuff gets rebuilt on a record build:

# Clean the tree and pick an "everything" build
$ make O=gcc-test clean allmodconfig -s

# Make a target normally
$ make O=gcc-test kernel/seccomp.o -s

# Touch a gcc plugin that was in .config
$ touch scripts/gcc-plugins/stackleak_plugin.c

# Build and a full rebuild is triggered (good)
$ make O=gcc-test kernel/seccomp.o
make[1]: Entering directory '/srv/code/gcc-test'
  GEN     Makefile
  DESCEND objtool
  HOSTCXX scripts/gcc-plugins/stackleak_plugin.so
  INSTALL libsubcmd_headers
  TOUCH   include/generated/global-rebuild.h
  CC      kernel/bounds.s
  CC      arch/x86/kernel/asm-offsets.s
  CALL    ../scripts/checksyscalls.sh
  CC      kernel/seccomp.o
make[1]: Leaving directory '/srv/code/gcc-test'

# Build again, but more stuff gets built
$ make O=gcc-test kernel/seccomp.o
make[1]: Entering directory '/srv/code/gcc-test'
  GEN     Makefile
  DESCEND objtool
  CC      scripts/mod/empty.o
  CC      scripts/mod/devicetable-offsets.s
  INSTALL libsubcmd_headers
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTLD  scripts/mod/modpost
  CALL    ../scripts/checksyscalls.sh
make[1]: Leaving directory '/srv/code/gcc-test'

# Third time finally everything is stable
$ hmake O=gcc-test kernel/seccomp.o
make[1]: Entering directory '/srv/code/gcc-test'
  GEN     Makefile
  DESCEND objtool
  CALL    ../scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
make[1]: Leaving directory '/srv/code/gcc-test'


Note that scripts/mod/* gets rebuilt on the second rebuild.


-- 
Kees Cook

