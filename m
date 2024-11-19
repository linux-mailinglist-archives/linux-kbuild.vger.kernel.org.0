Return-Path: <linux-kbuild+bounces-4723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620589D1E7C
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 03:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C0A282C43
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 02:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C66013B287;
	Tue, 19 Nov 2024 02:57:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824E33F7;
	Tue, 19 Nov 2024 02:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985054; cv=none; b=uBTOfrWVcsFrAasWWA5gyRylW8GQKS2Oy26fWA2tW545KMx4sXzNRbuJ7b5fIwpq8ckLJxBbmOpT0LAR32tDgur465doANEOOrOe6LMc8Wt1laBJcJq6UgIejru7IU1nPGLM0bihrVwyV054nqTXkJUalCs4c+Y1PPjs39VQ8C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985054; c=relaxed/simple;
	bh=w413NECTxsl+Nl96fgAQtg24zMjfl0KSYCzrvUomWL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vbu+HGgTNiEezxsG25hKT3wrqPcvxDuk55fDIsxVE6h1EtowTrzKUeGZjR8QyCVAYklZGcYxx3aDgYJtOBxJbnQ/nlNqkab09nJNp7UKCLNdeo47orBLbGidR0OD8th4nO1qsJi8BDru48Z953XeIU3894716zCWqJ9WZ4YJBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  arnd@arndb.de,  linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
In-Reply-To: <20241118205629.GA15698@thelio-3990X> (Nathan Chancellor's
	message of "Mon, 18 Nov 2024 13:56:29 -0700")
Organization: Gentoo
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
	<20241118205629.GA15698@thelio-3990X>
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Tue, 19 Nov 2024 02:57:28 +0000
Message-ID: <8734joj5gn.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nathan Chancellor <nathan@kernel.org> writes:

> Hi Kostadin,
>
> Just a quick FYI off the bat, you only directed this to LKML, which is
> basically like sending it into the void because very few people actually
> read every message on LKML. I only caught it because I have a filter set
> up for mentions of Clang and LLVM. I'd suggest adding at least the
> Kbuild mailing list, which I have done now. I have also added Arnd
> because I seem to recall him looking into how hard it would be to build
> the kernel with C23.

FWIW, scripts/get_maintainers.pl for stddef.h and types.h doesn't
include kbuild -- maybe we should add that in.

>
> On Mon, Nov 18, 2024 at 02:26:49PM +0000, Kostadin Shishmanov wrote:
>> Whenever I try to build the kernel with upcoming GCC 15 which defaults t=
o -std=3Dgnu23 I get a build failure:
>>=20
>> ```
>> In file included from ./include/uapi/linux/posix_types.h:5,
>>                  from ./include/uapi/linux/types.h:14,
>>                  from ./include/linux/types.h:6,
>>                  from ./include/uapi/linux/mei_uuid.h:12,
>>                  from ./include/uapi/linux/mei.h:10,
>>                  from ./include/linux/mod_devicetable.h:12,
>>                  from scripts/mod/devicetable-offsets.c:3:
>> ./include/linux/stddef.h:11:9: error: expected identifier before =E2=80=
=98false=E2=80=99
>>    11 |         false   =3D 0,
>> ./include/linux/types.h:35:33: error: two or more data types in declarat=
ion specifiers
>>    35 | typedef _Bool                   bool;
>> ./include/linux/types.h:35:1: warning: useless type name in empty declar=
ation
>>    35 | typedef _Bool                   bool;
>> ```
>>=20
>> This can be reproduced on older GCC versions with KCFLAGS=3D"-std=3Dgnu2=
3"
>
> The kernel builds explicitly with '-std=3Dgnu11' (see Makefile), so I
> would not expect the default switch on the GCC side to matter. That
> signals to me that we are not actually using that flag everywhere
> then?

Right, that's the conclusion I reached when discussing it with Kostadin.

> Building with V=3D1, I can see '-std=3Dgnu11' in the compiler command for
> scripts/mod/devicetable-offsets.s, which is generated from
> scripts/mod/devicetable-offsets.c, so it seems like something else is
> going on here?

I can reproduce it with `make defconfig` at
158f238aa69d91ad74e535c73f552bd4b025109c in Linus' tree with just `make
V=3D1 -j$(nproc) -l$(nproc)` (i.e. no CFLAGS manipulation at all).

```
# CC      drivers/firmware/efi/libstub/x86-5lvl.o
  gcc -Wp,-MMD,drivers/firmware/efi/libstub/.x86-5lvl.o.d -nostdinc -I./arc=
h/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/incl=
ude/uapi -I./arch/x86/include/genera
ted/uapi -I./include/uapi -I./include/generated/uapi -include ./include/lin=
ux/compiler-version.h -include ./include/linux/kconfig.h -include ./include=
/linux/compiler_types.h -D__KERNEL__
 -fmacro-prefix-map=3D./=3D -mcmodel=3Dsmall -m64 -D__KERNEL__ -fPIC -fno-s=
trict-aliasing -mno-red-zone -mno-mmx -mno-sse -fshort-wchar -Wno-pointer-s=
ign -Wno-address-of-packed-member -fno-asy
nchronous-unwind-tables -Os -DDISABLE_BRANCH_PROFILING -include ./include/l=
inux/hidden.h -D__NO_FORTIFY -ffreestanding -fno-stack-protector -D__DISABL=
E_EXPORTS    -DKBUILD_MODFILE=3D'"driv
ers/firmware/efi/libstub/x86-5lvl"' -DKBUILD_BASENAME=3D'"x86_5lvl"' -DKBUI=
LD_MODNAME=3D'"x86_5lvl"' -D__KBUILD_MODNAME=3Dkmod_x86_5lvl -c -o drivers/=
firmware/efi/libstub/x86-5lvl.o drivers/fi
rmware/efi/libstub/x86-5lvl.c
In file included from ./include/uapi/linux/posix_types.h:5,
                 from ./include/uapi/linux/types.h:14,
                 from ./include/linux/types.h:6,
                 from ./include/linux/kasan-checks.h:5,
                 from ./include/asm-generic/rwonce.h:26,
                 from ./arch/x86/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:317,
                 from ./include/linux/build_bug.h:5,
                 from ./include/linux/init.h:5,
                 from ./include/linux/efi.h:15,
                 from drivers/firmware/efi/libstub/file.c:10:
./include/linux/stddef.h:11:9: error: expected identifier before =E2=80=98f=
alse=E2=80=99
   11 |         false   =3D 0,
      |         ^~~~~
```

-std=3Dgnu11 certainly isn't there.

>
> [...]

thanks,
sam

