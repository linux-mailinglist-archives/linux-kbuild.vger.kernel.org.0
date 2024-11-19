Return-Path: <linux-kbuild+bounces-4725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD799D1F2D
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 05:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5B101F21480
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 04:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B6013B287;
	Tue, 19 Nov 2024 04:24:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3326020E6;
	Tue, 19 Nov 2024 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731990286; cv=none; b=HgchMRqc17k4ku0WzCtGfPOQ4t6Tekh1ERi++WduEOdFA381bfvpl0rno8jiR6uJb4BKmIez3GvFgAFz3drQ1eg7jMMdneln9E2ozALdoALFYtqP1jgwzz33G7HUS02j0ALWCwJpKEzttAeNanmhe7+HMblqwCFGRl9LJQkOxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731990286; c=relaxed/simple;
	bh=hQnbFB1vpAT3Rui8jZTOS905qzylSOBEZDSQknfnjBw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tqUNDwC9e0K19xCZVK7e3HaC+vQVP95eojbOEWkEPqbGq+qqSXG/j2SSLMR9bXTDThu3wms4rb584OoH4AhiW24wSlUC4YpXRDkTRV9dI4NrbPC7PCSOfnQprGxUFTReU3M7pAB4GyQgAzQ5E+y2CsxwFta7NNjbrgsStlajsew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  arnd@arndb.de,  linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
In-Reply-To: <20241119041550.GA573925@thelio-3990X> (Nathan Chancellor's
	message of "Mon, 18 Nov 2024 21:15:50 -0700")
Organization: Gentoo
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
	<20241118205629.GA15698@thelio-3990X> <8734joj5gn.fsf@gentoo.org>
	<20241119041550.GA573925@thelio-3990X>
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Tue, 19 Nov 2024 04:24:41 +0000
Message-ID: <87r077j1fa.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nathan Chancellor <nathan@kernel.org> writes:

> On Tue, Nov 19, 2024 at 02:57:28AM +0000, Sam James wrote:
>> Nathan Chancellor <nathan@kernel.org> writes:
>>=20
>> > Hi Kostadin,
>> >
>> > Just a quick FYI off the bat, you only directed this to LKML, which is
>> > basically like sending it into the void because very few people actual=
ly
>> > read every message on LKML. I only caught it because I have a filter s=
et
>> > up for mentions of Clang and LLVM. I'd suggest adding at least the
>> > Kbuild mailing list, which I have done now. I have also added Arnd
>> > because I seem to recall him looking into how hard it would be to build
>> > the kernel with C23.
>>=20
>> FWIW, scripts/get_maintainers.pl for stddef.h and types.h doesn't
>> include kbuild -- maybe we should add that in.
>
> Yeah, it would be good to have someone own these files. Not sure it
> makes sense for Kbuild to be it though, I merely suggested that since
> the actual root cause of the error is more in Kbuild's realm.

Yeah, I couldn't figure out who a better person would be either :|

>
>> I can reproduce it with `make defconfig` at
>> 158f238aa69d91ad74e535c73f552bd4b025109c in Linus' tree with just `make
>> V=3D1 -j$(nproc) -l$(nproc)` (i.e. no CFLAGS manipulation at all).
>>=20
>> ```
>> # CC      drivers/firmware/efi/libstub/x86-5lvl.o
>>   gcc -Wp,-MMD,drivers/firmware/efi/libstub/.x86-5lvl.o.d -nostdinc -I./=
arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/i=
nclude/uapi -I./arch/x86/include/genera
>> ted/uapi -I./include/uapi -I./include/generated/uapi -include ./include/=
linux/compiler-version.h -include ./include/linux/kconfig.h -include ./incl=
ude/linux/compiler_types.h -D__KERNEL__
>>  -fmacro-prefix-map=3D./=3D -mcmodel=3Dsmall -m64 -D__KERNEL__ -fPIC -fn=
o-strict-aliasing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -Wno-pointe=
r-sign -Wno-address-of-packed-member -fno-asy
>> nchronous-unwind-tables -Os -DDISABLE_BRANCH_PROFILING -include ./includ=
e/linux/hidden.h -D__NO_FORTIFY -ffreestanding -fno-stack-protector -D__DIS=
ABLE_EXPORTS    -DKBUILD_MODFILE=3D'"driv
>> ers/firmware/efi/libstub/x86-5lvl"' -DKBUILD_BASENAME=3D'"x86_5lvl"' -DK=
BUILD_MODNAME=3D'"x86_5lvl"' -D__KBUILD_MODNAME=3Dkmod_x86_5lvl -c -o drive=
rs/firmware/efi/libstub/x86-5lvl.o drivers/fi
>> rmware/efi/libstub/x86-5lvl.c
>> In file included from ./include/uapi/linux/posix_types.h:5,
>>                  from ./include/uapi/linux/types.h:14,
>>                  from ./include/linux/types.h:6,
>>                  from ./include/linux/kasan-checks.h:5,
>>                  from ./include/asm-generic/rwonce.h:26,
>>                  from ./arch/x86/include/generated/asm/rwonce.h:1,
>>                  from ./include/linux/compiler.h:317,
>>                  from ./include/linux/build_bug.h:5,
>>                  from ./include/linux/init.h:5,
>>                  from ./include/linux/efi.h:15,
>>                  from drivers/firmware/efi/libstub/file.c:10:
>> ./include/linux/stddef.h:11:9: error: expected identifier before =E2=80=
=98false=E2=80=99
>>    11 |         false   =3D 0,
>>       |         ^~~~~
>> ```
>>=20
>> -std=3Dgnu11 certainly isn't there.
>
> Ugh, this is because drivers/firmware/efi/libstub does not use
> KBUILD_CFLAGS from the rest of the kernel when targeting x86:
>
> $ sed -n '9,21p' drivers/firmware/efi/libstub/Makefile
> # non-x86 reuses KBUILD_CFLAGS, x86 does not
> cflags-y                        :=3D $(KBUILD_CFLAGS)
>
> cflags-$(CONFIG_X86_32)         :=3D -march=3Di386
> cflags-$(CONFIG_X86_64)         :=3D -mcmodel=3Dsmall
> cflags-$(CONFIG_X86)            +=3D -m$(BITS) -D__KERNEL__ \
>                                    -fPIC -fno-strict-aliasing -mno-red-zo=
ne \
>                                    -mno-mmx -mno-sse -fshort-wchar \
>                                    -Wno-pointer-sign \
>                                    $(call cc-disable-warning, address-of-=
packed-member) \
>                                    $(call cc-disable-warning, gnu) \
>                                    -fno-asynchronous-unwind-tables \
>                                    $(CLANG_FLAGS)
>
> This isn't the first time this peculiarity has bitten us :/ sticking
> '-std=3Dgnu11' in there should resolve that issue.
>
> arch/x86/boot/compressed/Makefile might need the same treatment. It
> might make sense to introduce something like 'CSTD_FLAG :=3D -std=3Dgnu11'
> then use that in the various places within the kernel that need it so it
> can be consistently updated in the future whenever needed. I see that
> flag in Makefile, arch/arm64/kernel/vdso32/Makefile, and
> arch/x86/Makefile.

This is the conclusion I just reached, although I'm struggling to figure
out a nice place to put it without sprinkling it all over the place. I'm
inclined to wait until kbuild folks weigh in so I don't do a lot of
(trivial, but tedious) work that needs changing.

As a hack, I've injected it into CLANG_FLAGS locally for now as it
happens to appear in all the right places ;)

>
> Cheers,
> Nathan

thanks,
sam

