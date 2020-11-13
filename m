Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFEB2B15C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Nov 2020 07:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgKMGGU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Nov 2020 01:06:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:57498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbgKMGGU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Nov 2020 01:06:20 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B89AB22201;
        Fri, 13 Nov 2020 06:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605247579;
        bh=5zkiwx4d0DuFFhv97YB0hnk+AeMXazz8WynYQMIwirQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FGg0DF+nIlkyFf8NhXl8jes6nU7IxqbztQgj8eEe6Nua/K+HSdbgucfYdtpu8b8Rv
         LgbAWJpdLdg91vmAkoY83Yj1muQxYfwnd7nX4yNktZGzKsjSPyDtsqC7MseKhPI9n2
         VeTJGurn6i0uuDR6495e9+IUE03VTymSnCE/kUrg=
Received: by mail-oi1-f179.google.com with SMTP id d9so9298434oib.3;
        Thu, 12 Nov 2020 22:06:19 -0800 (PST)
X-Gm-Message-State: AOAM533scAFytMYtQZLB35gkqf7tIZv4w0+50Hh1Zot3ehzhSye/YkK3
        Mx7NmWNWbPbbN1+DPPGKM83nKbt2JIEt6eo9QXg=
X-Google-Smtp-Source: ABdhPJyLj3/JD15MQYXh3Z2y15k35C5E7/4Y59yOolNEILUpCPY1HJQBptDWUw5mbneU0eTVf2dP1zJfXLqnigSYVs8=
X-Received: by 2002:aca:d583:: with SMTP id m125mr396725oig.47.1605247578865;
 Thu, 12 Nov 2020 22:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20201112183839.1009297-1-natechancellor@gmail.com>
 <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com> <20201113005347.GA3625030@ubuntu-m3-large-x86>
In-Reply-To: <20201113005347.GA3625030@ubuntu-m3-large-x86>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 13 Nov 2020 07:06:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHYG7d-BDtbZ-4+wGdHb0rxXiMLuSvSMW_JFHgp3G6kTg@mail.gmail.com>
Message-ID: <CAMj1kXHYG7d-BDtbZ-4+wGdHb0rxXiMLuSvSMW_JFHgp3G6kTg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 13 Nov 2020 at 01:53, Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Nov 12, 2020 at 04:44:46PM -0800, Nick Desaulniers wrote:
> > On Thu, Nov 12, 2020 at 10:41 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
> > > script and options") added '-z norelro' to the arm64 Makefile when
> > > CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
> > > defaults to '-z relro' but the kernel does not use program headers or
> > > adhere to the section layout that is required for RELRO to work.
> > >
> > > Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> > > CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
> > > an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
> > > unset.
> > >
> > > As it turns out, ARM experiences the same error after CONFIG_KASAN was
> > > implemented, meaning that '-z norelro' needs to be added to that
> > > Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):
> > >
> > > $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
> > > ld.lld: error: section: .exit.data is not contiguous with other relro sections
> > >
> > > To avoid playing whack-a-mole with different architectures over time,
> > > hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> > > because '-z norelro' is the default for it.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1189
> > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > Why not add it additionally to KBUILD_LDFLAGS_MODULE a la
> > `--build-id=sha1` a few lines above? (or `LDFLAGS_MODULE`, but that
> > looks unused?)  We probably don't want this for modules either.  In
> > that case, you could add -z norelo to the two existing lines with
> > `--build-id=sha1` above?
>
> Yes, I can do that. I will send a v2 along tomorrow morning to let
> others comment.
>

Modules are partially linked objects, so there is no point in passing
-z options for them.
