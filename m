Return-Path: <linux-kbuild+bounces-5023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8A9E6ED4
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 14:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF693284361
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 13:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02BD206F10;
	Fri,  6 Dec 2024 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kN7DvgOB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEAA1EE02E;
	Fri,  6 Dec 2024 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490256; cv=none; b=jojktOnkvcZHG95e5eCpcDQMYwC6e6tfT6nbx3FSMjwQ/4eIxweeqmmlXrlEh3RPmLF7GK56agzyHvntGn9hTB1JyMF6OdHoMGCgz4nPO5B/V5O8a5B/ItFihMNZS0sWvliKpW+iiYMNsHUqEooWxCnzLXd4ij5uHpEAS2EdNVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490256; c=relaxed/simple;
	bh=gJMFTn5WLa0s3prw0ucaZuCAbEut3+7nW6zrckqI3mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeU+hkjzqQY3GFqMRPd4gZ8X6n4BHwqkpE5NkQWhnnzWu2y2Hu+QhIe0R1XVMGE/U9GqJyTIbnC5rMNyvI/V2QWNdI7n/4QiBSb3nssMYgjg7GjPm60AGiFNopy4MqfHkzYTSedbV/tOQHWpK5g1y8TZXgHTufZeYNGxqZH4vHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kN7DvgOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345C6C4CED2;
	Fri,  6 Dec 2024 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733490255;
	bh=gJMFTn5WLa0s3prw0ucaZuCAbEut3+7nW6zrckqI3mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kN7DvgOBF7iAIshX2Mur8CcB9pM1LxCvpQOwaJ33XEova4anUsCe/5JIgO+mSUBoa
	 G/rlR4yu08RtztNHpsuLXytpVpPTNcRJ+tXU0v0YKtGij+ZWcx1xETKj2PoNK20/uu
	 KvvwKPyEOcAWUO16+spNk63bxU7JZUSAi5Nb3I3g=
Date: Fri, 6 Dec 2024 14:04:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, stable@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where
 possible
Message-ID: <2024120635-wham-campsite-b62b@gregkh>
References: <20241206085810.112341-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206085810.112341-1-chenhuacai@loongson.cn>

On Fri, Dec 06, 2024 at 04:58:07PM +0800, Huacai Chen wrote:
> Backport this series to 6.1&6.6 because LoongArch gets build errors with
> latest binutils which has commit 599df6e2db17d1c4 ("ld, LoongArch: print
> error about linking without -fPIC or -fPIE flag in more detail").
> 
>   CC      .vmlinux.export.o
>   UPD     include/generated/utsversion.h
>   CC      init/version-timestamp.o
>   LD      .tmp_vmlinux.kallsyms1
> loongarch64-unknown-linux-gnu-ld: kernel/kallsyms.o:(.text+0): relocation R_LARCH_PCALA_HI20 against `kallsyms_markers` can not be used when making a PIE object; recompile with -fPIE
> loongarch64-unknown-linux-gnu-ld: kernel/crash_core.o:(.init.text+0x984): relocation R_LARCH_PCALA_HI20 against `kallsyms_names` can not be used when making a PIE object; recompile with -fPIE
> loongarch64-unknown-linux-gnu-ld: kernel/bpf/btf.o:(.text+0xcc7c): relocation R_LARCH_PCALA_HI20 against `__start_BTF` can not be used when making a PIE object; recompile with -fPIE
> loongarch64-unknown-linux-gnu-ld: BFD (GNU Binutils) 2.43.50.20241126 assertion fail ../../bfd/elfnn-loongarch.c:2673
> 
> In theory 5.10&5.15 also need this, but since LoongArch get upstream at
> 5.19, so I just ignore them because there is no error report about other
> archs now.

Odd, why doesn't this affect other arches as well using new binutils?  I
hate to have to backport all of this just for one arch, as that feels
odd.

thanks,

greg k-h

