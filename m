Return-Path: <linux-kbuild+bounces-9068-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3CBCAD35
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 22:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EBE61885455
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 20:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B23273D84;
	Thu,  9 Oct 2025 20:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khiAb8cx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546627381B;
	Thu,  9 Oct 2025 20:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760042646; cv=none; b=rGkoMd/g/tTMwW9yLHRGsAjXeCf6p22kqyFjWjgXhmCALsm68/Ll1lUiQyq2nyJ0GgnLWF9tWMW6ZTGDqMuP3a8/D8OSGzk2kv1y43vc66odFFKo9uB2tXfcVd46E8yQVFuB9NmQYWEQN6HQAAkFSksOaxCRWsMnjxE88ilz270=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760042646; c=relaxed/simple;
	bh=q8tFl6oZrOiukZrjzXaSgvTq62o9cwQSbuh7QhRvhrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlTtYyVvH4dX0bq3rBY6kx1B/ks1uLZsh2aRA8LdP5+ke23Cg56smOK0wWN8rA+av1SBtpEKgYhI/sFoml1wZ+AghYNzRqDgKoffEn5kKQuQSdluPymn+ZTQBy6YiPfSeO2T5OvZt0/iN9WOmrm8mam0Qt7AAaXHRdExJKx4zEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khiAb8cx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB672C4CEE7;
	Thu,  9 Oct 2025 20:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760042646;
	bh=q8tFl6oZrOiukZrjzXaSgvTq62o9cwQSbuh7QhRvhrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khiAb8cxLTnThu3Krtfc39RUO3L4LY3itWb88cR4z7tIboEJ03CiihinESdvU9iiF
	 zr505XfLD2Vr3ltm0FYnJ1AmwgVFAhF6zWczQ7Iw6liq+85bX5reRIylG8wdTjecGJ
	 uvV8JGEjg/lJjxs38Y2JWHmQzspgoatDrR6gWNZrehxtrHK42OxIJqxRnmsXXXp13Q
	 bNnJlnu56epaimf6aDGcyBCQy3Fbtg7hbNp3qRZ/YD1x5ESiAcBnTyhaqqWmM/VXn3
	 ftCrYPoZRzJ1JYCcZkVF7tefpRb40sP9nJnhYJl6rI6yrqCRqy6QBlZcgdOZbnFG84
	 nubQIjHHqwpQA==
Date: Thu, 9 Oct 2025 21:52:08 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Charles Mirabile <cmirabil@redhat.com>, da.gomez@samsung.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, masahiroy@kernel.org,
	mcgrof@kernel.org, nathan@kernel.org, petr.pavlu@suse.com,
	samitolvanen@google.com, sfr@canb.auug.org.au
Subject: Re: [PATCH v8 7/8] modpost: Create modalias for builtin modules
Message-ID: <aOgSaNejdcBWKXx8@levanger>
References: <28d4da3b0e3fc8474142746bcf469e03752c3208.1758182101.git.legion@kernel.org>
 <20251007011637.2512413-1-cmirabil@redhat.com>
 <aOToOeNGiaFVM0Ds@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOToOeNGiaFVM0Ds@example.org>

On Tue, Oct 07, 2025 at 12:15:21PM +0200, Alexey Gladkov wrote:
> On Mon, Oct 06, 2025 at 09:16:37PM -0400, Charles Mirabile wrote:
> > On Thu, Sep 18, 2025 at 10:05:51AM +0200, Alexey Gladkov wrote:
> > > For some modules, modalias is generated using the modpost utility and
> > > the section is added to the module file.
> > > 
> > > When a module is added inside vmlinux, modpost does not generate
> > > modalias for such modules and the information is lost.
> > > 
> > > As a result kmod (which uses modules.builtin.modinfo in userspace)
> > > cannot determine that modalias is handled by a builtin kernel module.
> > > 
> > > $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> > > pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> > > 
> > > $ modinfo xhci_pci
> > > name:           xhci_pci
> > > filename:       (builtin)
> > > license:        GPL
> > > file:           drivers/usb/host/xhci-pci
> > > description:    xHCI PCI Host Controller Driver
> > > 
> > > Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> > > modpost if the module is built separately.
> > > 
> > > To fix this it is necessary to generate the same modalias for vmlinux as
> > > for the individual modules. Fortunately '.vmlinux.export.o' is already
> > > generated from which '.modinfo' can be extracted in the same way as for
> > > vmlinux.o.
> > 
> > Hi -
> > 
> > This patch broke RISC-V builds for me. During the final objcopy where the new
> > symbols are supposed to be stripped, an error occurs producing lots of error
> > messages similar to this one:
> > 
> > riscv64-linux-gnu-objcopy: not stripping symbol `__mod_device_table__...'
> > because it is named in a relocation
> > 
> > It does not occur using defconfig, but I was able to bisect my way to this
> > commit and then reduce my config delta w.r.t defconfig until I landed on:
> > 
> > cat > .config <<'EOF'
> > CONFIG_RELOCATABLE=y
> > CONFIG_KASAN=y
> > EOF
> > ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- make olddefconfig
> > ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- make -j $(nproc)
> > ...
> >   LD      vmlinux.unstripped
> >   NM      System.map
> >   SORTTAB vmlinux.unstripped
> >   CHKREL  vmlinux.unstripped
> >   OBJCOPY vmlinux
> >   OBJCOPY modules.builtin.modinfo
> >   GEN     modules.builtin
> > riscv64-linux-gnu-objcopy: not stripping symbol `<long symbol name>'
> > because it is named in a relocation
> > <repeats with different symbol names about a dozen times>
> > make[3]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error 1
> > make[3]: *** Deleting file 'vmlinux'
> > make[2]: *** [Makefile:1242: vmlinux] Error 2
> > make[1]: *** [/tmp/linux/Makefile:369: __build_one_by_one] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> > 
> > I confirmed that reverting this commit fixes the issue.

Thanks for the report!

> 
> Hm. Indeed. I haven't found a good solution yet, but you can use the
> following patch to unlock compilation. It won't solve the problem, it will
> only hide it.
> 
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -84,7 +84,7 @@ endif
>  remove-section-y                                   := .modinfo
>  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> 
> -remove-symbols := -w --strip-symbol='__mod_device_table__*'
> +remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
> 
>  # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
>  # it is necessary to remove the PT_LOAD flag from the segment.
> 

Is it problematic to hide that?  Otherwise we'd have to revert the
patch, right?

Kind regards,
Nicolas


