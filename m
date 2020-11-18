Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB8A2B8858
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Nov 2020 00:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgKRXYS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Nov 2020 18:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgKRXYS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Nov 2020 18:24:18 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88E8C0613D4
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2020 15:24:16 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id q28so2460775pgk.1
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2020 15:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fZb71qCZpbdlpuwjdIAT2vB+YWJhGNyA/NN+MDd17nY=;
        b=rKi7CCd0zuW2lqT7kWv0CJPzNJwftE8rgm/Sy31Hcx2XVCDLRzDG7GOQ/lU9xu4JIz
         xdNKeYXFQ0y8vM7VRezlVL7MRQVZZvQVWDQnM7LUZH7qgXLUWp3j+a+4G3RzBJDZBWzN
         do8vnvNSvg0/WtsrTbuipHyyipbcu+XrIqyNy9+hfIr2RSscR3r3rcv4MG/h8aFRH71k
         4vY6gOpaT+ZwBJtEBpdTmoz9r+bHsNcQRlpaaypb1ZvB+GvzJ5KqM/rwtls+eMAjVdYv
         GHJqrGTsfUgWZEr49PjNo9ayYe5xZye/n047PW/lsMwXI3orUyszOXBwoeUfnRHJOFBY
         5ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fZb71qCZpbdlpuwjdIAT2vB+YWJhGNyA/NN+MDd17nY=;
        b=R3yeXXA4dVldihGi4pms9He986ksKS+FfwceuFq73mihx3zwSaYtAYZ8o6LmDPVNhE
         s7B1txhhYmW52Ek4pSLV3exXD7ItH5T+R7BRdAxFhsXM1Jwn8gaZkbZePECaziaHxqdw
         MYfDtL7aXbyj9A0e+X2yuviPPrToXgXTkPwgvXkoP/ULihhIMUKfbL6cWgRS3UStVnj4
         10dh84HjbkNgoljGrarv4KX/G5U9j8wOauGDz4Op074SrU+9mtVUuY43SZ1QvaxbVPoN
         xm3+cPKtYcBjDeDepRzvP71UoFY+sNWXrmwGj7C+J1UwOQMClOwrNO5pwF4FStaxdTbk
         zKRg==
X-Gm-Message-State: AOAM532R1m6eGmhr4XyMOzvPiGtl0Ja/RAjyBYMsG9iI+m5XJGulODey
        8DxRmTrRYvQNaWZJZj3ZhQZQml0A8nSDXzP5vcR18Q==
X-Google-Smtp-Source: ABdhPJxbZL/HsUjbNlyNlEybpabI+oOFCI9CwCKy/MKm6NpHpglk6oRA1MyUE6utTjPjbunO1oGfBt9cinGmT20Yv6s=
X-Received: by 2002:a17:90a:4881:: with SMTP id b1mr1364541pjh.32.1605741856285;
 Wed, 18 Nov 2020 15:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20201112183839.1009297-1-natechancellor@gmail.com>
 <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com>
 <20201113005347.GA3625030@ubuntu-m3-large-x86> <CAMj1kXHYG7d-BDtbZ-4+wGdHb0rxXiMLuSvSMW_JFHgp3G6kTg@mail.gmail.com>
 <CAKwvOdk1ir=D---9xVAxcErJWSGVxK1Mv6AC=TK3RVwNdcvFjw@mail.gmail.com>
 <CAKwvOdnauFdUgS0Ww=O-PHrXWhXQEEYd806NUcy8_7MOG0Uo2g@mail.gmail.com> <CAMj1kXFrm+M6vN+e8KqBDHxMxSPTaH_hWT2fg+Z3iY3hV4Hcsw@mail.gmail.com>
In-Reply-To: <CAMj1kXFrm+M6vN+e8KqBDHxMxSPTaH_hWT2fg+Z3iY3hV4Hcsw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 18 Nov 2020 15:24:04 -0800
Message-ID: <CAKwvOdnNzd6wZoDJEgwjnEuTusU8jUcsLDiYoKipkcTubQ+t5g@mail.gmail.com>
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Fangrui Song <maskray@google.com>,
        Dan Rue <dan.rue@linaro.org>, Mark Brown <broonie@kernel.org>,
        Alan Modra <amodra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 18, 2020 at 3:07 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 19 Nov 2020 at 00:05, Nick Desaulniers <ndesaulniers@google.com> =
wrote:
> >
> > > > > > > To avoid playing whack-a-mole with different architectures ov=
er time,
> > > > > > > hoist '-z norelro' into the main Makefile. This does not affe=
ct ld.bfd
> > > > > > > because '-z norelro' is the default for it.
> >
> > Fangrui pointed out off list that this might need an ld-option wrapper
> > for older versions of GNU binutils.  Dan was showing me some build
> > logs today, and I thought I spotted such warnings about `-z norelro
> > will be ignored`.
>
> Does ld-option catch options that cause warnings but no errors?

$ ld.bfd -z foo /dev/null
ld.bfd: warning: -z foo ignored
ld.bfd: warning: cannot find entry symbol _start; not setting start address
=E2=9E=9C echo $?
0

Probably not. Can be a version check then (yuck); next is to find when
ld.bfd supported `-z norelro`.

commit 8c37241be3b1 in binutils looks like it.
Date:   Tue May 11 17:08:38 2004 +0000

which looks like either
2004-05-17 19:46:23 +0000  (tag: binutils-2_15)
or
2005-05-02 22:04:18 +0000  (tag: binutils-2_16)

So I think that would be fine then, since the kernel only supports 2.23+.

Though maybe it's
commit 5fd104addfddb68844fb8df67be832ee98ad9888
    Emit a warning when -z relro is unsupported

    ld silently accepts -z relro and -z norelro for targets that lack the
    necessary GNU_RELRO support.  This patch makes those targets emit a
    warning instead, and adds testsuite infrastructure to detect when
    relro is unsupported.

So maybe then alpha and xtensa are getting new warnings (IIUC).  If
that's the case, then we might not be able to set `-z norelro`
globally, and instead have to play whack a mole per architecture.
--=20
Thanks,
~Nick Desaulniers
