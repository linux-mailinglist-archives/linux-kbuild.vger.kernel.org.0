Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEB02DBB22
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 07:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgLPGVB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 01:21:01 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25431 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgLPGVB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 01:21:01 -0500
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0BG6JqRC015239;
        Wed, 16 Dec 2020 15:19:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0BG6JqRC015239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608099592;
        bh=6pI3W5aqoviNIdAK6AlX95XTyAmFY6eJRLasDg8LFA8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gx6OXDgdCPfRd0u1dkmsE8LkbtpmP0DDLYZZCnyUQVQfPXFSr5Jxzqj4/K7UppHJ+
         4mAhy6F/t3Cj4OLzmJr7e8O9sZi615ifalv/r67nBtDGVSiv6MxuL+l/kCBI1LX2dA
         LWO+X4lkbyZH+LIQM7j/gTGCOE4j4JSwAbrpby+JoVxLjp0bjsPSk9I0iQqBsYgkET
         g2hNh3037wGUCh2rhnUFZVXMdm/nR2/q6wAhERjC5vf+MTI7TPBMBYf0eJixfLTuXJ
         ZaA6pVkeRbjtK2kfpgWclelAQcQlrt7TTdefPrPbvKK6x6llsu602ZD2XIGhsoQCOa
         KupNgTFCagMdA==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id c22so1464087pgg.13;
        Tue, 15 Dec 2020 22:19:52 -0800 (PST)
X-Gm-Message-State: AOAM533BwVO5bYMJ18nRZ6/dLITNZBtUfAK2rFt2vuC5miB6+TaBErpj
        h7FQK7pjOgvULN+YNJ0boLUUBMoMU4KWUY8neOA=
X-Google-Smtp-Source: ABdhPJymRTWbp/4FZLaBMbqJiLTjYwk+ckfIymQ7g6q+gyKMR31IEUWMymgU8echz8AHO5aWmFmFC0gXO/Gn6kZkh10=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr32080061pgu.175.1608099591440;
 Tue, 15 Dec 2020 22:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20201203175551.573123-1-masahiroy@kernel.org> <CABCJKufyBcN-foh0kj5kUsn-wiZMJ_a8ZjB72jaTmN2GEVzVNA@mail.gmail.com>
In-Reply-To: <CABCJKufyBcN-foh0kj5kUsn-wiZMJ_a8ZjB72jaTmN2GEVzVNA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 16 Dec 2020 15:19:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmSOhGqB-MRnpxVXPF0=cftvZGWrgRZtjcxCOX7E+ZoQ@mail.gmail.com>
Message-ID: <CAK7LNAQmSOhGqB-MRnpxVXPF0=cftvZGWrgRZtjcxCOX7E+ZoQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: avoid split lines in .mod files
To:     Sami Tolvanen <samitolvanen@google.com>
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

On Fri, Dec 4, 2020 at 3:46 AM 'Sami Tolvanen' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> Hi Masahiro,
>
> On Thu, Dec 3, 2020 at 9:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > "xargs echo" is not a safe way to remove line breaks because the input
> > may exceed the command line limit and xargs may break it up into
> > multiple invocations of echo. This should never happen because
> > scripts/gen_autoksyms.sh expects all undefined symbols are placed in
> > the second line of .mod files.
> >
> > One possible way is to replace "xargs echo" with
> > "sed ':x;N;$!bx;s/\n/ /g'" or something, but I rewrote the code by
> > using awk because it is more readable.
> >
> > This issue was reported by Sami Tolvanen; in his Clang LTO patch set,
> > $(multi-used-m) is no longer an ELF object, but a thin archive that
> > contains LLVM bitcode files. llvm-nm prints out symbols for each
> > archive member separately, which results a lot of dupications, in some
> > places, beyond the system-defined limit.
> >
> > This problem must be fixed irrespective of LTO, and we must ensure
> > zero possibility of having this issue.
> >
> > Link: https://lkml.org/lkml/2020/12/1/1658
> > Reported-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Makefile.build | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index ae647379b579..4c058f12dd73 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -252,6 +252,9 @@ objtool_dep = $(objtool_obj)                                        \
> >  ifdef CONFIG_TRIM_UNUSED_KSYMS
> >  cmd_gen_ksymdeps = \
> >         $(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
> > +
> > +# List module undefined symbols
> > +undefined_syms = $(NM) $< | $(AWK) '$$1 == "U" { printf("%s%s", x++ ? " " : "", $$2) }';
> >  endif
> >
> >  define rule_cc_o_c
> > @@ -271,13 +274,6 @@ define rule_as_o_S
> >         $(call cmd,modversions_S)
> >  endef
> >
> > -# List module undefined symbols (or empty line if not enabled)
> > -ifdef CONFIG_TRIM_UNUSED_KSYMS
> > -cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
> > -else
> > -cmd_undef_syms = echo
> > -endif
> > -
> >  # Built-in and composite module parts
> >  $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
> >         $(call if_changed_rule,cc_o_c)
> > @@ -285,7 +281,7 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
> >
> >  cmd_mod = { \
> >         echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
> > -       $(cmd_undef_syms); \
> > +       $(undefined_syms) echo; \
> >         } > $@
> >
> >  $(obj)/%.mod: $(obj)/%.o FORCE
>
> Thanks for the patch! I confirmed that this works with llvm-nm and
> bitcode files, but it does still produce plenty of duplicates,

Actually, the duplication does not matter
because scripts/gen_autoksyms.sh line 46
calls 'sort -u' anyway.
Only the problem is we have bigger .mod files, though.

We do not have a good reason
to move 'sort -u' for now.




> even
> though they now stay on one line. I'm not sure if the readability of
> the .mod file matters though. Please feel free to add:
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
>
> Sami
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CABCJKufyBcN-foh0kj5kUsn-wiZMJ_a8ZjB72jaTmN2GEVzVNA%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
