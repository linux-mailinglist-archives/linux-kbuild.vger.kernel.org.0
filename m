Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B7D12225A
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 04:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfLQDGc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 22:06:32 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:58155 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQDGc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 22:06:32 -0500
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id xBH36CI2031595;
        Tue, 17 Dec 2019 12:06:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com xBH36CI2031595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576551973;
        bh=pugGGjF7UoSjVUlbexS6sMjOLhQht+PE5aPlQbu3gZI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XG0jL4Z9K1FdE5J1JOKxZIxiZwa8NLcIxoZqNdqDodGPR20KM+MqHO2s5a5mHmZqW
         wtvgE5naeIuBsDaM5g99Y41zIUJbo9bVfcjCmDRLyx75tvZUlMhA8FUSBoOCdAI3+H
         l0ihq/zIAjKucOEWwVx4IrSL3Jygz8V2oA+VJ6tNyOK3IEGABp9h78h6GJEa2CSDSu
         Sj2BLwivdka/vPEL+9uNgsTNz0kZ79eC5GUr/UVJnhq3eacLPRzL1KV76+uBymT5Hu
         VmDcd2O3y/A6XEAqZw/vt99PSaLH0Cq+Z7cs/Ue0ozIGWwQS9B0tc3vJkfdckNdE73
         q3dD17PQDdctQ==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id o187so2280165vka.2;
        Mon, 16 Dec 2019 19:06:13 -0800 (PST)
X-Gm-Message-State: APjAAAVa5FlKlNPsTAt+PcO42ylnfUV6+yYx382ea2tdaSlHksey7XGr
        IrdpD5IH2mspR12TYZZfw/qcLEbc3mCc13Pc0Wk=
X-Google-Smtp-Source: APXvYqzpD0fO/aIi+ks5CVgoBnhS77OdbbT+Hz15RXdLJaxFP29PsPPPy4YjBrxnkc42+qznbFUj3VyFbxlLC1iTnak=
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr1689010vkd.66.1576551972298;
 Mon, 16 Dec 2019 19:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20191204225446.202981-1-dima@golovin.in> <CAKwvOdm-bhuJMRRN3tyNdb88+_TFd4m3b-7gX0-91VG4djzp+Q@mail.gmail.com>
 <23883331575506134@vla1-3991b5027d7d.qloud-c.yandex.net>
In-Reply-To: <23883331575506134@vla1-3991b5027d7d.qloud-c.yandex.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Dec 2019 12:05:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRWgfnP_C68aiOLacR_Bhz2oL6DgyUE76gENWfOvvGbQ@mail.gmail.com>
Message-ID: <CAK7LNATRWgfnP_C68aiOLacR_Bhz2oL6DgyUE76gENWfOvvGbQ@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: kbuild: allow readelf executable to be specified
To:     Dmitry Golovin <dima@golovin.in>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        Ross Burton <ross.burton@intel.com>,
        Chao Fan <fanc.fnst@cn.fujitsu.com>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "fenghua.yu@intel.com" <fenghua.yu@intel.com>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 5, 2019 at 9:41 AM Dmitry Golovin <dima@golovin.in> wrote:
>
> 05.12.2019, 01:18, "'Nick Desaulniers' via Clang Built Linux" <clang-built-linux@googlegroups.com>:
> >
> > Grepping the kernel sources for `READELF`, it looks like
> > arch/ia64/Makefile makes the same mistake. Would you mind fixing both
> > cases in the same patch (v2)? I'm also curious about it's use in
> > arch/ia64/scripts/unwcheck.py, and scripts/faddr2line. +ia64
> > maintainers and list.
> >
> > I think if you simply remove the assignment on line 17 of
> > arch/ia64/Makefile you should be fine.
>
> Perhaps something should be done to NM on line 16 of this file as well. Also
> found similar invocation of `objcopy` in arch/riscv/kernel/vdso/Makefile.
> I think IA64 and RISC-V changes should be made as separate commits.
>
> -- Dmitry

Applied to linux-kbuid. Thanks.

-- 
Best Regards
Masahiro Yamada
