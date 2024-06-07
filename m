Return-Path: <linux-kbuild+bounces-2028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752E900792
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 16:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC9E8B232AE
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 14:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23701991A9;
	Fri,  7 Jun 2024 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5MYrUXi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8437196D99;
	Fri,  7 Jun 2024 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717771411; cv=none; b=vB9cucA9Op9Y8lY05RN2u76eZ8frkNuH+bDu86YbperwJDoVBvU7E76/u6QVKsF3re+FxBYZtd4/RkP00KrEx4U5jBF5L1mMtIGj5JiMg83Fu4uuKbOcQhkRq2nTbaE+L+9r8HKPyhE3iIvAfmPLqC8YrC8Hlb93ZOts2yDnazw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717771411; c=relaxed/simple;
	bh=Aghj0cHV7oDMUlR2GlJobLXB2IWw7s4ne4SMNdsCqFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTc4YsMu4fP4KLf8bjxMaBixmvAZG0ESe6g265jygPSo5C1e5lE/9yTLCHYCXctnLclAwKfKJ1WzLK82g0EL+XYROrZbaHu9YsaKCO2BlTqZZof0rPbyi+iF9XIwei4581z28NBZL44wSvHuFtJ6A4Aayy5NZyXZe/q3Lfecg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5MYrUXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FACAC2BBFC;
	Fri,  7 Jun 2024 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717771411;
	bh=Aghj0cHV7oDMUlR2GlJobLXB2IWw7s4ne4SMNdsCqFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5MYrUXijLFyMMTns3Y1RmhtCMDTfGeUkaXeRVBhmPNyZIg2mApXb6ESEBshsy3Sd
	 64pVbnn+U/RspCFpmpw/179i6UAbJ/W7L40/aKygtpmMWeNhyZJ8UCz2Kj7mAJIlGN
	 9ul4dSj+UgSu4VFfox9z9wuN9kkN/MF3D+o96rWPTn1bSPTE28b5TcRJByejP20R5K
	 fU3hMmdDy8c86v/V6FZ+jh3eZbuWRJ3Qty4qwQ8CR+w8TotpMLldTaThU1yrvx4CB+
	 zLsbLYshtAo3I6Vl8VxFlL1gda/ALNpMTbBGgS2KGDQaKtiCaLrieqSUgef/ZGXsry
	 9uq9G9UadYaiw==
Date: Fri, 7 Jun 2024 07:43:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
Message-ID: <20240607144329.GB2483293@thelio-3990X>
References: <20240607061629.530301-1-arnd@kernel.org>
 <87frtoq5yz.fsf@mail.lhotse>
 <23ddf649-f70b-47b0-90df-af572fd50504@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23ddf649-f70b-47b0-90df-af572fd50504@app.fastmail.com>

On Fri, Jun 07, 2024 at 04:11:25PM +0200, Arnd Bergmann wrote:
> This patch seems to work as well for me, and is a little
> more logical, but it's also more invasive and has a
> higher regression risk:

Commit feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
did something similar for clang for the same reason, so I would say it
is worth pursuing this direction. It also avoids including KBUILD_CFLAGS
twice when generating .i files.

Cheers,
Nathan

> 8<---------
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 65261cbe5bfd..9ad4ca318e34 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -62,14 +62,14 @@ KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>  endif
>  
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
> -KBUILD_CFLAGS  += -mlittle-endian
> +KBUILD_CPPFLAGS        += -mlittle-endian
>  KBUILD_LDFLAGS += -EL
>  LDEMULATION    := lppc
>  GNUTARGET      := powerpcle
>  MULTIPLEWORD   := -mno-multiple
>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
>  else
> -KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
> +KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
>  KBUILD_LDFLAGS += -EB
>  LDEMULATION    := ppc
>  GNUTARGET      := powerpc
> @@ -95,7 +95,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)               += $(call cc-option,-mbig-endian)
>  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mlittle-endian
>  
>  ifeq ($(HAS_BIARCH),y)
> -KBUILD_CFLAGS  += -m$(BITS)
> +KBUILD_CPPFLAGS        += -m$(BITS)
>  KBUILD_AFLAGS  += -m$(BITS)
>  KBUILD_LDFLAGS += -m elf$(BITS)$(LDEMULATION)
>  endif
> @@ -176,7 +176,6 @@ KBUILD_CPPFLAGS     += -I $(srctree)/arch/powerpc $(asinstr)
>  KBUILD_AFLAGS  += $(AFLAGS-y)
>  KBUILD_CFLAGS  += $(call cc-option,-msoft-float)
>  KBUILD_CFLAGS  += $(CFLAGS-y)
> -CPP            = $(CC) -E $(KBUILD_CFLAGS)
>  
>  CHECKFLAGS     += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>  ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 1b93655c2857..3516e71926e5 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -59,7 +59,7 @@ ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
>  ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  
>  # Filter flags that clang will warn are unused for linking
> -ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> +ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
>  CC32FLAGS := -m32
>  LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
> --------->8
> 
>      Arnd

