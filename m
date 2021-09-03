Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A423FF868
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Sep 2021 02:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243139AbhICAlM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Sep 2021 20:41:12 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30496 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238860AbhICAlL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Sep 2021 20:41:11 -0400
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1830dpfU020723;
        Fri, 3 Sep 2021 09:39:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1830dpfU020723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630629592;
        bh=1Y6XFgB9/D7mjEiysoImroDcHiCWsyF8Liocy0ZJmiw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=l29+RcAmQyS/huREVYv7UUXZT0hnO9UqzEujgTND96AUt5CRF/JlgQi+Xsjvocrd1
         N6xe77cP39v3f6RoWjEKH4kKSk973gCgM2eKAXIalYoyGR/08SzEn/mJp4DIrXF4yp
         HpbpnICOoy9knu0z5JmiQuLwvBejcN7ED/s4hKhpDrf2i0l3duAdHHYelsIq58JKqF
         xHIVYANXkwIZ3wgFvabcR3o9yiWysEV3qxqBW/RMRtshdoS+eHc/5dUqltJSDrcaQa
         DbV0odkBPqvTflQBGE9tLBXTu0FkxgaxbZspIxZuuPYrjZbfQHgSxONj+YN2PtTCyq
         2DxUAjLnWmIHw==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id e7so3836973pgk.2;
        Thu, 02 Sep 2021 17:39:51 -0700 (PDT)
X-Gm-Message-State: AOAM533uGroDCCyUTEmU+kT+cRdSyzKhm+nUsMxRzuLMr885fVZXgGH5
        YNW4SzdMsERsTLtewnoZsT2WloPc7kgE5plk/es=
X-Google-Smtp-Source: ABdhPJwzGYK4C5mlWmXEBMlp5fYhPEu8sKt5Gfs99DD7/XU6ShATFMOMttNOuk1lZQhNUYUZGpV1RJS5uaqcmAdlGv0=
X-Received: by 2002:a63:d40a:: with SMTP id a10mr1047510pgh.7.1630629590936;
 Thu, 02 Sep 2021 17:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-7-masahiroy@kernel.org> <202108311034.D4B1410@keescook>
In-Reply-To: <202108311034.D4B1410@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Sep 2021 09:39:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkducKiw8==u4477JGfyb5vnvbp2gM2s9ndZ_8owXfeg@mail.gmail.com>
Message-ID: <CAK7LNATkducKiw8==u4477JGfyb5vnvbp2gM2s9ndZ_8owXfeg@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] kbuild: reuse $(cmd_objtool) for cmd_cc_lto_link_modules
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 1, 2021 at 2:35 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Aug 31, 2021 at 04:39:57PM +0900, Masahiro Yamada wrote:
> > For CONFIG_LTO_CLANG=y, the objtool processing is not possible at the
> > compilation, hence postponed by the link time.
> >
> > Reuse $(cmd_objtool) for CONFIG_LTO_CLANG=y by defining objtool-enabled
> > properly.
> >
> > For CONFIG_LTO_CLANG=y:
> >
> >   objtool-enabled is off for %.o compilation
> >   objtool-enabled is on  for %.lto link
> >
> > For CONFIG_LTO_CLANG=n:
> >
> >   objtool-enabled is on for %.o compilation
> >       (but, it depends on OBJECT_FILE_NON_STANDARD)
> >
> > Set part-of-module := y for %.lto.o to avoid repeating --module.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Makefile.build | 28 +++++++++++++++++-----------
> >  1 file changed, 17 insertions(+), 11 deletions(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 21b55f37a23f..afc906cd7256 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -236,20 +236,26 @@ objtool_args =                                                          \
> >       $(if $(CONFIG_X86_SMAP), --uaccess)                             \
> >       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
> >
> > -ifndef CONFIG_LTO_CLANG
> > +cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
> > +cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
> > +
> > +endif # CONFIG_STACK_VALIDATION
> > +
> > +ifdef CONFIG_LTO_CLANG
> > +
> > +# Skip objtool for LLVM bitcode
> > +$(obj)/%o: objtool-enabled :=
>
> Is this intentionally "%o" instead of "%.o"?

Good catch.

No, it is not intentional.

I will fix "%o" to "%.o"


> (And it later overridden by the "%.lto.o" rule?

No, opposite.

While building %.lto.o, we want to set objtool-enabled.
But, we want to cancel it for %.o




-- 
Best Regards
Masahiro Yamada
