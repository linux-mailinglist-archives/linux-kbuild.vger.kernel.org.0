Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCF52B8822
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Nov 2020 00:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgKRXG4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Nov 2020 18:06:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:60072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgKRXG4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Nov 2020 18:06:56 -0500
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5511246F5;
        Wed, 18 Nov 2020 23:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605740832;
        bh=ozEp87BLC35xPyBVmDNmQ6DkEOrGPDG+EAMmXG54HQ4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GyVmbiubYH+DB+w+71RKjxb6bgYshMPjCmqYnRga9x1cUqzxDer+7gQRWsW6gCe69
         8mzHYvJ8kjyuf0y5YpTNGejuVc1JiflOf2lFlJXG0CqH8vLKCUbATja58auHlmBkas
         4pPw3fiMcY8MbqZJo6iCOOW0bXOgGEyDtip+0hWs=
Received: by mail-oo1-f51.google.com with SMTP id h10so872318ooi.10;
        Wed, 18 Nov 2020 15:07:12 -0800 (PST)
X-Gm-Message-State: AOAM533jYvtGCfSEq5mbm87DhbZ4ZcQDDpMbsYGJq7XrNqjnTXI+CRwD
        zWC5jDyz8eXofgzTqCXzWKNWmO+wYcZ/LYZ9S1Y=
X-Google-Smtp-Source: ABdhPJzhjKMJ9WU+vCAYaN4v+U+O1urFrWl4AEKRcYEc6mJ61WIU8kTJrw45Rs9k7wUhrxisrmJIXMm3W8M1tsGJgL4=
X-Received: by 2002:a4a:844f:: with SMTP id m15mr8299508oog.41.1605740831825;
 Wed, 18 Nov 2020 15:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20201112183839.1009297-1-natechancellor@gmail.com>
 <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com>
 <20201113005347.GA3625030@ubuntu-m3-large-x86> <CAMj1kXHYG7d-BDtbZ-4+wGdHb0rxXiMLuSvSMW_JFHgp3G6kTg@mail.gmail.com>
 <CAKwvOdk1ir=D---9xVAxcErJWSGVxK1Mv6AC=TK3RVwNdcvFjw@mail.gmail.com> <CAKwvOdnauFdUgS0Ww=O-PHrXWhXQEEYd806NUcy8_7MOG0Uo2g@mail.gmail.com>
In-Reply-To: <CAKwvOdnauFdUgS0Ww=O-PHrXWhXQEEYd806NUcy8_7MOG0Uo2g@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 19 Nov 2020 00:06:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFrm+M6vN+e8KqBDHxMxSPTaH_hWT2fg+Z3iY3hV4Hcsw@mail.gmail.com>
Message-ID: <CAMj1kXFrm+M6vN+e8KqBDHxMxSPTaH_hWT2fg+Z3iY3hV4Hcsw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jian Cai <jiancai@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Fangrui Song <maskray@google.com>,
        Dan Rue <dan.rue@linaro.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 19 Nov 2020 at 00:05, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Fri, Nov 13, 2020 at 11:34 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Nov 12, 2020 at 10:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Fri, 13 Nov 2020 at 01:53, Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > >
> > > > On Thu, Nov 12, 2020 at 04:44:46PM -0800, Nick Desaulniers wrote:
> > > > > On Thu, Nov 12, 2020 at 10:41 AM Nathan Chancellor
> > > > > <natechancellor@gmail.com> wrote:
> > > > > >
> > > > > > Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
> > > > > > script and options") added '-z norelro' to the arm64 Makefile when
> > > > > > CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
> > > > > > defaults to '-z relro' but the kernel does not use program headers or
> > > > > > adhere to the section layout that is required for RELRO to work.
> > > > > >
> > > > > > Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> > > > > > CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
> > > > > > an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
> > > > > > unset.
> > > > > >
> > > > > > As it turns out, ARM experiences the same error after CONFIG_KASAN was
> > > > > > implemented, meaning that '-z norelro' needs to be added to that
> > > > > > Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):
> > > > > >
> > > > > > $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
> > > > > > ld.lld: error: section: .exit.data is not contiguous with other relro sections
> > > > > >
> > > > > > To avoid playing whack-a-mole with different architectures over time,
> > > > > > hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> > > > > > because '-z norelro' is the default for it.
>
> Fangrui pointed out off list that this might need an ld-option wrapper
> for older versions of GNU binutils.  Dan was showing me some build
> logs today, and I thought I spotted such warnings about `-z norelro
> will be ignored`.

Does ld-option catch options that cause warnings but no errors?
