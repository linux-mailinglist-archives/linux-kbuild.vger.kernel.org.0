Return-Path: <linux-kbuild+bounces-4312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E2F9AEC50
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 18:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F822809DB
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 16:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BBB1F76AD;
	Thu, 24 Oct 2024 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b="Gm7bb1a3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B51EF085;
	Thu, 24 Oct 2024 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.231.106.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787873; cv=none; b=TW3kHvmBMqRxMUuGOQdJ6cWUG2nlOotM+liykc0TQmtYAtel9JfRLCH3/4o9vn/Qp+PAvVrQ333N2cl0iCA+ve3o0t9wzaQyp9fUnQfeaWVF08vhn8y+NxVRCMeSbn0MVQAFO6qaQQHAWWToqXXb7n89m7p5j1oOJqLImW8tEV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787873; c=relaxed/simple;
	bh=U3+AJJRqnhAn1ZIVOL5JxwmHhXrHc7bQMUH+2Obn0uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaDSbeCx9AbkBRp47BedllDsRrLXxaL5W7MfLZSwJ+XYAfhiAUJWt9zBGknfvZd6pjOWRDsv8+Pc/vG7kHE1s4zssIFz5CE4Q5eZf4kMbl5c/T4p+X4+lqDcQMNn28mvHUetKsvARsFX+kDN3i3rDjkqZj6ppopR0xUxrbeqxgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; spf=pass smtp.mailfrom=gaisler.com; dkim=pass (1024-bit key) header.d=gaisler.com header.i=@gaisler.com header.b=Gm7bb1a3; arc=none smtp.client-ip=94.231.106.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4XZBFL4KyYz1FRly;
	Thu, 24 Oct 2024 18:29:10 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4XZBFL0y8Rz1DR3Q;
	Thu, 24 Oct 2024 18:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1729787350;
	bh=pDtvgPgWUCdH0VwQTmdoMe1VEKVzRXoaSz6c++MgQfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Gm7bb1a3BiFp5OXGxXJaKSMiRIwGTTfyTUugeyyTubGRtrlBP9AsDdB3oY5uGHGqI
	 pjFqRq7VO2ftubkmWSL0lJKSjE5t8Re0rLF2WFIPGz3BOOysDl2JnY6+aeJbXldY65
	 SHtv6qvMryoK4HXA8Mxp/gVKfkSj+ZiPbcc52n9A=
Message-ID: <93d038de-3ba8-4d1e-9660-4c5e26ac055c@gaisler.com>
Date: Thu, 24 Oct 2024 18:29:08 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] sparc/build: Remove all usage of -fcall-used*
 flags
To: koachan@protonmail.com, "David S. Miller" <davem@davemloft.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20240717-sparc-cflags-v2-1-259407e6eb5f@protonmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20240717-sparc-cflags-v2-1-259407e6eb5f@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Sorry for being silent on your two patch sets. I did not have time to
look into them for 6.12.

On 2024-07-17 18:10, Koakuma via B4 Relay wrote:
> From: Koakuma <koachan@protonmail.com>
> 
> Remove all usage of -fcall-used* flags so that all flags used are
> portable between GCC and clang.
> 
> The reasoning is as follows:
> 
> In the (normal) 32-bit ABI, %g5 and %g7 is normally reserved, and in
> the 64-bit ABI, %g7 is the reserved one.
> Linux turns them into volatile registers by the way of -fcall-used-*,
> but on the other hand, omitting the flags shouldn't be harmful;
> compilers will now simply refuse to touch them, and any assembly
> code that happens to touch them would still work like usual (because
> Linux' conventions already treats them as volatile anyway).
> 
> Signed-off-by: Koakuma <koachan@protonmail.com>
> ---
>  arch/sparc/Makefile      | 4 ++--
>  arch/sparc/vdso/Makefile | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
> index 757451c3ea1d..7318a8b452c3 100644
> --- a/arch/sparc/Makefile
> +++ b/arch/sparc/Makefile
> @@ -29,7 +29,7 @@ UTS_MACHINE    := sparc
>  # versions of gcc.  Some gcc versions won't pass -Av8 to binutils when you
>  # give -mcpu=v8.  This silently worked with older bintutils versions but
>  # does not any more.
> -KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
> +KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu

Couldn't you use ifndef CONFIG_CC_IS_CLANG or perhaps better, use 
$(call cc-option,-fcall-used-g5) and $(call cc-option,-fcall-used-g7) to
not remove the possibility for gcc to make use of these registers?

>  KBUILD_CFLAGS  += -Wa,-Av8
>  
>  KBUILD_AFLAGS  += -m32 -Wa,-Av8
> @@ -45,7 +45,7 @@ export BITS   := 64
>  UTS_MACHINE   := sparc64
>  
>  KBUILD_CFLAGS += -m64 -pipe -mno-fpu -mcpu=ultrasparc -mcmodel=medlow
> -KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
> +KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -Wno-sign-compare

Similarly here

>  KBUILD_CFLAGS += -Wa,--undeclared-regs
>  KBUILD_CFLAGS += $(call cc-option,-mtune=ultrasparc3)
>  KBUILD_AFLAGS += -m64 -mcpu=ultrasparc -Wa,--undeclared-regs
> diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
> index 243dbfc4609d..e009443145af 100644
> --- a/arch/sparc/vdso/Makefile
> +++ b/arch/sparc/vdso/Makefile
> @@ -46,7 +46,7 @@ CFL := $(PROFILING) -mcmodel=medlow -fPIC -O2 -fasynchronous-unwind-tables -m64
>         -fno-omit-frame-pointer -foptimize-sibling-calls \
>         -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
>  
> -SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 -fcall-used-g5 -fcall-used-g7
> +SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5

and here.

>  
>  $(vobjs): KBUILD_CFLAGS := $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
>  
> 

Thanks,
Andreas

