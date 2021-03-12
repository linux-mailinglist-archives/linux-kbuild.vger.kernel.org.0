Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020563397C6
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 20:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbhCLTuU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 14:50:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:58676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234407AbhCLTuB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 14:50:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6176664DC4;
        Fri, 12 Mar 2021 19:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615578600;
        bh=v616x1G375Uxn8jR06zJgYSoDHrEKoBxTkT9rtV1Ymo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QRNoS7/z3Q3sM5Id9Z9dU7dwDpknBXinZsdlj3VO81lPOKRsfTQOunI+zghHvgsFE
         Mw4HkrY6hqK0o3+ZVTWrgR1r7HCHoFTCoeKPapU/lGPWIF4mLkVwXxBcl51U9NjsXJ
         9bAkzl8pAnbO5T+0apOKTdQb8VbiDZnmSxQ4e6KwY8bJPxk1k+zxGKwhYBBmHefWzm
         IL2OLaOOJuHxq56Fmro6NtSBkgE/+bYoaIbkzuyjxGUfLngTkfi5hzkClKbg1AJXKO
         fezaynK0l6CoSBfF2Wpmbe+noLf9Pe3b8MAkJlolGGbe9ssoYirFVeLRYZHzS37nbu
         vQdnGMTdDRAEQ==
Date:   Fri, 12 Mar 2021 12:49:56 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix ld-version.sh to not be affected by locale
Message-ID: <20210312194956.vsikqyaya676qvcu@archlinux-ax161>
References: <20210312193814.132558-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312193814.132558-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 13, 2021 at 04:38:14AM +0900, Masahiro Yamada wrote:
> ld-version.sh checks the output from $(LD) --version, but it has a
> problem on some locales.
> 
> For example, in Italian:
> 
>   $ LC_MESSAGES=it_IT.UTF-8 ld --version | head -n 1
>   ld di GNU (GNU Binutils for Debian) 2.35.2
> 
> This makes ld-version.sh fail because it expects "GNU ld" for the
> BFD linker case.
> 
> Add LC_ALL=C to override the user's locale.
> 
> BTW, setting LC_MESSAGES=C (or LANG=C) is not enough because it is
> ineffective if LC_ALL is set on the user's environment.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=212105
> Reported-by: Marco Scardovi
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

LGTM, this is Debian's recommendation as well:
https://wiki.debian.org/Locale

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/ld-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index 30debf78aa09..1bf3aadde9de 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -29,7 +29,7 @@ orig_args="$@"
>  # Get the first line of the --version output.
>  IFS='
>  '
> -set -- $("$@" --version)
> +set -- $(LC_ALL=C "$@" --version)
>  
>  # Split the line on spaces.
>  IFS=' '
> -- 
> 2.27.0
> 
