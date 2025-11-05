Return-Path: <linux-kbuild+bounces-9421-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA2C37716
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 20:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9EAEF34E955
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 19:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFE733DEF3;
	Wed,  5 Nov 2025 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W94hmpWc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71947335567;
	Wed,  5 Nov 2025 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762370179; cv=none; b=ByPlb7mT7LS+O4DhwCuA/wm0nL3sn55kB8rDxpvEC7Kr8KlzLGKw9PHzhOjdk1wRlu5AKMNMPAdYT2SQypp8XCZ4sTl/bMdQ56IieiSG/Uu6BqDT1QDD+gbbNUQrNQsXM+uCDqS9gns76wvubekLU7QkE8p75V30lu7RjWW0yr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762370179; c=relaxed/simple;
	bh=LvFCw2GT3XSKjjbezDneebu0Zzj2K249jCRRso+s0/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flPP8IfMndMSijuQ2OS3NgzZYaCu543lW0OVvi8m5pM+RBZv8EHwxrUoZY4lvsbDag1RG2/weYjxAt68ILGC6ZJCdSou4ZJVPzoClsiEclYoc7YzuzjdzjFxhgKs4YHpdO8RIq5RRNAqf3liFGhkox0i6cexvbDXG1LQhnee+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W94hmpWc; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y9nnRAMUrIWQISQm8qOZ3DHfH7zNFoiFJNKHLmrXVU8=; b=W94hmpWcKE/3rDJ4fjm+B1arFf
	gsUk0+R3nAphcDGlZR67gTwSXK4XiyjIkmP7c1uAmGCzkAcpM+64qwFePLIVvz9vAkANR1TEAziQJ
	5R7IWBUoQisKmjmv/1hf0BUDYMwR99ypvKt8u1YjFUacxKIGNacsxTRYNJ43gG5g+vCiyX5S0uLif
	/vSlDpN8MLrcQL4I+9g4ITuKAGRExYA7KwIFKRPQjP4HDKkJG5AAnVwiNiM/6ZYd2l1hcjiHUgPOP
	Fl9az1dNveiq7FDJ2YWxSGQ/dDS9jKcUlIN8j3NePGVlIrOSTONqwkUMpSNDfDYHw/3f5OBpYGFIS
	mvx34EqA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGi7h-00000002nKX-2Lf8;
	Wed, 05 Nov 2025 18:20:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B3EB43001D4; Wed, 05 Nov 2025 20:16:13 +0100 (CET)
Date: Wed, 5 Nov 2025 20:16:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105191613.GA1831451@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
 <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
 <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
 <20251105100014.GY4068168@noisy.programming.kicks-ass.net>
 <20251105100202.GZ4068168@noisy.programming.kicks-ass.net>
 <20251105101010.GA4068168@noisy.programming.kicks-ass.net>
 <20251105170715.GA706366@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105170715.GA706366@ax162>

On Wed, Nov 05, 2025 at 10:07:15AM -0700, Nathan Chancellor wrote:

>   $ make -skj"$(nproc)" ARCH=x86_64 vmlinux.o
>   Makefile:1912: warning: overriding recipe for target 'vmlinux.o'
>   Makefile:1150: warning: ignoring old recipe for target 'vmlinux.o'
>   make[2]: *** No rule to make target 'vmlinux.o'.
> 
> When did this work? 

Dunno, I have vague memories of it working. The only reason I tried
is that vmlinux seems to be misbehaving.

> As for the second comment, if I build the vmlinux target, I see:
> 
>   AR      built-in.a
>   AR      vmlinux.a
>   LD      vmlinux.o
>   MODPOST vmlinux.symvers
>   CC      .vmlinux.export.o
>   UPD     include/generated/utsversion.h
>   CC      init/version-timestamp.o
>   KSYMS   .tmp_vmlinux0.kallsyms.S
>   AS      .tmp_vmlinux0.kallsyms.o
>   LD      .tmp_vmlinux1
>   NM      .tmp_vmlinux1.syms
>   KSYMS   .tmp_vmlinux1.kallsyms.S
>   AS      .tmp_vmlinux1.kallsyms.o
>   LD      .tmp_vmlinux2
>   NM      .tmp_vmlinux2.syms
>   KSYMS   .tmp_vmlinux2.kallsyms.S
>   AS      .tmp_vmlinux2.kallsyms.o
>   LD      vmlinux.unstripped
>   NM      System.map
>   SORTTAB vmlinux.unstripped
>   OBJCOPY vmlinux
>   OBJCOPY modules.builtin.modinfo
>   GEN     modules.builtin

# make O=tmp-build clean
# make O=tmp-build allmodconfig
# make O=tmp-build -j64 vmlinux 2>&1 | grep "\[M\]"
  CC [M]  sound/sound_core.o
  CC [M]  virt/lib/irqbypass.o
  AS [M]  arch/x86/crypto/twofish-x86_64-asm_64.o
  CC [M]  arch/x86/crypto/twofish_glue.o
  CC [M]  samples/vfio-mdev/mtty.o
  CC [M]  sound/ac97_bus.o
  AS [M]  arch/x86/crypto/twofish-x86_64-asm_64-3way.o
  CC [M]  arch/x86/crypto/twofish_glue_3way.o

