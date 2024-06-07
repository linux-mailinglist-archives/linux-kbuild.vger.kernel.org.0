Return-Path: <linux-kbuild+bounces-2029-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8370900AAC
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 18:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 659AC1F22675
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 16:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B6E1974F7;
	Fri,  7 Jun 2024 16:47:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE99819AA6A;
	Fri,  7 Jun 2024 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717778855; cv=none; b=ixiV+tCMX8CzJuu+fuPXILiynM9o3r/QIMaEtNiPAsg6TPb/R4Atmw+nPZmLcdGtX2kUtuZcR4z4u2sjxofNMsObHsHMnvJk3QiAiGlpZF8be+u7+Gd1tQlrgTOXjgTX9SscFpz2uUyXtXuFcJ0DrMQEJ2OlzTXiCQVwTY1Gu3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717778855; c=relaxed/simple;
	bh=ORWpYE0If+xvTrgGuCjCMCvUAtaesfIGd43R5HKRp+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iagNHJdk7BL1T5DXy0JOucs4JQ6q0XxKiUzXb0opbvpRZHW/yhU2Dt+qDQOuHlrsW5dKp8tOoE16uy4rv3ZJLpsyRcRqG84noPS+yVr1Jt9Q1ZAfqTDgP0eHGIGWYDE5XD9ZeRxlWZlY+we7Uvqyzx3CMFyF/dxD3I6Qok8mMZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 457Ffa1j010762;
	Fri, 7 Jun 2024 10:41:36 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 457FfXv6010759;
	Fri, 7 Jun 2024 10:41:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 7 Jun 2024 10:41:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
        Nicholas Piggin <npiggin@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
Message-ID: <20240607154133.GD19790@gate.crashing.org>
References: <20240607061629.530301-1-arnd@kernel.org> <87frtoq5yz.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frtoq5yz.fsf@mail.lhotse>
User-Agent: Mutt/1.4.2.3i

On Fri, Jun 07, 2024 at 10:42:44PM +1000, Michael Ellerman wrote:
> I use the korg toolchains every day, and kisskb uses them too.
> 
> What commit / defconfig are you seeing the errors with?
> 
> Is it just the 12.3.0 toolchain or all of them? I just tested 12.3.0
> here and it built OK.
> 
> I guess you're building on x86 or arm64? I build on ppc64le, I wonder if
> that makes a difference.

The core problem of course is pre-processing a linker script with the
C preprocessor (although linker scripts themselves have much more
capable facilities for this), and by doing this as-if it was a piece of
assembler code that for some strange reason you want fed through the C
preprocessor (as .S file).

What is it the C preprocessor is wanted for here?  Is there nothing
better that can be done?

> The patch is probably OK regardless, but I'd rather understand what the
> actual problem is.

Yeah.  The problem was found later in the thread (the CPP env var, or
shell var anyway, not sure what it is here) was set.  Fun and
surprising!  If you do nnot like such fun all that much, reduce the
surface of eternal surprise?  (I don't like saying "attack surface", but
that is what it is as well).


Segher

