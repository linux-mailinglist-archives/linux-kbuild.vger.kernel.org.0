Return-Path: <linux-kbuild+bounces-7398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1237AD12B5
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 16:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F265C7A2D74
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 14:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C22822AE7F;
	Sun,  8 Jun 2025 14:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4jA56nh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B18BA3D;
	Sun,  8 Jun 2025 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749393864; cv=none; b=ZWRcHwOavEt5vmhDgPTwlIeO3BUZEb3VkWq+1envNld5t3y5pODIy9nhJ4HFsHFSit3QvUA8VqIqy5N/vnwOQYZgGIUgAfBnzCUfx0WCgDAUyFPCTozvcnZOybmz/JGI54wcr8R8h36W150FX/dJu6LxOUyEa7AmmOLpN7dNhU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749393864; c=relaxed/simple;
	bh=Ox8AceZER7aGtAHZJ3WDzB+SrRt2ctOOYkB5303l1sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tC+fxxoMWelZ0Unix7pS0G4zxVsfAvIYr7gxRMTFm0iPPrhtXBeCg+P6WW8KJzf5tyEswqiewR4lMVp2MZW3e3AUVcbc7V5sFlVvnhhYULsbRdvRfFfa8o60foR0DvfCBBA8mFoujBFC25dOHY5CFVTBlD5Zc1NJUL/CNA/zF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4jA56nh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1D4C4CEEE;
	Sun,  8 Jun 2025 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749393863;
	bh=Ox8AceZER7aGtAHZJ3WDzB+SrRt2ctOOYkB5303l1sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4jA56nh/kXftVkc2ZV2FFnXwkUNIa+h+32mU3aJw38dWW43lIIdbOg4bwLkjycpc
	 iUZHcu24AsYFduCMloDlYC8Qal8Qn4WNgDQQlJdo9PMYEh8W21Kvm0D/92SNKROYJh
	 cyHaZvDAY4c0KIGGYSJ8F9AWaJWYybNwhtc/60/O+Yer7sa2SZZqC/tKabshDjMslb
	 lXnnJYxApQFtKeRn3hoZpdCX7rgiEn0lQQ7u+o5A9kbVds0lu4rcSJudfoUg1EwrgS
	 0/fxKdegcwOHCVsf+mi6RSbEH7u4Mm8RxVoEChn7aS2hOKIOoJDZ8jmB4Zx72sp7Fh
	 NbMWnt9AksIRg==
Date: Sun, 8 Jun 2025 16:44:18 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] kbuild: generate module.builtin.modinfo from
 vmlinux.unstripped instead of vmlinux.o
Message-ID: <aEWhwur_W6UwDsx_@example.org>
References: <20250606041029.614348-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606041029.614348-1-masahiroy@kernel.org>

On Fri, Jun 06, 2025 at 01:10:22PM +0900, Masahiro Yamada wrote:
> 
> Currently, modules.builtin.modinfo is generated from vmlinux.o, which
> occurs before modpost. So, we cannot include modpost-processed data
> into modules.builtin.modinfo.
> 
> This patch set allows to generate modules.builtin.modinfo from
> vmlinux.unstripped.
> 
> I think this patch set will be useful to clean up this:
> 
> https://lore.kernel.org/linux-kbuild/cover.1748335606.git.legion@kernel.org/T/#m98813857abf2101bdf67f1b8529a44f5c7f4746d
> 
> The original approach generates modules.builtin.modinfo from two files
> and then cancatenates them into a single file.
> 
> I prefer generating modules.builtin.modinfo from a single point.
> 
> I think 1/4 is a good cleanup regardless of modules.builtin.modinfo
> 
> 
> Masahiro Yamada (4):
>   module: remove meaningless 'name' parameter from __MODULE_INFO()
>   kbuild: always create intermediate vmlinux.unstripped
>   kbuild: keep .modinfo section in vmlinux.unstripped
>   kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
> 
>  include/asm-generic/vmlinux.lds.h |  2 +-
>  include/crypto/algapi.h           |  4 +-
>  include/linux/module.h            |  3 --
>  include/linux/moduleparam.h       |  9 ++--
>  include/net/tcp.h                 |  4 +-
>  scripts/Makefile.vmlinux          | 73 +++++++++++++++++++++----------
>  scripts/Makefile.vmlinux_o        | 26 +----------
>  scripts/mksysmap                  |  3 ++
>  8 files changed, 63 insertions(+), 61 deletions(-)

Hm. It doesn't work for me :(

I haven't been able to figure out what's wrong yet.

make[3]: *** No rule to make target 'vmlinux', needed by 'arch/x86/boot/compressed/../voffset.h'.  Stop.
make[2]: *** [arch/x86/boot/Makefile:96: arch/x86/boot/compressed/vmlinux] Error 2
make[1]: *** [arch/x86/Makefile:320: bzImage] Error 2
make: *** [Makefile:248: __sub-make] Error 2

-- 
Rgrds, legion


