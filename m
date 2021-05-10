Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CF6378FB2
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 May 2021 15:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237215AbhEJNww (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 May 2021 09:52:52 -0400
Received: from foss.arm.com ([217.140.110.172]:58754 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242460AbhEJNqk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 May 2021 09:46:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A49B71688;
        Mon, 10 May 2021 06:45:34 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.4.9])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1548E3F73B;
        Mon, 10 May 2021 06:45:29 -0700 (PDT)
Date:   Mon, 10 May 2021 14:45:03 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-hardening@vger.kernel.org, Qing Zhao <qing.zhao@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] Makefile: Introduce CONFIG_ZERO_CALL_USED_REGS
Message-ID: <20210510134503.GA88495@C02TD0UTHF1T.local>
References: <20210505191804.4015873-1-keescook@chromium.org>
 <20210506125457.GA34956@C02TD0UTHF1T.local>
 <202105061416.3CB40BE5@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202105061416.3CB40BE5@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 06, 2021 at 02:24:18PM -0700, Kees Cook wrote:
> On Thu, May 06, 2021 at 01:54:57PM +0100, Mark Rutland wrote:
> > Hi Kees,
> > 
> > On Wed, May 05, 2021 at 12:18:04PM -0700, Kees Cook wrote:
> > > When CONFIG_ZERO_CALL_USED_REGS is enabled, build the kernel with
> > > "-fzero-call-used-regs=used-gpr" (in GCC 11). This option will zero any
> > > caller-used register contents just before returning from a function,
> > > ensuring that temporary values are not leaked beyond the function
> > > boundary. This means that register contents are less likely to be
> > > available for side channel attacks and information exposures.
> > > 
> > > Additionally this helps reduce the number of useful ROP gadgets in the
> > > kernel image by about 20%:
> > > 
> > > $ ROPgadget.py --nosys --nojop --binary vmlinux.stock | tail -n1
> > > Unique gadgets found: 337245
> > > 
> > > $ ROPgadget.py --nosys --nojop --binary vmlinux.zero-call-regs | tail -n1
> > > Unique gadgets found: 267175
> > > 
> > > and more notably removes simple "write-what-where" gadgets:
> > > 
> > > $ ROPgadget.py --ropchain --binary vmlinux.stock | sed -n '/Step 1/,/Step 2/p'
> > > - Step 1 -- Write-what-where gadgets
> > > 
> > >         [+] Gadget found: 0xffffffff8102d76c mov qword ptr [rsi], rdx ; ret
> > >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> > >         [+] Gadget found: 0xffffffff8104d7c8 pop rdx ; ret
> > >         [-] Can't find the 'xor rdx, rdx' gadget. Try with another 'mov [reg], reg'
> > > 
> > >         [+] Gadget found: 0xffffffff814c2b4c mov qword ptr [rsi], rdi ; ret
> > >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> > >         [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
> > >         [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'
> > > 
> > >         [+] Gadget found: 0xffffffff81540d61 mov qword ptr [rsi], rdi ; pop rbx ; pop rbp ; ret
> > >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> > >         [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
> > >         [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'
> > > 
> > >         [+] Gadget found: 0xffffffff8105341e mov qword ptr [rsi], rax ; ret
> > >         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
> > >         [+] Gadget found: 0xffffffff81029a11 pop rax ; ret
> > >         [+] Gadget found: 0xffffffff811f1c3b xor rax, rax ; ret
> > > 
> > > - Step 2 -- Init syscall number gadgets
> > > 
> > > $ ROPgadget.py --ropchain --binary vmlinux.zero* | sed -n '/Step 1/,/Step 2/p'
> > > - Step 1 -- Write-what-where gadgets
> > > 
> > >         [-] Can't find the 'mov qword ptr [r64], r64' gadget
> > > 
> > > In parallel build tests, this has a less than 1% performance impact,
> > > and grows the image size less than 1%:
> > > 
> > > $ size vmlinux.stock vmlinux.zero-call-regs
> > >    text    data     bss     dec     hex filename
> > > 22437676   8559152 14127340 45124168 2b08a48 vmlinux.stock
> > > 22453184   8563248 14110956 45127388 2b096dc vmlinux.zero-call-regs
> > 
> > FWIW, I gave this a go on arm64, and the size increase is a fair bit
> > larger:
> > 
> > | [mark@lakrids:~/src/linux]% ls -l Image* 
> > | -rw-r--r-- 1 mark mark 31955456 May  6 13:36 Image.stock
> > | -rw-r--r-- 1 mark mark 33724928 May  6 13:23 Image.zero-call-regs
> > 
> > | [mark@lakrids:~/src/linux]% size vmlinux.stock vmlinux.zero-call-regs 
> > |    text    data     bss     dec     hex filename
> > | 20728552        11086474         505540 32320566        1ed2c36 vmlinux.stock
> > | 22500688        11084298         505540 34090526        2082e1e vmlinux.zero-call-regs
> > 
> > The Image is ~5.5% bigger, and the .text in the vmlinux is ~8.5% bigger
> 
> Woo, that's quite a bit larger! So much so that I struggle to imagine
> the delta. That's almost 1 extra instruction for every 10. 

About 31% of this seems to be due to GCC (almost) always clearing x16
and x17 (see further down for numbers). I suspect that's because GCC has
to assume that any (non-static) functions might be reached via a PLT
which would clobber x16 and x17 with specific values.

We also have a bunch of small functions with multiple returns, where
each return path gets the full complement of zeroing instructions, e.g.

Stock:

| <fpsimd_sync_to_sve>:
|        d503245f        bti     c
|        f9400001        ldr     x1, [x0]
|        7209003f        tst     w1, #0x800000
|        54000040        b.eq    ffff800010014cc4 <fpsimd_sync_to_sve+0x14>  // b.none
|        d65f03c0        ret
|        d503233f        paciasp
|        a9bf7bfd        stp     x29, x30, [sp, #-16]!
|        910003fd        mov     x29, sp
|        97fffdac        bl      ffff800010014380 <fpsimd_to_sve>
|        a8c17bfd        ldp     x29, x30, [sp], #16
|        d50323bf        autiasp
|        d65f03c0        ret

With zero-call-regs:

| <fpsimd_sync_to_sve>:
|        d503245f        bti     c
|        f9400001        ldr     x1, [x0]
|        7209003f        tst     w1, #0x800000
|        540000c0        b.eq    ffff8000100152a8 <fpsimd_sync_to_sve+0x24>  // b.none
|        d2800000        mov     x0, #0x0                        // #0
|        d2800001        mov     x1, #0x0                        // #0
|        d2800010        mov     x16, #0x0                       // #0
|        d2800011        mov     x17, #0x0                       // #0
|        d65f03c0        ret
|        d503233f        paciasp
|        a9bf7bfd        stp     x29, x30, [sp, #-16]!
|        910003fd        mov     x29, sp
|        97fffd17        bl      ffff800010014710 <fpsimd_to_sve>
|        a8c17bfd        ldp     x29, x30, [sp], #16
|        d50323bf        autiasp
|        d2800000        mov     x0, #0x0                        // #0
|        d2800001        mov     x1, #0x0                        // #0
|        d2800010        mov     x16, #0x0                       // #0
|        d2800011        mov     x17, #0x0                       // #0
|        d65f03c0        ret

... where we go from 12 instructions to 20, which is a ~67% bloat.

> I don't imagine functions are that short. There seem to be only r9..r15 as
> call-used.

We have a bunch of cases like the above. Also note that per the AAPCS a
function can clobber x0-17 (and x18 if it's not reserved for something
like SCS), and I see a few places that clobber x1-x17.

> Even if every one was cleared at every function exit (28
> bytes), that implies 63,290 functions, with an average function size of
> 40 instructions?

I generated some (slightly dodgy) numbers by grepping the output of
objdump:

[mark@lakrids:~/src/linux]% usekorg 10.1.0 aarch64-linux-objdump -d vmlinux.stock | wc -l                                
3979677
[mark@lakrids:~/src/linux]% usekorg 10.1.0 aarch64-linux-objdump -d vmlinux.stock | grep 'mov\sx[0-9]\+, #0x0' | wc -l 
50070
[mark@lakrids:~/src/linux]% usekorg 10.1.0 aarch64-linux-objdump -d vmlinux.stock | grep 'mov\sx1[67], #0x0' | wc -l
1

[mark@lakrids:~/src/linux]% usekorg 10.1.0 aarch64-linux-objdump -d vmlinux.zero-call-regs | wc -l                                
4422188
[mark@lakrids:~/src/linux]% usekorg 10.1.0 aarch64-linux-objdump -d vmlinux.zero-call-regs | grep 'mov\sx[0-9]\+, #0x0' | wc -l
491371
[mark@lakrids:~/src/linux]% usekorg 10.1.0 aarch64-linux-objdump -d vmlinux.zero-call-regs | grep 'mov\sx1[67], #0x0' | wc -l 
135729

That's 441301 new MOVs, and the equivalent of 442511 new instructions
overall. There are 135728 new MOVs to x16 and x17 specifically, which
account for ~31% of that.

Overall we go from MOVs being ~1.3% of all instructions to 11%.

> > The resulting Image appears to work, but I haven't done anything beyond
> > booting, and I wasn't able to get ROPgadget.py going to quantify the
> > number of gadgets.
> 
> Does it not like arm64 machine code? I can go check and see if I can get
> numbers...

It's supposed to, and I suspect it works fine, but I wasn't able to get
the tool running at all due to environment problems on my machine.

Thanks,
Mark.
