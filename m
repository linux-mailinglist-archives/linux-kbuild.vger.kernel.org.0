Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A2B5A3095
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Aug 2022 22:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344987AbiHZUls (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Aug 2022 16:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344880AbiHZUlg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Aug 2022 16:41:36 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6E6DB7F4
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 13:41:34 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31f445bd486so64101977b3.13
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=P9zRTXvNypp3XLQggkQTXRwQu3WlNLsiD9EHNuXARTg=;
        b=La0x9SjqRvdzB4vrHoyKFtUVY2OoiypUYeaR78qLZ1vc0Nwu/4BSAIHNm5vqUngnKI
         4BZMs1MLaYX3We+ieWOWrIPjLiUTUM7q+lNsmXJtQ66T5JJFlSHM15jB1LAJf2FROLjB
         /ZFOXLO8zJT7cLYDpJkeiAEVbeqi5uinaep2zlxBJ5IaQxw2JDoOt0on08QyfNVdljdH
         pVERyUPLTkGofJNvPCIG2JNKsIX8UkDN7akdKRFln29ViEQtCyxqyLHZ9URilv8T+YV/
         llMYnpXHX9q4GlGyyGq+DPmoXdzD7rHkb8LhmMaFp2w5R5qc0OB5efh/jl0E9HCwXBkT
         1GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=P9zRTXvNypp3XLQggkQTXRwQu3WlNLsiD9EHNuXARTg=;
        b=0JLqblQzPIMMnzVm+hYsuXrSFneAPI70IThozblMUfIBhU927xaj8mBZc4j84ujHF7
         kuiqRIKFVMkTFn6yQMpUAAU87q9c4HrG7uTk+ErMDDM6MZhn6bUYU5QhxKu7TIU//dE/
         2FXTqRNvJXYDiiE7tsHZFOQmhzfF2fs/oCXns5BYgqD59U5Dq6kbD8sDfyvOZGhTbwBE
         kFDllOACHb79d9BDjCQs5bBYa4ZYjMsBG/WA4rm+HRsz+dADhwYQpJhbseJ+IjSnacVA
         BD56h+wd7IDht8EuEe0Qa9k42eiFZaveqLijJTl4Byxioue3vCYMM87faXTq/gS8BSIV
         nQkQ==
X-Gm-Message-State: ACgBeo1Muyi8ItKp1kNA4dd/h7XsT94WdMsnvpIctJty39b+aSTpFXoJ
        TSH9ASiV7Tj0xRvrwFpB1BxD6WunT0HJx//rvz3xcsQ+IpYs
X-Google-Smtp-Source: AA6agR4jYfv9Yfoj0O4lJ0QBOu5d/jHbq8WNg7m0HneGti9DqY9LkjBidt7XdZadNcfNiO3Yi2mpaNU4n3ilTzo2We0=
X-Received: by 2002:a25:8550:0:b0:691:11f9:41dd with SMTP id
 f16-20020a258550000000b0069111f941ddmr1315287ybn.600.1661546493585; Fri, 26
 Aug 2022 13:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
 <20220826181035.859042-3-ndesaulniers@google.com> <CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com>
 <CAKwvOdnPjYNFy3r01TBohrZbRGFafGuWaPa8u6b2JdgH=0tKKg@mail.gmail.com> <CAKwvOd=4VgsEjL6hYMTH2ufCZjDTiJWv_u48VY4YPGYXW3MR=A@mail.gmail.com>
In-Reply-To: <CAKwvOd=4VgsEjL6hYMTH2ufCZjDTiJWv_u48VY4YPGYXW3MR=A@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Fri, 26 Aug 2022 13:41:22 -0700
Message-ID: <CAGG=3QUStBe5QKa66vza_nmrs1J=0SjJPdqHQWVoNvHMWe7KSg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Makefile.debug: re-enable debug info for .S files
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Greg Thelen <gthelen@google.com>
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

On Fri, Aug 26, 2022 at 1:16 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Aug 26, 2022 at 12:52 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Aug 26, 2022 at 11:41 AM Bill Wendling <morbo@google.com> wrote:
> > >
> > > On Fri, Aug 26, 2022 at 11:10 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > Alexey reported that the fraction of unknown filename instances in
> > > > kallsyms grew from ~0.3% to ~10% recently; Bill and Greg tracked it down
> > > > to assembler defined symbols, which regressed as a result of:
> > > >
> > > > commit b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")
> > > >
> > > > In that commit, I allude to restoring debug info for assembler defined
> > > > symbols in a follow up patch, but it seems I forgot to do so in
> > > >
> > > > commit a66049e2cf0e ("Kbuild: make DWARF version a choice")
> > > >
> > > > This patch does a few things:
> > > > 1. Add -g to KBUILD_AFLAGS. This will instruct the compiler to instruct
> > > >    the assembler to emit debug info. But this can cause an issue for
> > > >    folks using a newer compiler but older assembler, because the
> > > >    implicit default DWARF version changed from v4 to v5 in gcc-11 and
> > > >    clang-14.
> > > > 2. If the user is using CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT, use a
> > > >    version check to explicitly set -Wa,-gdwarf-<version> for the
> > > >    assembler. There's another problem with this; GAS only gained support
> > > >    for explicit DWARF versions 3-5 in the 2.36 GNU binutils release.
> > > > 3. Wrap -Wa,-gdwarf-<version> in as-option call to test whether the
> > > >    assembler supports that explicit DWARF version.
> > > >
> > > > Link: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
> > > > Fixes: b8a9092330da ("Kbuild: do not emit debug info for assembly with LLVM_IAS=1")
> > > > Reported-by: Alexey Alexandrov <aalexand@google.com>
> > > > Reported-by: Bill Wendling <morbo@google.com>
> > > > Reported-by: Greg Thelen <gthelen@google.com>
> > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > ---
> > > >  scripts/Makefile.debug | 22 ++++++++++++++++++----
> > > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> > > > index 9f39b0130551..a7a6da7f6e7d 100644
> > > > --- a/scripts/Makefile.debug
> > > > +++ b/scripts/Makefile.debug
> > > > @@ -4,18 +4,32 @@ ifdef CONFIG_DEBUG_INFO_SPLIT
> > > >  DEBUG_CFLAGS   += -gsplit-dwarf
> > > >  else
> > > >  DEBUG_CFLAGS   += -g
> > > > +KBUILD_AFLAGS  += -g
> > > >  endif
> > > >
> > > > -ifndef CONFIG_AS_IS_LLVM
> > > > -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > > > +ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > > > +# gcc-11+, clang-14+
> > > > +ifeq ($(shell [ $(CONFIG_GCC_VERSION) -ge 110000 -o $(CONFIG_CLANG_VERSION) -ge 140000 ] && echo y),y)
> > >
> > > Do you think this would be better as a macro? Maybe something like:
> > >
> > > if $(call cc-min-version,110000,140000)
> > >
> > > where the first argument is GCC's min version and second Clang's min
> > > version. It would be more readable and reusable.
> >
> > Yeah!
> >
> > I was looking at cc-ifversion, which has a bug in that it specifically
> > uses CONFIG_GCC_VERSION.  I think I sent a series maybe a year or two
> > ago trying to remove all users of that macro; I think most landed but
> > not all and I never pursued it to completion.  Also, I think there's
> > one user remaining in the AMDGPU drivers; looks like they're been
> > reducing their dependency on that SIMD hack I wrote for them years ago
> > after propagating it to parts of their tree, but one user remains.
> > Perhaps I can just open code it there, or replace it with something
> > new like you suggest.
> >
> > Such a macro would need to consider whether CC_IS_GCC vs CC_IS_CLANG;
> > I could imagine we might need a version check for both, or just one of
> > the two compilers.
> >
> > Ugh, logical OR in GNU make is supported by use of the filter macro...yuck.
> >
> > ifneq ($(filter y, $(call gcc-min-version, 110000), $(call
> > clang-min-version, 140000),)
> > # add gcc-11+, clang-14+ flag
> > endif
> >
> > or maybe as you suggest:
> >
> > ifneq ($(call cc-min-version,110000,140000),)
> > # add gcc-11+, clang-14+ flag
> > endif
> >
> > where the newly minted cc-min-version is implemented in terms of the
> > newly minted gcc-min-version and clang-min-version.  Then I can use
> > cc-min-version in this series, and replace cc-ifversion in AMDGPU with
> > gcc-min-version.  That way, we create composable wrappers that are
> > readable and reusable.
>
> RFC:
> ```
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index d1739f0d3ce3..4809a4c9e5f2 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -65,6 +65,19 @@ cc-disable-warning = $(call try-run,\
>  # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
>  cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] &&
> echo $(3) || echo $(4))
>
> +# gcc-min-version
> +# Usage: cflags-$(call gcc-min-version, 70100) += -foo
> +gcc-min-version = $(shell [ $(CONFIG_GCC_VERSION) -ge $(1) ] && echo y)
> +
> +# clang-min-version
> +# Usage: cflags-$(call clang-min-version, 110000) += -foo
> +clang-min-version = $(shell [ $(CONFIG_CLANG_VERSION) -ge $(1) ] && echo y)
> +
> +# cc-min-version
> +# Usage: cflags-$(call cc-min-version, 701000, 110000)
> +#                                      ^ GCC   ^ Clang
> +cc-min-version = $(filter y, $(call gcc-min-version, $(1)), $(call
> clang-min-version, $(2)))
> +
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> index 0f9912f7bd4c..80c84f746219 100644
> --- a/scripts/Makefile.debug
> +++ b/scripts/Makefile.debug
> @@ -7,7 +7,7 @@ endif
>
>  ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>  # gcc-11+, clang-14+
> -ifeq ($(shell [ $(CONFIG_GCC_VERSION) -ge 110000 -o
> $(CONFIG_CLANG_VERSION) -ge 140000 ] && echo y),y)
> +ifeq ($(call cc-min-version, 110000, 140000), y)
>  dwarf-version-y := 5
>  else
>  dwarf-version-y := 4
>
> ```
>
> I'd keep the replacement of cc-ifversion with gcc-min-version as a
> distinct child patch, since I don't care about backports for that (and
> there's probably more cc-ifversion users the further back you go) but
> I think we might want cc-min-version in stable.
>
> Technically, the above should also update
> Documentation/kbuild/makefiles.rst; but I'm just testing this works;
> it seems to.
>
> Oh, it looks like cc-ifversion both permits checking max-version and
> min version. But we can implement -ge and -lt with just one or the
> other:
>
> ```
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 86a3b5bfd699..17e8fd42d0a5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -34,7 +34,7 @@ dml_ccflags := -mhard-float -maltivec
>  endif
>
>  ifdef CONFIG_CC_IS_GCC
> -ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> +ifeq ($(call gcc-min-version, 70100),)

I think for this you want "gcc-max-version".

>  IS_OLD_GCC = 1
>  endif
>  endif
> ```
>
> Thoughts?
>

I like this idea. Modifying "cc-ifversion" would be great, but you'd
have to somehow specify the checking versions for both gcc and clang
in the macro, and that's messy given the number of arguments that
already exist. It might be possible instead to implement
"cc-ifversion" in terms of the "*-{max,min}-version" macros.

-bw

> >
> > >
> > > -bw
> > >
> > > > +dwarf-version-y := 5
> > > > +else
> > > > +dwarf-version-y := 4
> > > >  endif
> > > > -
> > > > -ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > > > +else # !CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> > > >  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> > > >  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
> > > >  DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> > > >  endif
> > > >
> > > > +# Binutils 2.35+ (or clang) required for -gdwarf-{4|5}.
> > > > +# https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31bf18645d98b4d3d7357353be840e320649a67d
> > > > +ifneq ($(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y)),)
> > > > +KBUILD_AFLAGS  += -Wa,-gdwarf-$(dwarf-version-y)
> > > > +else
> > > > +ifndef CONFIG_AS_IS_LLVM
> > > > +KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > > > +endif
> > > > +endif
> > > > +
> > > >  ifdef CONFIG_DEBUG_INFO_REDUCED
> > > >  DEBUG_CFLAGS   += -fno-var-tracking
> > > >  ifdef CONFIG_CC_IS_GCC
> > > > --
> > > > 2.37.2.672.g94769d06f0-goog
> > > >
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
