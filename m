Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375C01EE667
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 16:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbgFDOOo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 10:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbgFDOOo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 10:14:44 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FC9C08C5C1
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 07:14:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b6so7519866ljj.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JFfRFTCW6FlgjlqwGn/P6j5CtXdNMxPx5d48a8cUyd4=;
        b=EEECY9X2ZdOdKHgdpzGf+DMwJvZiLd517zxt2dbS2nKm3skzGPqTgtp413UgMfvu0Z
         ySVazhwi/YFYlUV4XnFzNegdZNUnbuIoZjvesCvFjNLr65TFhoUJDtKunjSbLIdKe1Ij
         T9U0pl+DeA8gNiHYV54V1mtUWojw8ar7qhEqIKQJkpZOJbirv3Ko8C7M9ApwFuifCCyM
         2BCbFSH7yCa2YARYKYiQjagjZ6ntYCRHhZ+z6FtDWrarTmrlseFb6Ofe5PTMn80MgGMT
         w8bNH0WNfPllBGNPWsHRyTCLuuEd5VP4NkFuiuk4k8s1Iz/61glv2Kv2yiGh6FU/aHnF
         JmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JFfRFTCW6FlgjlqwGn/P6j5CtXdNMxPx5d48a8cUyd4=;
        b=QmcUp/Ab5AhyVMyfF+K8Ms5b/PolskHmfNbrCo3rp7273L5sx6liSqKckr65TPkfIN
         NaLlO2qai51PnI+uo+EK1R2F/tCBiqIg6n/BzDj2CLl39Toj4lxN6YYwypKCWlM1ifCU
         RndUHOtpNZV7ZB8BdkT0JKVVTvrJvUpr+OiRmj7oUc2RbBsfrbpjUnCiT3L/keLAGyBV
         TCNVrD8hYY3ip0gCARsCd5939kBQHRjyMeaAz+6HJl3UGodJBeZwnsXNHivuKYaK2shv
         58xRZ3GnAJOdqTiYrs0U65l7gCqbM+LX7WZ52V7JGw6O+Cv1Pb+raAkiQIZbfdOrnlu9
         FNLA==
X-Gm-Message-State: AOAM531yJ3UfYTHW2mzCn6vyX2GwEWI9q9e/GHwBz26w/Ee5l/7KRiJ8
        iFKrH4rNM6rBA6ycyzOcoW3NclMZyESiFE3SJJzOlQ==
X-Google-Smtp-Source: ABdhPJwh9Avfez2jE0mRwOtdOdTV4d94V9o8AmvMHNcT4N8KwBQZsul+bYwmwvBngke6YqzEcWV2C1L9uJeApYHNb1k=
X-Received: by 2002:a2e:541e:: with SMTP id i30mr2143909ljb.156.1591280081782;
 Thu, 04 Jun 2020 07:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200604134957.505389-1-alex.popov@linux.com> <20200604134957.505389-6-alex.popov@linux.com>
 <20200604135806.GA3170@willie-the-truck>
In-Reply-To: <20200604135806.GA3170@willie-the-truck>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 4 Jun 2020 16:14:15 +0200
Message-ID: <CAG48ez0H_+EBd1wekk2oddSzLsgzincyZb_dB+s5atudB23YyA@mail.gmail.com>
Subject: Re: [PATCH 5/5] gcc-plugins/stackleak: Don't instrument
 vgettimeofday.c in arm64 VDSO
To:     Will Deacon <will@kernel.org>
Cc:     Alexander Popov <alex.popov@linux.com>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-kbuild@vger.kernel.org,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel list <linux-kernel@vger.kernel.org>, gcc@gcc.gnu.org,
        notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 4, 2020 at 3:58 PM Will Deacon <will@kernel.org> wrote:
> On Thu, Jun 04, 2020 at 04:49:57PM +0300, Alexander Popov wrote:
> > Don't try instrumenting functions in arch/arm64/kernel/vdso/vgettimeofday.c.
> > Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
> > is disabled.
> >
> > Signed-off-by: Alexander Popov <alex.popov@linux.com>
> > ---
> >  arch/arm64/kernel/vdso/Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> > index 3862cad2410c..9b84cafbd2da 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -32,7 +32,8 @@ UBSAN_SANITIZE                      := n
> >  OBJECT_FILES_NON_STANDARD    := y
> >  KCOV_INSTRUMENT                      := n
> >
> > -CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables
> > +CFLAGS_vgettimeofday.o = -O2 -mcmodel=tiny -fasynchronous-unwind-tables \
> > +             $(DISABLE_STACKLEAK_PLUGIN)
>
> I can pick this one up via arm64, thanks. Are there any other plugins we
> should be wary of? It looks like x86 filters out $(GCC_PLUGINS_CFLAGS)
> when building the vDSO.

Maybe at some point we should replace exclusions based on
GCC_PLUGINS_CFLAGS and KASAN_SANITIZE and UBSAN_SANITIZE and
OBJECT_FILES_NON_STANDARD and so on with something more generic...
something that says "this file will not be built into the normal
kernel, it contains code that runs in realmode / userspace / some
similarly weird context, and none of our instrumentation
infrastructure is available there"...
