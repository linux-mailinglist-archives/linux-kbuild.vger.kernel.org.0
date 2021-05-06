Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5E3375CD0
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 May 2021 23:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhEFVZT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 May 2021 17:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhEFVZT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 May 2021 17:25:19 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A53DC061574
        for <linux-kbuild@vger.kernel.org>; Thu,  6 May 2021 14:24:20 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so3497903pjk.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 May 2021 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=igORqeSdzwqo7hq/vBpkTiAOSyR+7EZdkk8nfqYdFQM=;
        b=BaDJPqA9cyr8SHFiJFSFW/ovxF0YCGQxGzH1GbFSm2lkcry0lW6wkALibJ+QJkPnq3
         T/2roLurRn8olNeFSVCB5qx/Q0WIKUvNOqv4XHo4m0vBwG95R8drH6O56wfTXHqxM3OM
         b8QTXp5z3trWiW4IkfyMOZd2MOch7nj09MqSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=igORqeSdzwqo7hq/vBpkTiAOSyR+7EZdkk8nfqYdFQM=;
        b=tZZiZkF85yewMl4OVSf9aX5/3gDl7aiIGR2OYujc6ocj9QlVpKZmeKRH87QE5eo112
         d3ghFmiMvNqESaQyzi0hsyx5+MWC+gHQqdbFVRUVDTv3y13Mg7w3+hAUlgpdUlCTx+ZE
         k3hZyfmYcRWSrJHXkw5SkxL7Vr+CyTfe+er4AzUmJ7oQJz3cA0dhaL9sj57+DIbrsPLU
         kUfyXtc/fYcsnU4qe7Een/ksWaVTmM5RtgLU0VNM0EHiCkZcrsy8ntVAlp9PRY8wZEgE
         uOAQWE+01WfEw8l/2PofzMiFHYgmF1hKqwDRkTKS6mIkR7QQFXNiU9fCLREjPavyffU2
         u6Bg==
X-Gm-Message-State: AOAM532o4sllf8p11Ebtw0CfCK0F9KivFMLRJCjEafROlRrMOsnP5444
        xylz6ZSD+tc0oOVGS2VFKpmvkw==
X-Google-Smtp-Source: ABdhPJwZGIMWwWangIL+g4Zs6I8C0RKGaWIJOaKvTKBnzSDc6z3cY/7520S4vR8CJLJ13NQjfwGeHg==
X-Received: by 2002:a17:90b:3684:: with SMTP id mj4mr20430219pjb.50.1620336259795;
        Thu, 06 May 2021 14:24:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v18sm2749509pgl.94.2021.05.06.14.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 14:24:19 -0700 (PDT)
Date:   Thu, 6 May 2021 14:24:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     linux-hardening@vger.kernel.org, Qing Zhao <qing.zhao@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] Makefile: Introduce CONFIG_ZERO_CALL_USED_REGS
Message-ID: <202105061416.3CB40BE5@keescook>
References: <20210505191804.4015873-1-keescook@chromium.org>
 <20210506125457.GA34956@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506125457.GA34956@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 06, 2021 at 01:54:57PM +0100, Mark Rutland wrote:
> Hi Kees,
> 
> On Wed, May 05, 2021 at 12:18:04PM -0700, Kees Cook wrote:
> > When CONFIG_ZERO_CALL_USED_REGS is enabled, build the kernel with
> > "-fzero-call-used-regs=used-gpr" (in GCC 11). This option will zero any
> > caller-used register contents just before returning from a function,
> > ensuring that temporary values are not leaked beyond the function
> > boundary. This means that register contents are less likely to be
> > available for side channel attacks and information exposures.
> > 
> > Additionally this helps reduce the number of useful ROP gadgets in the
> > kernel image by about 20%:
> > 
> > $ ROPgadget.py --nosys --nojop --binary vmlinux.stock | tail -n1
> > Unique gadgets found: 337245
> > 
> > $ ROPgadget.py --nosys --nojop --binary vmlinux.zero-call-regs | tail -n1
> > Unique gadgets found: 267175
> > 
> > and more notably removes simple "write-what-where" gadgets:
> > 
> > $ ROPgadget.py --ropchain --binary vmlinux.stock | sed -n '/Step 1/,/Step 2/p'
> > - Step 1 -- Write-what-where gadgets
> > 
> >         [+] Gadget found: 0xffffffff8102d76c mov qword ptr [rsi], rdx ; ret
> >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> >         [+] Gadget found: 0xffffffff8104d7c8 pop rdx ; ret
> >         [-] Can't find the 'xor rdx, rdx' gadget. Try with another 'mov [reg], reg'
> > 
> >         [+] Gadget found: 0xffffffff814c2b4c mov qword ptr [rsi], rdi ; ret
> >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> >         [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
> >         [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'
> > 
> >         [+] Gadget found: 0xffffffff81540d61 mov qword ptr [rsi], rdi ; pop rbx ; pop rbp ; ret
> >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> >         [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
> >         [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'
> > 
> >         [+] Gadget found: 0xffffffff8105341e mov qword ptr [rsi], rax ; ret
> >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> >         [+] Gadget found: 0xffffffff81029a11 pop rax ; ret
> >         [+] Gadget found: 0xffffffff811f1c3b xor rax, rax ; ret
> > 
> > - Step 2 -- Init syscall number gadgets
> > 
> > $ ROPgadget.py --ropchain --binary vmlinux.zero* | sed -n '/Step 1/,/Step 2/p'
> > - Step 1 -- Write-what-where gadgets
> > 
> >         [-] Can't find the 'mov qword ptr [r64], r64' gadget
> > 
> > In parallel build tests, this has a less than 1% performance impact,
> > and grows the image size less than 1%:
> > 
> > $ size vmlinux.stock vmlinux.zero-call-regs
> >    text    data     bss     dec     hex filename
> > 22437676   8559152 14127340 45124168 2b08a48 vmlinux.stock
> > 22453184   8563248 14110956 45127388 2b096dc vmlinux.zero-call-regs
> 
> FWIW, I gave this a go on arm64, and the size increase is a fair bit
> larger:
> 
> | [mark@lakrids:~/src/linux]% ls -l Image* 
> | -rw-r--r-- 1 mark mark 31955456 May  6 13:36 Image.stock
> | -rw-r--r-- 1 mark mark 33724928 May  6 13:23 Image.zero-call-regs
> 
> | [mark@lakrids:~/src/linux]% size vmlinux.stock vmlinux.zero-call-regs 
> |    text    data     bss     dec     hex filename
> | 20728552        11086474         505540 32320566        1ed2c36 vmlinux.stock
> | 22500688        11084298         505540 34090526        2082e1e vmlinux.zero-call-regs
> 
> The Image is ~5.5% bigger, and the .text in the vmlinux is ~8.5% bigger

Woo, that's quite a bit larger! So much so that I struggle to imagine
the delta. That's almost 1 extra instruction for every 10. I don't
imagine functions are that short. There seem to be only r9..r15 as
call-used. Even if every one was cleared at every function exit (28
bytes), that implies 63,290 functions, with an average function size of
40 instructions?

> The resulting Image appears to work, but I haven't done anything beyond
> booting, and I wasn't able to get ROPgadget.py going to quantify the
> number of gadgets.

Does it not like arm64 machine code? I can go check and see if I can get
numbers...

Thanks for looking at this!

-Kees

> 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  Makefile                   |  5 +++++
> >  security/Kconfig.hardening | 17 +++++++++++++++++
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 31dcdb3d61fa..810600618490 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -811,6 +811,11 @@ KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
> >  KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
> >  endif
> >  
> > +# Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
> > +ifdef CONFIG_ZERO_CALL_USED_REGS
> > +KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr
> > +endif
> > +
> >  DEBUG_CFLAGS	:=
> >  
> >  # Workaround for GCC versions < 5.0
> > diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> > index 269967c4fc1b..85f7f2036725 100644
> > --- a/security/Kconfig.hardening
> > +++ b/security/Kconfig.hardening
> > @@ -217,6 +217,23 @@ config INIT_ON_FREE_DEFAULT_ON
> >  	  touching "cold" memory areas. Most cases see 3-5% impact. Some
> >  	  synthetic workloads have measured as high as 8%.
> >  
> > +config CC_HAS_ZERO_CALL_USED_REGS
> > +	def_bool $(cc-option,-fzero-call-used-regs=used-gpr)
> > +
> > +config ZERO_CALL_USED_REGS
> > +	bool "Enable register zeroing on function exit"
> > +	depends on CC_HAS_ZERO_CALL_USED_REGS
> > +	help
> > +	  At the end of functions, always zero any caller-used register
> > +	  contents. This helps ensure that temporary values are not
> > +	  leaked beyond the function boundary. This means that register
> > +	  contents are less likely to be available for side channels
> > +	  and information exposures. Additionally, this helps reduce the
> > +	  number of useful ROP gadgets by about 20% (and removes compiler
> > +	  generated "write-what-where" gadgets) in the resulting kernel
> > +	  image. This has a less than 1% performance impact on most
> > +	  workloads, and grows the image size less than 1%.
> 
> I think the numbers need an "on x86" caveat, since they're not
> necessarily representative of other architectures.
> 
> This shows up under the "Memory initialization" sub-menu, but I assume
> it was meant to be directly under the "Kernel hardening options" menu...
> 
> > +
> >  endmenu
> 
> ... and should presumably be here?
> 
> Thanks,
> Mark.
> 
> >  
> >  endmenu
> > -- 
> > 2.25.1
> > 

-- 
Kees Cook
