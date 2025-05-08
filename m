Return-Path: <linux-kbuild+bounces-7046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F737AB00C7
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 18:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A16FD7AFD2F
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 16:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AEC28312E;
	Thu,  8 May 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChcionI4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D4A78F32;
	Thu,  8 May 2025 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723392; cv=none; b=aJwzjD6JKZU9pmLmVkvGjhpI1jxVVVUSVTnQ07gH+pvj83jxxSjZtnFNowTR93GohNJkhjbVA4utlNCKaLsFmX7EULHXxZuyqQ+7LKpHy2L1qd0cLkdYUt0WGyMk1msKICcJ+xrk5vdhEKURpewmWb2kB599yeByX/z7MsBL+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723392; c=relaxed/simple;
	bh=kCC/RC1xjDARRLa7SAcxuLQRIDrsjd8nQJwVZfH9pX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1H8YWVrfgJA4Q8lgkD/p9WTMP9SibdUgL2+GfemnjH68nWF5SUKLhHHO1HXsIOpfovkKB7pxnm3+geAdphkEIvn702/Gm9QrvupxWipvwfICvaOxUfZ6VlpPNmE+60DpIKzxUmbyObN6nc8QVJQhcBz3B85d30wEGpWHQdSWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChcionI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EFAC4CEE7;
	Thu,  8 May 2025 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723391;
	bh=kCC/RC1xjDARRLa7SAcxuLQRIDrsjd8nQJwVZfH9pX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChcionI4QpBcr/AH77gTgk1kCLQT1l9LMAfmwMVaNf+bDRP6Op1BYMt0tvnyZCJsn
	 xV61+2za141yy7hFSI4I+u5IMD2WXBmr47eZ0zVO2m47go2gDtBsreS+sJ0dc9HUAf
	 3+TOt49NRBZVC6JUNMUCRALtckKCB/Kx41RnBtPXefVPpjLz7BQutjJpXiJZ8FwJMA
	 Lxy8sJkRr67dZJjkZI0gv1XsigXkr8albkRm3IKimy2/+lxM0dKKsujroALWXRTzTe
	 zEIyalnW83GX4AWc/VuCmGqORHqrQDoQZHE+sddRHD9gkjQT7JuZzPmP5jR/TwgXrP
	 8h7EKAY1c0FVA==
Date: Thu, 8 May 2025 09:56:28 -0700
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
Message-ID: <202505080953.789B3381@keescook>
References: <20250502224512.it.706-kees@kernel.org>
 <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>
 <202505031028.7022F10061@keescook>
 <CAK7LNAQehmFgB3kJtrkVhUKM1NEXGQrfJ3v3piToh7YV7-3ccw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQehmFgB3kJtrkVhUKM1NEXGQrfJ3v3piToh7YV7-3ccw@mail.gmail.com>

On Fri, May 09, 2025 at 01:44:09AM +0900, Masahiro Yamada wrote:
> On Sun, May 4, 2025 at 2:37 AM Kees Cook <kees@kernel.org> wrote:
> >
> > On Sat, May 03, 2025 at 06:39:28PM +0900, Masahiro Yamada wrote:
> > > On Sat, May 3, 2025 at 7:54 AM Kees Cook <kees@kernel.org> wrote:
> > > >
> > > >  v2:
> > > >   - switch from -include to -I with a -D gated include compiler-version.h
> > > >  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@kernel.org/
> > >
> > >
> > > What do you think of my patch as a prerequisite?
> > > https://lore.kernel.org/linux-kbuild/20250503084145.1994176-1-masahiroy@kernel.org/T/#u
> > > Perhaps, can you implement this series more simply?
> > >
> > > My idea is to touch a single include/generated/global-rebuild.h
> > > rather than multiple files such as gcc-plugins-deps.h, integer-wrap.h, etc.
> > >
> > > When the file is touched, the entire kernel source tree will be rebuilt.
> > > This may rebuild more than needed (e.g. vdso) but I do not think
> > > it is a big deal.
> >
> > This is roughly where I started when trying to implement this, but I
> > didn't like the ergonomics of needing to scatter "touch" calls all over,
> > which was especially difficult for targets that shared a build rule but
> > may not all need to trigger a global rebuild. But what ultimately pushed
> > me away from it was when I needed to notice if a non-built source file
> > changed (the Clang .scl file), and I saw that I need to be dependency
> > driven rather than target driven. (Though perhaps there is a way to
> > address this with your global-rebuild.h?)
> >
> > As far as doing a full rebuild, if it had been available last week, I
> > probably would have used it, but now given the work that Nicolas, you,
> > and I have put into this, we have a viable way (I think) to make this
> > more specific. It does end up being a waste of time/resources to rebuild
> > stuff that doesn't need to be (efi-stub, vdso, boot code, etc), and that
> > does add up when I'm iterating on something that keeps triggering a full
> > rebuild. We already have to do the argument filtering for targets that
> > don't want randstruct, etc, so why not capitalize on that and make the
> > rebuild avoid those files too?
> 
> 
> efi-stub, vdso are very small.
> 
> Unless this turns out to be painful, I prefer
> a simpler implementation.
> 
> You will see how .scl file is handled.
> 
> See the below code:
> 
> 
> diff --git a/Kbuild b/Kbuild
> index f327ca86990c..85747239314c 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -67,10 +67,20 @@ targets += $(atomic-checks)
>  $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
>         $(call if_changed,check_sha1)
> 
> +rebuild-$(CONFIG_GCC_PLUGINS)          += $(addprefix
> scripts/gcc-plugins/, $(GCC_PLUGIN))
> +rebuild-$(CONFIG_RANDSTRUCT)           += include/generated/randstruct_hash.h

These are in $(objtree)

> +rebuild-$(CONFIG_UBSAN_INTEGER_WRAP)   += scripts/integer-wrap-ignore.scl

This is in $(srctree)

> +
> +quiet_cmd_touch = TOUCH   $@
> +      cmd_touch = touch $@
> +
> +include/generated/global-rebuild.h: $(rebuild-y)
> +       $(call cmd,touch)

Is this rule going to find the right versions of the dependencies?

> --- a/Makefile
> +++ b/Makefile
> @@ -558,7 +558,8 @@ USERINCLUDE    := \
>                 -I$(srctree)/include/uapi \
>                 -I$(objtree)/include/generated/uapi \
>                  -include $(srctree)/include/linux/compiler-version.h \
> -                -include $(srctree)/include/linux/kconfig.h
> +                -include $(srctree)/include/linux/kconfig.h \
> +                -include $(objtree)/include/generated/global-rebuild.h

Instead of adding a new file, why not just touch compiler-version.h?

But whatever the case, sure, I can live with this. :)

-Kees

-- 
Kees Cook

