Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1EB3DE154
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 23:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhHBVS6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 17:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhHBVS4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 17:18:56 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16CEC061760
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 14:18:46 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h9so25631951ljq.8
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Z9yRMRPvPvhNhspEK5nK4+ikbIcB7z17ForMSSXLIM=;
        b=kXYzxNBoPnSs60tSumVikXkgLSMYmd8MP0QG9/neTn5fMj+4x9WawziIkd++CZ5Qlt
         LECxLgnwPznfHsA5PWYTAUZcwobBzWh80Tt4aQXaaleOkLjYK0Mq8RzPk9nZGdeDgm7R
         lkW3sfjIbPL7zqRIDSArn2AXnywcz5L+8EHVNZ3jIkshvWrqL3H+IKcB9RiEbL5S1rgk
         5cMPRVE4Hi0IN3Sgbpol4+Risi2OaHtQSi4Iv/bPa8vkqp9Jm21EP5vhwyGCaQIHI9UQ
         eR4HDqRpIYqeWX7Py7Bjt5DgbZkzxHEN9++aKaW38yML2aT/Cmg3hJDrK+U5vy1nsObC
         c+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Z9yRMRPvPvhNhspEK5nK4+ikbIcB7z17ForMSSXLIM=;
        b=MZWeCaYkgpEZ1YAlgNP1cHGCCmAplunvGmsfvRft6mxAuyowgjk4nPWxWeCyQbmOu7
         YAeuZtM+pdl+SiePEq70V5Ok0Z7bbBu2e15ayIB/ounQq2BwQtqy/1ydZkCi89PYlr4+
         leVtoGqWlW3auOE8WgFSBDd1G4YGk9/ZIVkxP/51ghtObL5UBUy1wuUBxT+6upoaA2vb
         yP8vMP5PWImoBK5xeRrzcC6Ze7vUDxIdoDxbrQORh7IvdOvA167ZsQsjCrUflM6BOwTs
         QDXFo0XKQJvA6XGBIzZEmrpnoCV2mKvyY6o7fvQjwi/hPxFLI3YwgMO9KHAB3zTh6daB
         sJJQ==
X-Gm-Message-State: AOAM530Hdj/xP5g+hkHijVR9nyBG8g2/PQN373ExMpS6rFiPuwlIJM9n
        Zib4XtGwGTdx28s7fh8befi38Qb+7ocCELpupZnJmedw+fhnEg==
X-Google-Smtp-Source: ABdhPJwhxcINA21tw/Nuh+g4OW6UTFPkym/AwtBxtV+7RU8HofOMbVlwuzsG1pckNPkn3uhcMoULO3vL7zZPoqOBHDA=
X-Received: by 2002:a2e:9304:: with SMTP id e4mr12467173ljh.244.1627939124801;
 Mon, 02 Aug 2021 14:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210802210307.3202472-1-nathan@kernel.org>
In-Reply-To: <20210802210307.3202472-1-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 2 Aug 2021 14:18:33 -0700
Message-ID: <CAKwvOdmG0Ahieq27y29zqqEfjDu4NiC8j1fDg8c6RPnWVhdSsA@mail.gmail.com>
Subject: Re: [PATCH] scripts/recordmcount.pl: Remove check_objcopy() and $can_use_local
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 2, 2021 at 2:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building ARCH=riscv allmodconfig with llvm-objcopy, the objcopy
> version warning from this script appears:
>
> WARNING: could not find objcopy version or version is less than 2.17.
>         Local function references are disabled.
>
> The check_objcopy() function in scripts/recordmcount.pl is set up to
> parse GNU objcopy's version string, not llvm-objcopy's, which triggers
> the warning.
>
> Commit 799c43415442 ("kbuild: thin archives make default for all archs")
> made binutils 2.20 mandatory and commit ba64beb17493 ("kbuild: check the
> minimum assembler version in Kconfig") enforces this at configuration
> time so just remove check_objcopy() and $can_use_local instead, assuming
> --globalize-symbol is always available.
>
> llvm-objcopy has supported --globalize-symbol since LLVM 7.0.0 in 2018
> and the minimum version for building the kernel with LLVM is 10.0.1 so
> there is no issue introduced:
>
> https://github.com/llvm/llvm-project/commit/ee5be798dae30d5f9414b01f76ff807edbc881aa

^ should this be a Link: tag?

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Makefile                |  1 -
>  scripts/recordmcount.pl | 40 ----------------------------------------
>  2 files changed, 41 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 27a072cffcb9..b6ee64dd435e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -546,7 +546,6 @@ export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \
>  PHONY += scripts_basic
>  scripts_basic:
>         $(Q)$(MAKE) $(build)=scripts/basic
> -       $(Q)rm -f .tmp_quiet_recordmcount
>
>  PHONY += outputmakefile
>  ifdef building_out_of_srctree
> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> index c17e48020ec3..8f6b13ae46bf 100755
> --- a/scripts/recordmcount.pl
> +++ b/scripts/recordmcount.pl
> @@ -173,39 +173,6 @@ my $mcount_regex;  # Find the call site to mcount (return offset)
>  my $mcount_adjust;     # Address adjustment to mcount offset
>  my $alignment;         # The .align value to use for $mcount_section
>  my $section_type;      # Section header plus possible alignment command
> -my $can_use_local = 0;         # If we can use local function references
> -
> -# Shut up recordmcount if user has older objcopy
> -my $quiet_recordmcount = ".tmp_quiet_recordmcount";
> -my $print_warning = 1;
> -$print_warning = 0 if ( -f $quiet_recordmcount);
> -
> -##
> -# check_objcopy - whether objcopy supports --globalize-symbols
> -#
> -#  --globalize-symbols came out in 2.17, we must test the version
> -#  of objcopy, and if it is less than 2.17, then we can not
> -#  record local functions.
> -sub check_objcopy
> -{
> -    open (IN, "$objcopy --version |") or die "error running $objcopy";
> -    while (<IN>) {
> -       if (/objcopy.*\s(\d+)\.(\d+)/) {
> -           $can_use_local = 1 if ($1 > 2 || ($1 == 2 && $2 >= 17));
> -           last;
> -       }
> -    }
> -    close (IN);
> -
> -    if (!$can_use_local && $print_warning) {
> -       print STDERR "WARNING: could not find objcopy version or version " .
> -           "is less than 2.17.\n" .
> -           "\tLocal function references are disabled.\n";
> -       open (QUIET, ">$quiet_recordmcount");
> -       printf QUIET "Disables the warning from recordmcount.pl\n";
> -       close QUIET;
> -    }
> -}
>
>  if ($arch =~ /(x86(_64)?)|(i386)/) {
>      if ($bits == 64) {
> @@ -434,8 +401,6 @@ if ($filename =~ m,^(.*)(\.\S),) {
>  my $mcount_s = $dirname . "/.tmp_mc_" . $prefix . ".s";
>  my $mcount_o = $dirname . "/.tmp_mc_" . $prefix . ".o";
>
> -check_objcopy();
> -
>  #
>  # Step 1: find all the local (static functions) and weak symbols.
>  #         't' is local, 'w/W' is weak
> @@ -473,11 +438,6 @@ sub update_funcs
>
>      # is this function static? If so, note this fact.
>      if (defined $locals{$ref_func}) {
> -
> -       # only use locals if objcopy supports globalize-symbols
> -       if (!$can_use_local) {
> -           return;
> -       }
>         $convert{$ref_func} = 1;
>      }
>
>
> base-commit: c500bee1c5b2f1d59b1081ac879d73268ab0ff17
> --
> 2.32.0.264.g75ae10bc75
>


-- 
Thanks,
~Nick Desaulniers
