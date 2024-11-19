Return-Path: <linux-kbuild+bounces-4726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD09D1F6B
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 05:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAB47B2221F
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 04:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B71F13C836;
	Tue, 19 Nov 2024 04:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQ2003lq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137C229CA;
	Tue, 19 Nov 2024 04:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731991647; cv=none; b=bNzBhD8qW5nE6Iuny4sC5zvWa+tB2SbVKDjvZ2HUsL+GcrWXZg1y1ECL9cwO/h2wTqFsdjzRT5qJUjpLjIfm02UJA3/0mjGP+ulTiBVBf2SXAJBZ6A4ssZeXdF9cNy5PFjvYuQJlC/S+MYj3jj1ht+2Ltsp1r1hSNch79lWmQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731991647; c=relaxed/simple;
	bh=njP3rH1PKCc4ZIOIRoLEjtTcHM/DnKKasYoMrLcDeQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agnqpeXgYOnQlrPXOABMWqHrDd3/za5jVogJZWtwh7i1a8+HUNx9z6BMzB1xrrZCS1GNsm2tPJWptEVuK9F9RTrm8NXsBPB5EePu93iuQHpKiSUZdXNAbT4HLXhaxR9nBi72FukNequblTYoO6lyR2LM3wlUW3mQzpGyDQVEY6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQ2003lq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256B8C4CECF;
	Tue, 19 Nov 2024 04:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731991646;
	bh=njP3rH1PKCc4ZIOIRoLEjtTcHM/DnKKasYoMrLcDeQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQ2003lqvxe4Hspe6XfTurn6h1GTFP3zroXwd9dR9CQePXdKSS4i0/cNot9tugdv1
	 nLhzVouylcnrNvULnP8ao9b43Nk4hxlhBrzC0o/yRi9R3Je85ayrX8fj5UD7J4DTMi
	 4v+V5XRasexHXrgW3LrtrzbTrELOYYVUChgfEu6pQE752hoXwpWm6wCKRo2TkQeinj
	 mW2SXxjjrmbFcXwX7t9OYmWbCupVwHh/ebfnZwEVfqUz2n7kA9kNt87Olcjw/zRtcL
	 sBRdfTuZyvv40kEShEkg9Zmh9K8bVjB1QV+xQPRNtxNuJdgkoOTCgPXBd0AhAEADlN
	 Egd8Iv8pq7AOQ==
Date: Mon, 18 Nov 2024 21:47:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sam James <sam@gentoo.org>, masahiroy@kernel.org
Cc: Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	arnd@arndb.de, linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Message-ID: <20241119044724.GA2246422@thelio-3990X>
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X>
 <8734joj5gn.fsf@gentoo.org>
 <20241119041550.GA573925@thelio-3990X>
 <87r077j1fa.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r077j1fa.fsf@gentoo.org>

On Tue, Nov 19, 2024 at 04:24:41AM +0000, Sam James wrote:
> This is the conclusion I just reached, although I'm struggling to figure
> out a nice place to put it without sprinkling it all over the place. I'm
> inclined to wait until kbuild folks weigh in so I don't do a lot of
> (trivial, but tedious) work that needs changing.

Sure. Masahiro, do you have any thoughts here? You can see the beginning
of the thread at [1].

I think the diff below would be a good first patch in a series that adds
it to every other place that needs it. As you noticed, it probably makes
sense to add it to most places that have CLANG_FLAGS, as that is a good
indicator that KBUILD_CFLAGS is not being used properly in those spots.

> As a hack, I've injected it into CLANG_FLAGS locally for now as it
> happens to appear in all the right places ;)

:) exactly why I am quite familiar with this issue...

[1]: https://lore.kernel.org/4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com/

Cheers,
Nathan

diff --git a/Makefile b/Makefile
index 68a8faff2543..33cc6bcf39b5 100644
--- a/Makefile
+++ b/Makefile
@@ -416,6 +416,8 @@ export KCONFIG_CONFIG
 # SHELL used by kbuild
 CONFIG_SHELL := sh
 
+CSTD_FLAG := -std=gnu11
+
 HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
 HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
@@ -437,7 +439,7 @@ HOSTRUSTC = rustc
 HOSTPKG_CONFIG	= pkg-config
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
-			 -O2 -fomit-frame-pointer -std=gnu11
+			 -O2 -fomit-frame-pointer $(CSTD_FLAG)
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
 KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 
@@ -545,7 +547,7 @@ LINUXINCLUDE    := \
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 
 KBUILD_CFLAGS :=
-KBUILD_CFLAGS += -std=gnu11
+KBUILD_CFLAGS += $(CSTD_FLAG)
 KBUILD_CFLAGS += -fshort-wchar
 KBUILD_CFLAGS += -funsigned-char
 KBUILD_CFLAGS += -fno-common
@@ -589,7 +591,7 @@ export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AW
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
-export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS
+export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS CSTD_FLAG
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 25a2cb6317f3..5f9d5c38ed9e 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -65,7 +65,7 @@ VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -fno-strict-aliasing -fno-common \
                -Werror-implicit-function-declaration \
                -Wno-format-security \
-               -std=gnu11
+               $(CSTD_FLAG)
 VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
 VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 5b773b34768d..d5c851dd0653 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -47,7 +47,7 @@ endif
 
 # How to compile the 16-bit code.  Note we always compile for -march=i386;
 # that way we can complain to the user if the CPU is insufficient.
-REALMODE_CFLAGS	:= -std=gnu11 -m16 -g -Os -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS \
+REALMODE_CFLAGS	:= $(CSTD_FLAG) -m16 -g -Os -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS \
 		   -Wall -Wstrict-prototypes -march=i386 -mregparm=3 \
 		   -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
 		   -mno-mmx -mno-sse $(call cc-option,-fcf-protection=none)

