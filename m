Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B934D182391
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2020 21:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgCKU5d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 16:57:33 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:44784 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726579AbgCKU5d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 16:57:33 -0400
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02BKvJcp023652
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2020 05:57:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02BKvJcp023652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583960240;
        bh=s/lTPfF/9Td3gM2y8OPktONIp8u1hvau5QxY5V9vnAc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MF6XJ48QXTqCIHccn43DAUG950ImDgxVRZ2RTjtPQVbuPPXvKQeXi3iOYOQ0J8nOC
         I7mkiV+aO/Z61b+zKQbaFVTB7p7awG5nBhT10JrMOFifVxf6TFGTTeIjM7WBRzzxnx
         fkher4yAHCkhY9S46psICZtkqn94Mpgg02DQeK1Jn0yQFA8dyS9mAYEFjzVb5fBVce
         BOQ3MMKfMnVdcXVgPOUXoGQNdctAd0Z2LF1d1Ul5lqUi+k/L3kFoVDClIXvQvHTrnN
         LrWSurM9Ot/n+ZpnocCgIhzU/IjDn5OZsz0/cWVDMDTjBBzbiW8ghkaaxdWre8Bifg
         CtSu022e/oz2Q==
X-Nifty-SrcIP: [209.85.221.177]
Received: by mail-vk1-f177.google.com with SMTP id a1so960302vkg.3
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2020 13:57:19 -0700 (PDT)
X-Gm-Message-State: ANhLgQ00OS/7kFU6pjP4m4Tc0K8XXIIRkAM57lF3G1me7IySSc6AGY8q
        cxpn3a3fp9WrJp/TYoGg/8iKTkgYLtntnB4VaO8=
X-Google-Smtp-Source: ADFU+vuVF6/XkexAwjcOaoQ0wH/a6BYvzBe6+J7u9/4SigppWWmGQBcjYpbTx3Haly+CU2s64HHd+vd6AAhrtM3nqPk=
X-Received: by 2002:a1f:b401:: with SMTP id d1mr3195100vkf.26.1583960238397;
 Wed, 11 Mar 2020 13:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev> <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
 <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev>
In-Reply-To: <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 12 Mar 2020 05:56:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
Message-ID: <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with CONFIG_KALLSYMS_BASE_RELATIVE
To:     Mikhail Petrov <Mikhail.Petrov@mir.dev>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 12, 2020 at 3:18 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>
> Hi Masahiro,
>
> On 11.03.2020 9:06, Masahiro Yamada wrote:
> > Hi Mikhail,
> >
> > On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
> >>
> >> There is the code in the read_symbol function in 'scripts/kallsyms.c':
> >>
> >>         if (is_ignored_symbol(name, type))
> >>                 return NULL;
> >>
> >>         /* Ignore most absolute/undefined (?) symbols. */
> >>         if (strcmp(name, "_text") == 0)
> >>                 _text = addr;
> >>
> >> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
> >>
> >> It makes the wrong kallsyms_relative_base symbol as a result of the code:
> >>
> >>         if (base_relative) {
> >>                 output_label("kallsyms_relative_base");
> >>                 output_address(relative_base);
> >>                 printf("\n");
> >>         }
> >>
> >> Because the output_address function uses the _text variable.
> >>
> >> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
> >>
> >>         Call Trace:
> >>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
> >>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
> >>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
> >>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
> >>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
> >>
> >> The right stack trace:
> >>
> >>         Call Trace:
> >>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
> >>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
> >>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
> >>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
> >>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
> >>
> >> Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>
> >>
> >> ---
> >
> >
> > Thanks for the patch.
> >
> > Just for curiosity, on which architecrure
> > did you see  name="_text" and type='a' case ?
>
> Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.
>
> nm -n .tmp_vmlinux1 looks like:
>
> ...
>          w kallsyms_token_table
>          w mach_powermac
> 00000007 a LG_CACHELINE_BYTES
> 00000007 a LG_CACHELINE_BYTES
> 00000007 a LG_CACHELINE_BYTES
> 00000020 a reg
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000400 a dcr
> 80000000 T _start
> 80000000 A _stext
> 80000000 A _text


Hmm, I am still not able to reproduce this.

I compiled ARCH=powerpc, but
'powerpc-linux-nm -n .tmp_vmlinux1' got this.


0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000400 a dcr
c0000000 T _start
c0000000 T _stext
c0000000 T _text
c00000b8 t interrupt_base
c00000c0 t CriticalInput
c00001a0 t MachineCheck
c0000280 t MachineCheckA




Which defconfig did you use?


(I also CCed the ppc maintainer,
I am just curious what makes _text absolute.)







> 80000088 t interrupt_base
> 800000a0 t CriticalInput
> 80000180 t MachineCheck
> 80000260 t MachineCheckA
> 80000360 t DataStorage
> 80000420 t InstructionStorage
> 80000500 t ExternalInput
> 800005c0 t Alignment
> 80000680 t Program
> 80000740 t FloatingPointUnavailable
> 80000820 t SystemCall
> 80000900 t AuxillaryProcessorUnavailable
> ...
>
>
> > Could you wrap the commit log to avoid
> > this checkpatch warning?
> > WARNING: Possible unwrapped commit description (prefer a maximum 75
> > chars per line)
> >
> > Also, could you shorten the patch subject
> > to make it fit in this limit?
>
> Sorry for that. Now I know about scripts/checkpatch.pl. I will improve and resubmit the patch soon.
>
> Thanks.


--
Best Regards
Masahiro Yamada
