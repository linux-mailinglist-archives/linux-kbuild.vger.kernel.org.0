Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 136F718281F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2020 06:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387677AbgCLFMT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Mar 2020 01:12:19 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51177 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387657AbgCLFMT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Mar 2020 01:12:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dH4w24w8z9sNg;
        Thu, 12 Mar 2020 16:12:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1583989936;
        bh=xNIGR985NSdazMaCNAnfESZ3cpOPL+Cw4T3S+R47fIg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jLijGXvodmMu0U+ntCcxEZ6YLmdmeUOq8/4DTLoubSDGrzlES5wzBxk42KZYSsuki
         O1pytPRag4ReCLKYGo+j6WSTRyfO8BSy+RQMmXLDoZgxD+jBrT8gwfNQLETHpSEFZ4
         SCRwz6GAOe61RrsXAgHTMSnEd7hTrEyh7C10exWrUX9/GO4b7CMt1l6TzjoewvpnwM
         F4aZGFinim3Sr1BLLWZ8SzeGJ8jKrQUYd/NTdnv9SVnKvJEMFPSnIKsJfUMR3zhKR8
         WBXru+uAGkPXTlo8i2Dx0MTVp+jq2kh2aLHxm9QjaAt+v9DvfM2ww4sxx77Jx8mswN
         uTKpvjDGX2/eQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with CONFIG_KALLSYMS_BASE_RELATIVE
In-Reply-To: <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev> <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com> <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev> <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
Date:   Thu, 12 Mar 2020 16:12:15 +1100
Message-ID: <87lfo6i2c0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Thu, Mar 12, 2020 at 3:18 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>> On 11.03.2020 9:06, Masahiro Yamada wrote:
>> > On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>> >>
>> >> There is the code in the read_symbol function in 'scripts/kallsyms.c':
>> >>
>> >>         if (is_ignored_symbol(name, type))
>> >>                 return NULL;
>> >>
>> >>         /* Ignore most absolute/undefined (?) symbols. */
>> >>         if (strcmp(name, "_text") == 0)
>> >>                 _text = addr;
>> >>
>> >> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
>> >>
>> >> It makes the wrong kallsyms_relative_base symbol as a result of the code:
>> >>
>> >>         if (base_relative) {
>> >>                 output_label("kallsyms_relative_base");
>> >>                 output_address(relative_base);
>> >>                 printf("\n");
>> >>         }
>> >>
>> >> Because the output_address function uses the _text variable.
>> >>
>> >> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
>> >>
>> >>         Call Trace:
>> >>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>> >>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>> >>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>> >>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>> >>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>> >>
>> >> The right stack trace:
>> >>
>> >>         Call Trace:
>> >>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>> >>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>> >>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>> >>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
>> >>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>> >
>> > Thanks for the patch.
>> >
>> > Just for curiosity, on which architecrure
>> > did you see  name="_text" and type='a' case ?
>>
>> Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.
>>
>> nm -n .tmp_vmlinux1 looks like:
>>
>> ...
>>          w kallsyms_token_table
>>          w mach_powermac
>> 00000007 a LG_CACHELINE_BYTES
>> 00000007 a LG_CACHELINE_BYTES
>> 00000007 a LG_CACHELINE_BYTES
>> 00000020 a reg
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000400 a dcr
>> 80000000 T _start
>> 80000000 A _stext
>> 80000000 A _text
>
>
> Hmm, I am still not able to reproduce this.
>
> I compiled ARCH=powerpc, but
> 'powerpc-linux-nm -n .tmp_vmlinux1' got this.
>
>
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000400 a dcr
> c0000000 T _start
> c0000000 T _stext
> c0000000 T _text
> c00000b8 t interrupt_base
> c00000c0 t CriticalInput
> c00001a0 t MachineCheck
> c0000280 t MachineCheckA
>
>
> Which defconfig did you use?
>
>
> (I also CCed the ppc maintainer,
> I am just curious what makes _text absolute.)

I have no idea sorry.

arch/powerpc has about 20 sub-platforms that do weird and wonderful
things. Presumably this happens on one of those.

I played around with some of the defconfigs but couldn't reproduce this.

The only config we have that puts the kernel at 0x80000000 is:

  $ git grep 80000000  arch/powerpc/configs/
  arch/powerpc/configs/85xx/xes_mpc85xx_defconfig:CONFIG_PAGE_OFFSET=0x80000000

But that's not a PPC476 platform.

And _text is not 'A':

  $ nm .tmp_vmlinux1 | grep -w _text
  80000000 T _text


cheers
