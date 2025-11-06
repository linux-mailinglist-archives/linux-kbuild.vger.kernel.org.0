Return-Path: <linux-kbuild+bounces-9431-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8CC3AAD8
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 12:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF0874E1AA4
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 11:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78E1314D29;
	Thu,  6 Nov 2025 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kzcZb8SQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38903313528;
	Thu,  6 Nov 2025 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429733; cv=none; b=mllp2AZfiadEZzOixQ4V0GzwEZbyZmxWoUqmV7xtCVJs+sZLkq3TgSRS4n3qmLVE+jkm86XhbIPmG1UXXiU1bKslAZHePkA+nhXKS2ohE/RCtT4XGR0SYPoFdpAOYDMf9MU+99sVCTAfZqVoJ8jsXa/ZvOypDIEcbM8E1WFMZ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429733; c=relaxed/simple;
	bh=j7BStaRxwDAjCYBYFnVX7kISfxPEDMh+i6X+m+vT9Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhKv6FS0whnDTmiR2/+4xT/YqS67o87vn+5v0Dck3i7JKVTF7Vk6kzyLLCU9aSfng0aJ0OffSZMhNCC6Pid66yEy+11Ch1T11cQ7a5ZWZeLe2ObWeMefc7DB5JE2xuyGrIVoHdX3vQzzN2tS1xcpBVvLDzMYzIGSBkbO06mToXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kzcZb8SQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/N5SGmOLq1oiqPzqIkV4hiZWekuo+GJNLDsYMFqpx9c=; b=kzcZb8SQfBUtVO/Y7manVoMBqb
	YW+j6s6TadX7Bj7ksWs5DDPGD2yQ8hhEGY/TxXPqakfMAoPERFwAY37BX6roitPeERPaZHKWK9ueV
	nB68iu1DBV+4eGCqolwoOb697EQJ5moA5vdwXbVvVWhEbldiPSFoFvhYzAtUxL8m4Rdj+lIcRHJ75
	wk26wkA10HbrJHMsQsMSFEB7xxIvVXHvup+Su2q6ktej32myHdSVrDPQjVQv4TcUZffHAOYVHS3Gl
	GNaBwoTHgR+fNxYqHUavXN4lK0LxHRD6ZqJ9KxqynNknGQkhLZK0H9Qb/RBoKXTTZFj3iwoYP/zLn
	w5oFBh5w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGyTs-000000013a7-05zf;
	Thu, 06 Nov 2025 11:48:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3F64F300230; Thu, 06 Nov 2025 12:48:44 +0100 (CET)
Date: Thu, 6 Nov 2025 12:48:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251106114844.GT4067720@noisy.programming.kicks-ass.net>
References: <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
 <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
 <20251105100014.GY4068168@noisy.programming.kicks-ass.net>
 <20251105100202.GZ4068168@noisy.programming.kicks-ass.net>
 <20251105101010.GA4068168@noisy.programming.kicks-ass.net>
 <20251105170715.GA706366@ax162>
 <20251105191613.GA1831451@noisy.programming.kicks-ass.net>
 <20251105200923.GA3787308@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105200923.GA3787308@ax162>

On Wed, Nov 05, 2025 at 01:09:23PM -0700, Nathan Chancellor wrote:
> On Wed, Nov 05, 2025 at 08:16:13PM +0100, Peter Zijlstra wrote:
> > # make O=tmp-build clean
> > # make O=tmp-build allmodconfig
> > # make O=tmp-build -j64 vmlinux 2>&1 | grep "\[M\]"
> >   CC [M]  sound/sound_core.o
> >   CC [M]  virt/lib/irqbypass.o
> >   AS [M]  arch/x86/crypto/twofish-x86_64-asm_64.o
> >   CC [M]  arch/x86/crypto/twofish_glue.o
> >   CC [M]  samples/vfio-mdev/mtty.o
> >   CC [M]  sound/ac97_bus.o
> >   AS [M]  arch/x86/crypto/twofish-x86_64-asm_64-3way.o
> >   CC [M]  arch/x86/crypto/twofish_glue_3way.o
> 
> Thanks, I bisected this to commit d2d5cba5d92c ("kbuild: remove EXPERT
> and !COMPILE_TEST guarding from TRIM_UNUSED_KSYMS"), which explains
> everything when looking at Makefile:
> 
>   ifdef CONFIG_TRIM_UNUSED_KSYMS
>   # For the kernel to actually contain only the needed exported symbols,
>   # we have to build modules as well to determine what those symbols are.
>   KBUILD_MODULES := y
>   endif
> 
> Maybe we want to restore the !COMPILE_TEST dependency?

Urgh, yeah, I suppose we do want. This TRIM_UNUSED_KSYMS is cute if you
swing that way for a full build, but getting all modules built if you
just want a vmlinux is really somewhat unexpected.

