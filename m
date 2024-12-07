Return-Path: <linux-kbuild+bounces-5028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 905979E7F6F
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2024 10:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C85E28260E
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2024 09:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A557DA9F;
	Sat,  7 Dec 2024 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lTlGTO2l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B899F28FC;
	Sat,  7 Dec 2024 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733563975; cv=none; b=aocvFuzmjV20N+MTajfgT1s3lF/C0wyHhqE84y+7gOf2rhKyk43gzzXC87TdZXK9jwqr/uYquCScVbLQ/YeuqXR7PiYeTeSitakU/iJtOqB4s0VS9Jr5ojSMOvpY6RRtZYFIpvQJHki05We41fEmlrLDStZmE4FbXuBMvML4cvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733563975; c=relaxed/simple;
	bh=6DNqqp0BEEShzwNPt86T5uBRfbIexWScrWu5NvV+rDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUSz63eRH3jSKwjiQVvqC2/TJ/lC1BnpKyGdupRA0h5K5u+5gqv2yFFp3O0gRyJGyRr24csueRau7wvt7QGiKuACHzl38HhaE7ouh2E3ByWx72q8L3Iz4wK46xS1G2fARpJkeRx0MKNqAN2Ficm62SIz7L6tijoWcu5SxGpQlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lTlGTO2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8702C4CECD;
	Sat,  7 Dec 2024 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733563974;
	bh=6DNqqp0BEEShzwNPt86T5uBRfbIexWScrWu5NvV+rDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTlGTO2l+7HU+qP8XzJPRRIFxd6mVD3aeYyR9hH4I//Uh3N3i4YdbtdNVepd7Ic7S
	 01X/Cuy3MI9TV4BW9g0Sf0tlXuL8l6iRxPUWRrzD0wDQd9E10kx1LmubL9VeTfqKEj
	 fIXuDT6hXaIvx0BS0sOu4zYyv76NTsfda/v02Q7Y=
Date: Sat, 7 Dec 2024 10:32:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, stable@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where
 possible
Message-ID: <2024120748-preaching-reshape-06e9@gregkh>
References: <20241206085810.112341-1-chenhuacai@loongson.cn>
 <2024120635-wham-campsite-b62b@gregkh>
 <CAAhV-H4Db0tVrqcfXHceJeODgnK0ggHpx9_6vwXAAV0LohCD-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4Db0tVrqcfXHceJeODgnK0ggHpx9_6vwXAAV0LohCD-w@mail.gmail.com>

On Sat, Dec 07, 2024 at 05:21:00PM +0800, Huacai Chen wrote:
> Hi, Greg,
> 
> On Fri, Dec 6, 2024 at 9:04 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Dec 06, 2024 at 04:58:07PM +0800, Huacai Chen wrote:
> > > Backport this series to 6.1&6.6 because LoongArch gets build errors with
> > > latest binutils which has commit 599df6e2db17d1c4 ("ld, LoongArch: print
> > > error about linking without -fPIC or -fPIE flag in more detail").
> > >
> > >   CC      .vmlinux.export.o
> > >   UPD     include/generated/utsversion.h
> > >   CC      init/version-timestamp.o
> > >   LD      .tmp_vmlinux.kallsyms1
> > > loongarch64-unknown-linux-gnu-ld: kernel/kallsyms.o:(.text+0): relocation R_LARCH_PCALA_HI20 against `kallsyms_markers` can not be used when making a PIE object; recompile with -fPIE
> > > loongarch64-unknown-linux-gnu-ld: kernel/crash_core.o:(.init.text+0x984): relocation R_LARCH_PCALA_HI20 against `kallsyms_names` can not be used when making a PIE object; recompile with -fPIE
> > > loongarch64-unknown-linux-gnu-ld: kernel/bpf/btf.o:(.text+0xcc7c): relocation R_LARCH_PCALA_HI20 against `__start_BTF` can not be used when making a PIE object; recompile with -fPIE
> > > loongarch64-unknown-linux-gnu-ld: BFD (GNU Binutils) 2.43.50.20241126 assertion fail ../../bfd/elfnn-loongarch.c:2673
> > >
> > > In theory 5.10&5.15 also need this, but since LoongArch get upstream at
> > > 5.19, so I just ignore them because there is no error report about other
> > > archs now.
> >
> > Odd, why doesn't this affect other arches as well using new binutils?  I
> > hate to have to backport all of this just for one arch, as that feels
> > odd.
> The related binutils commit is only for LoongArch, so build errors
> only occured on LoongArch. I don't know why other archs have no
> problem exactly, but may be related to their CFLAGS (for example, if
> we disable CONFIG_RELOCATABLE, LoongArch also has no build errors
> because CFLAGS changes).

does LoongArch depend on that option?  What happens if it is enabled for
other arches?  Why doesn't it break them?

> On the other hand, Ard's original patches are not for LoongArch only,
> so I think backport to stable branches is also not for LoongArch only.

Maybe Ard can answer that.

thanks,

greg k-h

