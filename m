Return-Path: <linux-kbuild+bounces-8980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B676CBA8EB7
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 12:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72BF23B7E52
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 10:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A613C2FCC04;
	Mon, 29 Sep 2025 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F5ixpPay"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061FD2FC031
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759142995; cv=none; b=WSjb73e4DIR9OdicqnPJRQytu03QjxNZPdVbwwSrzALyxpMo2X4xdPE2zpNwJv7y2xY2CQcRGl7XdMWp1w+N6DgIXaTmNU++fDzEcfSm1oJMUrO1Ahp6LcsnWvShy4aLnvAbfhmIb/HIZcTfDU3KnyYLScRgRmSJPdZgvRaQ4I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759142995; c=relaxed/simple;
	bh=e/0wPemZfVqiNjIZwBNplp+tpMbhytl5fUcDKhEUjh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEc78bhCaWnRRR4avXw0uAZyljGnMYYQQjq+yYq9GLFdqRbZ7hLBamqhznvxdcTXAwymbB3o4qM0JXZ8tp5H6EF+z2iyd4vaFd11/QnJy2TnPZD9i1z//5gAIY8YoIgS7NbniHT4thIsRkuqWe+m3XtI5tccsSwvFZmamVQgUVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F5ixpPay; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qzHDQ5E1BEhrB/Kyhc2CU746VNASWmSMFZRhiDzzUxY=; b=F5ixpPayZAyC6bvP+y5MerpI48
	F/QjGalzkRktcTBEJvEgp/7fU/pfCZyDFtoF4u1/VmElteyXY5hoFA492m3Tbdy5xh6YUyPUrmHgj
	23Gk29j7Eelt21VuJKDIbodTcw9mbFfR94r5Cw0KhTtnlJlGNr4UgzS8bMk+WKufzBjAQPp7241lt
	Ue9GqJ0qprXykBpjL3M7YzDKRTWCchrA/Y/QFjxpR7r86YGlWLDGinMoLKaSZKGU+YBBU4ovhq0vw
	AFQFKq7+COj0EMjfCOb4qUac15POXV1CEfI4C8seCVvj9U9C2WMpjZIoL6S/yoIhJSKd94ox2NSGZ
	dJJTLpIA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BRy-00000000HSo-0Bwp;
	Mon, 29 Sep 2025 10:49:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D000B300359; Mon, 29 Sep 2025 12:49:46 +0200 (CEST)
Date: Mon, 29 Sep 2025 12:49:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
	naveen@kernel.org, jpoimboe@kernel.org, npiggin@gmail.com,
	maddy@linux.ibm.com, segher@kernel.crashing.org,
	christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
	mahesh@linux.ibm.com
Subject: Re: [RFC PATCH v2 1/3] objtool/powerpc: Enhance objtool to fixup
 alternate feature relative addresses
Message-ID: <20250929104946.GG3289052@noisy.programming.kicks-ass.net>
References: <20250929080456.26538-1-sv@linux.ibm.com>
 <20250929080456.26538-2-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929080456.26538-2-sv@linux.ibm.com>

On Mon, Sep 29, 2025 at 01:34:54PM +0530, Sathvika Vasireddy wrote:
> Implement build-time fixup of alternate feature relative addresses for
> the out-of-line (else) patch code. Initial posting to achieve the same
> using another tool can be found at [1]. Idea is to implement this using
> objtool instead of introducing another tool since it already has elf
> parsing and processing covered.
> 
> Introduce --ftr-fixup as an option to objtool to do feature fixup at
> build-time.
> 
> Couple of issues and warnings encountered while implementing feature
> fixup using objtool are as follows:
> 
> 1. libelf is creating corrupted vmlinux file after writing necessary
> changes to the file. Due to this, kexec is not able to load new
> kernel.
> 
> It gives the following error:
>         ELF Note corrupted !
>         Cannot determine the file type of vmlinux
> 
> To fix this issue, after opening vmlinux file, make a call to
> elf_flagelf (e, ELF_C_SET, ELF_F_LAYOUT). This instructs libelf not
> to touch the segment and section layout. It informs the library
> that the application will take responsibility for the layout of the
> file and that the library should not insert any padding between
> sections.
> 
> 2. Fix can't find starting instruction warnings when run on vmlinux
> 
> Objtool throws a lot of can't find starting instruction warnings
> when run on vmlinux with --ftr-fixup option.
> 
> These warnings are seen because find_insn() function looks for
> instructions at offsets that are relative to the start of the section.
> In case of individual object files (.o), there are no can't find
> starting instruction warnings seen because the actual offset
> associated with an instruction is itself a relative offset since the
> sections start at offset 0x0.
> 
> However, in case of vmlinux, find_insn() function fails to find
> instructions at the actual offset associated with an instruction
> since the sections in vmlinux do not start at offset 0x0. Due to
> this, find_insn() will look for absolute offset and not the relative
> offset. This is resulting in a lot of can't find starting instruction
> warnings when objtool is run on vmlinux.
> 
> To fix this, pass offset that is relative to the start of the section
> to find_insn().
> 
> find_insn() is also looking for symbols of size 0. But, objtool does
> not store empty STT_NOTYPE symbols in the rbtree. Due to this,
> for empty symbols, objtool is throwing can't find starting
> instruction warnings. Fix this by ignoring symbols that are of
> size 0 since objtool does not add them to the rbtree.
> 
> 3. Objtool is throwing unannotated intra-function call warnings
> when run on vmlinux with --ftr-fixup option.
> 
> One such example:
> 
> vmlinux: warning: objtool: .text+0x3d94:
>                         unannotated intra-function call
> 
> .text + 0x3d94 = c000000000008000 + 3d94 = c0000000000081d4
> 
> c0000000000081d4: 45 24 02 48  bl c00000000002a618
> <system_reset_exception+0x8>
> 
> c00000000002a610 <system_reset_exception>:
> c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
>                         c00000000002a610: R_PPC64_REL16_HA    .TOC.
> c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
>                         c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
> c00000000002a618:       a6 02 08 7c     mflr    r0
> 
> This is happening because we should be looking for destination
> symbols that are at absolute offsets instead of relative offsets.
> After fixing dest_off to point to absolute offset, there are still
> a lot of these warnings shown.
> 
> In the above example, objtool is computing the destination
> offset to be c00000000002a618, which points to a completely
> different instruction. find_call_destination() is looking for this
> offset and failing. Instead, we should be looking for destination
> offset c00000000002a610 which points to system_reset_exception
> function.
> 
> Even after fixing the way destination offset is computed, and
> after looking for dest_off - 0x8 in cases where the original offset
> is not found, there are still a lot of unannotated intra-function
> call warnings generated. This is due to symbols that are not
> properly annotated.
> 
> So, for now, as a hack to curb these warnings, do not emit
> unannotated intra-function call warnings when objtool is run
> with --ftr-fixup option.

Should not all those fixes be split out into separate patches? Also,
Changelog seems to have lost the bit where you explain *why* you need
this. IIRC Nick's original tool had a description of why this is needed.

Also, please see:

  https://lkml.kernel.org/r/9500b90c4182b03da59472e1a27876818610b084.1758067942.git.jpoimboe@kernel.org

  https://lkml.kernel.org/r/457c2e84b81bd6515aaa60ec8e9e0cc892ed7afa.1758067942.git.jpoimboe@kernel.org



