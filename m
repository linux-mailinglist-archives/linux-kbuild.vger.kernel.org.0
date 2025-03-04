Return-Path: <linux-kbuild+bounces-5951-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB5CA4DA5C
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 11:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFFC616B4C0
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 10:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D951FF1B7;
	Tue,  4 Mar 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rX5gQber"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9141FE44C;
	Tue,  4 Mar 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741083942; cv=none; b=AkzDfvCWRzgUW2PYjGuKQZLzvBAqIlMT0Bi0OltWCLpOAO8rraX8n2k59D6GId7a2qhYemucwlg9+KV+pPZYn1Dafx5aQD9ZAC9X3jKAbh+T+/i1F4mNp7K+N8JB/rGdk9YOT0Pwo8XQuJ1qsAtoXN39xaSib0Qf6ZYBf3BdOxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741083942; c=relaxed/simple;
	bh=8ZkZU3FoF7zi+/hYRJkZ7DR17Usi6ykuq+2dOQLsQ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKAihtGJk0oA6A34SGjlHZbjALU/IpjpbXwZU4c4FZic3PqBbcY0r+mVXA5hCph9XCTP3TlVF6PIShkLhJRAr4rnxpaDRiRJ3GTdm4EsmPM8YU+tJeaZB0LYEcgv8XzUQ0K5otYhp/1HQdJSbfrO2+IddvFK0OvQqGCECf7v7Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rX5gQber; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A6FC4CEE5;
	Tue,  4 Mar 2025 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741083941;
	bh=8ZkZU3FoF7zi+/hYRJkZ7DR17Usi6ykuq+2dOQLsQ9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rX5gQberdBnCGAgwLtoDbjzRfpjAZFQe3KlPLx5WiBReC5yfyunNCbknNPIRCQvSs
	 6k/TOoJ4MrcVR9G5+HSerd3dnXkH4WwiD/LW36PtLfu282BVsPp+r6+4dCDz8+n2Fy
	 k2TpXZCfFVyU5O/FPUMQ4RDJkSCAIVF4RPY0t149zeEx71SjFoHZfKWO2j+drCyx6X
	 1/YBe29TcMupWbiyvSuPQneZ+8It/K/Maj7QnMI2ePBjdjHMtFhEX1r1dJ/DCgQSsu
	 R3ftb3rTlyYejS2/tr5rqMsyCBkGWco+bBOVTOOkPNQotMMalSeHigCRHcuzxPdHyB
	 gFs2yPCscSNoA==
Date: Tue, 4 Mar 2025 11:25:36 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Kees Cook <kees@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, David Gow <davidgow@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: clang: Support building UM with SUBARCH=i386
Message-ID: <20250304102536.GB2529736@ax162>
References: <20250303215240.work.379-kees@kernel.org>
 <05a25510-ab44-4eb1-a878-71e84c8aff0d@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05a25510-ab44-4eb1-a878-71e84c8aff0d@t-8ch.de>

On Mon, Mar 03, 2025 at 11:29:58PM +0100, Thomas Weißschuh wrote:
> On 2025-03-03 13:52:41-0800, Kees Cook wrote:
> > The UM builds distinguish i386 from x86_64 via SUBARCH, but we don't
> > support building i386 directly with Clang. To make SUBARCH work for
> > i386 UM, we need to explicitly test for it.
> > 
> > This lets me run i386 KUnit tests with Clang:
> > 
> > $ ./tools/testing/kunit/kunit.py run \
> > 	--make_options LLVM=1 \
> > 	--make_options SUBARCH=i386
> > ...
> > 
> > Fixes: c7500c1b53bf ("um: Allow builds with Clang")
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > I could not find a cleaner way to do this without hardcoding a test
> > for i386 UM. Does anyone see a more sane way to accomplish this? The
> > comment above the CLANG_TARGET_FLAGS seems like it can't be done with
> > UM's Makefile...
> 
> This seems to work for me:
> 
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 2435efae67f5..8e349bf30fa8 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -12,6 +12,7 @@ CLANG_TARGET_FLAGS_riscv      := riscv64-linux-gnu
>  CLANG_TARGET_FLAGS_s390                := s390x-linux-gnu
>  CLANG_TARGET_FLAGS_sparc       := sparc64-linux-gnu
>  CLANG_TARGET_FLAGS_x86         := x86_64-linux-gnu
> +CLANG_TARGET_FLAGS_i386                := i386-linux-gnu
>  CLANG_TARGET_FLAGS_um          := $(CLANG_TARGET_FLAGS_$(SUBARCH))
>  CLANG_TARGET_FLAGS             := $(CLANG_TARGET_FLAGS_$(SRCARCH))

Yeah, I think I prefer this. As the comment at the top of this file
notes, we normally want '-m32' and '-m64' to control the word size,
which happens for regular x86 but not UML. Since UML is already weird
here, I think going this route for simplicity rather than consistency is
not that big of a deal. I would probably add a comment it is only there
for ARCH=um SUBARCH=i386 though just so we do not accidentally remove
it.

> This is also what exists in tools/testing/selftests/lib.mk.
> Minus the missing CONFIG_FORTIFY_SOURCE on clang x86_32
> and a failure of overflow.DEFINE_FLEX_test (clang 19.1.7).

Does Kees's other patch resolve the second issue? It'll obviously fix
the first :P

https://lore.kernel.org/20250303214929.work.499-kees@kernel.org/

> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Bill Wendling <morbo@google.com>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Nicolas Schier <nicolas@fjasle.eu>
> > Cc: llvm@lists.linux.dev
> > Cc: linux-kbuild@vger.kernel.org
> > ---
> >  scripts/Makefile.clang | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> > index 2435efae67f5..fa6f9a9be4ac 100644
> > --- a/scripts/Makefile.clang
> > +++ b/scripts/Makefile.clang
> > @@ -12,8 +12,12 @@ CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
> >  CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
> >  CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
> >  CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
> > +ifeq ($(SRCARCH):$(SUBARCH),um:i386)
> > +CLANG_TARGET_FLAGS		:= i386-linux-gnu
> > +else
> >  CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
> >  CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
> > +endif
> >  
> >  ifeq ($(CLANG_TARGET_FLAGS),)
> >  $(error add '--target=' option to scripts/Makefile.clang)
> > -- 
> > 2.34.1
> > 
> 

