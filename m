Return-Path: <linux-kbuild+bounces-5003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D39E4C75
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 03:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7240A18817FE
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 02:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0B817B4EC;
	Thu,  5 Dec 2024 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rftoUn15"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA679DC;
	Thu,  5 Dec 2024 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733366926; cv=none; b=kjFVoZAzxQgchzO2qQIQXdTbsKcv8Q/2DR/srk35AcB7r9RdWDwouP3vinzsuZMIg27zBJVVjGem8dpVsl9vGME6poZGEUbid8+9OmKZ7FYtFxl4H89/jx2X2ZjeoO8AA+UmJpz60Sd2JvSB5oGN1vQzCiNdRcY08jBEoL1I/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733366926; c=relaxed/simple;
	bh=DGF70DZln5IThYnEF4xvE0h/pdv3E5Nk+vHPdXkKDoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkdHAaewS0YBZpPEN1QyLRBKPbSXX2MSaUPdi847F3DElrKKeBX+a69aAeGpIItRwBTazoeKUViuv4S1x524NlcXj066Cxhqlt/NnRE/PE/unR9rCTY2UBXwLew4t4ugk5bt/aL2BKB8Q7jbjsotj8u5pR1UUjJUVAnp07+wpJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rftoUn15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14415C4CEDD;
	Thu,  5 Dec 2024 02:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733366926;
	bh=DGF70DZln5IThYnEF4xvE0h/pdv3E5Nk+vHPdXkKDoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rftoUn15aGFBIRnpVaAVAmjIxPc1EwQ3BMQFjAukWCAx3UVBHpa9OAIC6h7DD6gCp
	 8r/y6Mpg+o8vmanLhEGUwptePJ69vGvd9JMBvbEQ1ZPN456Kqx2oq+9ZxFaOebQI7s
	 kL8vjhNoflVNWSGY4pPohDFu7M5LgRdzv+MWj7iHogn4MZTlOZKtbKj9uSItqCF7Dl
	 9+6W4bXbBF5VJ41yhJqsRPOe2p4TD7OpcD3y0TKxzDmKJFlpRLHxVw2W+Cl71Z+pgf
	 I8L/qSQ8gCX/jB91bX2jKyM2tO7vh3Isk9IkqLSOgboVIIOlPalDuuqgQyLQfkI9nt
	 GPSWBYnes70Lg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53df1d1b6e8so444037e87.1;
        Wed, 04 Dec 2024 18:48:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwL410WMQnfdH9HCn3T2l72yV5rEFedEc6zlkmzGFHB2EeXj8E7wvd68T+CRf4uAv9FApgcucEdOaWoH0=@vger.kernel.org, AJvYcCVnNPsn7lf0dsGXDxXdUmO3/Hf2x7Licoy/VCbmSpm/jve8AQbcixuTokIh/mYh9IBCtpRv9tibGO5jFyPybwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOcDsySnqfJMhpggWI4rEMnQekzIUMx4zXMeOTZX6S38rSVJT
	ugEBkIbRv2durOQymsPPma8M9N9VPTPPKbksaU/9XtpJT3i9NpKVHfPp+CPd/ncJh01P6o+PUgJ
	oE0regUA/4LuKGKrZwWnqsAbBKO0=
X-Google-Smtp-Source: AGHT+IFCBAQTSON6KO7eKz9ICddrwpuu6tdofnQ5qKiK3Z8z33N+AkdWTWu4fSDeOy/kXzQjn9HZXL3f2oJE/UZT//g=
X-Received: by 2002:a05:6512:224b:b0:53e:1ead:e33a with SMTP id
 2adb3069b0e04-53e1eade521mr1490930e87.49.1733366924705; Wed, 04 Dec 2024
 18:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110013649.34903-1-masahiroy@kernel.org> <20241110013649.34903-6-masahiroy@kernel.org>
 <Z1DnP-GJcfseyrM3@ghost>
In-Reply-To: <Z1DnP-GJcfseyrM3@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Dec 2024 11:48:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0jmafdi7GAxq58AU-=tuWdVas02q=sQXC4zaOg4JcEA@mail.gmail.com>
Message-ID: <CAK7LNAR0jmafdi7GAxq58AU-=tuWdVas02q=sQXC4zaOg4JcEA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 8:35=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> On Sun, Nov 10, 2024 at 10:34:33AM +0900, Masahiro Yamada wrote:
> > Currently, Kbuild always operates in the output directory of the kernel=
,
> > even when building external modules. This increases the risk of externa=
l
> > module Makefiles attempting to write to the kernel directory.
> >
> > This commit switches the working directory to the external module
> > directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> > some build artifacts.
> >
> > The command for building external modules maintains backward
> > compatibility, but Makefiles that rely on working in the kernel
> > directory may break. In such cases, $(objtree) and $(srctree) should
> > be used to refer to the output and source directories of the kernel.
> >
> > The appearance of the build log will change as follows:
> >
> > [Before]
> >
> >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >   make: Entering directory '/path/to/my/linux'
> >     CC [M]  /path/to/my/externel/module/helloworld.o
> >     MODPOST /path/to/my/externel/module/Module.symvers
> >     CC [M]  /path/to/my/externel/module/helloworld.mod.o
> >     CC [M]  /path/to/my/externel/module/.module-common.o
> >     LD [M]  /path/to/my/externel/module/helloworld.ko
> >   make: Leaving directory '/path/to/my/linux'
> >
> > [After]
> >
> >   $ make -C /path/to/my/linux M=3D/path/to/my/externel/module
> >   make: Entering directory '/path/to/my/linux'
> >   make[1]: Entering directory '/path/to/my/externel/module'
> >     CC [M]  helloworld.o
> >     MODPOST Module.symvers
> >     CC [M]  helloworld.mod.o
> >     CC [M]  .module-common.o
> >     LD [M]  helloworld.ko
> >   make[1]: Leaving directory '/path/to/my/externel/module'
> >   make: Leaving directory '/path/to/my/linux'
> >
> > Printing "Entering directory" twice is cumbersome. This will be
> > addressed later.
>
> This change has caused O=3D<relative directory> to fail.
>
> For example:
>
> make O=3Dbuild defconfig
> make -j$(nproc) V=3D1 O=3Dbuild bindeb-pkg
>
> outputs:
>
> make ARCH=3Dx86 KERNELRELEASE=3D6.13.0-rc1 KBUILD_BUILD_VERSION=3D3  run-=
command KBUILD_RUN_COMMAND=3D'+$(srctree)/scripts/package/builddeb linux-li=
bc-dev'
> dh_installchangelogs -plinux-image-6.13.0-rc1
> ../scripts/package/builddeb linux-headers-6.13.0-rc1
> dh_compress -plinux-image-6.13.0-rc1
> dh_fixperms -plinux-image-6.13.0-rc1
> dh_gencontrol -plinux-image-6.13.0-rc1 -- -fdebian/image.files
> Rebuilding host programs with x86_64-linux-gnu-gcc...
> make[6]: Entering directory '/scratch/kernels/linux/build'
> /scratch/kernels/linux/Makefile:190: *** specified kernel directory "buil=
d" does not exist.  Stop.
>
> It is stepping into this directory and then trying to find the directory
> it just stepped into so $(realpath $(KBUILD_OUTPUT)) returns an empty
> string.
>
> Using an absolute directory resolves this problem, but I believe it
> shouldn't be necessary.


Agree.

I will apply the following fixup unless I have a better idea.




diff --git a/scripts/package/install-extmod-build
b/scripts/package/install-extmod-build
index 64d958ee45f3..85af1573db31 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -69,7 +69,7 @@ if [ "${CC}" !=3D "${HOSTCC}" ]; then
        #
        # Use the single-target build to avoid the modpost invocation, whic=
h
        # would overwrite Module.symvers.
-       "${MAKE}" HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" scripts/
+       "${MAKE}" O=3D. HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" scrip=
ts/

        cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
        subdir-y :=3D basic
@@ -78,7 +78,7 @@ if [ "${CC}" !=3D "${HOSTCC}" ]; then
        EOF

        # Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
-       "${MAKE}" HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" scripts/
+       "${MAKE}" O=3D. HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" scrip=
ts/

        rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
 fi



--
Best Regards
Masahiro Yamada

