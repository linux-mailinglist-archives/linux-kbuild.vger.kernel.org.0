Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBA62D303F
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Dec 2020 17:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbgLHQyh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Dec 2020 11:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgLHQyh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Dec 2020 11:54:37 -0500
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410F8C061749
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Dec 2020 08:53:57 -0800 (PST)
Received: by mail-vk1-xa44.google.com with SMTP id f71so3280552vka.12
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Dec 2020 08:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l5zve3QgoBiHLvxkhbeIQQ8L+c1shM0AySo9iJPfdLI=;
        b=tcWjcUsoxU6SpDxMxfUujxhJGgNiN0OcrzVgHRXE+pbJuNC7SLmXfBUI75eINJCzON
         G0nY39F1EVNqZripZe6gbBqfZzjuLM84h1W0NmIJ9jvGryhhLgEOXTrybPsOQT8GLnc8
         KUcGz9aiF8dfaNJXcsm4ma4k42S8fJ72oEzmlNAlfhp/cRlYwKUgc/vMzXaoCHGAiAQz
         Fv8ITYgJz1voaC3m4n36riFKsJeJiarjPn95yOG7ac8eVlG7dHlzrZ6kvmUTf+Y5xSqG
         1a1WQigfWfhFFyxkOxdgAlObdqquWglgAenkMnogNlCbuvVFB7EBjDeKD1KOeC3meePi
         dfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5zve3QgoBiHLvxkhbeIQQ8L+c1shM0AySo9iJPfdLI=;
        b=NXLD+YLBxBBaY2PBQNnWUsR73ia9zsV0DSVQCZ+v9PRGh+7jBtjSFQX/T9/mDQvksv
         CoywSBktQStu0ND1LfjDVugb6aW8ym7xWLPZGf4/OSJQLRpCJbNfB+rTPo8eibBowq4A
         sXhiBCTsCVJJj8CnqBU5h+zSXW+bhn45nRfK6Dd2q0snyw4PIoT8qbaEFjdqGX/MwNRW
         fczKJXrVYXZcq8cnTEP8xHG/yEkEszdB9GitsDdQu7BoG2JAA0B7NCDDZzTzlwGut8TG
         c8/B1cnEmOIXp52CcN4W1aOMRDBqnUS9OFKrXkO5J4BdxWkOmzsGbY8pQuEyc4EEKoFu
         bUPA==
X-Gm-Message-State: AOAM533P/z2PxNVGLVCdavcKXI1WNOPKAsLSFm5m2nPeh8lLwNxIL6Kn
        jr3GT4ao8T8GuxvvkTm6bzLVgbTdmIexYF0sBfreHA==
X-Google-Smtp-Source: ABdhPJxgg0AuBgAyNX33MRQChfKNjBy/l6I+d3qFW7cDxguUPeYCwHRH9XJaUc5ctnBi5qE5LUaYex6e2Q3DEwkWc2E=
X-Received: by 2002:a1f:b245:: with SMTP id b66mr17138078vkf.3.1607446436156;
 Tue, 08 Dec 2020 08:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20201201213707.541432-1-samitolvanen@google.com>
 <CAK8P3a1WEAo2SEgKUEs3SB7n7QeeHa0=cx_nO==rDK0jjDArow@mail.gmail.com> <CAK8P3a0AyciKoHzrgtaLxP9boo8WqZCe8YfPBzGPQ14PW_2KgQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0AyciKoHzrgtaLxP9boo8WqZCe8YfPBzGPQ14PW_2KgQ@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 8 Dec 2020 08:53:44 -0800
Message-ID: <CABCJKudbCD3s0RcSVzbnn4MV=DadKOxOxar3jfiPWucX4JGxCg@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] Add support for Clang LTO
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 8, 2020 at 5:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Dec 8, 2020 at 1:15 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Tue, Dec 1, 2020 at 10:37 PM 'Sami Tolvanen' via Clang Built Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > - many builds complain about thousands of duplicate symbols in the kernel, e.g.
> >   ld.lld: error: duplicate symbol: qrtr_endpoint_post
> >  >>> defined in net/qrtr/qrtr.lto.o
> >  >>> defined in net/qrtr/qrtr.o
> >  ld.lld: error: duplicate symbol: init_module
> >  >>> defined in crypto/842.lto.o
> >  >>> defined in crypto/842.o
> >  ld.lld: error: duplicate symbol: init_module
> >  >>> defined in net/netfilter/nfnetlink_log.lto.o
> >  >>> defined in net/netfilter/nfnetlink_log.o
> >  ld.lld: error: duplicate symbol: vli_from_be64
> >  >>> defined in crypto/ecc.lto.o
> >  >>> defined in crypto/ecc.o
> >  ld.lld: error: duplicate symbol: __mod_of__plldig_clk_id_device_table
> >  >>> defined in drivers/clk/clk-plldig.lto.o
> >  >>> defined in drivers/clk/clk-plldig.o
>
> A small update here: I see this behavior with every single module
> build, including 'tinyconfig' with one module enabled, and 'defconfig'.

The .o file here is a thin archive of the bitcode files for the
module. We compile .lto.o from that before modpost, because we need an
ELF binary to process, and then reuse the .lto.o file when linking the
final module.

At no point should we link the .o file again, especially not with
.lto.o, because that would clearly cause every symbol to be
duplicated, so I'm not sure what goes wrong here. Here's the relevant
part of scripts/Makefile.modfinal:

ifdef CONFIG_LTO_CLANG
# With CONFIG_LTO_CLANG, reuse the object file we compiled for modpost to
# avoid a second slow LTO link
prelink-ext := .lto
...
$(modules): %.ko: %$(prelink-ext).o %.mod.o scripts/module.lds FORCE
        +$(call if_changed,ld_ko_o)

Sami
