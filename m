Return-Path: <linux-kbuild+bounces-9418-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E950C37048
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 18:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2594A1A26D74
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 17:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5251F337B8D;
	Wed,  5 Nov 2025 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9JYaLzy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215BE3431FC;
	Wed,  5 Nov 2025 17:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362440; cv=none; b=l9nvz12B4eBPCZDB99TfbF0y+331L7TS+mslr3xL80P6iy8ivGeIKL9y0tOj4WJGYwmC31AV2C14kwtv1l81nDs/1QLZ3ae3GN40xq8aKDfQMpACPpmVNDlUavRllT5BWp8UUSvCQ46BzoWjlzVVxlRXYUehvockXqJKtvCPa2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362440; c=relaxed/simple;
	bh=BELkoVxTs5SAwNyOCNROpeZoIObP8eqfaNIDaCrXlTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSVjCJldzpt5bA32EY8+vwLsnhd95H2VBIZOdN3UkDNu5SPuNB2pAs9U7r7vgVZsuQMh9+LU/kuVp4B2DSkdyXDcoRW2Z68701Y0XohLRRSZgvsBdvhYyTuKEEm3X6ouCKTcRCL9YkirItD9OR08myELYYj0FD0rO5BQB3KCqO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9JYaLzy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10107C116B1;
	Wed,  5 Nov 2025 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762362439;
	bh=BELkoVxTs5SAwNyOCNROpeZoIObP8eqfaNIDaCrXlTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9JYaLzy0zSC8AVFoextq9sVyCzeAXLwLbLjNmLaTh1XfftIxtZujWdXEvvZqfuN4
	 0q4v6IAks/5DQC8TajZB/6+PmyHiQDi+NeYtIHW0Rr0iglw+7rb0jV8UxksaB50Din
	 23sQD/vlS2RyrQedWpZsS5GAoQLYuDoEHH+LyXCB4DIVRGKYCpyxS6HCbZ7GbPXNGr
	 7rIQAVlyx5WwrnnIt6v6dY0chAUFOtu6uonFWwOgHmkxbCbw4Pe1xLyQQABorsR8bI
	 r0PhdqBOUViDZDKgLcgfGJvlk/rQBKHKkoOd/SfwK4q7PEmxXU+5ZAwhGH8+ehMsmt
	 fXuC1Dnc93oNw==
Date: Wed, 5 Nov 2025 10:07:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105170715.GA706366@ax162>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
 <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
 <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
 <20251105100014.GY4068168@noisy.programming.kicks-ass.net>
 <20251105100202.GZ4068168@noisy.programming.kicks-ass.net>
 <20251105101010.GA4068168@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105101010.GA4068168@noisy.programming.kicks-ass.net>

Hey Peter,

On Wed, Nov 05, 2025 at 11:10:10AM +0100, Peter Zijlstra wrote:
> + Nathan

Thanks for the heads up.

> On Wed, Nov 05, 2025 at 11:02:02AM +0100, Peter Zijlstra wrote:
> > Also, someone wrecked the build system.
> > 
> > vmlinux.o is no longer a valid build target, and the vmlinux target
> > seems to build a ton of module stuff :/

I tested the major stable releases (6.1, 6.6, and 6.12), long before
Nicolas and I took over Kbuild, and vmlinux.o does not work as a target
in any of them:

  $ make -skj"$(nproc)" ARCH=x86_64 mrproper
  $ make -skj"$(nproc)" ARCH=x86_64 defconfig
  $ make -skj"$(nproc)" ARCH=x86_64 vmlinux.o
  Makefile:1912: warning: overriding recipe for target 'vmlinux.o'
  Makefile:1150: warning: ignoring old recipe for target 'vmlinux.o'
  make[2]: *** No rule to make target 'vmlinux.o'.

When did this work? Is it configuration dependent? FWIW, it looks like
the 'vmlinux_o' targets does the right thing? I am not sure why it
exists instead of just vmlinux.o, Masahiro did that in commit
7a342e6c7735 ("kbuild: move modules.builtin(.modinfo) rules to
Makefile.vmlinux_o") in 6.1.

As for the second comment, if I build the vmlinux target, I see:

  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  CC      .vmlinux.export.o
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  KSYMS   .tmp_vmlinux0.kallsyms.S
  AS      .tmp_vmlinux0.kallsyms.o
  LD      .tmp_vmlinux1
  NM      .tmp_vmlinux1.syms
  KSYMS   .tmp_vmlinux1.kallsyms.S
  AS      .tmp_vmlinux1.kallsyms.o
  LD      .tmp_vmlinux2
  NM      .tmp_vmlinux2.syms
  KSYMS   .tmp_vmlinux2.kallsyms.S
  AS      .tmp_vmlinux2.kallsyms.o
  LD      vmlinux.unstripped
  NM      System.map
  SORTTAB vmlinux.unstripped
  OBJCOPY vmlinux
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin

at the end of the build with no instances of [M]. What "ton of module
stuff" are you seeing in your build? Also configuration dependent?

Cheers,
Nathan

