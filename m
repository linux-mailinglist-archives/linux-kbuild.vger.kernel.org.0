Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39D63C8A9E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 20:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238941AbhGNST1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 14:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhGNST0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 14:19:26 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0394C061762
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:16:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i5so5195771lfe.2
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gdYfStJb5mwOOj1KojUyVafFJ1o2WedkSsc19T3H7UY=;
        b=NWbdnzBEli+FCtVqOVGaPss2MwLIRyY/wdM4+OblEBSOHLPtHRJx4v4lqeWS87OiJq
         GrCDPu7eUBhilt/v8alOd8G8WOI58C8iirfAC7Bz5pOBy2GTDt8ZNdlBxGQUO3n4YrBX
         0YKG1LOyZQ9udog24gV/2cMfql+Vkwc1NHmxZvx5GcfwE8hcU6pFqbjySrUJjrRw2Wp9
         mApyz4NWpEbcuSm3WOHq4Qb6GYGwKDFVRWXkeey6gBTkA2EnAqy9IxDqE3imgbiOZ+V1
         pU7DeFfq4lKx0B5Opnxs9bmnjeQZ7/8mdW9zD4wwqb+xlxZyqrUAVcx6lpH5Y8+P6nMC
         F3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gdYfStJb5mwOOj1KojUyVafFJ1o2WedkSsc19T3H7UY=;
        b=K+QQ05CcGj3wuF4qzD8SHStDxBbPD79wYCvS0lC+X361q1cX59sveNaAXxgdWFcyLV
         1zy7XQ+aXaU7FGqDlAUjKusDuw9sbAXxvtNu54dSQFBzZUlTylq3q/VN+Q7O/L3UGV9U
         J7G15nqjlBiI4z5lfEOH2cU/wOIQngk4y4hH3dS1XZL3wxKxw+2IJjA2L5OAU/2C1SHz
         4MG/NUhg+6RXePHKQHmdxG/0Nd8mhExAEzMs3IO1JW68FCoGPWu1LkHHdRwnERSBowXu
         MgcCf0QZ4Ta/iaUMfub9/6A9n3dozCKskABngb23VG9FJ4cTp9/VcKMgqH8O8/o86szt
         C/Iw==
X-Gm-Message-State: AOAM530L3pFnqmInkBvcfWv9fuPrLokV5QCqA36ykdjFNTTTzhohESDP
        k+HhWXlx7wfaMedxE1czVb1Mc/pxy19BgcIxeSncOg==
X-Google-Smtp-Source: ABdhPJzEKs9SRTQ6+N8LhT06hWiRWkYkLtuXtaEpRgI5+ZlKGUTLSDyWY2UH/XyxBPnSN/RKA3eJ4h/aWPEjT0jZRRI=
X-Received: by 2002:ac2:59db:: with SMTP id x27mr5574226lfn.547.1626286592091;
 Wed, 14 Jul 2021 11:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-4-ojeda@kernel.org>
 <CAKwvOdnO1ZbM_FzY3qwokEkWDxsr37t_u57H_wEO6Pbu6CqFZw@mail.gmail.com>
In-Reply-To: <CAKwvOdnO1ZbM_FzY3qwokEkWDxsr37t_u57H_wEO6Pbu6CqFZw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Jul 2021 11:16:20 -0700
Message-ID: <CAKwvOdm3_TbPPCZRvpdsfZW7szWEEnpb4NyqQ39P8a=7YGCb=g@mail.gmail.com>
Subject: Re: [PATCH 03/17] Makefile: generate `CLANG_FLAGS` even in GCC builds
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 11:13 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, Jul 4, 2021 at 1:28 PM <ojeda@kernel.org> wrote:
> >
> > From: Miguel Ojeda <ojeda@kernel.org>
> >
> > To support Rust under GCC-built kernels, we need to save the flags that
> > would have been passed if the kernel was being compiled with Clang.
> >
> > The reason is that `bindgen` -- the tool we use to generate Rust
> > bindings to the C side of the kernel -- relies on `libclang` to
> > parse C. Ideally:
> >
> >   - `bindgen` would support a GCC backend (requested at [1]),
> >
> >   - or the Clang driver would be perfectly compatible with GCC,
> >     including plugins. Unlikely, of course, but perhaps a big
> >     subset of configs may be possible to guarantee to be kept
> >     compatible nevertheless.
> >
> > This is also the reason why GCC builds are very experimental and some
> > configurations may not work (e.g. `GCC_PLUGIN_RANDSTRUCT`). However,
> > we keep GCC builds working (for some example configs) in the CI
> > to avoid diverging/regressing further, so that we are better prepared
> > for the future when a solution might become available.
> >
> > [1] https://github.com/rust-lang/rust-bindgen/issues/1949
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/167
> > Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> > Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> > Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
> > Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> > Co-developed-by: Finn Behrens <me@kloenk.de>
> > Signed-off-by: Finn Behrens <me@kloenk.de>
> > Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> > Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> > Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Patch LGTM; please keep an eye on the series:
> https://lore.kernel.org/lkml/20210707224310.1403944-2-ndesaulniers@google.com/
>
> If that lands in kbuild before this, this patch will need to be
> rebased to avoid a conflict in linux-next.
>
> So (tentatively :-P):
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> If the patch needs to be rebased on the series linked above, please
> drop my reviewed by tag and I will re-review. Perhaps putting me
> explicitly on Cc: in the commit message will help notify me if there
> are successive versions?
>
> > ---
> >  Makefile | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 0565caea036..6e823d8bd64 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -573,18 +573,23 @@ endif
> >  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
> >  CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
> >
> > -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> > +TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option

Also, consider whether `BINDGEN_FLAGS` would be more descriptive (and
less verbose) than `TENTATIVE_CLANG_FLAGS`.

> > +
> >  ifneq ($(CROSS_COMPILE),)
> > -CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > +TENTATIVE_CLANG_FLAGS  += --target=$(notdir $(CROSS_COMPILE:%-=%))
> >  endif
> >  ifeq ($(LLVM_IAS),1)
> > -CLANG_FLAGS    += -integrated-as
> > +TENTATIVE_CLANG_FLAGS  += -integrated-as
> >  else
> > -CLANG_FLAGS    += -no-integrated-as
> > +TENTATIVE_CLANG_FLAGS  += -no-integrated-as
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > -CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> > +TENTATIVE_CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> >  endif
> > -CLANG_FLAGS    += -Werror=unknown-warning-option
> > +
> > +export TENTATIVE_CLANG_FLAGS
> > +
> > +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> > +CLANG_FLAGS    += $(TENTATIVE_CLANG_FLAGS)
> >  KBUILD_CFLAGS  += $(CLANG_FLAGS)
> >  KBUILD_AFLAGS  += $(CLANG_FLAGS)
> >  export CLANG_FLAGS
> > --
> > 2.32.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
