Return-Path: <linux-kbuild+bounces-4705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD999D19F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 21:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2C81F223A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 20:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB37A1E570A;
	Mon, 18 Nov 2024 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phmi8UAX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F31E1311;
	Mon, 18 Nov 2024 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731963391; cv=none; b=EfsJqBVKR8tsNE1kERlCQwF6kBEdBWqm/lq3rCCoyhzkNslQDqMHmak1+3FtUmZ76gCf2iWRb3KUZewomTb93buVGFD25xg7XpsDoNibQZFfI8hHyiDy3ZejT3TMWGsj2Qej85y0WCStb4Knth02PQqJqR9kBO1Vbd5J+7jFszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731963391; c=relaxed/simple;
	bh=C/75dlNTZVVctHgjkR2wxTlbf5aGs3bgMgbYh1A3x3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSWkOSf+0DkxGpsj670B9QFNbQA1u6BE5l9gJvk8M+CMwpLSjjRQgg22/QiKc8Nzde/gRHIz6MSuv/Y7iZHWvAGHgAH6B+d/L+DdpomwBd2AH9Q7IzTAENGLQkWTiVsDnm5e/+ROqjWPVX+JomN21MN13TxZ/ySyzWLPFzwh2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phmi8UAX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013B0C4CECC;
	Mon, 18 Nov 2024 20:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731963391;
	bh=C/75dlNTZVVctHgjkR2wxTlbf5aGs3bgMgbYh1A3x3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phmi8UAXzawnyrf1Mok1RJa2zC/F0QO0kj/gkLvrYII2QAfXVDlfeSq2x/JwwNSjr
	 KFCJdFDYSV1nElXUN/puKdll9nhZc6ul2vRC0ezGHw5h/Ng5IqW+e1PfvnsW/qQhUb
	 Blglb2HEIqGDAKqkgcuYislTMysxb5MagQZXemC95QCE6bL8AdSjTm9HOuYsUyygfP
	 8MUMHa9R9O4Wlhb/REX2TwPOWMTdGK1QFhyb98e4daRxg/NMXWRQL2mSNBjTq/P+Ke
	 1b691aq/UOxISsdwE5BOnMp6lou/kP1lHsQAYbCx7MfNHeCliOfNzCSgC1IoNOuf/z
	 DIvjxfVy/68yQ==
Date: Mon, 18 Nov 2024 13:56:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kostadin Shishmanov <kostadinshishmanov@protonmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sam@gentoo.org" <sam@gentoo.org>, arnd@arndb.de,
	linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Message-ID: <20241118205629.GA15698@thelio-3990X>
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>

Hi Kostadin,

Just a quick FYI off the bat, you only directed this to LKML, which is
basically like sending it into the void because very few people actually
read every message on LKML. I only caught it because I have a filter set
up for mentions of Clang and LLVM. I'd suggest adding at least the
Kbuild mailing list, which I have done now. I have also added Arnd
because I seem to recall him looking into how hard it would be to build
the kernel with C23.

On Mon, Nov 18, 2024 at 02:26:49PM +0000, Kostadin Shishmanov wrote:
> Whenever I try to build the kernel with upcoming GCC 15 which defaults to -std=gnu23 I get a build failure:
> 
> ```
> In file included from ./include/uapi/linux/posix_types.h:5,
>                  from ./include/uapi/linux/types.h:14,
>                  from ./include/linux/types.h:6,
>                  from ./include/uapi/linux/mei_uuid.h:12,
>                  from ./include/uapi/linux/mei.h:10,
>                  from ./include/linux/mod_devicetable.h:12,
>                  from scripts/mod/devicetable-offsets.c:3:
> ./include/linux/stddef.h:11:9: error: expected identifier before ‘false’
>    11 |         false   = 0,
> ./include/linux/types.h:35:33: error: two or more data types in declaration specifiers
>    35 | typedef _Bool                   bool;
> ./include/linux/types.h:35:1: warning: useless type name in empty declaration
>    35 | typedef _Bool                   bool;
> ```
> 
> This can be reproduced on older GCC versions with KCFLAGS="-std=gnu23"

The kernel builds explicitly with '-std=gnu11' (see Makefile), so I
would not expect the default switch on the GCC side to matter. That
signals to me that we are not actually using that flag everywhere then?
Building with V=1, I can see '-std=gnu11' in the compiler command for
scripts/mod/devicetable-offsets.s, which is generated from
scripts/mod/devicetable-offsets.c, so it seems like something else is
going on here?

> With Clang 18 and KCFLAGS="-std=c23" it's an even bigger mess:

I think the error below occurs because you used 'c23' instead of
'gnu23'. GCC's documentation states:

"The asm keyword is a GNU extension. When writing code that can be
compiled with -ansi and the various -std options, use __asm__ instead of
asm (see Alternate Keywords)."

https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html

Cheers,
Nathan

> ```
> In file included from ./arch/x86/include/asm/jump_label.h:7,
>                  from ./include/linux/jump_label.h:112,
>                  from ./arch/x86/include/asm/string_64.h:6,
>                  from ./arch/x86/include/asm/string.h:5,
>                  from ./include/linux/string.h:64,
>                  from ./include/linux/uuid.h:11,
>                  from ./include/linux/mod_devicetable.h:14:
> ./arch/x86/include/asm/asm.h: In function ‘rip_rel_ptr’:
> ./arch/x86/include/asm/asm.h:120:9: error: implicit declaration of function ‘asm’ [-Wimplicit-function-declaration]
>   120 |         asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
> ./arch/x86/include/asm/asm.h:120:34: error: expected ‘)’ before ‘:’ token
>   120 |         asm("leaq %c1(%%rip), %0" : "=r"(p) : "i"(p));
> ./arch/x86/include/asm/asm.h: At top level:
> ./arch/x86/include/asm/asm.h:222:46: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘asm’
>   222 | register unsigned long current_stack_pointer asm(_ASM_SP);
> ./arch/x86/include/asm/jump_label.h: In function ‘arch_static_branch’:
> ./arch/x86/include/asm/jump_label.h:27:9: error: ‘asm’ undeclared (first use in this function)
>    27 |         asm goto("1:"
> ./arch/x86/include/asm/jump_label.h:27:9: note: each undeclared identifier is reported only once for each function it appears in
> ./arch/x86/include/asm/jump_label.h:27:12: error: expected ‘;’ before ‘goto’
>    27 |         asm goto("1:"
>                   ;
> In file included from ./include/uapi/linux/swab.h:8,
>                  from ./include/linux/swab.h:5,
>                  from ./include/uapi/linux/byteorder/little_endian.h:14,
>                  from ./include/linux/byteorder/little_endian.h:5,
>                  from ./arch/x86/include/uapi/asm/byteorder.h:5,
>                  from ./include/linux/bitfield.h:11,
>                  from ./include/linux/fortify-string.h:5,
>                  from ./include/linux/string.h:390:
> ./arch/x86/include/uapi/asm/swab.h: In function ‘__arch_swab32’:
> ./arch/x86/include/uapi/asm/swab.h:10:24: error: expected ‘)’ before ‘:’ token
>    10 |         asm("bswapl %0" : "=r" (val) : "0" (val));
>                                )
> ./arch/x86/include/uapi/asm/swab.h: In function ‘__arch_swab64’:
> ./arch/x86/include/uapi/asm/swab.h:31:24: error: expected ‘)’ before ‘:’ token
>    31 |         asm("bswapq %0" : "=r" (val) : "0" (val));
>                                )
> In file included from scripts/mod/devicetable-offsets.c:2:
> scripts/mod/devicetable-offsets.c: In function ‘main’:
> ./include/linux/kbuild.h:6:9: error: ‘asm’ undeclared (first use in this function)
>     6 |         asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
> scripts/mod/devicetable-offsets.c:5:22: note: in expansion of macro ‘DEFINE’
>     5 | #define DEVID(devid) DEFINE(SIZE_##devid, sizeof(struct devid))
> scripts/mod/devicetable-offsets.c:11:9: note: in expansion of macro ‘DEVID’
>    11 |         DEVID(usb_device_id);
> ./include/linux/kbuild.h:6:13: error: expected ‘;’ before ‘volatile’
>     6 |         asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
> ```
> 
> There is a lot more output from the compiler that i've cut off because the email would become way too long.
> 
> Regards,
> Kostadin
> 

