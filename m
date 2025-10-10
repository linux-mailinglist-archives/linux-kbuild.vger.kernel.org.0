Return-Path: <linux-kbuild+bounces-9072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E4FBCC04A
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 10:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E42014F0742
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 08:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A4F275AF0;
	Fri, 10 Oct 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4Ce0Ihz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569761FF7B3;
	Fri, 10 Oct 2025 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083340; cv=none; b=JtJlomCHM2jRbUW8VMO7850MjqYltjHaPfdn6X/FcANj+8EGqFs72mGQ7k/OUpEULQJiFMWPaMfDesNxj4ewufvRwC/fo6DrJn//5VUMxcePl6g6qokyN99IJviJV/IJjCUrFiQgC4QSFVI9nZmyqMiqdk1zgqnY7Tfi1YiOiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083340; c=relaxed/simple;
	bh=qITXVMxXmEHwXiNKpVxw+h1NSbH+gxKcGOO6VkAiZAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWEDlKKjnjjj8uBMwgn8GWOcS2Mp0fnXP/LVhqPYMXiDuqkOM0Vmga9vU3qDbxqMN2BBL553oJ2uW5dpQyuqk9jXnmZxTVLQKa3fRXg4kYp56XhThnfvzUYI5y0ysWIwg+svRi/cvoHXY6K8spaHPToFRcHHDvwrnu4b9FtiaKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4Ce0Ihz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4AFC4CEF1;
	Fri, 10 Oct 2025 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760083340;
	bh=qITXVMxXmEHwXiNKpVxw+h1NSbH+gxKcGOO6VkAiZAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4Ce0IhzxEtlBd34zRXczESlNsvIn/4sm7FxJjJXgOOvhPPqrNVWQIFZF3eooWXWy
	 p5My/PZ8bo1uzbULgbP246bWosmlHa9YI2GZdEPO/7D2cgsa3zIQDkT7Y7Bfkpeu5I
	 vNnjfgPh8rzguIwUhbue3nt81K30OAHoANq4cgYXxR1mHSHepEkloQ6K1AtNZqtiSe
	 phow/E1jNkh0rEdAZKmuffo1+fFztn32VrSJaNAtAsg5PTgmq9RLb0YqVXdRnpe9cT
	 IQD1aI9/9isEAxQPECazMxpHyv0N3e0yxei8fUm/CYt9LmP3+1Nx2v2svayptKBe3y
	 l0xeJ4UOJUKOQ==
Date: Fri, 10 Oct 2025 10:02:14 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Charles Mirabile <cmirabil@redhat.com>,
	da.gomez@samsung.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	masahiroy@kernel.org, mcgrof@kernel.org, petr.pavlu@suse.com,
	samitolvanen@google.com, sfr@canb.auug.org.au
Subject: Re: [PATCH v8 7/8] modpost: Create modalias for builtin modules
Message-ID: <aOi9hqyvMg4bmXAw@example.org>
References: <28d4da3b0e3fc8474142746bcf469e03752c3208.1758182101.git.legion@kernel.org>
 <20251007011637.2512413-1-cmirabil@redhat.com>
 <aOToOeNGiaFVM0Ds@example.org>
 <aOgSaNejdcBWKXx8@levanger>
 <20251010053736.GA447238@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010053736.GA447238@ax162>

On Thu, Oct 09, 2025 at 10:37:36PM -0700, Nathan Chancellor wrote:
> On Thu, Oct 09, 2025 at 09:52:08PM +0200, Nicolas Schier wrote:
> > On Tue, Oct 07, 2025 at 12:15:21PM +0200, Alexey Gladkov wrote:
> > > Hm. Indeed. I haven't found a good solution yet, but you can use the
> > > following patch to unlock compilation. It won't solve the problem, it will
> > > only hide it.
> > > 
> > > --- a/scripts/Makefile.vmlinux
> > > +++ b/scripts/Makefile.vmlinux
> > > @@ -84,7 +84,7 @@ endif
> > >  remove-section-y                                   := .modinfo
> > >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> > > 
> > > -remove-symbols := -w --strip-symbol='__mod_device_table__*'
> > > +remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
> > > 
> > >  # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
> > >  # it is necessary to remove the PT_LOAD flag from the segment.
> > > 
> > 
> > Is it problematic to hide that?  Otherwise we'd have to revert the
> > patch, right?
> 
> Yeah, I would much prefer to ending up with pointless
> __mod_device_table__ symbols in the final binary than erroring out
> during the build...

This is a very unpleasant problem, but it does not seem fatal. There will
not be many such characters in the final vmlinux. In the configuration
from the bug report, there are only:

$ nm vmlinux.unstripped.riscv |grep -c __mod_device_table__
17

Of course, this does not mean that the problem does not need to be solved.

> Does this happen with other architectures? I have
> not seen any reports yet but I have not tested anything yet.

LDFLAGS_vmlinux for riscv was taken from arm64. I suspect that there may
be the same problem there. But I haven't checked yet whether the problem
actually exists on arm64.

> Why is RISC-V special here?

This problem on riscv only occurs when CONFIG_RELOCATABLE=y is specified.
Without this parameter, everything will compile as expected.
 
> It seems like the relocation comes from the .LASANLOC4 symbol in
> .data.rel.local?
> 
>   $ llvm-objdump -Dr drivers/irqchip/irq-riscv-aplic-main.o
>   ...
>   Disassembly of section .data.rel.local:
>   ...
>   0000000000000130 <.LASANLOC4>:
>   ...
>        1c0: 0000          unimp
>           00000000000001c0:  R_RISCV_64   __mod_device_table__kmod_irq_riscv_aplic_main__acpi__aplic_acpi_match
>   ...
> 
> I cannot find much information about this ASANLOC outside of its
> location within the GCC sources, do we even need it? I don't see a way
> to opt out of this section altogether or on a per-variable basis, I
> wonder if there is some way to strip it out...

The aplic_acpi_match structure is indeed used, but they are used
themselves, not their alias, which is generated by the MODULE_DEVICE_TABLE
macro.

I also asked the guys from binutils for help:

https://sourceware.org/pipermail/binutils/2025-October/144782.html

> I plan to send the initial 6.18 Kbuild fixes pull request on Saturday.
> If we cannot figure out a real solution before then, maybe we can just
> switch to '--strip-unneeded-symbol' with a comment to upgrade that to
> '--strip-symbol' when possible?

Yes, that would be great.



Maybe I'm looking in the wrong direction, but still.

On riscv:

* with CONFIG_RELOCATABLE=y (where the error appears):

vmlinux.unstripped: ELF 64-bit LSB shared object, UCB RISC-V, RVC, soft-float ABI, version 1 (SYSV), dynamically linked, not stripped

* without CONFIG_RELOCATABLE:

vmlinux.unstripped: ELF 64-bit LSB executable, UCB RISC-V, RVC, soft-float ABI, version 1 (SYSV), statically linked, not stripped

On x64_64:

* with and without CONFIG_RELOCATABLE=y:

vmlinux.unstripped: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

-- 
Rgrds, legion


