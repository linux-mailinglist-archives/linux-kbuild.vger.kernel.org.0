Return-Path: <linux-kbuild+bounces-4724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BC9D1F22
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 05:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559B31F21BCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 04:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FEEA94F;
	Tue, 19 Nov 2024 04:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAxCZyPQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C920E6;
	Tue, 19 Nov 2024 04:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731989753; cv=none; b=SYxI81VzhyW2ctyyQlTW2B4todoLnYGJkWQ+0AFBuAbGRNM3Ktl80WtSsV4EQC3qRyvK0MyOZCntxGZ+WsavzhQKn5r9Ar0GYD9W+JWvj+WmX+ZCuI2Mv0nVYa/v58wqn+b+fYIhqAkQAuyYcISBZ6kS8YALO8DCeOlgKLOxML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731989753; c=relaxed/simple;
	bh=OUKrVf1KaqLQ/JFG97BB+rIec/+AQ+0G/vTxVjQIpTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGvHWxcALuwuk9kID8BitZBFy1z/G9NiaATp+zGM8UPZuGd4o+fj7Ta4gi4hNuhi5If/r8KibKc9s7c0RLcoLPRX6/w234CeZHrPJPTVy/NwQ1GqbeT2aQV5WGT+B88sdYpKtckoerLyVQ3Vtvk39E5sY5lI+tkJ5lBUML114Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAxCZyPQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A21BC4CECF;
	Tue, 19 Nov 2024 04:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731989752;
	bh=OUKrVf1KaqLQ/JFG97BB+rIec/+AQ+0G/vTxVjQIpTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAxCZyPQ47S2tPiQdS8wVa1fUKdT1SQZJhkBYzzxwvnfy5YUZt7WCTO3DsaOVC13W
	 6yWwV31OeznKkFR98eYPVVrqJrAimkc0rneB+nukreyydbPShHGyL0cdvXvlbioKjv
	 r5dKNpMo9SrRTN/qNvID9LcPm5xLhyXjfdde9wi7v9AfmJPrsMXZKJENsWAWFc/Hoo
	 QHuvU8ft5r4Pj9bfceEo7N3RyCg7vBpbN7Zddz3C599GzIeNm0/+zaHKYVjW42NpbV
	 AN/SrpM9mlwzLzTNm6flCxvRNdIrn87f44HFh36X77Vaib6ZqUnznSxPLo9ieSIoqs
	 1V/PHhea0JLxA==
Date: Mon, 18 Nov 2024 21:15:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	arnd@arndb.de, linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Message-ID: <20241119041550.GA573925@thelio-3990X>
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X>
 <8734joj5gn.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734joj5gn.fsf@gentoo.org>

On Tue, Nov 19, 2024 at 02:57:28AM +0000, Sam James wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> 
> > Hi Kostadin,
> >
> > Just a quick FYI off the bat, you only directed this to LKML, which is
> > basically like sending it into the void because very few people actually
> > read every message on LKML. I only caught it because I have a filter set
> > up for mentions of Clang and LLVM. I'd suggest adding at least the
> > Kbuild mailing list, which I have done now. I have also added Arnd
> > because I seem to recall him looking into how hard it would be to build
> > the kernel with C23.
> 
> FWIW, scripts/get_maintainers.pl for stddef.h and types.h doesn't
> include kbuild -- maybe we should add that in.

Yeah, it would be good to have someone own these files. Not sure it
makes sense for Kbuild to be it though, I merely suggested that since
the actual root cause of the error is more in Kbuild's realm.

> I can reproduce it with `make defconfig` at
> 158f238aa69d91ad74e535c73f552bd4b025109c in Linus' tree with just `make
> V=1 -j$(nproc) -l$(nproc)` (i.e. no CFLAGS manipulation at all).
> 
> ```
> # CC      drivers/firmware/efi/libstub/x86-5lvl.o
>   gcc -Wp,-MMD,drivers/firmware/efi/libstub/.x86-5lvl.o.d -nostdinc -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/genera
> ted/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__
>  -fmacro-prefix-map=./= -mcmodel=small -m64 -D__KERNEL__ -fPIC -fno-strict-aliasing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -Wno-pointer-sign -Wno-address-of-packed-member -fno-asy
> nchronous-unwind-tables -Os -DDISABLE_BRANCH_PROFILING -include ./include/linux/hidden.h -D__NO_FORTIFY -ffreestanding -fno-stack-protector -D__DISABLE_EXPORTS    -DKBUILD_MODFILE='"driv
> ers/firmware/efi/libstub/x86-5lvl"' -DKBUILD_BASENAME='"x86_5lvl"' -DKBUILD_MODNAME='"x86_5lvl"' -D__KBUILD_MODNAME=kmod_x86_5lvl -c -o drivers/firmware/efi/libstub/x86-5lvl.o drivers/fi
> rmware/efi/libstub/x86-5lvl.c
> In file included from ./include/uapi/linux/posix_types.h:5,
>                  from ./include/uapi/linux/types.h:14,
>                  from ./include/linux/types.h:6,
>                  from ./include/linux/kasan-checks.h:5,
>                  from ./include/asm-generic/rwonce.h:26,
>                  from ./arch/x86/include/generated/asm/rwonce.h:1,
>                  from ./include/linux/compiler.h:317,
>                  from ./include/linux/build_bug.h:5,
>                  from ./include/linux/init.h:5,
>                  from ./include/linux/efi.h:15,
>                  from drivers/firmware/efi/libstub/file.c:10:
> ./include/linux/stddef.h:11:9: error: expected identifier before ‘false’
>    11 |         false   = 0,
>       |         ^~~~~
> ```
> 
> -std=gnu11 certainly isn't there.

Ugh, this is because drivers/firmware/efi/libstub does not use
KBUILD_CFLAGS from the rest of the kernel when targeting x86:

$ sed -n '9,21p' drivers/firmware/efi/libstub/Makefile
# non-x86 reuses KBUILD_CFLAGS, x86 does not
cflags-y                        := $(KBUILD_CFLAGS)

cflags-$(CONFIG_X86_32)         := -march=i386
cflags-$(CONFIG_X86_64)         := -mcmodel=small
cflags-$(CONFIG_X86)            += -m$(BITS) -D__KERNEL__ \
                                   -fPIC -fno-strict-aliasing -mno-red-zone \
                                   -mno-mmx -mno-sse -fshort-wchar \
                                   -Wno-pointer-sign \
                                   $(call cc-disable-warning, address-of-packed-member) \
                                   $(call cc-disable-warning, gnu) \
                                   -fno-asynchronous-unwind-tables \
                                   $(CLANG_FLAGS)

This isn't the first time this peculiarity has bitten us :/ sticking
'-std=gnu11' in there should resolve that issue.

arch/x86/boot/compressed/Makefile might need the same treatment. It
might make sense to introduce something like 'CSTD_FLAG := -std=gnu11'
then use that in the various places within the kernel that need it so it
can be consistently updated in the future whenever needed. I see that
flag in Makefile, arch/arm64/kernel/vdso32/Makefile, and
arch/x86/Makefile.

Cheers,
Nathan

