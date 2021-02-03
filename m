Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB28F30E140
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 18:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhBCRjU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 12:39:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:50762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229731AbhBCRjT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 12:39:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCC2C64F8C;
        Wed,  3 Feb 2021 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612373918;
        bh=Aur/j6fTeQV4UkRiilIagFzYZdsU9nYyikcJSjSuE60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JyBWrrOl9vRKGkC/DEPmppNz7GIVgFe8GyZiqR3daGBx03/z3R+UQQ/DrZyx9kpow
         uwCsjkVMGp0/c/cDXw1nohvWxUwl600GV/s80sXG6Ld6TXGeXrHagaT8UPetUOosNR
         1qCp31+9mCk8lGoUVOCARRWxQUgEwFc661vdxBSxTPOJeEowbFA9AmA1pUp90E9N5Z
         1M01CKvNkJL3UyD9lH4yehXguU866+aMJKTTaonPSYsTOB4leVVY0nY/qWvJxTJhDa
         ttKrkmUOtxyGP3Jy+hJIl7veeC9I7thublswqLMvIeaFcLzRZXtOFIaA3RZTBRpLUS
         3fQ7DrshDs3mg==
Date:   Wed, 3 Feb 2021 10:38:35 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Kleen <andi@firstfloor.org>,
        Ian Rogers <irogers@google.com>,
        Mark Wielaard <mark@klomp.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix duplicated flags in DEBUG_CFLAGS
Message-ID: <20210203173835.GA765175@localhost>
References: <20210203075239.5505-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203075239.5505-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 03, 2021 at 04:52:39PM +0900, Masahiro Yamada wrote:
> Sedat Dilek noticed duplicated debug flags passed when building C
> files with CONFIG_DEBUG_INFO.
> 
> I do not know much about his build environment, but yes, Kbuild
> recurses to the top Makefile with some build targets. For example,
> 'make CC=clang bindeb-pkg' reproduces the issue.
> 
> With commit 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments
> for old GCC versions") applied, DEBUG_CFLAGS is now reset only when
> CONFIG_CC_IS_GCC=y.
> 
> Fix it to reset DEBUG_CFLAGS also when using Clang.
> 
> Fixes: 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments for old GCC versions")
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 3d3f67b98ca2..769a38ee81b9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -811,10 +811,12 @@ KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
>  KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
>  endif
>  
> +DEBUG_CFLAGS	:=
> +
>  # Workaround for GCC versions < 5.0
>  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
>  ifdef CONFIG_CC_IS_GCC
> -DEBUG_CFLAGS	:= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
> +DEBUG_CFLAGS	+= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
>  endif
>  
>  ifdef CONFIG_DEBUG_INFO
> -- 
> 2.27.0
> 
