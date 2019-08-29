Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD90A2890
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 23:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfH2VBz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Aug 2019 17:01:55 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38510 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfH2VBy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 17:01:54 -0400
Received: by mail-wm1-f68.google.com with SMTP id o184so5203970wme.3;
        Thu, 29 Aug 2019 14:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ZgMiCDsvAhR2S/cT0qUBSbvUO2xWHZnNLYMNHL1KOXk=;
        b=AJK6irA1DxOewMSTnbKuAtMbukG7rx19gj+03tFdraBsRCP6ZR3dYnscXmH9xWrGdo
         DBxudPb0vPEr8jKk4esm+jxwaLF+Wr4LDgnzhrbQbk3Y8AX706gPfackUAk6nJBW7vuA
         Ax3ig3ZWThvtTDeez3QmAvqh31ADc1EXdCIGMFfyV7QRFiY+d1lISeYXleBzn0NCgLla
         p8Ic3eMdvBBrpRpUF8ren1VCsb3L0hr+1eXYxXSlCMpZPAB5jOYVhOKvXq6zlQgl2xRN
         bocr5UfgcPxyMVR8w3I5IkIzwS8I35t5OHrEJ7ad0I3Qtg941oQkciajSVR5rzvg5taV
         ZL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ZgMiCDsvAhR2S/cT0qUBSbvUO2xWHZnNLYMNHL1KOXk=;
        b=C54uCwrOImX4PnspYp0JwepdrX7DfMpB0s5iL6SHW60GfCGsNVbVuZRQfq35G0PYgd
         elAbnTuKN4JGtlvosMicceaEWc5v6MiaA3GxCoVKq8hvPY4RThNBS+7j0xCuzZ9i2zCT
         EUWlVc2ec7T8SiEGqi5S5X4U4NtYaYvEuFFjH9kO8Dzqe9CvgSn+6Be7SH6p4TI+Dcw6
         NLetdSe1gd4yfMxCTlCgt4aB3mFEl59cG/LINpHXglYwrCV61cf95ONWIp4mvrEQfQ/v
         Eh1kOnbngceDZUlSMo5A0duXTsFqTWEgp1pyCvvCiFWSasm2OFtSqP9vKxPXiI4w0rgK
         YC6A==
X-Gm-Message-State: APjAAAXOO2R+qmglo54iMtsqRI8apNo2GqtqUUG24bwRk/dJqo7U0ESb
        x1q6n9znlfskGl3kd0DFwYq//Fcdp2OAoyoS8YnvWfC4
X-Google-Smtp-Source: APXvYqzKZdM5AEn2uLd407Bhnr3IsadVQVOu5I+UXxtON9ZXZy0KM50mJBMvOHH6uJ7J+gbgTB8b+B+7fxtDiMh5JQc=
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr2380971wmg.150.1567112512410;
 Thu, 29 Aug 2019 14:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190829181231.5920-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190829181231.5920-1-yamada.masahiro@socionext.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 29 Aug 2019 23:01:39 +0200
Message-ID: <CA+icZUX0WvZ9Kfvvkq2Xhgv=kEkmHi7bF8VSONKcXnJx28bKGg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: refactor scripts/Makefile.extrawarn
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 29, 2019 at 8:13 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Instead of the warning-[123] magic, let's accumulate compiler options
> to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> easier to understand what is going on in this file.
>
> This commit slightly changes the behavior, I think all of which are OK.
>
> [1] Currently, cc-option calls are needlessly evaluated. For example,
>       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
>     needs evaluating only when W=3, but it is actually evaluated for
>     W=1, W=2 as well. With this commit, only relevant cc-option calls
>     will be evaluated. This is a slight optimization.
>
> [2] Currently, unsupported level like W=4 is checked by:
>       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
>     This will no longer be checked, but I do not think it is a big
>     deal.
>
> [3] Currently, 4 Clang warnings (Winitializer-overrides, Wformat,
>     Wsign-compare, Wformat-zero-length) are shown by any of W=1, W=2,
>     and W=3. With this commit, they will be warned only by W=1. I
>     think this is a more correct behavior since each warning belongs
>     to only one group.
>
> For understanding this commit correctly:
>
> We have 3 warning groups, W=1, W=2, and W=3. You may think W=3 has a
> higher level than W=1, but they are actually independent. If you like,
> you can combine them like W=13. To enable all the warnings, you can
> pass W=123. This is shown by 'make help', but it is often missed
> unfortunately. Since we support W= combination, there should not exist
> intersection among the three groups. If we enable Winitializer-overrides
> for W=1, we do not need to for W=2 or W=3. This is why I believe the
> change [3] makes sense.
>
> The documentation says -Winitializer-overrides is enabled by default.
> (https://clang.llvm.org/docs/DiagnosticsReference.html#winitializer-overrides)
> We negate it by passing -Wno-initializer-overrides for the normal
> build, but we do not do that for W=1. This means, W=1 effectively
> enables -Winitializer-overrides by the clang's default. The same for
> the other three. I wonder if this logic needs detailed commenting,
> but I do not want to be bothered any more. I added comments.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Changes in v2:
>   - Added comments and more commit log
>
>  scripts/Makefile.extrawarn | 105 +++++++++++++++++++------------------
>  1 file changed, 54 insertions(+), 51 deletions(-)
>

Thanks for the v2.

I am impressed by the very informative commit-log.

But... I still miss relevant infos in the "kbuild-docs" aka in
<Documentation/kbuild/kbuild.rst file>

I also was not aware I can combine W=... settings like W=123 (W=132
and W=321 does the same I guess).
In my little world W=3 should include W=1 and W=2.
Such informations I would like to have in kbuild-docs.

BTW, I mixed up kbuild-system with kconfig-system as I normally get in
touch with the 2nd.

Renaming the kbuild-variable is up to you.
I am OK when you want to wait for Arnd's rework of extrawarn compiler options.
I did change it in one of my patches treewide.

- Sedat -
