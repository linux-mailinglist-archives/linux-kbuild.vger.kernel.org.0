Return-Path: <linux-kbuild+bounces-5948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F86A4CE4C
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 23:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C2FB188C8A9
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Mar 2025 22:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5671EE028;
	Mon,  3 Mar 2025 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fLR7UpeP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C0238D32;
	Mon,  3 Mar 2025 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041012; cv=none; b=Bno62PZKcQqsdodt3NAlVpgkSV88JO4GS8g7iGFlLvIf1Yt2vAwXmonkUT1K4GhthZ6frPykh6PoeafIjqUVvLGus16BKNte6ykQ50wgHsGwxkSyc+58MXcH85/do/agGyWow/yjZciNnBlL537dMJRsdIttVWvsjKStSeHyKGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041012; c=relaxed/simple;
	bh=/mpM4N1kNDhZtm4ABQXD/3qB+8qtSGSXUnHC8BYYl6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvaFpw4R4K6sAFk7wLQn1PMv0MBE9rTkKpkUSd7ZrzukPSF2c8nKY+mebxUvFuQ0Cgebjcy4L9CCQ4uGKRSaQlL9sKc1Nm79z0YW+gZh9HDdqspoabVhZ/9ewChiCbMHzTktpL6Q0MQK6DDRvk4nBcvEZzsFWCjiCJA77/XLfAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fLR7UpeP; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741040998;
	bh=/mpM4N1kNDhZtm4ABQXD/3qB+8qtSGSXUnHC8BYYl6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLR7UpeP9xNPJwSceytvWKqQcTq5p6NeGGoTvLGKWIxJtVcrxpGbqjdwwF5chj1R3
	 jM08LGDSxfPApKI9Rtr8L5T5s6iqVMNEoPc4KzmIQ+v1+ZB614qYp6jgqcyBsOlQFX
	 VQF8q0mfoa6PkQNAnfigxU0A/pDDo5v1GslYX8cs=
Date: Mon, 3 Mar 2025 23:29:58 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	David Gow <davidgow@google.com>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: clang: Support building UM with SUBARCH=i386
Message-ID: <05a25510-ab44-4eb1-a878-71e84c8aff0d@t-8ch.de>
References: <20250303215240.work.379-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303215240.work.379-kees@kernel.org>

On 2025-03-03 13:52:41-0800, Kees Cook wrote:
> The UM builds distinguish i386 from x86_64 via SUBARCH, but we don't
> support building i386 directly with Clang. To make SUBARCH work for
> i386 UM, we need to explicitly test for it.
> 
> This lets me run i386 KUnit tests with Clang:
> 
> $ ./tools/testing/kunit/kunit.py run \
> 	--make_options LLVM=1 \
> 	--make_options SUBARCH=i386
> ...
> 
> Fixes: c7500c1b53bf ("um: Allow builds with Clang")
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> I could not find a cleaner way to do this without hardcoding a test
> for i386 UM. Does anyone see a more sane way to accomplish this? The
> comment above the CLANG_TARGET_FLAGS seems like it can't be done with
> UM's Makefile...

This seems to work for me:

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 2435efae67f5..8e349bf30fa8 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -12,6 +12,7 @@ CLANG_TARGET_FLAGS_riscv      := riscv64-linux-gnu
 CLANG_TARGET_FLAGS_s390                := s390x-linux-gnu
 CLANG_TARGET_FLAGS_sparc       := sparc64-linux-gnu
 CLANG_TARGET_FLAGS_x86         := x86_64-linux-gnu
+CLANG_TARGET_FLAGS_i386                := i386-linux-gnu
 CLANG_TARGET_FLAGS_um          := $(CLANG_TARGET_FLAGS_$(SUBARCH))
 CLANG_TARGET_FLAGS             := $(CLANG_TARGET_FLAGS_$(SRCARCH))

This is also what exists in tools/testing/selftests/lib.mk.
Minus the missing CONFIG_FORTIFY_SOURCE on clang x86_32
and a failure of overflow.DEFINE_FLEX_test (clang 19.1.7).

> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: llvm@lists.linux.dev
> Cc: linux-kbuild@vger.kernel.org
> ---
>  scripts/Makefile.clang | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 2435efae67f5..fa6f9a9be4ac 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -12,8 +12,12 @@ CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
>  CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
>  CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
>  CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
> +ifeq ($(SRCARCH):$(SUBARCH),um:i386)
> +CLANG_TARGET_FLAGS		:= i386-linux-gnu
> +else
>  CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
>  CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))
> +endif
>  
>  ifeq ($(CLANG_TARGET_FLAGS),)
>  $(error add '--target=' option to scripts/Makefile.clang)
> -- 
> 2.34.1
> 

