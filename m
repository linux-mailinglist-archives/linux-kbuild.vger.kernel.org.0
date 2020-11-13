Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412212B248D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Nov 2020 20:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgKMTe0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Nov 2020 14:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725967AbgKMTeZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Nov 2020 14:34:25 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B1EC0617A6
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2020 11:34:24 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id b3so5001777pls.11
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Nov 2020 11:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z8F0h3EiXSYH2EwQ00yhxQHEYYtz5zW5mBasLaONkpU=;
        b=P6HAc57qE2Y5UcbYBoRa5r/4fC17b0CPIYGfj09rjoC4y+H+fAssvRyYyO+LgbOh4k
         0Avtb8vbC2gKyR8qI/tRiojazj31g/0UjY/wR/h1q1SRtRo5UfFWU8QNqjSzcDtOFMc1
         YvgGbbQgMs/h1aqB09iLPlZAjftBRLiyiyivj8rN6vkaGIel6wcEPX0G7g2k5SA1Vqw1
         8EQTImjwSSiZKrdYvcvFJ2sPkDrpRJd0ndDLysiqRYfSTDSbDBsm94dGVXlM/UDfdwaX
         GzV+fgDxCX3U+OubSQkCQ44eJr2p7G0vRobS9xQP47oG7PmbwY4Bo09RNStd63bzeZBt
         DBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z8F0h3EiXSYH2EwQ00yhxQHEYYtz5zW5mBasLaONkpU=;
        b=jTAEutyFkKv6YaJip5hvmUaHIuyerwqwPTwIxw9tbZog6fo4j0YheRZsp2rmCDJ8gn
         dXBPwSzh8LD7NvpnDN0rttPsxWGmmLNbwS9d5z181TI6aoO5qKTe5UGKK08SAYGe+sEq
         jV84GF+g5RrPK0p35QBhDL5Y651R+iBDQEbzeA2WCMAkQI9a8OS1y1hRad4hMy7mX9bA
         K61iUZYlpXk2QJarlXAM/ErbsCyPZg0bUjFe6v7NBrfqjxGYT25dS8uwGPNWllhgMj7P
         SNNVhoHFhTED0MiZVxAVnWoeL0hM+x//jhH+XVrNxzyxdvUBegT9CpuXtvONtp7kHTgU
         8EzA==
X-Gm-Message-State: AOAM531bcIRzyb1jz6pMHctLPbVNQa1ivecAvIhuNCiF7C9tXdCBThRN
        CExzNDhLgQnjqGoIcE+ebRMw8qRGdX6ybRp4+AgwsQ==
X-Google-Smtp-Source: ABdhPJyhopxb7RfHnNVf8DNmtk8myF/2H+M5fzPOJVrVSM9HWXnDlBhQ6V385hHHAXP1h8pNPPVnryqLNySs22r4GZE=
X-Received: by 2002:a17:902:760c:b029:d6:efa5:4cdd with SMTP id
 k12-20020a170902760cb02900d6efa54cddmr3344130pll.56.1605296063135; Fri, 13
 Nov 2020 11:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20201112183839.1009297-1-natechancellor@gmail.com>
 <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com>
 <20201113005347.GA3625030@ubuntu-m3-large-x86> <CAMj1kXHYG7d-BDtbZ-4+wGdHb0rxXiMLuSvSMW_JFHgp3G6kTg@mail.gmail.com>
In-Reply-To: <CAMj1kXHYG7d-BDtbZ-4+wGdHb0rxXiMLuSvSMW_JFHgp3G6kTg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 13 Nov 2020 11:34:11 -0800
Message-ID: <CAKwvOdk1ir=D---9xVAxcErJWSGVxK1Mv6AC=TK3RVwNdcvFjw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
To:     Ard Biesheuvel <ardb@kernel.org>
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 12, 2020 at 10:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 13 Nov 2020 at 01:53, Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Thu, Nov 12, 2020 at 04:44:46PM -0800, Nick Desaulniers wrote:
> > > On Thu, Nov 12, 2020 at 10:41 AM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > >
> > > > Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
> > > > script and options") added '-z norelro' to the arm64 Makefile when
> > > > CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
> > > > defaults to '-z relro' but the kernel does not use program headers or
> > > > adhere to the section layout that is required for RELRO to work.
> > > >
> > > > Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> > > > CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
> > > > an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
> > > > unset.
> > > >
> > > > As it turns out, ARM experiences the same error after CONFIG_KASAN was
> > > > implemented, meaning that '-z norelro' needs to be added to that
> > > > Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):
> > > >
> > > > $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
> > > > ld.lld: error: section: .exit.data is not contiguous with other relro sections
> > > >
> > > > To avoid playing whack-a-mole with different architectures over time,
> > > > hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> > > > because '-z norelro' is the default for it.
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1189
> > > > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > >
> > > Why not add it additionally to KBUILD_LDFLAGS_MODULE a la
> > > `--build-id=sha1` a few lines above? (or `LDFLAGS_MODULE`, but that
> > > looks unused?)  We probably don't want this for modules either.  In
> > > that case, you could add -z norelo to the two existing lines with
> > > `--build-id=sha1` above?
> >
> > Yes, I can do that. I will send a v2 along tomorrow morning to let
> > others comment.
> >
>
> Modules are partially linked objects, so there is no point in passing
> -z options for them.

Ok then.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

More work to be done to boot this config, but at least we can link
without error.
-- 
Thanks,
~Nick Desaulniers
