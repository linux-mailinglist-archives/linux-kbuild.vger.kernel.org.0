Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FAE5A2ED2
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Aug 2022 20:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345127AbiHZSiL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Aug 2022 14:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345123AbiHZShx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Aug 2022 14:37:53 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E078696D9
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 11:35:04 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m5so3071628lfj.4
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 11:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4aLkJX7cunHtM95EA9sb2bQZzhjKdoxn0b8NHuPsFR0=;
        b=L0/i8Wip3YLAM3uYJCwNd1DWXNAdOUnJwUT2dG612DDLpJ+3YZhuHltz7xznpTH9U2
         GWC8IwUPt+IApjCrjxi2jZNwH98Lvma8HMhMNrc4H+dCpbsZpvutNVa79X9n2Gjx0LT0
         b9WD+ih6oaaJiQnXQs2aB0H0fqGnIxPuvpdhlqQR3pevS9RC0wnHyoo85R5qWNg2v7NY
         zC88PKdPO+k2QY668NzdEmAt3F+bnrn+UXJQpL/GYHjMFMxw/uiy0TXVflSclJagtiq8
         ir16es+xHOWCet/uE2FskJ34y0RKe+jT78jbM8rU0o4AZCc7AdmblmHv196v25iKCG2K
         /Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4aLkJX7cunHtM95EA9sb2bQZzhjKdoxn0b8NHuPsFR0=;
        b=WpM6E+gb9hJRIV68YMtnFYIihUWkL/U/04VWFmaJH+oyrh+65q2lHCNeDgf9Q6BFo8
         tCvPMGQTrgw9O01vnLNCCvi8Ay3LEahOcveHzGRxxRFYY9aTGiUwheeI70Y+pNHnUvqu
         nlgFKcR6NQyJ6PO14eyoA4kp35futRBtBHOffH9NJQUspjx4PLOvWmXSOQibXuihTIHR
         GHT18+fjKBCMA9IAGlg82zNxvnFsFZ6AWoz1WvJHVsxZYK/Qx1bZQ8FUrj0roqz4rEI7
         oPFXmlj2nq4jX1Ps6wAWUwgHdWUTdfiIbpaUXebyetcidBzsEZ3j1cXaGGlx3j/AGdDo
         VQhw==
X-Gm-Message-State: ACgBeo2w34PtztYLiyJpMj5vmafCjfPiLCammKy7kQrK3YHR4XWowgpt
        XlKq1T+p65fyWyCsNrIuDRylWG1feUlhf4/kEWGGQoPyGd86zQ==
X-Google-Smtp-Source: AA6agR6GjUnk9Fc+Xi2855vHSGp0Lm/1DilayQZsJQlEygL9lQ7uIA7Heq8q4/hGmgyGNbztLUDhV1Oeyd2FboyaH+w=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr3230009lfr.647.1661538901687; Fri, 26
 Aug 2022 11:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
 <20220826181035.859042-2-ndesaulniers@google.com> <YwkPNyHvxR2dM+CQ@dev-arch.thelio-3990X>
In-Reply-To: <YwkPNyHvxR2dM+CQ@dev-arch.thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 26 Aug 2022 11:34:50 -0700
Message-ID: <CAKwvOdmR8D_GTM=ZhnhLzR3d9Ra46WpcO1W_CujGjMb+QR-_3w@mail.gmail.com>
Subject: Re: [PATCH 1/3] Makefile.compiler: s/KBUILD_CFLAGS/KBUILD_AFLAGS/ for as-option
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>,
        Greg Thelen <gthelen@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 26, 2022 at 11:21 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Nick,
>
> I think the title would be a little more readable if it was:
>
> Makefile.compiler: Use KBUILD_AFLAGS for as-option

Thanks, yeah that looks better; I expect a v2 of this series will be necessary.

>
> On Fri, Aug 26, 2022 at 11:10:33AM -0700, Nick Desaulniers wrote:
> > as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
> > cause as-option to fail unexpectedly because clang will emit
> > -Werror,-Wunused-command-line-argument for various -m and -f flags for
> > assembler sources.
> >
> > Callers of as-option (and as-instr) likely want to be adding flags to
> > KBUILD_AFLAGS/aflags-y, not KBUILD_CFLAGS/cflags-y.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1699
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/x86/boot/compressed/Makefile | 5 +++--
> >  scripts/Makefile.compiler         | 6 +++---
> >  2 files changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> > index 35ce1a64068b..fb3db714a028 100644
> > --- a/arch/x86/boot/compressed/Makefile
> > +++ b/arch/x86/boot/compressed/Makefile
> > @@ -48,8 +48,6 @@ KBUILD_CFLAGS += -Wno-pointer-sign
> >  KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
> >  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
> >  KBUILD_CFLAGS += -D__DISABLE_EXPORTS
> > -# Disable relocation relaxation in case the link is not PIE.
> > -KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
> >  KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
> >
> >  # sev.c indirectly inludes inat-table.h which is generated during
> > @@ -58,6 +56,9 @@ KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
> >  CFLAGS_sev.o += -I$(objtree)/arch/x86/lib/
> >
> >  KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
> > +# Disable relocation relaxation in case the link is not PIE.
> > +KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
> > +
>
> Commit 09e43968db40 ("x86/boot/compressed: Disable relocation
> relaxation") added this to address
> https://github.com/ClangBuiltLinux/linux/issues/1121, is it correct to
> move it to only being used for the .S files in arch/x86/boot/compressed?

+ Arvind

Hmm...that makes me think we might need two different as-option flags;
one that does use KBUILD_CFLAGS, and whose result is meant to be added
to cflags-y, then another that uses KBUILD_AFLAGS and is added to
aflagsy-y.

(My patch 2/3 in the series would use the latter)

Let's see what thoughts Masahiro has.

>
> >  GCOV_PROFILE := n
> >  UBSAN_SANITIZE :=n
> >
> > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > index 94d0d40cddb3..d1739f0d3ce3 100644
> > --- a/scripts/Makefile.compiler
> > +++ b/scripts/Makefile.compiler
> > @@ -29,13 +29,13 @@ try-run = $(shell set -e;         \
> >       fi)
> >
> >  # as-option
> > -# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
> > +# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
> >
> >  as-option = $(call try-run,\
> > -     $(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
> > +     $(CC) $(KBUILD_AFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
> >
> >  # as-instr
> > -# Usage: cflags-y += $(call as-instr,instr,option1,option2)
> > +# Usage: aflags-y += $(call as-instr,instr,option1,option2)
> >
> >  as-instr = $(call try-run,\
> >       printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
> > --
> > 2.37.2.672.g94769d06f0-goog
> >



-- 
Thanks,
~Nick Desaulniers
