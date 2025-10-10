Return-Path: <linux-kbuild+bounces-9070-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7CBCBBA8
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 07:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409B219E3E93
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 05:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B3F1F91D6;
	Fri, 10 Oct 2025 05:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mE/NCL8B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A0C1E5B88;
	Fri, 10 Oct 2025 05:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760074662; cv=none; b=Jgy5EAaR4WwAx0CmPgC/BhgsMelcFCAeWmSAqLKRVEgeQ3WogtQZwf0KeyWbP3PZfaecYskQY9i3hM8/RW05Q38TPTY66eNZGjXJSQ3/aaj5mrAayYlEIaM023WfB7ZZtp2oumHx56y3aPf4Je4HNoZN22XM5PA1QN+FYEqx1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760074662; c=relaxed/simple;
	bh=eSG/Q37AL9myTBhDnUGwpJwl96ThmygUixnMjqfFA7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaS2zUxDtZJUHHUgdgHDwxGuO/VVh/Hdugj/r85xfDoYL9HS+U+TfOm7kBl9/8LdpwwfICtW6ViZXnBMX1rdGsADhRmljMpP6XBlopn9LB11mKHJiXOxsygc7HrVFIVYPUkU7pXaExXBkhePP0LyowAzp8WSnmNLZZF54/IDyrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mE/NCL8B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37497C4CEF1;
	Fri, 10 Oct 2025 05:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760074661;
	bh=eSG/Q37AL9myTBhDnUGwpJwl96ThmygUixnMjqfFA7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mE/NCL8BB4pxQmbWQWld9vmyEKkzDTVph4kFYLT8D6CxOIunbO3lsKyifa7pUV+7l
	 C1OyCfMr1shXqOSaGvN1HIE3Xa+WQluhv3hWTL0BDu7MRrKoFRjvfxMP/evN1bKDm9
	 L5OsI03zPx3hHjXSCGDG2cTPG3JO/uUPO6ED5dXjkRvbG3gdpwWu6g7M5CaHHyS9Ck
	 qWTLqHRg97t1kBkuRYTwUEft6UBGWSHf5DEQpPmHO8Twr4HuYo/jJSFnGh5fEzSwsi
	 RfTCFRXZhINgXySpPI1hlTOp49aHh1zHl6B0X7dSvvVMAXhxzPJbMNw5EN719EvWhn
	 1QFsHhGMJ3Syw==
Date: Thu, 9 Oct 2025 22:37:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>, da.gomez@samsung.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, masahiroy@kernel.org,
	mcgrof@kernel.org, petr.pavlu@suse.com, samitolvanen@google.com,
	sfr@canb.auug.org.au
Subject: Re: [PATCH v8 7/8] modpost: Create modalias for builtin modules
Message-ID: <20251010053736.GA447238@ax162>
References: <28d4da3b0e3fc8474142746bcf469e03752c3208.1758182101.git.legion@kernel.org>
 <20251007011637.2512413-1-cmirabil@redhat.com>
 <aOToOeNGiaFVM0Ds@example.org>
 <aOgSaNejdcBWKXx8@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOgSaNejdcBWKXx8@levanger>

On Thu, Oct 09, 2025 at 09:52:08PM +0200, Nicolas Schier wrote:
> On Tue, Oct 07, 2025 at 12:15:21PM +0200, Alexey Gladkov wrote:
> > Hm. Indeed. I haven't found a good solution yet, but you can use the
> > following patch to unlock compilation. It won't solve the problem, it will
> > only hide it.
> > 
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -84,7 +84,7 @@ endif
> >  remove-section-y                                   := .modinfo
> >  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> > 
> > -remove-symbols := -w --strip-symbol='__mod_device_table__*'
> > +remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
> > 
> >  # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
> >  # it is necessary to remove the PT_LOAD flag from the segment.
> > 
> 
> Is it problematic to hide that?  Otherwise we'd have to revert the
> patch, right?

Yeah, I would much prefer to ending up with pointless
__mod_device_table__ symbols in the final binary than erroring out
during the build... Does this happen with other architectures? I have
not seen any reports yet but I have not tested anything yet. Why is
RISC-V special here?

It seems like the relocation comes from the .LASANLOC4 symbol in
.data.rel.local?

  $ llvm-objdump -Dr drivers/irqchip/irq-riscv-aplic-main.o
  ...
  Disassembly of section .data.rel.local:
  ...
  0000000000000130 <.LASANLOC4>:
  ...
       1c0: 0000          unimp
          00000000000001c0:  R_RISCV_64   __mod_device_table__kmod_irq_riscv_aplic_main__acpi__aplic_acpi_match
  ...

I cannot find much information about this ASANLOC outside of its
location within the GCC sources, do we even need it? I don't see a way
to opt out of this section altogether or on a per-variable basis, I
wonder if there is some way to strip it out...

I plan to send the initial 6.18 Kbuild fixes pull request on Saturday.
If we cannot figure out a real solution before then, maybe we can just
switch to '--strip-unneeded-symbol' with a comment to upgrade that to
'--strip-symbol' when possible?

Cheers,
Nathan

