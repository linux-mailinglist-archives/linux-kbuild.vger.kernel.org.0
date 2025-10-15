Return-Path: <linux-kbuild+bounces-9176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE0BDFCE6
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 19:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAFBC3ACA72
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 17:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC027E076;
	Wed, 15 Oct 2025 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgGcDNdX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79BD1B532F;
	Wed, 15 Oct 2025 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760547953; cv=none; b=jku42gcWli5/moHiyFvCUHGWcjOSiyrUbv9DyXx3tJVp5i2yZBTMlRCRag40o18NO3eVinvoxHSKA0kZ5WB8/ppmhZMOdWbm5uXtGq2avKB4iOAawX1YvgRlhclNBJgMsp8hQi2IGYMsAAhav8oVeAhEHkT1mKR270qctmK74WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760547953; c=relaxed/simple;
	bh=byrDP4KW/mDr13JuOP6Ir4nB0N+mfEkhXYkP2pV0vRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUC3PS9G9tpkFn8iruFAzOdSAfFTo75nrzP3Kov8ElJJy3V5LZwKdjNfz+yvlh6uUmtUoHk2VxgoTMtxqxvyGLkjLAsqwDKLP8eS56jhT0wau7/gT/2C/ypijwe40xW55Xvf0L7aKrN3lgLt8Hi2H9SRr0tQvEoLChOEMEUMLyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgGcDNdX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13DCC4CEF8;
	Wed, 15 Oct 2025 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760547952;
	bh=byrDP4KW/mDr13JuOP6Ir4nB0N+mfEkhXYkP2pV0vRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgGcDNdXj+ee10Y0Qv9A9yUmdDn+R03T7rhD7//BQucSy4vwL1k7kJP10N3H85ZFp
	 Oeu2HFFrc742az2CuBKScmN/b4lubQxEystZ0GFEc0fLpUoYiuruF3D8/G2PheW8Yf
	 xYyHXmtpYG8TvwvJPMPne99mqKjfSzrZbHR/foPGvu9nOrB1m/Yo61iEkHkWKhl2Vd
	 S9gjx+vwVoFkLmsRnY+rpoWn91yOZJsHOwwfU6eqUYSOUzHK2Bk48z6c8M5VDARTAt
	 Pvj911o3HEGoG7nAZxKasUmXc+n4j1RVaTe614nWalgy2AyRBLebduwOgjcmSljEvN
	 /MjPGb/4Ysoew==
Date: Wed, 15 Oct 2025 19:05:43 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, John Crispin <john@phrozen.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] kbuild: modules.builtin is empty on architectures without
 CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
Message-ID: <aO_UZ6M_J9YMVuMI@example.org>
References: <aO-kDdBybaHSn62G@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO-kDdBybaHSn62G@makrotopia.org>

On Wed, Oct 15, 2025 at 02:39:25PM +0100, Daniel Golle wrote:
> Hi,
> 
> While build todays net-next tree on a Lantiq-based board I use for
> testing I run into a weird problem which gave me some headaches. It
> turns there is a regression introduced in commit 39cfd5b12160 ("kbuild:
> extract modules.builtin.modinfo from vmlinux.unstripped") which causes
> both modules.builtin and modules.builtin.modinfo to be empty files on
> certain architectures.
> 
> AFFECTED SCOPE:
> ===============
> This bug affects all architectures where:
>   1. CONFIG_ARCH_VMLINUX_NEEDS_RELOCS is NOT set, AND
>   2. The architecture uses the standard ELF_DETAILS macro in its linker
>      script (which places .modinfo at address 0 as a non-allocatable
>      section)
> 
> This includes at least MIPS (32-bit and 64-bit) and likely several other
> architectures. The issue does NOT affect architectures with
> CONFIG_ARCH_VMLINUX_NEEDS_RELOCS=y (e.g., x86 with certain
> configurations, parisc, s390).
> 
> OBSERVED BEHAVIOR:
> ==================
> After a successful kernel build with the affected configuration:
>   - modules.builtin: 0 bytes (empty)
>   - modules.builtin.modinfo: 0 bytes (empty)
>   - vmlinux.o: contains .modinfo section (verified with readelf)
>   - vmlinux.unstripped: .modinfo section is MISSING (verified with
>     readelf)
> 
> This breaks any build tooling that depends on modules.builtin to
> determine which drivers are built into the kernel image, such as
> OpenWrt's build system.
> 
> ROOT CAUSE ANALYSIS:
> ====================
> Commit 39cfd5b12160 moved the extraction of modules.builtin.modinfo from
> vmlinux.o to vmlinux.unstripped. The commit message states:
> 
>   "Currently, we assume all the data for modules.builtin.modinfo are
>    available in vmlinux.o."
> 
> However, this change makes a NEW assumption that was not explicitly
> documented or validated: it assumes that the .modinfo section will be
> present in vmlinux.unstripped.
> 
> The problem occurs during the linking phase
> (vmlinux.o -> vmlinux.unstripped):
> 
> 1. The .modinfo section is defined in include/asm-generic/vmlinux.lds.h
>    as part of ELF_DETAILS:
> 
> 	.modinfo : { *(.modinfo) }
> 
>    This places it at address 0 (non-allocatable, similar to .comment,
>    .symtab, etc.)
> 
> 2. When CONFIG_ARCH_VMLINUX_NEEDS_RELOCS is NOT set, the Makefile does NOT
>    add "--discard-none" to LDFLAGS_vmlinux (see Makefile line 1133-1135):
> 
> 	ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> 	LDFLAGS_vmlinux += --emit-relocs --discard-none
> 	endif
> 
> 3. Without "--discard-none", the GNU linker (ld) applies its default
>    behavior: it discards unreferenced sections with address 0 that are
>    not marked as allocatable.
> 
> 4. The .modinfo section is unreferenced from the linker's perspective
>    (no code/data references it directly), so it gets discarded.
> 
> 5. In scripts/Makefile.vmlinux line 107, objcopy attempts to extract
>    .modinfo from vmlinux.unstripped:
> 
> 	modules.builtin.modinfo: vmlinux.unstripped FORCE
> 	    $(call if_changed,objcopy)
> 
>    But since .modinfo was discarded, objcopy produces an empty file.
> 
> 6. Subsequently, modules.builtin (which depends on
>    modules.builtin.modinfo) is also empty.
> 
> WHY THE PREVIOUS CODE WORKED:
> ==============================
> Before commit 39cfd5b12160, modules.builtin.modinfo was extracted from
> vmlinux.o (in scripts/Makefile.vmlinux_o). The .modinfo section was
> reliably present in vmlinux.o because:
>   - vmlinux.o is the direct output of object file linking
>   - No section stripping occurs at this stage
>   - The section contains actual data (module metadata from __MODULE_INFO)
> 
> REPRODUCTION:
> =============
> 1. Configure a kernel for MIPS (or any other architecture without
>    CONFIG_ARCH_VMLINUX_NEEDS_RELOCS)
> 2. Ensure CONFIG_MODULES=y is set
> 3. Build the kernel: make
> 4. Observe: ls -lh modules.builtin modules.builtin.modinfo
>    Both files will be 0 bytes

Hm. At least on arm64, it doesn't reproduce with these parameters.

$ grep -w -e CONFIG_MODULES -e CONFIG_ARCH_VMLINUX_NEEDS_RELOCS .config
CONFIG_MODULES=y

$ ARCH=arm64 CROSS_COMPILE=aarch64-unknown-linux-gnu- make
/tmp/linux/Makefile:1133: CONFIG_ARCH_VMLINUX_NEEDS_RELOCS=""
  CALL    scripts/checksyscalls.sh
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin

$ ls -lh modules.builtin modules.builtin.modinfo 
-rw-r--r-- 1 legion legion 1.1K Oct 15 18:59 modules.builtin
-rw-r--r-- 1 legion legion  14K Oct 15 18:59 modules.builtin.modinfo

I'll try to reproduce it on mips.

> VERIFICATION:
> =============
> You can verify the .modinfo section presence:
> 
>   $ readelf -S vmlinux.o | grep modinfo
>   [51265] .modinfo          PROGBITS        00000000 919448 00803e 00   A  0   0  1
> 
>   $ readelf -S vmlinux.unstripped | grep modinfo
>   (no output - section is missing)
> 
> IMPACT:
> =======
> This is a build system regression that breaks kernel builds for downstream 
> projects (like OpenWrt) that rely on modules.builtin. Since the file is 
> silently empty rather than causing a build failure, it can lead to incorrect 
> packaging and deployment decisions.
> 
> The regression is present in v6.18-rc1 and later kernels.
> 
> I'm happy to test any proposed patches. Please let me know if you need 
> additional information or testing.
> 
> Best regards,
> Daniel Golle
> 

-- 
Rgrds, legion


