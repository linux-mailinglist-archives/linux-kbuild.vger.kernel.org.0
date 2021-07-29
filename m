Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EC23DABF0
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jul 2021 21:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhG2Tkf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Jul 2021 15:40:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:37410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229606AbhG2Tkf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jul 2021 15:40:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9282760E94;
        Thu, 29 Jul 2021 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627587631;
        bh=/Yw1ltAAMBiNHrqDZqFgdBiPKvkkzx4e1WN53FOS1jk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XsUrIiOl/y3BXS1pX9J0o4LR32Zzbi3NrUmWLtuHlVZQyITfP91oW59NELbfvClji
         4ysyqHwsqLPGrEJaAIxh1STsgg37BsYYD2crK1ULSUID+vHno/whxNZDaSRe24GhEn
         xgLnZLLVzGqjDHyYKK9ERbU79tZljF0PqX52/CkPBvpEyMJ0Ic+QQCz62Gnq4kJd/a
         6Wr4GeqC8EHuzYsajiDRlfXXm2SQjIJ427Ln0+CGdsLhPvtsb3o0yBGBVp2U2krK4i
         Czua671ql/MlDtUwavgbBhnJJLPjPDLMEkvYAzuZkAdZTXKYUSSHIGK5gqXUQonQDZ
         w2qBC+xE3lEig==
Received: by mail-wr1-f44.google.com with SMTP id j2so8243756wrx.9;
        Thu, 29 Jul 2021 12:40:31 -0700 (PDT)
X-Gm-Message-State: AOAM533CMswBY7h1GBbbc0u0uEMhkmXlj0fYn7njAANHqV1QmJaul8/3
        awM/K5CKMuDy3EwpWcsepT8bWNAX/e2j1LA88OY=
X-Google-Smtp-Source: ABdhPJy8iQAJ1xOVGl9+NSAQ2HXzOxucAPUYHNRsmJ5tj/sps65AJO3YWAButgQpvbz4XTYl4uCQNivlgpci7BhQLrg=
X-Received: by 2002:adf:e107:: with SMTP id t7mr6536342wrz.165.1627587630094;
 Thu, 29 Jul 2021 12:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210729165039.23896-1-ndesaulniers@google.com> <20210729165039.23896-3-ndesaulniers@google.com>
In-Reply-To: <20210729165039.23896-3-ndesaulniers@google.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 29 Jul 2021 21:40:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=mLvHfOthgyMgtv1v=nqY=oEMnj1EdJfFW-AwOrMh9g@mail.gmail.com>
Message-ID: <CAK8P3a2=mLvHfOthgyMgtv1v=nqY=oEMnj1EdJfFW-AwOrMh9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 CC=clang LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 29, 2021 at 6:50 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given SRCARCH. SRCARCH itself is derived from ARCH
> (normalized for a few different targets).
>
> If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> KBUILD_CFLAGS, and KBUILD_AFLAGS based on $SRCARCH.
>
> Previously, we'd cross compile via:
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1
> Now:
> $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
>
> For native builds (not involving cross compilation) we now explicitly
> specify a target triple rather than rely on the implicit host triple.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1399
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

> +else
> +$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
> +endif # SRCARCH
> +endif # LLVM_IAS

Now in theory I suppose we could just have the fallback use
--target="$(SRCARCH)-linux-gnu"
to avoid having to change this for every new architecture. I think in
most cases, this
would just work, even though a lot of the one you listed have
different patterns.

       Arnd
