Return-Path: <linux-kbuild+bounces-1802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F58BE0FB
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 13:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6E1284658
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C851514DE;
	Tue,  7 May 2024 11:25:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5D522E;
	Tue,  7 May 2024 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715081109; cv=none; b=fGPEozFYCw0N3JWJotrafzrZIAjzptxrJLtwzsCpN0C72eBSrS+WiCxuCkW79hpvRJ2Sf26jSv1U72clk3ik3XyHpEd0zTPFkBNUIBYdoe/cbPUITMKOr2WD/ZtdG0FdbUhTxL8VDOkQfJ/J+q4brc8PxnK/8ZObSMCTOCM45LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715081109; c=relaxed/simple;
	bh=bwWzxT3pcIW6avQmLLAcKFb0553T2UiC6CDbQwNPuRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uP8ntR0HNAC1wN/LJp9GITP+o3uDlUDNcSaKSxStzQ2KXI1q/5tgdoRYrK8+UKRcMivDpI53hb3gfM8qXYf4YxdkfCr52Pawp6n1O2r5T8+ovS837tOg1ItAvTSBl5nH3ktaN2DnvlxigXJi3DPAuZLxIx+mkwCUtXydp584yx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue,  7 May 2024 13:15:53 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 11300806B0;
	Tue,  7 May 2024 13:15:56 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 00D0A182C00; Tue,  7 May 2024 13:15:55 +0200 (CEST)
Date: Tue, 7 May 2024 13:15:55 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: add 'private' to target-specific variables
Message-ID: <ZjoNa434si-Hk0Cs@buildd.core.avm.de>
References: <20240427153253.2809911-1-masahiroy@kernel.org>
 <20240427153253.2809911-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240427153253.2809911-2-masahiroy@kernel.org>
X-purgate-ID: 149429::1715080554-4379CE42-DC1AD1A7/0/0
X-purgate-type: clean
X-purgate-size: 3145
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sun, Apr 28, 2024 at 12:32:53AM +0900, Masahiro Yamada wrote:
> Currently, Kbuild produces inconsistent results in some cases.
> 
> You can do an interesting experiment using the --shuffle option, which
> is supported by GNU Make 4.4 or later.
> 
> Set CONFIG_KVM_INTEL=y and CONFIG_KVM_AMD=m (or vice versa), and repeat
> incremental builds w/wo --shuffle=reverse.
> 
>   $ make
>     [ snip ]
>     CC      arch/x86/kvm/kvm-asm-offsets.s
> 
>   $ make --shuffle=reverse
>     [ snip ]
>     CC [M]  arch/x86/kvm/kvm-asm-offsets.s
> 
>   $ make
>     [ snip ]
>     CC      arch/x86/kvm/kvm-asm-offsets.s
> 
> arch/x86/kvm/kvm-asm-offsets.s is rebuilt every time w/wo the [M] marker.
> 
> arch/x86/kvm/kvm-asm-offsets.s is built as built-in when it is built as
> a prerequisite of arch/x86/kvm/kvm-intel.o, which is built-in.
> 
> arch/x86/kvm/kvm-asm-offsets.s is built as modular when it is built as
> a prerequisite of arch/x86/kvm/kvm-amd.o, which is a module.
> 
> Another odd example is single target builds.
> 
> When CONFIG_LKDTM=m, drivers/misc/lkdtm/rodata.o can be built as
> built-in or modular, depending on how it is built.
> 
>   $ make drivers/misc/lkdtm/lkdtm.o
>     [ snip ]
>     CC [M]  drivers/misc/lkdtm/rodata.o
> 
>   $ make drivers/misc/lkdtm/rodata.o
>     [ snip ]
>     CC      drivers/misc/lkdtm/rodata.o
> 
> drivers/misc/lkdtm/rodata.o is built as modular when it is built as a
> prerequisite of another, but built as built-in when it is a final
> target.
> 
> The same thing happens to drivers/memory/emif-asm-offsets.s when
> CONFIG_TI_EMIF_SRAM=m.
> 
>   $ make drivers/memory/ti-emif-sram.o
>     [ snip ]
>     CC [M]  drivers/memory/emif-asm-offsets.s
> 
>   $ make drivers/memory/emif-asm-offsets.s
>     [ snip ]
>     CC      drivers/memory/emif-asm-offsets.s
> 
> This is because the part-of-module=y flag defined for the modules is
> inherited by its prerequisites.
> 
> Target-specific variables are likely intended only for local use.
> This commit adds 'private' to them.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

uh, thanks for fixing this!  (And for the bug documentation, as always!)

I have just one question below.

> 
>  Makefile               | 8 ++++----
>  scripts/Makefile.build | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 62557fabfee5..25dcc7ead330 100644
> --- a/Makefile
> +++ b/Makefile
[...]
> @@ -1500,7 +1500,7 @@ MRPROPER_FILES += include/config include/generated          \
>  
>  # clean - Delete most, but leave enough to build external modules
>  #
> -clean: rm-files := $(CLEAN_FILES)
> +clean: private rm-files := $(CLEAN_FILES)

Did you leave 'clean: rm-files := $(KBUILD_EXTMOD)/...' for oot kmods
the way it is (w/o 'private') by intention?

Even though I cannot think of a possible problem without the 'private',
I think it makes sense to change the line as well.

W/ or w/o the 'clean'-update for oot kmods:

Reviewed-by: Nicolas Schier <n.schier@avm.de>

Kind regards,
Nicolas

