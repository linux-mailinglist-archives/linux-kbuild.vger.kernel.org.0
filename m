Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157362B70C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 22:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgKQVRc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 16:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgKQVRc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 16:17:32 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51CFC0613CF
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 13:17:31 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id o24so25945906ljj.6
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 13:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I/hHF4xlcau8abUMMWWu9ZOPfLuX56SHUOKI4p/GLog=;
        b=FPqXJr9icDh9L7sI6ggEaWimg9DuZcX++8IlgUQAq4mXREd7/XhwpmygB9qKmqGvqN
         SgbZqbV8tybddAgk78HR7TYSHbwylUQzGkMaoaX8Un84MYCZ5QF3DXxAmnEV6pZf/g60
         tNyL40rr2dqucYJetfJpcOCm9LHFMSF1y9AnHiL/5Po5NzezA3haTP/heFqC2oAsbS3j
         D9vdsy5PKYnI45n5K1+qUG97MU0q4SQnq1oZnXo6MIQihRQn0QRF3t3+EtlG1QduJniW
         +cRsHvzXQ8D3t2PmcksPlXKrcPcLwOBxN/Hd8u2jOyRMLnLNeJ78n8ZtuqKZDUofrVoN
         dZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I/hHF4xlcau8abUMMWWu9ZOPfLuX56SHUOKI4p/GLog=;
        b=VDuMJ5jXrC2Gj/la2gv9SOyJTiqhMbOTLb3e24e6UauuG/3B28iMFf7NYsC8xMnbpp
         bnhyhrWzMYceegBuKHZXD62EHX+CLj3vBr7oL4TXQ7p2szgpWjx68vE9h4AGb3OcKrNG
         lOxVrbH7a6zbv6JckfOz9xOmvy6qABz/zQ6JA1BcYNtYxl6SnU4o2crykoxZRAG3ksdH
         KIxKJmyDZ+SQPqoT4XPGjcpOIEss/crrcktwMUl2YlAXQHvAuQxHonbmHm4lSEWC+tqD
         N4aS4H9RcTI1ZtjsDRDsi3vb5zm1KXFpRMaQZkeoM/n7O1DSRwnOkPAruAjPFMVJl7QU
         4ngA==
X-Gm-Message-State: AOAM532u/C1TOVU/TsE9gGqJInSZpPTrDuRPq/HPtHvGM8xLfPs0BbTP
        fHK3CQHDaA7u0HjLHdICmZzyT1+gMffazPfqO8V/MQ==
X-Google-Smtp-Source: ABdhPJwwYzjaEnUocguKy9WJ8dtjA20kmRVQYAgUyPCCmjjYxTPilv86jTYXLmDvrReOEOTbXTIGkyUopqHL2PSdFCc=
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr2899299ljh.286.1605647850397;
 Tue, 17 Nov 2020 13:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20201112183839.1009297-1-natechancellor@gmail.com>
In-Reply-To: <20201112183839.1009297-1-natechancellor@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 22:17:19 +0100
Message-ID: <CACRpkda_u7wVr6E97WaxPC6h5SGTrmGWYBrph_0oLUAFgYnYMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Jian Cai <jiancai@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 12, 2020 at 7:41 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
> script and options") added '-z norelro' to the arm64 Makefile when
> CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
> defaults to '-z relro' but the kernel does not use program headers or
> adhere to the section layout that is required for RELRO to work.
>
> Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
> an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
> unset.
>
> As it turns out, ARM experiences the same error after CONFIG_KASAN was
> implemented, meaning that '-z norelro' needs to be added to that
> Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):
>
> $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
> ld.lld: error: section: .exit.data is not contiguous with other relro sections
>
> To avoid playing whack-a-mole with different architectures over time,
> hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> because '-z norelro' is the default for it.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1189
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

OK makes sense, FWIW:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
