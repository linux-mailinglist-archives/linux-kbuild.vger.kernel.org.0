Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD92D2CDDF6
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 19:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbgLCSrA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 13:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgLCSrA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 13:47:00 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A28DC061A4E
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 10:46:20 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id u7so1808743vsq.11
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 10:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H0DcdlycUl8yD+PFJ+dKHHIvXlHjuiMGa/ykP4hbRMk=;
        b=da7qVXXSLDQ2p2jRS6Ay6LvWkADrz1pjmMSfUY5JoNoD6S0+nvwLJUu/OzoYW9kPJm
         SahUKy8OLBHhCyot6Fcd1y5Hyrn8vIgpy5rkoRF1QVybMy9tBq+Rux9rGrmXjUrHkoES
         M11nYapPeUjRwzDjvtfW+E+HEwQIAYYILTYyTN2CR3uELL/nSI6AE0lQF/0KHxcPWO/e
         hiomMyCQ9/s73vJbm3xhh5pfjSchi37qwg5//frxEi+cK96Q+SFJOJAq9TBVv54GmgGD
         b+nu8I84BMZH5QOHaZLfdbLlk6KduXkLa7PrWqbZ1Cz/4W6SBQGpb+pwX9MyimZfoAdh
         pw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H0DcdlycUl8yD+PFJ+dKHHIvXlHjuiMGa/ykP4hbRMk=;
        b=LA2gIy5zuMpH5EcfK4ujwMj0Ia6xX5A/dGOSDgFmUPpkFqRMqmTtE/mTKfPow1Nr90
         +Ojt3c3Xpk7zX6l6aDtTXXKsMEQuZyYFaoHO9QeqHiAtEM4qyKT1nz+HSrjfiSjutvd4
         om3AnEVjVuBi2f2uk0NK/BdAOO0MEmVhE9g0Q6iX01k1KiZKuJuEFynIwSTPoRkrWvq7
         pnyO1v+12ceqZhsXVU0LjWgX5tE9Js+dRsiNuIyFtaE4lojUPzx/hkh+mfhp3RaukEPq
         cIN4pCUfxLo8st5QJOby1P61T7+qqi1J0hH4k8JPJ8RpET2YrGlFa6f1COx67GrcqOYK
         si+w==
X-Gm-Message-State: AOAM533QfbTHCFww3nvQh4oLIyDK2byjUdsM7rmaFI1xWwrue+KYHcKw
        XsGg64qW8gOujU0zGQcZGB4zNDkuVJBrtSrJFNtKC0fMKmc=
X-Google-Smtp-Source: ABdhPJxLrdUujsVsIE/v7rlctaN1xk5i13lGSJAo1gNk4C8Qzv+u6urvtjWPQsxxUfK6HuGqN3ryjrtE4pvXvKJSDiI=
X-Received: by 2002:a67:80c8:: with SMTP id b191mr213218vsd.36.1607021178886;
 Thu, 03 Dec 2020 10:46:18 -0800 (PST)
MIME-Version: 1.0
References: <20201203175551.573123-1-masahiroy@kernel.org>
In-Reply-To: <20201203175551.573123-1-masahiroy@kernel.org>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 3 Dec 2020 10:46:07 -0800
Message-ID: <CABCJKufyBcN-foh0kj5kUsn-wiZMJ_a8ZjB72jaTmN2GEVzVNA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: avoid split lines in .mod files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Thu, Dec 3, 2020 at 9:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> "xargs echo" is not a safe way to remove line breaks because the input
> may exceed the command line limit and xargs may break it up into
> multiple invocations of echo. This should never happen because
> scripts/gen_autoksyms.sh expects all undefined symbols are placed in
> the second line of .mod files.
>
> One possible way is to replace "xargs echo" with
> "sed ':x;N;$!bx;s/\n/ /g'" or something, but I rewrote the code by
> using awk because it is more readable.
>
> This issue was reported by Sami Tolvanen; in his Clang LTO patch set,
> $(multi-used-m) is no longer an ELF object, but a thin archive that
> contains LLVM bitcode files. llvm-nm prints out symbols for each
> archive member separately, which results a lot of dupications, in some
> places, beyond the system-defined limit.
>
> This problem must be fixed irrespective of LTO, and we must ensure
> zero possibility of having this issue.
>
> Link: https://lkml.org/lkml/2020/12/1/1658
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.build | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index ae647379b579..4c058f12dd73 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -252,6 +252,9 @@ objtool_dep = $(objtool_obj)                                        \
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>  cmd_gen_ksymdeps = \
>         $(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
> +
> +# List module undefined symbols
> +undefined_syms = $(NM) $< | $(AWK) '$$1 == "U" { printf("%s%s", x++ ? " " : "", $$2) }';
>  endif
>
>  define rule_cc_o_c
> @@ -271,13 +274,6 @@ define rule_as_o_S
>         $(call cmd,modversions_S)
>  endef
>
> -# List module undefined symbols (or empty line if not enabled)
> -ifdef CONFIG_TRIM_UNUSED_KSYMS
> -cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
> -else
> -cmd_undef_syms = echo
> -endif
> -
>  # Built-in and composite module parts
>  $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
>         $(call if_changed_rule,cc_o_c)
> @@ -285,7 +281,7 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
>
>  cmd_mod = { \
>         echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
> -       $(cmd_undef_syms); \
> +       $(undefined_syms) echo; \
>         } > $@
>
>  $(obj)/%.mod: $(obj)/%.o FORCE

Thanks for the patch! I confirmed that this works with llvm-nm and
bitcode files, but it does still produce plenty of duplicates, even
though they now stay on one line. I'm not sure if the readability of
the .mod file matters though. Please feel free to add:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
