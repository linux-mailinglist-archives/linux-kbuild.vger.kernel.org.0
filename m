Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC7B3E1B16
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 20:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241043AbhHESSG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 14:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbhHESSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 14:18:06 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB25C061765;
        Thu,  5 Aug 2021 11:17:52 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id f8so6063094ilr.4;
        Thu, 05 Aug 2021 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wrqyGrlzJbaQiQwV6UU8HEiTXlXj9XwABefl+sGFyRs=;
        b=Ban+ybOof8hxsRRxNPJ2VMCbfacPMCGVJ6mBT1wwqsf/SKwJL6ha3pHlVu5s4o1K+D
         ZjnJdB511f3l64hjTiG+TGj/S8mBo7lwqzy0C2qtmYawW+XIwckuWt2gUlpUravfo11M
         KwRYjYZK6ZbuMhmMDcpexL5nRo+02sh+6XdFHtZlr2/554olkE4M/2+Vhz8YIAKChRge
         7NBOIq+/giaX3VcA8ZWA1ss56KMpnhyszNCbqMvZbQk1TKrp93CVFmpXZcVvkGYK7kzh
         iLYFdqXwO86zEaCgUAzFKOFiLConEuxnf7ZJKXR9yIxdipY001SRlAwimravcGjyX2qT
         9hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wrqyGrlzJbaQiQwV6UU8HEiTXlXj9XwABefl+sGFyRs=;
        b=X+bTYRLYH9mHPGCSkGdj1cqL2f7s7tFwtK9r7oYEV0iVxH7sDiWoxbnnySGQJJWRys
         tMmbnBsMBtI0VcUf/CRnMILHUFx5aLzONQrDJE8prj+7vO1rbMmqC7/DHQkCJryhx2qV
         /mkF9FwXvqd4RY3U9MnI4tndGoTgcGD1Vs4Z9YIjdg5yGSeK0DUFiZr6ggrkR7gQjiox
         VsfiqDwoAqPXngdKtWwGi3BrLpzIuXOKYR2cdEMR7iQevipYMBvwQbb/MsfC+HRNIBT9
         QymftHfJKg21+ap4UAbWDF+3mMtXlZjPO75rOatsP6sYbVkocsGy3tPOzwJe1bfvZHEO
         V/xw==
X-Gm-Message-State: AOAM530sznEj1TJP5ML/V9Ha53psEPadgKTi5NoRls/eXG7zKI9mlJ6G
        T2MQCa2OH6laKJs5brHFTJiDlDfIPiAy91W+eM0=
X-Google-Smtp-Source: ABdhPJxk224epffKzdwfCMkaspSFRHJ6HJetar8YOaBxdFYNm/GLKKNPTw3O0uXNvKudsh4EH8kBwidEHDD2CPRBoow=
X-Received: by 2002:a92:b74d:: with SMTP id c13mr535113ilm.176.1628187470918;
 Thu, 05 Aug 2021 11:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com> <20210802183910.1802120-3-ndesaulniers@google.com>
In-Reply-To: <20210802183910.1802120-3-ndesaulniers@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 5 Aug 2021 20:17:40 +0200
Message-ID: <CANiq72ng4a1g8TDFWb652TNhch2NDrQsHkJyP5HrrkJREGg8jg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] Makefile: infer --target from ARCH for CC=clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
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

On Mon, Aug 2, 2021 at 8:39 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> We get constant feedback that the command line invocation of make is too
> long when compiling with LLVM. CROSS_COMPILE is helpful when a toolchain
> has a prefix of the target triple, or is an absolute path outside of
> $PATH.
>
> Since a Clang binary is generally multi-targeted, we can infer a given
> target from SRCARCH/ARCH.  If CROSS_COMPILE is not set, simply set
> --target= for CLANG_FLAGS, KBUILD_CFLAGS, and KBUILD_AFLAGS based on
> $SRCARCH.
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
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Acked-by: Arnd Bergmann <arnd@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
