Return-Path: <linux-kbuild+bounces-9174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF03BDEDD1
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 15:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76C3F3AC9E4
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 13:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C831121323C;
	Wed, 15 Oct 2025 13:56:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B5D1DFDE;
	Wed, 15 Oct 2025 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536570; cv=none; b=avpP8ZXLZ9l03YuGoLs/3Y+DeDdiFrumGZipQ8oxSlohXRhYhjei+2yJ9Gktw251+g8qef3TTbPRK8RLGGF4mjX/hvfgz21M2qtj5plOxWg+d34HWsENO5ipkfLRsuRjlb/EU6lPEVch4tszl+m4MAb0vjdcoTQ8TVr3g+ej8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536570; c=relaxed/simple;
	bh=6i31HR1v/IWR6Cv6X6HmC/6c67PGJzoIiH70ew790aY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QmRbhgF4wi+TmdP12OislzeOFro4xUdltM7VbZzR4uRHtMmdM2n8vEdFxDTOi6OiKTXLIsmCkQE8kEZFeZKrZ9TagzoB7ZK4fF4XiLUqDicFE2kk4W+hQIuTgzQH5wSYeSd3L6etvqqi+l8JP1/vxTNSc6RhhtivODFbiR6dmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1v91j2-000000003yq-08aR;
	Wed, 15 Oct 2025 13:39:32 +0000
Date: Wed, 15 Oct 2025 14:39:25 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: John Crispin <john@phrozen.org>, Alexey Gladkov <legion@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] kbuild: modules.builtin is empty on architectures without
 CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
Message-ID: <aO-kDdBybaHSn62G@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

While build todays net-next tree on a Lantiq-based board I use for
testing I run into a weird problem which gave me some headaches. It
turns there is a regression introduced in commit 39cfd5b12160 ("kbuild:
extract modules.builtin.modinfo from vmlinux.unstripped") which causes
both modules.builtin and modules.builtin.modinfo to be empty files on
certain architectures.

AFFECTED SCOPE:
===============
This bug affects all architectures where:
  1. CONFIG_ARCH_VMLINUX_NEEDS_RELOCS is NOT set, AND
  2. The architecture uses the standard ELF_DETAILS macro in its linker
     script (which places .modinfo at address 0 as a non-allocatable
     section)

This includes at least MIPS (32-bit and 64-bit) and likely several other
architectures. The issue does NOT affect architectures with
CONFIG_ARCH_VMLINUX_NEEDS_RELOCS=y (e.g., x86 with certain
configurations, parisc, s390).

OBSERVED BEHAVIOR:
==================
After a successful kernel build with the affected configuration:
  - modules.builtin: 0 bytes (empty)
  - modules.builtin.modinfo: 0 bytes (empty)
  - vmlinux.o: contains .modinfo section (verified with readelf)
  - vmlinux.unstripped: .modinfo section is MISSING (verified with
    readelf)

This breaks any build tooling that depends on modules.builtin to
determine which drivers are built into the kernel image, such as
OpenWrt's build system.

ROOT CAUSE ANALYSIS:
====================
Commit 39cfd5b12160 moved the extraction of modules.builtin.modinfo from
vmlinux.o to vmlinux.unstripped. The commit message states:

  "Currently, we assume all the data for modules.builtin.modinfo are
   available in vmlinux.o."

However, this change makes a NEW assumption that was not explicitly
documented or validated: it assumes that the .modinfo section will be
present in vmlinux.unstripped.

The problem occurs during the linking phase
(vmlinux.o -> vmlinux.unstripped):

1. The .modinfo section is defined in include/asm-generic/vmlinux.lds.h
   as part of ELF_DETAILS:

	.modinfo : { *(.modinfo) }

   This places it at address 0 (non-allocatable, similar to .comment,
   .symtab, etc.)

2. When CONFIG_ARCH_VMLINUX_NEEDS_RELOCS is NOT set, the Makefile does NOT
   add "--discard-none" to LDFLAGS_vmlinux (see Makefile line 1133-1135):

	ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
	LDFLAGS_vmlinux += --emit-relocs --discard-none
	endif

3. Without "--discard-none", the GNU linker (ld) applies its default
   behavior: it discards unreferenced sections with address 0 that are
   not marked as allocatable.

4. The .modinfo section is unreferenced from the linker's perspective
   (no code/data references it directly), so it gets discarded.

5. In scripts/Makefile.vmlinux line 107, objcopy attempts to extract
   .modinfo from vmlinux.unstripped:

	modules.builtin.modinfo: vmlinux.unstripped FORCE
	    $(call if_changed,objcopy)

   But since .modinfo was discarded, objcopy produces an empty file.

6. Subsequently, modules.builtin (which depends on
   modules.builtin.modinfo) is also empty.

WHY THE PREVIOUS CODE WORKED:
==============================
Before commit 39cfd5b12160, modules.builtin.modinfo was extracted from
vmlinux.o (in scripts/Makefile.vmlinux_o). The .modinfo section was
reliably present in vmlinux.o because:
  - vmlinux.o is the direct output of object file linking
  - No section stripping occurs at this stage
  - The section contains actual data (module metadata from __MODULE_INFO)

REPRODUCTION:
=============
1. Configure a kernel for MIPS (or any other architecture without
   CONFIG_ARCH_VMLINUX_NEEDS_RELOCS)
2. Ensure CONFIG_MODULES=y is set
3. Build the kernel: make
4. Observe: ls -lh modules.builtin modules.builtin.modinfo
   Both files will be 0 bytes

VERIFICATION:
=============
You can verify the .modinfo section presence:

  $ readelf -S vmlinux.o | grep modinfo
  [51265] .modinfo          PROGBITS        00000000 919448 00803e 00   A  0   0  1

  $ readelf -S vmlinux.unstripped | grep modinfo
  (no output - section is missing)

IMPACT:
=======
This is a build system regression that breaks kernel builds for downstream 
projects (like OpenWrt) that rely on modules.builtin. Since the file is 
silently empty rather than causing a build failure, it can lead to incorrect 
packaging and deployment decisions.

The regression is present in v6.18-rc1 and later kernels.

I'm happy to test any proposed patches. Please let me know if you need 
additional information or testing.

Best regards,
Daniel Golle

