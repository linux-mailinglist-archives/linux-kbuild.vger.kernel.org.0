Return-Path: <linux-kbuild+bounces-11413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3nlWDzMOnmkxTQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11413-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 21:46:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA57518C79C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 21:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 451F53033A9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 20:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B5F29BD88;
	Tue, 24 Feb 2026 20:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQrHKWTv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39ED86329;
	Tue, 24 Feb 2026 20:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965997; cv=none; b=MPKpYWmMbpI7JAuOUUaEA37eDT63aMm0sUwF9n6p36W5GeMEbnBKdsxY7LeIS4wiPT4hRU6pKjpKhAjlxQtPGsoGLJIw5f6oFl984TWpRbjfNv8o6/d4FQlI8rAatRIH5bI1EdD4fDE0SDG75uaJfnAqV6tKYKnlDAKCY8UcSNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965997; c=relaxed/simple;
	bh=jmOYHt9cC6ZpKvMGks7yUQ5i9q/IGQvo01Y/3L+Bs24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZ1LOW3iiZeODh343wC2CcZ+QSOA0YPQrirytuiN3ZCsFVAXTNAtJorJQoZM9ITEEE3iefRyLYX59gjc37+lWUYlUb70qz0QFYBGHkEYgVER5upgH0cZZb+3VWJi+d1FqtkeXpd2wPZm8x/+14tlTbxS8huh6KDgUnxCpA4z4jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQrHKWTv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A161C116D0;
	Tue, 24 Feb 2026 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771965996;
	bh=jmOYHt9cC6ZpKvMGks7yUQ5i9q/IGQvo01Y/3L+Bs24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQrHKWTv4H+wrJveLnpCfS/RRPovjTtpmdrOphe68F38sGjJC0aYsPdsbvOaEPjJD
	 zZ3bsTEGr9Qzt4u/c6pD6aZMu+PODtFLpS0yPAvooza3lMyBq9lRDxcec60lPu1kjB
	 GivLbVCOI1sXiX9BQsLs2H+v8QiG6j2S+zPaTih9jLFqcyyXynfBtPY+A+F9ELbp3A
	 M5tmc0c8fWq1ClDzTHJdU7RlfkPG5y95HPLz+5D2+EbY0cPJHgof8YdQNiTF2NB6Vx
	 2x460+7+rQ6jjAbuPLQ83czEaNCpNO53f84okSCAu14LNqu/+trOXyUFO+1b75yL1l
	 yp0wvWgoMel0A==
Date: Tue, 24 Feb 2026 13:46:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Ed W <lists@wildgooses.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	masahiroy@kernel.org,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: extlinux can't boot kernel after commit "kbuild: keep .modinfo
 section in vmlinux.unstripped"
Message-ID: <20260224204632.GA3510750@ax162>
References: <587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com>
 <3ac876ca-0038-41e8-a1a0-3d5434f30473@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ac876ca-0038-41e8-a1a0-3d5434f30473@leemhuis.info>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11413-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA57518C79C
X-Rspamd-Action: no action

Hi Ed and Thorsten,

On Tue, Feb 24, 2026 at 01:11:05PM +0100, Thorsten Leemhuis wrote:
> On 2/17/26 20:24, Ed W wrote:
> > Hi, I wonder if I can get some help debugging a problem post the following commit. After trying to
> > upgrade to a newer kernel build I encountered boot failures on my amd64 machine, booting via
> > extlinux and git bisect narrowed it down to this commit:
> 
> Thx for the report. Adding a few more recipients to this.

Thank you for the linux-kbuild CC, this somehow ended up in my spam box,
so I did not see it :/

> Two things are likely worth checking:
> 
> * Is 7.0-rc1 still affected?
> * If it's possible to revert the culprit in 7.0-rc1, does it fix the
> problem?

I doubt this change will cleanly revert on 7.0-rc1, as it was an early
patch in a series that touched a few places in Kbuild and it had several
follow up fixes.

> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.19.2&id=3e86e4d74c0490e5fc5a7f8de8f29e7579c9ffe5
> > kbuild: keep .modinfo section in vmlinux.unstripped
> 
> FWIW: Masahiro Yamada, that's a change of yours.

Masahiro has stepped away from regular kernel development and
maintenance:

  https://lore.kernel.org/20250804142007.776418-1-masahiroy@kernel.org/

So I will deal with this one, as I committed the series.

> > Keep the .modinfo section during linking, but strip it from the final vmlinux. 
> > Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms. 
> > This change will allow the next commit to extract the .modinfo section from the vmlinux.unstripped
> > intermediate.
> > 
> > 
> > The symptoms are that prior to this commit I can boot a kernel built using gcc-15 and binutils
> > 2.45.1, however, adding that commit, or trying kernels up to 6.18.12, all fail to boot the bzImage file.
> >  
> > Extlinux apparently won't read (or otherwise rejects as invalid) the resulting bzImage kernel with
> > error:
> >     failed: I/O error
> > So it doesn't even try to run the kernel, it appears to fail reading from disk (and presumably
> > locating the entry point for execution?)
> > 
> > Kernel is relocatable and hence ends up being built with 
> > VMLINUX_NEEDS_RELOCS=y
> > 
> > Curiously, if I build with clang then the resulting kernels all seem to work without a problem??
> > 
> > System is one of a cluster of Ryzen 9 5950X, but similar errors appear with older Ryzen 9 3900
> > boxes. Underlying OS is gentoo, so packages approximately as per latest releases with that.
> > 
> > I'm not sure how to narrow down what precisely triggers the boot failure though. For example I see
> > similar results to the following on both a working 6.17.0 and a broken 6.18.12
> > 
> > # readelf -l vmlinux | grep -A3 LOAD
> >   LOAD           0x0000000000200000 0xffffffff81000000 0x0000000001000000
> >                  0x0000000002a8b4d0 0x0000000002a8b4d0  R E    0x200000
> >   LOAD           0x0000000002e00000 0xffffffff83c00000 0x0000000003c00000
> >                  0x0000000001a00000 0x0000000001a00000  RW     0x200000
> >   NOTE           0x0000000002c8b47c 0xffffffff83a8b47c 0x0000000003a8b47c
> >                  0x0000000000000054 0x0000000000000054         0x4
> > 
> > On the non working 6.18.12 I see:
> > # readelf -S vmlinux.unstripped | grep modinfo
> >   [70] .modinfo          PROGBITS         ffffffff85600000  04800000
> > # readelf -S vmlinux | grep modinfo
> > 
> > So it seems as though the modinfo sectors ARE being stripped?!

Yes, that is expected. vmlinux.unstripped contains .modinfo for modpost
processing at build time but it is removed from vmlinux because it is
not needed at run time.

> > My guess is that something has moved or become re-ordered such that the extlinux is rejecting the
> > image?? 
> > 
> > At this point I'm honestly not quite sure what I am doing, so would some kind soul please help me
> > figure out what is happening? I apologise in advance that I've likely not given enough information
> > about the problem, please be gentle...

I think you provided good information off the bat, so no worries on that
front. I am not entirely positive that this is the root cause but now
that I am looking at it and have some additional context from a recent
7.0-rc1 commit [1], I think 3e86e4d74c04 adding .modinfo to ELF_DETAILS
and removing it from DISCARDS results in .modinfo appears in certain
places, namely arch/x86/boot/compressed/vmlinux, where it may not be
expected. Why that breaks this bootloader, not sure, but I don't really
think it matters. I think we should move .modinfo from ELF_DETAILS
(which may be used in other non-vmlinux linker scripts) to its own
macro, add that to all vmlinux linker scripts, and discard it from
places where it used to be properly discarded. More code but I think
it will result in fewer problems. As far as I can tell, this is the
reason that commit d50f21091358 ("kbuild: align modinfo section for
Secureboot Authenticode EDK2 compat") was needed and that change needed
a further follow up fix in commit a26a6c93edfe ("kbuild: Strip trailing
padding bytes from modules.builtin.modinfo"), so we could have saved
some headache from doing it right from the beginning.

Ed, could you test the below patch with your setup (it should apply
cleanly to 6.18.13, 6.19.3, or 7.0-rc1) and see if it resolves your
issue?

[1] ddc6cbef3ef1 ("s390/boot/vmlinux.lds.S: Ensure bzImage ends with SecureBoot trailer")

Cheers,
Nathan

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 2efa7dfc798a..2d136c63db16 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -71,6 +71,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 61a1b2b96e1d..6af63084ff28 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -123,6 +123,7 @@ SECTIONS
 	_end = . ;
 
 	STABS_DEBUG
+	MODINFO
 	ELF_DETAILS
 	DISCARDS
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index ad6133b89e7a..2964aad0362e 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -349,6 +349,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	HEAD_SYMBOLS
diff --git a/arch/csky/kernel/vmlinux.lds.S b/arch/csky/kernel/vmlinux.lds.S
index d718961786d2..81943981b3af 100644
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@ -109,6 +109,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/hexagon/kernel/vmlinux.lds.S b/arch/hexagon/kernel/vmlinux.lds.S
index 1150b77fa281..aae22283b5e0 100644
--- a/arch/hexagon/kernel/vmlinux.lds.S
+++ b/arch/hexagon/kernel/vmlinux.lds.S
@@ -62,6 +62,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 	.hexagon.attributes 0 : { *(.hexagon.attributes) }
 
diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/vmlinux.lds.S
index 08ea921cdec1..d0e1377a041d 100644
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -147,6 +147,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 #ifdef CONFIG_EFI_STUB
diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index 2624fc18c131..45d7f4b0177b 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -85,6 +85,7 @@ SECTIONS {
 	_end = .;
 
 	STABS_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	/* Sections to be discarded */
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index 1ccdd04ae462..7326586afe15 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -58,6 +58,7 @@ SECTIONS
   _end = . ;
 
   STABS_DEBUG
+  MODINFO
   ELF_DETAILS
 
   /* Sections to be discarded */
diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index f13ddcc2af5c..1b19fef201fb 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -51,6 +51,7 @@ __init_begin = .;
   _end = . ;
 
   STABS_DEBUG
+  MODINFO
   ELF_DETAILS
 
   /* Sections to be discarded */
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 2b708fac8d2c..579b2cc1995a 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -217,6 +217,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	/* These must appear regardless of  .  */
diff --git a/arch/nios2/kernel/vmlinux.lds.S b/arch/nios2/kernel/vmlinux.lds.S
index 37b958055064..206f92445bfa 100644
--- a/arch/nios2/kernel/vmlinux.lds.S
+++ b/arch/nios2/kernel/vmlinux.lds.S
@@ -57,6 +57,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/openrisc/kernel/vmlinux.lds.S b/arch/openrisc/kernel/vmlinux.lds.S
index 049bff45f612..9b29c3211774 100644
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -101,6 +101,7 @@ SECTIONS
 	/* Throw in the debugging sections */
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
         /* Sections to be discarded -- must be last */
diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/compressed/vmlinux.lds.S
index ab7b43990857..87d24cc824b6 100644
--- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -90,6 +90,7 @@ SECTIONS
 	/* Sections to be discarded */
 	DISCARDS
 	/DISCARD/ : {
+		*(.modinfo)
 #ifdef CONFIG_64BIT
 		/* temporary hack until binutils is fixed to not emit these
 		 * for static binaries
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index b445e47903cf..0ca93d6d7235 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -165,6 +165,7 @@ SECTIONS
 	_end = . ;
 
 	STABS_DEBUG
+	MODINFO
 	ELF_DETAILS
 	.note 0 : { *(.note) }
 
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 15850296c0a9..8fc11d6565bf 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -397,6 +397,7 @@ SECTIONS
 	_end = . ;
 
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 61bd5ba6680a..997f9eb3b22b 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -170,6 +170,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 	.riscv.attributes 0 : { *(.riscv.attributes) }
 
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 53bcbb91bb9b..2b62395e35bf 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -221,6 +221,7 @@ SECTIONS
 	/* Debugging sections.	*/
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	/*
diff --git a/arch/sh/kernel/vmlinux.lds.S b/arch/sh/kernel/vmlinux.lds.S
index 008c30289eaa..169c63fb3c1d 100644
--- a/arch/sh/kernel/vmlinux.lds.S
+++ b/arch/sh/kernel/vmlinux.lds.S
@@ -89,6 +89,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.lds.S
index f1b86eb30340..7ea510d9b42f 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -191,6 +191,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/um/kernel/dyn.lds.S b/arch/um/kernel/dyn.lds.S
index a36b7918a011..ad3cefeff2ac 100644
--- a/arch/um/kernel/dyn.lds.S
+++ b/arch/um/kernel/dyn.lds.S
@@ -172,6 +172,7 @@ SECTIONS
 
   STABS_DEBUG
   DWARF_DEBUG
+  MODINFO
   ELF_DETAILS
 
   DISCARDS
diff --git a/arch/um/kernel/uml.lds.S b/arch/um/kernel/uml.lds.S
index a409d4b66114..30aa24348d60 100644
--- a/arch/um/kernel/uml.lds.S
+++ b/arch/um/kernel/uml.lds.S
@@ -113,6 +113,7 @@ SECTIONS
 
   STABS_DEBUG
   DWARF_DEBUG
+  MODINFO
   ELF_DETAILS
 
   DISCARDS
diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
index 587ce3e7c504..e0b152715d9c 100644
--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -88,7 +88,7 @@ SECTIONS
 	/DISCARD/ : {
 		*(.dynamic) *(.dynsym) *(.dynstr) *(.dynbss)
 		*(.hash) *(.gnu.hash)
-		*(.note.*)
+		*(.note.*) *(.modinfo)
 	}
 
 	.got.plt (INFO) : {
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index d7af4a64c211..4ed82b1fe173 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -424,6 +424,7 @@ SECTIONS
 	.llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
 #endif
 
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 8ca130af301f..7b38ec8dc8dd 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -848,12 +848,14 @@
 
 /* Required sections not related to debugging. */
 #define ELF_DETAILS							\
-		.modinfo : { *(.modinfo) . = ALIGN(8); }		\
 		.comment 0 : { *(.comment) }				\
 		.symtab 0 : { *(.symtab) }				\
 		.strtab 0 : { *(.strtab) }				\
 		.shstrtab 0 : { *(.shstrtab) }
 
+#define MODINFO								\
+		.modinfo : { *(.modinfo) . = ALIGN(8); }
+
 #ifdef CONFIG_GENERIC_BUG
 #define BUG_TABLE							\
 	. = ALIGN(8);							\

