Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67EA03BF6BA
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 10:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbhGHIL3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 04:11:29 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:42548 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhGHIL3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 04:11:29 -0400
Received: by mail-vs1-f48.google.com with SMTP id f7so1649411vsa.9;
        Thu, 08 Jul 2021 01:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/tIWe1nqJc31V9O67iN2UwPLB/e3npgUn13q7m69ss=;
        b=qGlLnBuCRgQDHIqNwEFfJXZTd4avWy8Q9VwCF4SondArB+UipHMxKeQj5R6Azg6je+
         sOALUfZF4Tq832YtnFhLQmKtqdRyDsQdXyDfFwAlMtcgNABrUfa0FTWAwtJw7pYh7+mJ
         4Fg74KP6kJyfMsnYeKJ+VSCiaUbpVqe/S8zBrgea+wB77Wz2VUyDeSnHpKNOfroCcL93
         XBb06O2TE06x0fQHgvu+MRzAql6pXqzAy6PIQpwk/93IfA3DznQfFFTfecfuOqLHWBes
         pYLUr9/jXAN1Hrb7TQN9jLUOX6zBv4liy2RTpVKzA5qleA10IzKf377D54n+MwU3ds+F
         KTpw==
X-Gm-Message-State: AOAM531O4VVb5sX5+9RQ5UenPr9XdiEaFJ6MPIq5LmEM3RYPELH2uuhR
        NEWzVLahFYKUgEOukwbICNn/sTe2Hld3Mukp3lA=
X-Google-Smtp-Source: ABdhPJyfgxP7oRWHTXJVgdG1tOCGPkZeuoNJZuk3WboobDdKopyitU1PXLZUDpWjlFzGxDsvvBGsTPy4zyldcksBuf0=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr1843618vsf.40.1625731726611;
 Thu, 08 Jul 2021 01:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com> <20210707224310.1403944-3-ndesaulniers@google.com>
In-Reply-To: <20210707224310.1403944-3-ndesaulniers@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Jul 2021 10:08:35 +0200
Message-ID: <CAMuHMdXuzb6PuujuCzm_FYq9ZeZeJxVZiYTGxdGeOTkZ6+W=+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick,

On Thu, Jul 8, 2021 at 1:12 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> We get constant feedback that the command line invocation of make is too
> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> target triple, or is an absolute path outside of $PATH, but it's mostly
> redundant for a given ARCH.
>
> If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> KBUILD_CFLAGS, and KBUILD_AFLAGS based on $ARCH.
>
> Previously, we'd cross compile via:
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linxu-gnu make LLVM=1 LLVM_IAS=1

Which didn't really work, I assume? (s/linxu/linux/)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
