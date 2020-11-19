Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A505C2B9B90
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Nov 2020 20:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgKSTd7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Nov 2020 14:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgKSTd6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Nov 2020 14:33:58 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FE7C0613CF;
        Thu, 19 Nov 2020 11:33:58 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id 63so3465218qva.7;
        Thu, 19 Nov 2020 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gziYjKkMg0T3fda4PLPmPFitx5z4Cip2iKsXyoEML/s=;
        b=fEILrQsuqmm7C3jki72PWAuLo9yXZKuY+NTeUlUHEiKXyiEUvI4TuXBuiFrIoUzwf2
         rJ7gq8g1lcO/jKDCjcRC9J9ajbXNVLZysRxXzX4Vr+Fce4d2oMTpsJsB5oh7/RODJt4r
         GmdRFWZUCw8LJMeTSnk6JSsz0sJoLZqnNfRnSPjYyswiTd7oFb4rdTA9mH+I99wgymmV
         9PRxhvYjQQ/313sey0FkoXOqTQwWb/nxGUR1C6BGwG1fakx7JNIsPKS4Q27J2go1RdqO
         M3Xsa3dtr3AVeMvUgNfFlQUjVSUYgYjaTQ7GYGw5sA4oGzZ0sZCrU1ihwpn2LYvKtLaa
         Eg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gziYjKkMg0T3fda4PLPmPFitx5z4Cip2iKsXyoEML/s=;
        b=pJjJnEaIWunU3SFMoD7Lv1gqDvCANlpiMdapSNr9V/TAuoeWV/HVAqIHZs07jcSnph
         nWflcbGf+oGQ9Ig8WMXKIsy50324aBqUc3rFKgYwFm/iwDRm8sPR3pb4FEXvtobPv2lU
         3+1anK8WKDYAwYVFw0xpl9yp4eMwGwXl2znCHp97d0HBk66ISLG0nNmg6qLebYmmxNP1
         0koVyFxAkHqd5fNLGgzqHC2uFbDpB2+2ikA2Fc4WyxAv5fXEPtO5CvWcm2ccUb921M5u
         AbdFGyMWxzQWXLO3h0xJnO/MAzsVZFE4UcOwi8gKxz0wBaAu4V7F15BsypIc89baNrmR
         wwRQ==
X-Gm-Message-State: AOAM530qWBZEC9WVWoIeuS+H3j18ch+nydfcd6GOYU3O66ILuyLjVxgV
        yEgvBdMyKgctimtOBqf9fl4=
X-Google-Smtp-Source: ABdhPJwdaaT7gNq9Yefd1mBZgnLtZ2leAAeBVUx/ottu+ecz+LQC62c5CaqIYapYEnqyOJQIKe6fqQ==
X-Received: by 2002:ad4:4514:: with SMTP id k20mr12374804qvu.18.1605814437722;
        Thu, 19 Nov 2020 11:33:57 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id p48sm570704qtp.67.2020.11.19.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:33:56 -0800 (PST)
Date:   Thu, 19 Nov 2020 12:33:55 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
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
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
Message-ID: <20201119193355.GA3235069@ubuntu-m3-large-x86>
References: <20201112183839.1009297-1-natechancellor@gmail.com>
 <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com>
 <20201113005347.GA3625030@ubuntu-m3-large-x86>
 <CAMj1kXHYG7d-BDtbZ-4+wGdHb0rxXiMLuSvSMW_JFHgp3G6kTg@mail.gmail.com>
 <CAKwvOdk1ir=D---9xVAxcErJWSGVxK1Mv6AC=TK3RVwNdcvFjw@mail.gmail.com>
 <CAKwvOdnauFdUgS0Ww=O-PHrXWhXQEEYd806NUcy8_7MOG0Uo2g@mail.gmail.com>
 <CAMj1kXFrm+M6vN+e8KqBDHxMxSPTaH_hWT2fg+Z3iY3hV4Hcsw@mail.gmail.com>
 <CAKwvOdnNzd6wZoDJEgwjnEuTusU8jUcsLDiYoKipkcTubQ+t5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnNzd6wZoDJEgwjnEuTusU8jUcsLDiYoKipkcTubQ+t5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 18, 2020 at 03:24:04PM -0800, Nick Desaulniers wrote:
> On Wed, Nov 18, 2020 at 3:07 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 19 Nov 2020 at 00:05, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > > > > > > To avoid playing whack-a-mole with different architectures over time,
> > > > > > > > hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> > > > > > > > because '-z norelro' is the default for it.
> > >
> > > Fangrui pointed out off list that this might need an ld-option wrapper
> > > for older versions of GNU binutils.  Dan was showing me some build
> > > logs today, and I thought I spotted such warnings about `-z norelro
> > > will be ignored`.
> >
> > Does ld-option catch options that cause warnings but no errors?
> 
> $ ld.bfd -z foo /dev/null
> ld.bfd: warning: -z foo ignored
> ld.bfd: warning: cannot find entry symbol _start; not setting start address
> ➜ echo $?
> 0
> 
> Probably not. Can be a version check then (yuck); next is to find when
> ld.bfd supported `-z norelro`.
> 
> commit 8c37241be3b1 in binutils looks like it.
> Date:   Tue May 11 17:08:38 2004 +0000
> 
> which looks like either
> 2004-05-17 19:46:23 +0000  (tag: binutils-2_15)
> or
> 2005-05-02 22:04:18 +0000  (tag: binutils-2_16)
> 
> So I think that would be fine then, since the kernel only supports 2.23+.
> 
> Though maybe it's
> commit 5fd104addfddb68844fb8df67be832ee98ad9888
>     Emit a warning when -z relro is unsupported
> 
>     ld silently accepts -z relro and -z norelro for targets that lack the
>     necessary GNU_RELRO support.  This patch makes those targets emit a
>     warning instead, and adds testsuite infrastructure to detect when
>     relro is unsupported.
> 
> So maybe then alpha and xtensa are getting new warnings (IIUC).  If
> that's the case, then we might not be able to set `-z norelro`
> globally, and instead have to play whack a mole per architecture.

Sure, I can just submit the arch/arm patch that I had before this for
now and we can always revisit something like this later, if you feel it
is best.

Cheers,
Nathan
