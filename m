Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B292B138C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Nov 2020 01:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgKMAyE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Nov 2020 19:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbgKMAyD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Nov 2020 19:54:03 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06885C0613D1;
        Thu, 12 Nov 2020 16:53:51 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id n132so7462968qke.1;
        Thu, 12 Nov 2020 16:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yh/YuTw0y4KR1MgkgIBehu19vz49jA8SsJy90VDwqGU=;
        b=J5hJ054G32wzCXh7R5D/WPjTqiomiHjOOgzNffvkR2KB9Gxxp1mCIg1Bpyh3ODjPtw
         fHM53tdVC7fJPJck2D2zbXqvZHDPltV/mUJYRTltz4towedQTSvpxMmV2o8rg8DHyX+K
         kCCNZvfbX9K+1R2sZCj1LbqarVu/LWF5m1ImklDLwEvTLfgopHlQz8ZE5PAwW3BewItc
         QLsYyt8JOVghe2br+L9VhWXFkCHaqs5jiVN9sRdz5HK1AVKkY0uFEz5asEE2z6uU245+
         GHr4nYRS4k1fYK6afm4g+wRg0RtGYcS/tzD4BXLYCCB/S3clmd7s74O1dhvUFxgc9p5g
         6qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yh/YuTw0y4KR1MgkgIBehu19vz49jA8SsJy90VDwqGU=;
        b=q2/m+Bjv2eiks9fcuOvFNBtoaM5M9ZAWA3tJ2GdEPTTvSYsoyV5Ymdlw5hWFWcytd0
         qw3Oi1/puhUtjYd1CiMbHKFAnHzMd1DDj2kumRZmyABh5JC7drCdEqrcYGSseeAUnYrZ
         u4w50BA9peu7J7q7QfomYzx9/hsdhwpPyUyXoVMLP9W8Odl0uT+3KRAA7Xmb93k8bk4m
         jeRBKTmdaj+zCyIiNwk+gp2w4PKLij7D6G5+HOJp2TUYB6FIYGcPGRQ+aUcz54ha9TPX
         ijTkiE4JQw/gJ9tk059lMXFXMqZbZhLDj//M+RwUJbflCp88w6UJpTzj7F4+XCyxGZKk
         0ybA==
X-Gm-Message-State: AOAM5304t2eYtbU7/WDqxCBMfIGb8p3XPc7ihUoNLKr5T/1h0QiZ794X
        EgqefTtNQNdizrlUjAocOic=
X-Google-Smtp-Source: ABdhPJxI6cxHqXTnL8iNUPyKAT3DdO12ers/lEE6XssOLoVGxQGUFwOgjoS54/qkoRdbXCzDQgS0OA==
X-Received: by 2002:a37:b985:: with SMTP id j127mr2629060qkf.282.1605228830079;
        Thu, 12 Nov 2020 16:53:50 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id r190sm5941546qkf.101.2020.11.12.16.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 16:53:49 -0800 (PST)
Date:   Thu, 12 Nov 2020 17:53:47 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
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
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
Message-ID: <20201113005347.GA3625030@ubuntu-m3-large-x86>
References: <20201112183839.1009297-1-natechancellor@gmail.com>
 <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 12, 2020 at 04:44:46PM -0800, Nick Desaulniers wrote:
> On Thu, Nov 12, 2020 at 10:41 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
> > script and options") added '-z norelro' to the arm64 Makefile when
> > CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
> > defaults to '-z relro' but the kernel does not use program headers or
> > adhere to the section layout that is required for RELRO to work.
> >
> > Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> > CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
> > an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
> > unset.
> >
> > As it turns out, ARM experiences the same error after CONFIG_KASAN was
> > implemented, meaning that '-z norelro' needs to be added to that
> > Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):
> >
> > $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
> > ld.lld: error: section: .exit.data is not contiguous with other relro sections
> >
> > To avoid playing whack-a-mole with different architectures over time,
> > hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> > because '-z norelro' is the default for it.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1189
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Why not add it additionally to KBUILD_LDFLAGS_MODULE a la
> `--build-id=sha1` a few lines above? (or `LDFLAGS_MODULE`, but that
> looks unused?)  We probably don't want this for modules either.  In
> that case, you could add -z norelo to the two existing lines with
> `--build-id=sha1` above?

Yes, I can do that. I will send a v2 along tomorrow morning to let
others comment.

Cheers,
Nathan
