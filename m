Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBD716794D
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 10:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgBUJWw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 04:22:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:38708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbgBUJWv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 04:22:51 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4986C20722;
        Fri, 21 Feb 2020 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582276971;
        bh=ALN0VHctPPGg0pxI3Em/Or50WMnH8i03K/5ZLFgljvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VB4dS6ni6nuf+jC6BMCt6gKplNkZ3/m5PBW3FkqeN4wgkGtpqn1bKsDBuvTrJ40nU
         6u5Usn9f6Bb+NGwxZO6u6WWC0zmyIvY8frgCGmdSIdv9092Tc9Y8Xp9eXSIwjJ+A/a
         JDLU9Wrx30hZjTJymghhADO8Axxbu7RlmHBDelVo=
Date:   Fri, 21 Feb 2020 09:22:43 +0000
From:   Will Deacon <will@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        X86 ML <x86@kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-um@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Borislav Petkov <bp@alien8.de>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jeff Dike <jdike@addtoit.com>, Nick Hu <nickhu@andestech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Chen <deanbo422@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] kbuild: use KBUILD_DEFCONFIG as the fallback for
 DEFCONFIG_LIST
Message-ID: <20200221092242.GA11448@willie-the-truck>
References: <CGME20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929@eucas1p2.samsung.com>
 <20200216154502.26478-1-masahiroy@kernel.org>
 <e0212512-bc44-fc3a-a647-47eff86983b7@samsung.com>
 <CAK7LNAQqsLnZc4h_XEMifS2hX+E39-vxD-BL5C59Aj+TaQo+eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQqsLnZc4h_XEMifS2hX+E39-vxD-BL5C59Aj+TaQo+eA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 21, 2020 at 06:18:50PM +0900, Masahiro Yamada wrote:
> On Fri, Feb 21, 2020 at 5:50 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > This patch landed in today's linux-next (next-20200221) and broke arm64
> > builds:
> >
> > --->8---
> >
> > $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
> > *** Default configuration is based on 'defconfig'
> > #
> > # configuration written to .config
> > #
> > $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image.gz
> > scripts/kconfig/conf  --syncconfig Kconfig
> > scripts/kconfig/conf  --syncconfig Kconfig
> > scripts/kconfig/conf  --syncconfig Kconfig
> > scripts/kconfig/conf  --syncconfig Kconfig
> > scripts/kconfig/conf  --syncconfig Kconfig
> > ...
> >
> > (endless loop)
> >
> > --->8---
> >
> > Reverting it fixes the issue:
> 
> 
> 
> My bad.
> 
> This is because arch/arm64/Makefile does not define
> KBUILD_DEFCONFIG.
> 
> 
> 
> I will drop it.
> 
> Sorry about that.

Thanks, Masahiro.

Will
