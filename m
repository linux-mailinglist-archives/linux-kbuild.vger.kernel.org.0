Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1BD3FCC62
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240340AbhHaReX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240268AbhHaReX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:34:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A745C061760
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:33:27 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id l10so431793lfg.4
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DZrI18LgS1AdjStd1TKHBE3FrFTsYJzmFcPjKcirCd0=;
        b=GPXZdvpwt6jtEOn3JFvQvlIzVUPyhg/+Cg9AB6JRZHVzFTtM3OOe1q2+0g1mXDAvx4
         YXvwXFaqehzLP6LXJWykKY39RmpHTcHGVJfWNChZie4bK93oW5bEDIfvUKzoUZ5YgXR8
         caPv+ZJUdLm4GFMo6uPvQ9zpK86a1gwrVcwO6RuegspPWVJtCsSBy2bfM/RzuGT+1gKN
         d/qxwCIwzb2vH3I7lq9peXTtgMbnyNEDh7tOOoksmwaSEixrS7HuALczmAqOH8Xrl0Ds
         vyTtF1STL2KW+2A0bKgjAbt6U5TVzLhX4INQ/8pOcDmCMUUBr3FV90URn4G1552+4TlM
         mqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZrI18LgS1AdjStd1TKHBE3FrFTsYJzmFcPjKcirCd0=;
        b=GGKy3BZag6HPk7iPdroPD0GqYQ8hNSDtiLIA+w9uFpNa3+Hh0iHLsOHVhMoTu9V8yB
         +BVduInvoy/4Mh8Hg5UTD7xUXE3S/jfimfp2UvUjr/NdZeQiQPGAF0NqQ19dF1z0XZ2m
         6vRquE86goB0LIAFqhujBi/8o827WdSbBZmKhlYm0HeOIF1aORs5LSS5A4t/dWAoQJ09
         a1EdqOO+MfscRw2j7pgmGvK1MUE5+sdGygs9tUOC2xKxX+OnPv2e4EfaAVgwKFi/8jSI
         nG3apV2HFOkpvCQ15nioMf/NtvqJyQBJmc2bWzIO3+bwkXp0JDcOrR7gSOc1q/gGVDJL
         8yvw==
X-Gm-Message-State: AOAM533HNZVi9T6ToD5wr9D0xH+8NLsMgC71ehr+oeIP+bwrke/ENj6u
        R+iu7xlVK5Aet8vHbowpPMgo/KT6x37hIl60PlByS3VY4HP6/Q==
X-Google-Smtp-Source: ABdhPJyN8F39mi4Qm2/KOgSNBQR20dPHngD1OzWbSHKWRDp82Be0xe7biQ5MmCf9/ONK6p2xBWyIz++PMrvfMk3uIhQ=
X-Received: by 2002:a05:6512:3e22:: with SMTP id i34mr22560264lfv.374.1630431205487;
 Tue, 31 Aug 2021 10:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org> <20210831074004.3195284-6-masahiroy@kernel.org>
In-Reply-To: <20210831074004.3195284-6-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 31 Aug 2021 10:33:14 -0700
Message-ID: <CAKwvOdmsnuv6qa5USKqqhg419FGD55U2zGw_KngmBcz_UDOOcg@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] kbuild: detect objtool update without using .SECONDEXPANSION
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Redo commit 8852c5524029 ("kbuild: Fix objtool dependency for
> 'OBJECT_FILES_NON_STANDARD_<obj> := n'") to add the objtool
> dependency in a cleaner way.
>
> Using .SECONDEXPANSION ends up with unreadable code due to escaped
> dollars. Also, it is not efficient because the second half of
> Makefile.build is parsed twice every time.
>
> Append the objtool dependency to the *.cmd files at the build time.
>
> This is what fixdep and gen_ksymdeps.sh already do. So, following the
> same pattern seems a natural solution.
>
> This allows us to drop $$(objtool_deps) entirely.

s/objtool_deps/objtool_dep/

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

You and Josh should be cc'ing each other explicitly on these kind of changes.

> ---
>
>  scripts/Makefile.build | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 720a86642f48..21b55f37a23f 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -246,14 +246,11 @@ objtool-enabled = $(if $(filter-out y%, \
>         $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
>
>  cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
> -objtool_obj = $(if $(objtool-enabled), $(objtool))
> +cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
>
>  endif # CONFIG_LTO_CLANG
>  endif # CONFIG_STACK_VALIDATION
>
> -# Rebuild all objects when objtool changes
> -objtool_dep = $(objtool_obj)
> -
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>  cmd_gen_ksymdeps = \
>         $(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
> @@ -267,6 +264,7 @@ define rule_cc_o_c
>         $(call cmd,gen_ksymdeps)
>         $(call cmd,checksrc)
>         $(call cmd,checkdoc)
> +       $(call cmd,gen_objtooldep)
>         $(call cmd,modversions_c)
>         $(call cmd,record_mcount)
>  endef
> @@ -274,12 +272,12 @@ endef
>  define rule_as_o_S
>         $(call cmd_and_fixdep,as_o_S)
>         $(call cmd,gen_ksymdeps)
> +       $(call cmd,gen_objtooldep)
>         $(call cmd,modversions_S)
>  endef
>
>  # Built-in and composite module parts
> -.SECONDEXPANSION:
> -$(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
> +$(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
>         $(call if_changed_rule,cc_o_c)
>         $(call cmd,force_checksrc)
>
> @@ -380,7 +378,7 @@ cmd_modversions_S =                                                         \
>         fi
>  endif
>
> -$(obj)/%.o: $(src)/%.S $$(objtool_dep) FORCE
> +$(obj)/%.o: $(src)/%.S FORCE
>         $(call if_changed_rule,as_o_S)
>
>  targets += $(filter-out $(subdir-builtin), $(real-obj-y))
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
