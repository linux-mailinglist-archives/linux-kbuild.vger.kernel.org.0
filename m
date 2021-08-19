Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3133F1163
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 05:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhHSDTz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 23:19:55 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:50990 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbhHSDTy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 23:19:54 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17J3IxsJ030290;
        Thu, 19 Aug 2021 12:19:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17J3IxsJ030290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629343140;
        bh=8R7YU7UMyAYg6tI+s5cGIr3kp+Uc/xP2EG46o6jBdT4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XQkyXmXY6RH3PPpTXNjeBoJ9oCb2cOWub2Fljdqz6J3wCSmqBL3JPz5q9j1bcExFN
         7Q3VU2ftUEdwXmDSEZpsGjKlXW1++UBLDjmAydHFRtFvNPDb+nhYJckUsivZZEJes2
         dv2UJeIq4U7C9DPhtC7RyyRZGIQ9pUHEnPvpZakVt81GuzchlcBRD9PpAQUmCsYr2l
         pNalNMVC9du/wzz2EwjJfmLUgufJP9zb6+RkjHi6kTHMj1XAssAnlzDErGayNgjzkY
         UYEnwNLcTmRQb7xyawFeVWXhWx9mJ0jKCWtarHHX4zoUE3RHzRoKt95GIT7Fr7WfnU
         ZplSxzewdw5Vg==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso10308194pjh.5;
        Wed, 18 Aug 2021 20:19:00 -0700 (PDT)
X-Gm-Message-State: AOAM533/vUcXANZTt6zGaFNBnBtntLRGpTL66IWTctU8tVgml3yg7Y5r
        dCZ5GGW45466iu5gyadgJPcPbTqx8zWJf7r02IE=
X-Google-Smtp-Source: ABdhPJziJU4OCVndQXuzQnNS+qX678bfza4wm+IfG/N31dAjyI+7YzjBQH/lrEqEVyok9RGqWAhv/WgF/SG9n8Wzkns=
X-Received: by 2002:a17:902:bc41:b029:12d:3f9b:401e with SMTP id
 t1-20020a170902bc41b029012d3f9b401emr9847564plz.47.1629343139527; Wed, 18 Aug
 2021 20:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210819005744.644908-1-masahiroy@kernel.org> <20210819005744.644908-4-masahiroy@kernel.org>
 <202108181952.14AEEED@keescook>
In-Reply-To: <202108181952.14AEEED@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Aug 2021 12:18:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT27ADexKfDjxK1F=FKGGWNFKQZ7vEyKXR_0+gpjZpT5Q@mail.gmail.com>
Message-ID: <CAK7LNAT27ADexKfDjxK1F=FKGGWNFKQZ7vEyKXR_0+gpjZpT5Q@mail.gmail.com>
Subject: Re: [PATCH 03/13] kbuild: detect objtool changes correctly and remove .SECONDEXPANSION
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 11:55 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Aug 19, 2021 at 09:57:34AM +0900, Masahiro Yamada wrote:
> > This reverts commit 8852c5524029 ("kbuild: Fix objtool dependency for
> > 'OBJECT_FILES_NON_STANDARD_<obj> := n'"), and fix the dependency in a
> > cleaner way.
> >
> > Using .SECONDEXPANSION is expensive since Makefile.build is parsed
> > twice every time, and the escaping dollars makes the code unreadable.
> >
> > Adding include/config/* as dependency is not maintainable either because
> > objtool_args is dependent on more CONFIG options.
> >
> > A better fix is to include the objtool command in *.cmd files so any
> > command change is naturally detected by if_change.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Makefile.build | 28 ++++++++++------------------
> >  1 file changed, 10 insertions(+), 18 deletions(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 31154e44c251..3e4cd1439cd4 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -155,7 +155,7 @@ $(obj)/%.ll: $(src)/%.c FORCE
> >  # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
> >
> >  quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
> > -      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
> > +      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< $(cmd_objtool)
> >
> >  ifdef CONFIG_MODVERSIONS
> >  # When module versioning is enabled the following steps are executed:
> > @@ -223,6 +223,8 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
> >
> >  ifdef CONFIG_STACK_VALIDATION
> >
> > +objtool := $(objtree)/tools/objtool/objtool
> > +
> >  # Objtool arguments are also needed for modfinal with LTO, so we define
> >  # then here to avoid duplication.
> >  objtool_args =                                                               \
> > @@ -237,26 +239,19 @@ objtool_args =                                                          \
> >
> >  ifndef CONFIG_LTO_CLANG
> >
> > -__objtool_obj := $(objtree)/tools/objtool/objtool
> > -
> >  # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
> >  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
> >  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
> >  cmd_objtool = $(if $(patsubst y%,, \
> >       $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> > -     $(__objtool_obj) $(objtool_args) $@)
> > -objtool_obj = $(if $(patsubst y%,, \
> > -     $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> > -     $(__objtool_obj))
> > +     ; $(objtool) $(objtool_args) $@)
>
> This is extremely clever -- pasting commands together. :)
>
> Does this correctly propagate failures in the first half of the command?


Yes.
Any failure bails out immediately because the -e option is set.


See

  cmd = @set -e; $(echo-cmd) $(cmd_$(1))

in scripts/Kbuild.include




>
> For example, now we'd have:
>         gcc flags..... -c -o out in ; objtool...
>
> But I think objtool will run even on gcc failure, and "make" won't see
> the failure from gcc? I need to go test this.
>
> -Kees
>
> > +
> > +# Rebuild all objects when objtool is updated
> > +objtool_dep = $(objtool)
> >
> >  endif # CONFIG_LTO_CLANG
> >  endif # CONFIG_STACK_VALIDATION
> >
> > -# Rebuild all objects when objtool changes, or is enabled/disabled.
> > -objtool_dep = $(objtool_obj)                                 \
> > -           $(wildcard include/config/ORC_UNWINDER            \
> > -                      include/config/STACK_VALIDATION)
> > -
> >  ifdef CONFIG_TRIM_UNUSED_KSYMS
> >  cmd_gen_ksymdeps = \
> >       $(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
> > @@ -270,7 +265,6 @@ define rule_cc_o_c
> >       $(call cmd,gen_ksymdeps)
> >       $(call cmd,checksrc)
> >       $(call cmd,checkdoc)
> > -     $(call cmd,objtool)
> >       $(call cmd,modversions_c)
> >       $(call cmd,record_mcount)
> >  endef
> > @@ -278,13 +272,11 @@ endef
> >  define rule_as_o_S
> >       $(call cmd_and_fixdep,as_o_S)
> >       $(call cmd,gen_ksymdeps)
> > -     $(call cmd,objtool)
> >       $(call cmd,modversions_S)
> >  endef
> >
> >  # Built-in and composite module parts
> > -.SECONDEXPANSION:
> > -$(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
> > +$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
> >       $(call if_changed_rule,cc_o_c)
> >       $(call cmd,force_checksrc)
> >
> > @@ -367,7 +359,7 @@ $(obj)/%.s: $(src)/%.S FORCE
> >       $(call if_changed_dep,cpp_s_S)
> >
> >  quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
> > -      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
> > +      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
> >
> >  ifdef CONFIG_ASM_MODVERSIONS
> >
> > @@ -386,7 +378,7 @@ cmd_modversions_S =                                                               \
> >       fi
> >  endif
> >
> > -$(obj)/%.o: $(src)/%.S $$(objtool_dep) FORCE
> > +$(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
> >       $(call if_changed_rule,as_o_S)
> >
> >  targets += $(filter-out $(subdir-builtin), $(real-obj-y))
> > --
> > 2.30.2
> >
>
> --
> Kees Cook



-- 
Best Regards
Masahiro Yamada
