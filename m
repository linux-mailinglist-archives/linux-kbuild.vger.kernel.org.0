Return-Path: <linux-kbuild+bounces-7030-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D41AAEFAB
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 01:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B5E27A16FF
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 23:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752EF215F49;
	Wed,  7 May 2025 23:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBsiBKAU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BEC215184;
	Wed,  7 May 2025 23:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746661800; cv=none; b=JnsFpS7trmrMqTF8QUiyCglO9+IUfzDkyHncwKn//Eq8rmoJrLZsv9SMlXhPI479Y5kfvNvJftV2wP0APHu8K9g+PbCl18P3rN3GJGR5bL1zPTVX1BnTJzmvOx1Vw7P7GzicTkGBDq/Sx4SnzyuSfLimHT/yJiJZ/9F8yDLhjJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746661800; c=relaxed/simple;
	bh=PVmj7NJyGeK45hmVPi9ligxBtZ3ZO1Bg3hX7jXbGtO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OckQwGoVcfcYAQC3Q4KFFAy2qo/8qBtk2eoM9B/l4JFV8SgcVsNLx25fY84H+dWkycnFEdXwyl2sumVIeIjLD6nycJJhBs+9V5BUoaNhdM1jbt4A8tLhdJSC2RQtGPOc3jvAW0bpim5FUKyptQHx2SFjhaQhK28znyJ2Y/whcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBsiBKAU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED2DC4CEEE;
	Wed,  7 May 2025 23:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746661798;
	bh=PVmj7NJyGeK45hmVPi9ligxBtZ3ZO1Bg3hX7jXbGtO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hBsiBKAUDAXzgSmpSbpGdkNylmRIgkbK4/Hj+Ve7zJtcUQvgigt/XtrN+K1LIiPmH
	 PDRV7f2CvAG+e8ptJw34NUUIbaVKSSUrJTNUsgjaph9lLic/h4jc0fgDpI8Kv+e7eW
	 5QdJAuAY9kHsbUFBp298uOBt8AyEbBaOvhcYNJCH7al+nyRn1wlHbLx5oHVowhChnO
	 kJ+zen5xT0RxKMYzarCbYa0N13MAlbtJ4Pj9Cta89X0cRv2UqxQO0NUA6zyLcfRONp
	 i/0oTHvVRmjej7YEM5WS8zbdSPWIR8lpxCQfB7NQ9NIRinzCoiX2C38T8vR9rmM934
	 RiRpCmQynwb5w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e7967cf67so530768e87.0;
        Wed, 07 May 2025 16:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVussF3hplz8lxqJtw6m/YeIRiL4HX9CIokD4Kh7kbwoaiDYE8AGaKhc+aIYybKCSWjCzL8E7RAIQ6cDIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqh3DPZyRMXR9E018BOibuyb38/C6v6tZzKhrOyI6uKckDSkY4
	37NR0SrVbkuOMsQBzYiAaBUbgoVoptI0QLXf8TGsCcP/h5rc/x3PuBD7PLbmReub6g//Ep7spYR
	AtJWvqoZFvgJJUrrWA4WEq4Mmg08=
X-Google-Smtp-Source: AGHT+IFRdcpdVRskCoXAlzXvWCXXYRP4Q/wNsCbxpdTtK57XXn4nA18MqRrP5CC+45nMFjK7JUCyvRyniMzrCrngk3U=
X-Received: by 2002:ac2:4c50:0:b0:54e:81c9:6117 with SMTP id
 2adb3069b0e04-54fbfc40c95mr303374e87.46.1746661796733; Wed, 07 May 2025
 16:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507074936.486648-1-masahiroy@kernel.org> <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
In-Reply-To: <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 May 2025 08:49:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARF=ANEEeENSwcWeayympi6Svci+ScWGpWQimyWm8xUzA@mail.gmail.com>
X-Gm-Features: ATxdqUEgEyaivNEkUxgddjCMDWte50zHAOMye87izKfRKe3dxwgVuXd7oBJ8YTk
Message-ID: <CAK7LNARF=ANEEeENSwcWeayympi6Svci+ScWGpWQimyWm8xUzA@mail.gmail.com>
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as well
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, 
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 6:38=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 5/7/25 01:49, Masahiro Yamada wrote:
> > Building the kernel with O=3D is affected by stale in-tree build artifa=
cts.
> >
> > So, if the source tree is not clean, Kbuild displays the following:
> >
> >    $ make ARCH=3Dum O=3Dbuild defconfig
> >    make[1]: Entering directory '/.../linux/build'
> >    ***
> >    *** The source tree is not clean, please run 'make ARCH=3Dum mrprope=
r'
> >    *** in /.../linux
> >    ***
> >    make[2]: *** [/.../linux/Makefile:673: outputmakefile] Error 1
> >    make[1]: *** [/.../linux/Makefile:248: __sub-make] Error 2
> >    make[1]: Leaving directory '/.../linux/build'
> >    make: *** [Makefile:248: __sub-make] Error 2
> >
> > Usually, running 'make mrproper' is sufficient for cleaning the source
> > tree for out-of-tree builds.
> >
> > However, building UML generates build artifacts not only in arch/um/,
> > but also in the SUBARCH directory (i.e., arch/x86/). If in-tree stale
> > files remain under arch/x86/, Kbuild will reuse them instead of creatin=
g
> > new ones under the specified build directory.
> >
> > This commit makes 'make ARCH=3Dum clean' recurse into the SUBARCH direc=
tory.
> >
> > Reported-by: Shuah Khan <skhan@linuxfoundation.org>
> > Closes: https://lore.kernel.org/lkml/20250502172459.14175-1-skhan@linux=
foundation.org/
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> It doesn't solve the problem. I still see arch/x86/realmode/rm/pasyms.h
> after running make ARCH=3Dum mrproper


Why not?

This patch allows 'make ARCH=3Dum mrproper'
to clean up both arch/um and arch/x86/.

It is really simple to test the behavior.


[Without this patch]

masahiro@zoe:~/workspace/linux-kbuild(master)$ touch
arch/x86/realmode/rm/pasyms.h
masahiro@zoe:~/workspace/linux-kbuild(master)$ make ARCH=3Dum mrproper
masahiro@zoe:~/workspace/linux-kbuild(master)$ ls arch/x86/realmode/rm/pasy=
ms.h
arch/x86/realmode/rm/pasyms.h

[With this patch]

masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ touch
arch/x86/realmode/rm/pasyms.h
masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ make ARCH=3Dum mrproper
  CLEAN   arch/x86/realmode/rm
masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ ls arch/x86/realmode/rm/pasy=
ms.h
ls: cannot access 'arch/x86/realmode/rm/pasyms.h': No such file or director=
y





> A subsequent kunit run on x86_64 fails. make ARCH=3Dx86_64 mrproper
> will remove the headers for x86_64 properly. The patch I proposed
> prompts user run mrproper on the arch in compile.h - It works now
> for the case where compile.h doesn't exist. I can send that out
> unless you have other ideas on how to fix this.

No.

If you still see a problem, please explain the bad scenario,
please explain without kunit.









> My workflow:
>
> - Build kernel on x86_64 with CONFIG_AMD_MEM_ENCRYPT enabled
>
> - Check for arch/x86/realmode/rm/pasyms.h
>    ls arch/x86/realmode/rm/pasyms.h
>       arch/x86/realmode/rm/pasyms.h
>
> - make ARCH=3Dum O=3D/linux/build
>
>    This patch cleans the source tree, but doesn't remove
>    arch/x86/realmode/rm/pasyms.h
>
> - ls arch/x86/realmode/rm/pasyms.h
>       arch/x86/realmode/rm/pasyms.h
>
> - ./tools/testing/kunit/kunit.py run --alltests --arch x86_64
> [15:26:35] Configuring KUnit Kernel ...
> Regenerating .config ...
> Populating config with:
> $ make ARCH=3Dx86_64 O=3D.kunit olddefconfig
> [15:26:37] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=3Dx86_64 O=3D.kunit olddefconfig
> Building with:
> $ make all compile_commands.json scripts_gdb ARCH=3Dx86_64 O=3D.kunit --j=
obs=3D16
> ERROR:root:ld:arch/x86/realmode/rm/realmode.lds:236: undefined symbol `se=
v_es_trampoline_start' referenced in expression
> make[6]: *** [../arch/x86/realmode/rm/Makefile:49: arch/x86/realmode/rm/r=
ealmode.elf] Error 1
> make[5]: *** [../arch/x86/realmode/Makefile:22: arch/x86/realmode/rm/real=
mode.bin] Error 2
> make[4]: *** [../scripts/Makefile.build:461: arch/x86/realmode] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [../scripts/Makefile.build:461: arch/x86] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [/linux/linux_kselftest/Makefile:2009: .] Error 2
> make[1]: *** [/linux/linux_kselftest/Makefile:248: __sub-make] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> thanks,
> -- Shuah



--
Best Regards

Masahiro Yamada

