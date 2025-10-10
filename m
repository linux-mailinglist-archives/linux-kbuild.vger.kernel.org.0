Return-Path: <linux-kbuild+bounces-9073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA338BCC9FD
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 12:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECEBE1A6196F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3599A286897;
	Fri, 10 Oct 2025 10:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pusbB5hd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108C220698;
	Fri, 10 Oct 2025 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093918; cv=none; b=Lvprk/rutUkHrLdNqqSFufp7H+0mN1H4YKaCz8gFooRQl4hfZsJdqZAQA2yXk+mGaPUhLJ5zGjUf5skEBo0YgAtQrGuEEKv52UuRGqvEz60+xTlCEtya+bD5K1p4ZfpaDyEOT7KH7QZCYi8lPzREq1CoEYTF5ltOLZGpXE5UIHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093918; c=relaxed/simple;
	bh=pcvcYrMqBiwXSvllWuqT/xk5871QOq1jg4KfRAUYz4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUHGVQ+pVSAvSUp3R2eZosQ+6pd0dNN3Mc6J8HJ2znwLvKdzccoHaCAZzcXj8cmUPFw98p2AobtsvhPmEwgo44fqazaj/EexLeW5gpLXIyiyskIm/z6kmJIpa2mE947fO6/3sI8bR9i0Urlel1v2JVbvRyhwQHUK73On+9MxL24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pusbB5hd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD73C4CEF1;
	Fri, 10 Oct 2025 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760093917;
	bh=pcvcYrMqBiwXSvllWuqT/xk5871QOq1jg4KfRAUYz4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pusbB5hd0qgHZ1SEpuPaZi3Tk3BKxGz63vAWHJeo9jU+baW0qFu+68BbYuebCD96C
	 1U6t55yOddpp8N90AlKznTmmTvk/Fxt/MxOLa+1H8G2r6lQcjFbOXovRi5pyaqzS4D
	 LmMUM11gFyIwM9V7mjML4LHs0aVPFDnLwGq9OiGWCQNtugM1E+XdiHLXAFmEcGAvJa
	 yWaP+Q/nHvUaO2kFZx1xz5Ofs953HJaJWxsa0Q0hBs9fPsrqAyXmdusHwdvIWDwSAc
	 R6brOFakkMpZYwsltg3/0qXxUcYFzbbnZVPsM1M2lXBY3cWiRpuKoRrF0XRK4Rq+mQ
	 4Qixq4lCLp9DA==
Date: Fri, 10 Oct 2025 12:58:31 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Charles Mirabile <cmirabil@redhat.com>,
	da.gomez@samsung.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	masahiroy@kernel.org, mcgrof@kernel.org, petr.pavlu@suse.com,
	samitolvanen@google.com, sfr@canb.auug.org.au
Subject: Re: [PATCH v8 7/8] modpost: Create modalias for builtin modules
Message-ID: <aOjm15pZ5SXm1I_X@example.org>
References: <28d4da3b0e3fc8474142746bcf469e03752c3208.1758182101.git.legion@kernel.org>
 <20251007011637.2512413-1-cmirabil@redhat.com>
 <aOToOeNGiaFVM0Ds@example.org>
 <aOgSaNejdcBWKXx8@levanger>
 <20251010053736.GA447238@ax162>
 <aOi9hqyvMg4bmXAw@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOi9hqyvMg4bmXAw@example.org>

On Fri, Oct 10, 2025 at 10:02:20AM +0200, Alexey Gladkov wrote:
> On Thu, Oct 09, 2025 at 10:37:36PM -0700, Nathan Chancellor wrote:
> > On Thu, Oct 09, 2025 at 09:52:08PM +0200, Nicolas Schier wrote:
> > > On Tue, Oct 07, 2025 at 12:15:21PM +0200, Alexey Gladkov wrote:
> > > > Hm. Indeed. I haven't found a good solution yet, but you can use the
> > > > following patch to unlock compilation. It won't solve the problem, it will
> > > > only hide it.
> > > > 
> > > > --- a/scripts/Makefile.vmlinux
> > > > +++ b/scripts/Makefile.vmlinux
> > > > @@ -84,7 +84,7 @@ endif
> > > >  remove-section-y                                   := .modinfo
> > > >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> > > > 
> > > > -remove-symbols := -w --strip-symbol='__mod_device_table__*'
> > > > +remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
> > > > 
> > > >  # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
> > > >  # it is necessary to remove the PT_LOAD flag from the segment.
> > > > 
> > > 
> > > Is it problematic to hide that?  Otherwise we'd have to revert the
> > > patch, right?
> > 
> > Yeah, I would much prefer to ending up with pointless
> > __mod_device_table__ symbols in the final binary than erroring out
> > during the build...
> 
> This is a very unpleasant problem, but it does not seem fatal. There will
> not be many such characters in the final vmlinux. In the configuration
> from the bug report, there are only:
> 
> $ nm vmlinux.unstripped.riscv |grep -c __mod_device_table__
> 17
> 
> Of course, this does not mean that the problem does not need to be solved.
> 
> > Does this happen with other architectures? I have
> > not seen any reports yet but I have not tested anything yet.
> 
> LDFLAGS_vmlinux for riscv was taken from arm64. I suspect that there may
> be the same problem there. But I haven't checked yet whether the problem
> actually exists on arm64.

I tried to compile the kernel for arm64 with CONFIG_RELOCATABLE=y.
It works without errors and the symbols are removed.

vmlinux.unstripped: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), statically linked, not stripped

-- 
Rgrds, legion


