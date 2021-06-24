Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2AA3B2B83
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jun 2021 11:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbhFXJj7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Jun 2021 05:39:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:54100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230299AbhFXJj6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Jun 2021 05:39:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D280F613F9;
        Thu, 24 Jun 2021 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624527459;
        bh=BRrvph5/+TcbIIRURC3dhBDaxnlbf7gMrs7xrGBEJ5w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FnSrWN6orV0xQa7fmIML1dsXu0jnPpIPj09dlFLuURTzgeGKH97NtY62R8v9Yhcg+
         0w2cOb2wCLY1tZHKlZYPvy/rp9W2hO8TbQzJH+76l/AFNzn7St8UitSLofkVEeIiHY
         MT3GwxHELojY6nwwsiUO/7+MHZ2QbE1QZvH8sTEa6G+EqVaky1zQKhZcnO/UVOB8fW
         CYmYfTno2USmq9Qp0QcUROWK0dVJOck/5nLQluIKohXkxhtTQiNZzQYmFBJ/4Goip7
         ycUYKR/YPAujtG4O5VOK7+i7MwyVJZw+0pEopxSkhrjApgIonSLjvHJiCrirKgAFVz
         7hiW8dkMfdccg==
Received: by mail-lj1-f176.google.com with SMTP id c16so6863121ljh.0;
        Thu, 24 Jun 2021 02:37:39 -0700 (PDT)
X-Gm-Message-State: AOAM532nlkPlPaszPyO9TiYkcgxCq7+cgzczgssjtboLSKhL2iTZa1uh
        opop6zx77hK6gafH2VkVfaM2BtoJzi0cq310f9U=
X-Google-Smtp-Source: ABdhPJyVcOFzmbVtHW+o38pky4hna/vG/wq+y+FLuO2HnlxlDrcFVXbY0J/1fCJDllWBF2eI1TbX51WBQjIIjGwAIn8=
X-Received: by 2002:a2e:a591:: with SMTP id m17mr3124092ljp.498.1624527458067;
 Thu, 24 Jun 2021 02:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <202106220959.QA9KOJ3Q-lkp@intel.com> <20210622094818.GA67867@shbuild999.sh.intel.com>
 <20210623085806.GA77080@shbuild999.sh.intel.com> <CAJF2gTQy=+K_UD8u9Ygk4v2my3=hQf+kXmhjm_FjEX678SYGYw@mail.gmail.com>
 <20210624085024.GB77080@shbuild999.sh.intel.com>
In-Reply-To: <20210624085024.GB77080@shbuild999.sh.intel.com>
From:   Guo Ren <guoren@kernel.org>
Date:   Thu, 24 Jun 2021 17:37:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR16xEz4OiteNx_zBTCX-JSAvZ1YR_=soJC0N9E15v1Vg@mail.gmail.com>
Message-ID: <CAJF2gTR16xEz4OiteNx_zBTCX-JSAvZ1YR_=soJC0N9E15v1Vg@mail.gmail.com>
Subject: Re: [linux-next:master 3665/11714] {standard input}:2644: Error:
 pcrel offset for branch to .LS0015 too far (0x3e)
To:     Feng Tang <feng.tang@intel.com>
Cc:     lkp <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        linux-csky@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andi Kleen <ak@linux.intel.com>,
        "?????????" <xianmiao_qu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 24, 2021 at 4:50 PM Feng Tang <feng.tang@intel.com> wrote:
>
> On Thu, Jun 24, 2021 at 04:06:51PM +0800, Guo Ren wrote:
> > On Wed, Jun 23, 2021 at 4:59 PM Feng Tang <feng.tang@intel.com> wrote:
> > >
> > > Add linux-csky list and originally cced people and replace the linux-mm
> > > with linux-kbuild list, which match the discussion better and avoid
> > > email noise for mm people.
> > >
> > > On Tue, Jun 22, 2021 at 05:48:18PM +0800, Tang, Feng wrote:
> > > > On Tue, Jun 22, 2021 at 09:49:05AM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > > head:   889bab4c367a0ef58208fd80fafa74bb6e2dca26
> > > > > commit: cf536e185869d4815d506e777bcca6edd9966a6e [3665/11714] Makefile: extend 32B aligned debug option to 64B aligned
> > > > > config: csky-randconfig-c024-20210622 (attached as .config)
> > > > > compiler: csky-linux-gcc (GCC) 9.3.0
> > > > > reproduce (this is a W=1 build):
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cf536e185869d4815d506e777bcca6edd9966a6e
> > > > >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > > >         git fetch --no-tags linux-next master
> > > > >         git checkout cf536e185869d4815d506e777bcca6edd9966a6e
> > > > >         # save the attached .config to linux build tree
> > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=csky
> > >
> > > > Thanks for the report.
> > > >
> > > > I just reproduced the issue locally, with similar log:
> > > >
> > > >   CC      drivers/target/target_core_sbc.o
> > > > {standard input}: Assembler messages:
> > > > {standard input}:2644: Error: pcrel offset for branch to .LS0015 too far (0x3e)
> > > > {standard input}:2653: Error: pcrel offset for branch to .LS0015 too far (0x34)
> > > > {standard input}:2659: Error: pcrel offset for branch to .LS0015 too far (0x2c)
> > > > make[2]: *** [scripts/Makefile.build:272: drivers/target/target_core_sbc.o] Error 1
> > > > m
> > > >
> > > > And when I changed the function align option from 64 to 32, the
> > > > compilation did pass, so this looks to be related with the alignment
> > > > option.
> > > >
> > > > I'm not very familiar with compiler, and will try to check more.
> > >
> > > I did some check and found the error info comes from the assembler
> > > for 'csky' in binutils' gas/config/tc-csky.c, and I could hardly
> > > dive deeper into the code as limited by my knowledge.
> > >
> > >
> > > > I know it works on x86_64, but don't know how about other
> > > > architectures, and if 'csky' is the only not working one, one
> > > > workaround I can think of is to add kconfig dependency for !csky
> > >
> > > I reused the 0day's reproduce process, and tried on arm64, powerpc64,
> > > and arc, the kernel compilation all succeeded. So maybe we can
> > > add some dependency for this debug option like:
> > >
> > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > index 3cf48998a374..eb035b31657f 100644
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -415,7 +415,8 @@ config SECTION_MISMATCH_WARN_ONLY
> > >           If unsure, say Y.
> > >
> > >  config DEBUG_FORCE_FUNCTION_ALIGN_64B
> > > -       bool "Force all function address 64B aligned" if EXPERT
> > > +       bool "Force all function address 64B aligned"
> > > +       depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC)
> > >         help
> > >           There are cases that a commit from one domain changes the function
> > >           address alignment of other domains, and cause magic performance
> > >
> > > Any comments? thanks!
> > Have tried riscv32? I don't think csky is the only problem.
> >
> > Assembler just follows gcc backend result and also depends on ISA
> > design. Our condition branch seems not far enough.
>
> Thanks for the info.
>
> I just used 0day's cross compile env to compile 'riscv32', and it
> succeeded with 64B align option. (the kernel config is attached)
Thx for the info, we'll have a look at it.

>
> Anyway, this debug option is for debug only, and nice to have. If
> it doesn't work on one architecture, I dont' think it means a severe
> problem.
>
> Thanks,
> Feng
>
> > Cc: xianmiao_qu@c-sky.com
> >
> > >
> > > - Feng
> > >
> > > > Thanks,
> > > > Feng
> > > >
> > > >
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
