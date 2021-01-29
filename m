Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951BC308F09
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Jan 2021 22:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbhA2VKU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Jan 2021 16:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbhA2VKT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 16:10:19 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2D4C061574
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 13:09:38 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id w14so7020429pfi.2
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RYeBCM1n6l4ocBSebSg/m7g9I7gGkp0ycMnAlPc92B8=;
        b=S3tklrxmGuXpMHcYLnRVK+jeO5qFc0et2gxfHJPQ0maQI1TeXudon4C5RUBooPCbtB
         goYiM4KLrjpEgSVh614bPfwnqkxKbGnEWD5ZgbuV9ghFGquGz8RsqJOdxC056XkyI8lU
         pd5WC2uWhmIhqxmn0OBQw9LoOS6gY1SYZrbRbWe3qgx8Ieaaw/LEjU1gYbWnnG2zPGHj
         qQbw3c6WjrjcaqDzcG5TnhzJgLNdnIfhj6iG45ssDD8s7PV60/XSdIS6QT2VUkZX08uQ
         m//NN9Ux3wCuB0CiNg3HAYgZ1K+DBpmMZLVJr0jJxqLXx5EjQxst8zY2wazLv14aA7Xs
         3xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RYeBCM1n6l4ocBSebSg/m7g9I7gGkp0ycMnAlPc92B8=;
        b=bMcXlMjxWztO+iRaUIYxTnfTuhaUVgpSfXjYB40rrWN1H+rUnQdduit+VsaEb9ndPs
         /wiZPsQ4lO2A0dEuBn1vcA230P63zv+fVKaL6j5tbtjJPuzWvZGsVgydg8qJsVDouxJp
         bHrpjHZNb2K2rQRiNFBrMNlD1IYH5rC2SuG0Ssp7ry0wzn71LF8BdjM0Kyj9fQp0rDiJ
         rlyLXsaapx4Ljq9gnfNpux9JtlGeugvoeh7/wnQ93i+4LmZfd9YwStOeAO5GLei1EMoT
         ICmlFpyctrA7CCbrFJfYkwjdAkyWWEfWQHieh+OrOH+uoW8rU+RQNC6B+egolv/96kAA
         id3w==
X-Gm-Message-State: AOAM531p8Z9v6uXIbYICbBcdQmryesmi/YyoVfpIF0FyhAMlTJUJoThn
        E28y8OO1Pall4jsbzFeaPc9A8DtlNvaQGrBNXD3Av3ZdvFiZ1w==
X-Google-Smtp-Source: ABdhPJzFg2tAjKXAr4Pnf1l9ek+uXHXxbHOoTUeTs3hbphe3V1NgyYOvCVADlXGG1yCGPKwdUqQ3VIJHbeuij/TInsA=
X-Received: by 2002:a63:7e10:: with SMTP id z16mr6507613pgc.263.1611954578268;
 Fri, 29 Jan 2021 13:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20210129194318.2125748-1-ndesaulniers@google.com>
 <20210129194318.2125748-3-ndesaulniers@google.com> <CA+icZUX4q-JhCo+UZ9T3FhbC_gso-oaB0OR9KdH5iEpoGZyqVw@mail.gmail.com>
 <CAKwvOdnj1Np62+eOiTOCRXSW6GLSv4hmvtWaz=0aTZEEot_dhw@mail.gmail.com> <CA+icZUWsyjDY58ZZ0MAVfWqBJ8FUSpM6=_5aqPcRTfX2W8Y-+Q@mail.gmail.com>
In-Reply-To: <CA+icZUWsyjDY58ZZ0MAVfWqBJ8FUSpM6=_5aqPcRTfX2W8Y-+Q@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 29 Jan 2021 13:09:27 -0800
Message-ID: <CAKwvOd=mHvEtto37rzFMfsFYe2e-Cp2MAiyRYxHWPdc-HbT8EA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] Kbuild: implement support for DWARF v5
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        Nick Clifton <nickc@redhat.com>, Yonghong Song <yhs@fb.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 29, 2021 at 12:55 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, Jan 29, 2021 at 9:48 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Jan 29, 2021 at 12:41 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Fri, Jan 29, 2021 at 8:43 PM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index 20141cd9319e..bed8b3b180b8 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -832,8 +832,20 @@ endif
> > > >
> > > >  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
> > > >  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> > > > +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
> > > >  DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> > > >
> > > > +# If using clang without the integrated assembler, we need to explicitly tell
> > > > +# GAS that we will be feeding it DWARF v5 assembler directives. Kconfig should
> > > > +# detect whether the version of GAS supports DWARF v5.
> > > > +ifdef CONFIG_CC_IS_CLANG
> > > > +ifneq ($(LLVM_IAS),1)
> > > > +ifeq ($(dwarf-version-y),5)
> > > > +DEBUG_CFLAGS   += -Wa,-gdwarf-5
> > >
> > > I noticed double "-g -gdwarf-5 -g -gdwarf-5" (a different issue) and
> > > that's why I looked again into the top-level Makefile.
> >
> > That's...unexpected.  I don't see where that could be coming from.
> > Can you tell me please what is the precise command line invocation of
> > make and which source file you observed this on so that I can
> > reproduce?
> >
>
> That's everywhere...
>
> $ zstdgrep --color '\-g -gdwarf-5 -g -gdwarf-5'
> build-log_5.11.0-rc5-8-amd64-clang12-lto.txt.zst
> | wc -l
> 29529

I'm not able to reproduce.

$ make LLVM=1 -j72 V=1 2>&1 | grep dwarf
...
clang ... -g -gdwarf-5 -Wa,-gdwarf-5 ...
...

$ make LLVM=1 LLVM_IAS=1 -j72 V=1 2>&1 | grep dwarf
...
clang ... -g -gdwarf-5 ...
...

Can you tell me please what is the precise command line invocation of
make and which source file you observed this on so that I can
reproduce?
-- 
Thanks,
~Nick Desaulniers
