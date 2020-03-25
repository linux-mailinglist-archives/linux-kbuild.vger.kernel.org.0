Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD6D192057
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 06:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgCYFKn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 01:10:43 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23447 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgCYFKn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 01:10:43 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 02P5ABfc011337;
        Wed, 25 Mar 2020 14:10:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 02P5ABfc011337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585113012;
        bh=goHEK+Svl1j1CHZ8RGvjblzdAWdDcWxFnIuljEdud0o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DnT5KzDtk1VZ4bX5jz1F2rsdqsISqFkA3UcZ8xsfhN86oNs2j/XPmD5P0cCs/JhpC
         4djo10x3J7e7VKuxZ6VaqctGHnlh7v8Y2a60Ld7EPdInTe+DqQnV3Yv2mMRbEtWync
         MiWlzZhvtXqwbjoutaboaVOvFnOMo0MJcs+5uYk6RNu52LFYtiOci3i1kOmUu1RoBi
         xhqivkrrBXMFOs8hfcQ/k+Do1CGoUI92UhBVNthIcvYQO4wcMswpJWLXGNNqUdh7Tw
         n7tev83ZNX9rklVlt+woYh25RkzUKyFRAAw9ucZjUiaVa3CirJ/T2AZaRCO80gKTwU
         bP6ZfZcCxvw5g==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id u11so785408vsg.2;
        Tue, 24 Mar 2020 22:10:11 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2vNbc2TrzjPxjgBIKbjx7jdeRQw5e6nOYp13rqZwpbzX8EPZmU
        sPc59FID1rTdNjijqL5feN1mlNAWFqqvWJEvY4M=
X-Google-Smtp-Source: ADFU+vu+bM6M5+X0alIJHo1ALDGfE82bX+MEHXukXjfTCtMpyx9j4+KKQCB6mj8BRZ3ztAMCXwbRLo3j/oOEZhFBzJo=
X-Received: by 2002:a67:2d55:: with SMTP id t82mr1251970vst.215.1585113010953;
 Tue, 24 Mar 2020 22:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200325045940.GA24974@gmail.com>
In-Reply-To: <20200325045940.GA24974@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Mar 2020 14:09:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
Message-ID: <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Peter Zijlstra <a.p.zijlstra@chello.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ingo,

On Wed, Mar 25, 2020 at 1:59 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > This series of cleanups was prompted by Linus:
> > https://lkml.org/lkml/2020/3/12/726
> >
> > First, this series drop always-on CONFIG_AS_* options.
> > Some of those options were introduced in old days.
> > For example, the check for CONFIG_AS_CFI dates back to 2006.
> >
> > We raise the minimal tool versions from time to time.
> > Currently, we require binutils 2.21
> > (and we plan to bump it to 2.23 for v5.7-rc1).
> >
> > After cleaning away the old checks,
> > as-instr calls are moved to Kconfig from Makefiles.
> > (patch 11)
> >
> > This allows more Kconfig / Makefile cleanups.
> > Patch 12 is complex, but I double-checked it does the equivalent.
> >
> > Patch 14 bumps the binutils version to 2.23,
> > and patch 15 removes more CONFIG_AS_* options.
> >
> > I folded all relevanet patches into this series,
> > as suggested by Jason A. Donenfeld.
> >
> > If x86 maintainers take care of this series, that's good.
> >
> > If it is OK to queue this up to Kbuild tree,
> > I will send a pull request to Linus.
> >
> > Thank you.
>
> LGTM. I've got these four from Jason A. Donenfeld queued up in
> tip:WIP.x86/asm:
>
>  bd5b1283e41c: ("crypto: Curve25519 - do not pollute dispatcher based on assembler")
>  829f32d78588: ("crypto: X86 - rework configuration, based on Kconfig")
>  95ef9f80ed63: ("x86/build: Probe assembler from Kconfig instead of Kbuild")
>  1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
>
> I suppose these might interact (maybe even conflict), and are topically
> related.
>
> Would you like to pull these into the kbuild tree? You can find them in:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/asm
>
> Thanks,
>
>         Ingo


I did not know that these had already landed in tip tree.

They are immature version.
(In fact CONFIG_AS_CFI and AS_ADX are false-negative
if GCC that defaults to 32-bit is used.)

Can you simply discard the WIP.x86/asm branch,
and only reapply
1651e700664b: ("x86: Fix bitops.h warning with a moved cast")

?


-- 
Best Regards
Masahiro Yamada
