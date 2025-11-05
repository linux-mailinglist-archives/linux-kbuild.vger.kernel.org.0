Return-Path: <linux-kbuild+bounces-9404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC23C339D2
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 02:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CEB23A8560
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 01:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C707186329;
	Wed,  5 Nov 2025 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PM++pU91"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9340D1C01;
	Wed,  5 Nov 2025 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762305353; cv=none; b=jsSzN1SpVsK+Q7Aa1HEEdKHDTnzuKPMVDZvTRawtlaeQEoA+DSYwz37Xuvp3V0Q5RMJEGwR6LPnH1IIgpBDi+mILkmyDiy7x2wVViDgpqFxpAbJrXgUPoOcO27r32tpTjPEgT6APPtbd44gm83rpBY+bLvOU11Qr6GOtqu6xTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762305353; c=relaxed/simple;
	bh=CsnrgY3ow1Hsdj2YG4J6IqyXrFoqn9+/tjZzz9IhLCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2nysxwZf76ouzMNndT2euBDwIfcp+i4NROwbVs1NNGHsGoiGdZoeuGNKRJ7tZSW6N0WSq2C7DRP6p97ORbtBdRmAArqpYWAj9QyzwtsX3A9zgDpLMKmqUHNEFM/OfIKzAb2A3zptn3HKzD7cHNGKsWSOU1NS5mtT87E2tUXoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PM++pU91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0446C4CEF7;
	Wed,  5 Nov 2025 01:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762305353;
	bh=CsnrgY3ow1Hsdj2YG4J6IqyXrFoqn9+/tjZzz9IhLCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PM++pU91LAvtNQJIfUyhlZOSNF17Yd3ab6rJr8sfaxhsErPleehq7bycEMTMm0enL
	 qxpUhBEpivL0WFkzNy5gxuwOYeEDYwGxUsPaFQK+4a6zPItRYyFlQYsiUEhAHRinzs
	 BfBQtO3lbi+LplMpRqcMxfGLH0moakEijvjNGpxqsLFkYAFLzsFh5Qd99jUdmjJWgV
	 heevVRsbefj9gmhAFH4gGo3YFBMWqEueblCAfnsc0ZDRrZQ6mTH6+gsHifl+OFaKiH
	 1lJjQUwE4anZnIJkl5HxkJt2z8Qm8bptsu8pxcD/TXoe2SV6L0BI3rLldyGTVnl/YS
	 WOCZmGHkycUEw==
Date: Tue, 4 Nov 2025 18:15:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>,
	Omar Sandoval <osandov@osandov.com>
Cc: linux-kbuild@vger.kernel.org, Samir M <samir@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <20251105011548.GB769905@ax162>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <aQpCE_XTU-bZHFbk@telecaster>
 <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBHLUhJ5UVsN4-JN2PG=jq63yGttB9BD6Qm8MgvYirTvg_stw@mail.gmail.com>

On Tue, Nov 04, 2025 at 08:35:57PM +0000, Dimitri John Ledkov wrote:
> On Tue, 4 Nov 2025 at 18:12, Omar Sandoval <osandov@osandov.com> wrote:
> > drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
> > commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
> > vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
> > for some configurations, which confused drgn until I added a workaround
> > (https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c23013595d391a).
> > So there's some funkiness in this area.

Omar, could you provide me with a configuration file that reproduces
this for you? Is there an easy way to check for this situation on the
command line?

> The expectation is that said section is removed from the final binary.
> But the fact that it is present with 0 length, indicates incorrect
> linking. It also now makes sense why on x86/arm it is tripping up
> section alignment.

If I diff the output of 'llvm-readelf -e' for vmlinux.unstripped and
vmlinux when building 'ARCH=arm64 defconfig' using my suggested diff on
top of 6.18-rc4, I do see .modinfo get removed and I am not sure I see
an empty segment as a result?

diff --git a/tmp/.psub.Rg1zsq b/tmp/.psub.nGpcxI
index 2f079cb57f58..dcca71062760 100644
--- a/tmp/.psub.Rg1zsq
+++ b/tmp/.psub.nGpcxI
@@ -10,15 +10,15 @@ ELF Header:
   Version:                           0x1
   Entry point address:               0xffff800080000000
   Start of program headers:          64 (bytes into file)
-  Start of section headers:          157810560 (bytes into file)
+  Start of section headers:          156417384 (bytes into file)
   Flags:                             0x0
   Size of this header:               64 (bytes)
   Size of program headers:           56 (bytes)
-  Number of program headers:         5
+  Number of program headers:         4
   Size of section headers:           64 (bytes)
-  Number of section headers:         47
-  Section header string table index: 46
-There are 47 section headers, starting at offset 0x967ff80:
+  Number of section headers:         46
+  Section header string table index: 45
+There are 46 section headers, starting at offset 0x952bd68:
 
 Section Headers:
   [Nr] Name              Type            Address          Off    Size   ES Flg Lk Inf Al
@@ -56,19 +56,18 @@ Section Headers:
   [31] .mmuoff.data.read PROGBITS        ffff80008270b800 271b800 000008 00  WA  0   0  8
   [32] .pecoff_edata_padding PROGBITS    ffff80008270b808 271b808 0001f8 00   A  0   0  1
   [33] .bss              NOBITS          ffff80008270c000 271ba00 0ac970 00  WA  0   0 4096
-  [34] .debug_aranges    PROGBITS        0000000000000000 27d09d0 047550 00      0   0 16
-  [35] .debug_info       PROGBITS        0000000000000000 2817f20 38fdcf1 00      0   0  1
-  [36] .debug_abbrev     PROGBITS        0000000000000000 6115c11 4845e1 00      0   0  1
-  [37] .debug_line       PROGBITS        0000000000000000 659a1f2 1848e28 00      0   0  1
-  [38] .debug_frame      PROGBITS        0000000000000000 7de3020 3e2858 00      0   0  8
-  [39] .debug_str        PROGBITS        0000000000000000 81c5878 58f8cc 01  MS  0   0  1
-  [40] .debug_line_str   PROGBITS        0000000000000000 8755144 057ff7 01  MS  0   0  1
-  [41] .debug_rnglists   PROGBITS        0000000000000000 87ad13b 4d3fc6 00      0   0  1
-  [42] .modinfo          PROGBITS        ffff8000827d0000 2720000 0b09c8 00   A  0   0  1
-  [43] .comment          PROGBITS        0000000000000000 8c81101 000012 01  MS  0   0  1
-  [44] .symtab           SYMTAB          0000000000000000 8c81118 671a60 18     45 250028  8
-  [45] .strtab           STRTAB          0000000000000000 92f2b78 38d1f3 00      0   0  1
-  [46] .shstrtab         STRTAB          0000000000000000 967fd6b 000215 00      0   0  1
+  [34] .debug_aranges    PROGBITS        0000000000000000 271ba00 047550 00      0   0 16
+  [35] .debug_info       PROGBITS        0000000000000000 2762f50 38fdcf1 00      0   0  1
+  [36] .debug_abbrev     PROGBITS        0000000000000000 6060c41 4845e1 00      0   0  1
+  [37] .debug_line       PROGBITS        0000000000000000 64e5222 1848e28 00      0   0  1
+  [38] .debug_frame      PROGBITS        0000000000000000 7d2e050 3e2858 00      0   0  8
+  [39] .debug_str        PROGBITS        0000000000000000 81108a8 58f8cc 01  MS  0   0  1
+  [40] .debug_line_str   PROGBITS        0000000000000000 86a0174 057ff7 01  MS  0   0  1
+  [41] .debug_rnglists   PROGBITS        0000000000000000 86f816b 4d3fc6 00      0   0  1
+  [42] .comment          PROGBITS        0000000000000000 8bcc131 000012 01  MS  0   0  1
+  [43] .symtab           SYMTAB          0000000000000000 8bcc148 612990 18     44 233806  8
+  [44] .strtab           STRTAB          0000000000000000 91dead8 34d07e 00      0   0  1
+  [45] .shstrtab         STRTAB          0000000000000000 952bb56 00020c 00      0   0  1
 Key to Flags:
   W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
   L (link order), O (extra OS processing required), G (group), T (TLS),
@@ -77,21 +76,19 @@ Key to Flags:
 
 Elf file type is DYN (Shared object file)
 Entry point 0xffff800080000000
-There are 5 program headers, starting at offset 64
+There are 4 program headers, starting at offset 64
 
 Program Headers:
   Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
   LOAD           0x010000 0xffff800080000000 0xffff800080000000 0x11cc000 0x11cc000 R E 0x10000
   LOAD           0x11e0000 0xffff8000811d0000 0xffff8000811d0000 0x153ba00 0x15e8970 RWE 0x10000
-  LOAD           0x2720000 0xffff8000827d0000 0xffff8000827d0000 0x0b09c8 0x0b09c8 R   0x10000
   NOTE           0x1e83cf4 0xffff800081e73cf4 0xffff800081e73cf4 0x000054 0x000054 R   0x4
-  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x10
+  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x8
 
  Section to Segment mapping:
   Segment Sections...
    00     .head.text .text 
    01     .rodata .pci_fixup __ksymtab __ksymtab_gpl __ksymtab_strings __param __modver __ex_table .notes .hyp.rodata .got .got.plt .rodata.text .init.text .exit.text .altinstructions .init.data runtime_shift_d_hash_shift runtime_ptr_dentry_hashtable .data..percpu .hyp.data..percpu .hyp.reloc .rela.dyn .relr.dyn .data __bug_table .hyp.data .mmuoff.data.write .mmuoff.data.read .pecoff_edata_padding .bss 
-   02     .modinfo 
-   03     .notes 
-   04     
+   02     .notes 
+   03     
    None   .debug_aranges .debug_info .debug_abbrev .debug_line .debug_frame .debug_str .debug_line_str .debug_rnglists .comment .symtab .strtab .shstrtab 

> As it is likely that it is the same underlying issue that such segment
> exists in the first place.
> 
> I wonder if the original implementation of moving sections about and
> when/where the builtin module info is kept is not as tidy as it was
> intended to be.

This is entirely possible. It would be helpful to know why exactly this
is happening to be certain.

> I wonder if we should:
> - rollback to the state of how things were before that feature was added
> - keep the production / stripped / installed kernel build as is
> - reshuffle of how modinfo is preserved in the unstripped kernel with
> a bespoke linker script
> 
> Such that hopefully we have correct alignment, without any zero length segments.
> 
> Or possibly even link / split the built-in module info somewhere else entirely.
> 
> As in revert both:
> - d50f21091358b (kbuild: align modinfo section for Secureboot
> Authenticode EDK2 compat, 2025-10-26)
> - 3e86e4d74c049 (kbuild: keep .modinfo section in vmlinux.unstripped,
> 2025-09-18)
> 
> And try implementing the keeping of .modinfo section again.
> 
> Better structure tests, after linking would be nice to catch such
> issues, because linker scripts are hard and trying to understand how a
> linker script change affects the result.

I think if we cannot figure out these issues by -rc6 timeframe, it may
be worth reverting the entire builtin .modinfo series and trying again
for 6.20 (it will probably be too late for 6.19 at that point) but I
would like to avoid doing that to Alexey if possible. I am not sure the
zero length segment issue is worth an entire back out at this point
alone, as I have proposed a fix for the original issue brought up by
this thread.

Cheers,
Nathan

