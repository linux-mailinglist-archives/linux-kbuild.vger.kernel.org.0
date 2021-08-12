Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3588F3EABD7
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Aug 2021 22:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhHLUfM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Aug 2021 16:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhHLUfM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Aug 2021 16:35:12 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B955C0613D9
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Aug 2021 13:34:46 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id c5so1250361ybn.5
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Aug 2021 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4PJufOzjLBDCxdq/byxiVCZ51RzAASfRORWxOimYCxM=;
        b=FhizRNLCd+RpqCzF7ofLVuYTSDV5HqtAsijvP5uBYKiQfQrC1MpI5rFPfWxlG1PPEd
         usL3o21HJUcysoaA/e54dPPnFam1mt/bXCXA/hHmj2cu7hruApd7pdF9lSudzFXee8hh
         clgFmKrihfVyFBa+x70y/9THhNesXqiaj02aNT7qauvtD+xMaNfizcEGUHbaB9hztQTp
         NeoQxcGTMMR3Va5RYXFZWHAQyBL1O0uL5KVSTvMDYRuoL8sgPYANAnCuI2h7+mRThJQt
         kksIAa2YDQm0ptup/oWRi2oeLCHR06qpE1BvhIIgf6k9RlxHNApWI82NdRiGgrmMSv6k
         ANaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4PJufOzjLBDCxdq/byxiVCZ51RzAASfRORWxOimYCxM=;
        b=BMFh6DLE3NguE4u2qmQLh1C3l/o4c5wXFYwhEwNaMXeuNSCLH/mkF4WFIxhqNsoSSC
         4w1fDl4CRtz/tqVPzQVTyr0yiaPqLxwAj6VXf93QQpauyWVWc/uc8LrgB3c0Uqp9zIRs
         hzFXLsuxyiY3+9TmLPbQhRwdfIP5aSebSvvdH6oN/PybFCTl713zDciSNAMPOvsB0Z9N
         q4hsflfwCVascHf9rwTaboRrvNzDsKELI4BCo8V32pEs9xfyg8t6MqrIAy4Q2KV17rle
         igpsWqklUYgNzQIoI+UJ2FHWhN857JUHz2/bbDd3bvCNEAkyllFRyjRoAFKpxbKIoRbi
         QaYA==
X-Gm-Message-State: AOAM531yxEkxGfgSqIDoOiM1HJwR8McSLnAlN50QBGxubtbzV+kfekYW
        Sbf6Bo6eW7/9py7M8+WSdfVSYpXC3zEZ8gGxLb6rgQ==
X-Google-Smtp-Source: ABdhPJygpRbF8yewEdCLcSehxtUV+GfdmlXeak1qcq+DZ2i4bEBInT1AtkYF730K9VPxZwPeLuSAR2ivIpVrh+3QrN8=
X-Received: by 2002:a25:24cd:: with SMTP id k196mr6831305ybk.459.1628800485582;
 Thu, 12 Aug 2021 13:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210811203035.2463343-1-samitolvanen@google.com> <CAK7LNAS7Hf19wxebY70jK0TsebmfUpdh5AMo5W21PEjEXOERTw@mail.gmail.com>
In-Reply-To: <CAK7LNAS7Hf19wxebY70jK0TsebmfUpdh5AMo5W21PEjEXOERTw@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 12 Aug 2021 13:34:34 -0700
Message-ID: <CABCJKuevfeizkWN7uafPwb7S5uQ2_jZaUbPOttrwJJTuzTwVDw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Alexander Lobakin <alobakin@pm.me>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 12, 2021 at 1:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Aug 12, 2021 at 5:30 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > With CONFIG_LTO_CLANG, we currently link modules into native
> > code just before modpost, which means with TRIM_UNUSED_KSYMS
> > enabled, we still look at the LLVM bitcode in the .o files when
> > generating the list of used symbols. As the bitcode doesn't
> > yet have calls to compiler intrinsics and llvm-nm doesn't see
> > function references that only exist in function-level inline
> > assembly, we currently need a whitelist for TRIM_UNUSED_KSYMS to
> > work with LTO.
> >
> > This change moves module LTO linking to happen earlier, and
> > thus avoids the issue with LLVM bitcode and TRIM_UNUSED_KSYMS
> > entirely, allowing us to also drop the whitelist from
> > gen_autoksyms.sh.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1369
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Reviewed-by: Alexander Lobakin <alobakin@pm.me>
> > Tested-by: Alexander Lobakin <alobakin@pm.me>
> > ---
> > Changes in v2:
> > - Fixed a couple of typos.
> > - Fixed objtool arguments for .lto.o to always include --module.
> >
> > ---
> >  scripts/Makefile.build    | 24 +++++++++++++++++++++++-
> >  scripts/Makefile.lib      |  7 +++++++
> >  scripts/Makefile.modfinal | 21 ++-------------------
> >  scripts/Makefile.modpost  | 22 +++-------------------
> >  scripts/gen_autoksyms.sh  | 12 ------------
> >  5 files changed, 35 insertions(+), 51 deletions(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 02197cb8e3a7..778dabea3a89 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -271,12 +271,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
> >         $(call if_changed_rule,cc_o_c)
> >         $(call cmd,force_checksrc)
> >
> > +ifdef CONFIG_LTO_CLANG
> > +# Module .o files may contain LLVM bitcode, compile them into native code
> > +# before ELF processing
> > +quiet_cmd_cc_lto_link_modules = LTO [M] $@
> > +cmd_cc_lto_link_modules =                                              \
> > +       $(LD) $(ld_flags) -r -o $@                                      \
> > +               $(shell [ -s $(@:.lto.o=.o.symversions) ] &&            \
> > +                       echo -T $(@:.lto.o=.o.symversions))             \
> > +               --whole-archive $^
> > +
> > +ifdef CONFIG_STACK_VALIDATION
> > +# objtool was skipped for LLVM bitcode, run it now that we have compiled
> > +# modules into native code
> > +cmd_cc_lto_link_modules += ;                                           \
> > +       $(objtree)/tools/objtool/objtool $(objtool_args) --module       \
> > +               $(@:.ko=$(mod-prelink-ext).o)
> > +endif
> > +
> > +$(obj)/%.lto.o: $(obj)/%.o
> > +       $(call if_changed,cc_lto_link_modules)
>
>
>
>
> Documentation/kbuild/makefiles.rst says:
>
>           Note: It is a typical mistake to forget the FORCE prerequisite.
>
>
> The current code in scripts/Makefile.modpost is also wrong, though.

Thanks for taking a look, Masahiro. I'll fix that in v3.

Sami
