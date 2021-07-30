Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2D83DC0A3
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 23:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhG3V67 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 17:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbhG3V6x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 17:58:53 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1480EC061765
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:58:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f18so20639862lfu.10
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 14:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8/otlIVLRCwvxqaT7/wbzC/cVJd2N14X3gcUk8hSgA=;
        b=HZJzYyoWQwt26c3g1n6pcTy3z322z6mrNVycNvQ/UW57gfm0rJdddIduXXvVXFZ2JC
         Dw8Nnw/2sQzo4LepQycbSI7PZ6YEAk4C1nuT8dsa2RZ71fgb6YqflB5Vy5BaLIa7Rsy1
         fd4IJfHPj3+e1B3dJ85G7CwUPbnDXJLuht+mSghu/NfmCuLttGqo4aOaSIDr12iAhajJ
         D/ff0gKVGCc1MDo9WgSEZ6hcF17X8GFsh55Ohunam/LxhSdeWEsqWd3CD0+91actJqDI
         WEaLckc0XlYH1iMVKkijGGbIUY6dL+X5Iy5+6eNHry6cjWiX7bpjfyItDxAlvJ/1Wau+
         dFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8/otlIVLRCwvxqaT7/wbzC/cVJd2N14X3gcUk8hSgA=;
        b=azbs2MDheMjNfoHkLAbNY2t4DAVW/5GIAarKUubKC70M+rPPyFl3QmGilgXgAlSYS5
         ajlxkNuEfSnYKn+bSCsf5dFZ6nxJjj2B3Iy7VjEU7adKcsaZadcitrzUG7vRev75eMqs
         KAMhVS2nZBVd9YHIFKrtLJ0EKAJ7/f20XKzqIt+1oQmF76GYUjzDdhIJz9hPzzUdyDpy
         pnCt/+lkn4Q9xHF80u17hG8bhc4qqV8QRYIA+yz0dwfn7V6XdJtimG9zrGS1a/CoK8u8
         ItBRgSCxA8AwQSB+OZUX49xRiKlDFhBWkdHOhAqu4yClFGRprvsbBdNH+CxbggCFs/MG
         egHQ==
X-Gm-Message-State: AOAM530/ta0ck6Ye6s3m31efpkVpByXwZrkRZAvtWGzYN4IE1e7fO1tK
        L3JMcGf/tTW1xnYtYPILcjbJkjAZflqh3kjTgVNIQg==
X-Google-Smtp-Source: ABdhPJzgd5uCAKnhB8M++MAkN1bTpZ1d/LvNlWKABLiMPhkZep2d6h6EeAEEPbxXlVGdEIP6TlwDE+YoYgDgu6PL8Kc=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr3490307lfi.543.1627682326096;
 Fri, 30 Jul 2021 14:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201701.3146910-1-ndesaulniers@google.com>
 <20210730201701.3146910-2-ndesaulniers@google.com> <CAHk-=wgh_gk17OoVjXSiuT+7=oYDUKjYGWibd+tCfQRpYJ7cGA@mail.gmail.com>
In-Reply-To: <CAHk-=wgh_gk17OoVjXSiuT+7=oYDUKjYGWibd+tCfQRpYJ7cGA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 30 Jul 2021 14:58:35 -0700
Message-ID: <CAKwvOdmFPLAv_FucACe9LQC49gm2WCgXUBKkhWy4pONt29njWQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Makefile: infer --target from ARCH for CC=clang
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 30, 2021 at 2:54 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Jul 30, 2021 at 1:17 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > +ifeq ($(SRCARCH),arm)
> > +CLANG_FLAGS    += --target=arm-linux-gnueabi
> ..,.
>
> Ugh.
>
> A wise man once said: "All problems in computer science can be solved
> with another level of indirection".
>
> Just do it like this:
>
>    CLANG_TARGET_FLAGS_arm = arm-linux-gnueabi
>    CLANG_TARGET_FLAGS_hexagon = hexagon-linux-gnu
>    ..
>    CLANG_TARGET_FLAGS = $(CLANG_TARGET_FLAGS_$(ARCH))
>
> Which is a lot denser and simpler.
>
> And then the only if-statement can be something along the lines of
>
>    ifeq ($(CLANG_TARGET_FLAGS),)
>    $(error Specify clang target flags)
>    else
>    CLANG_FLAGS    += --target=$(CLANG_TARGET_FLAGS)
>    endif

D'oh, just sent v5 before seeing this. SGTM will work on v6.

>
> Plus add *random handwaving* about all the details for CROSS_COMPILE
> and friends.
>
>             Linus



-- 
Thanks,
~Nick Desaulniers
