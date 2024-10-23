Return-Path: <linux-kbuild+bounces-4265-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 121809ACC43
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9507D1F24C03
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 14:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA7D1BD004;
	Wed, 23 Oct 2024 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSGteKuc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6735DDAB;
	Wed, 23 Oct 2024 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693738; cv=none; b=thLHC7+3gN9rDJb6lSSGa0V5s6c2txqlbsYXnSc8Ni8SnK0CGGu8lE2BfE90+DnYBSOxmnVc5ysce7eKMeZjt4F/1xcXI8p6cZvdpnzKAUb4Yf/ML76PrpYbqgIjhZbzjFzutDYIVoGc+fdl1VlE45QYTK5Ur+CeoHrMjU1nZ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693738; c=relaxed/simple;
	bh=sOQusbb6i/faxmqa/sKu7YY9Rjw0MS3fEyQXXO0CK/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iKtERILqN/rQAd4ylrXyOprz4gCQzoPAPD9V/ywEMsANsdsX5RaM9jW56THpVHlJopJCrE5LlGEHkPElEVcKuEY1yYtEKbHuO+46T8ZGy4FaXDZbOCYLcgGXGnjanYV6STtC8Xe2HVaIFkD5voZ1/7djGICRzHFP+9LfSOnkkVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSGteKuc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65971C4CEE5;
	Wed, 23 Oct 2024 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729693737;
	bh=sOQusbb6i/faxmqa/sKu7YY9Rjw0MS3fEyQXXO0CK/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bSGteKucdVruNEYEAUzGKgoEGciQWORzoiunNu+88SytySD0vHnX4HyCRt2/TZ/K5
	 WH1Y5iF+21kpbFyoMUbmPs4QIrvyIFyiW1i+aVDZtu8MoanrkK0ub4DVloNHPgbVhX
	 pGQwzu3FcQc2AdAbDbrW59j/Dn1fgRvTeQWIot/Wc7sk0rj3Atw/KSmB3gwG1JMDyT
	 iXf+Xsq24heJFDz8WuxJr6rT2VYexHLqFfWgOs0asgAc09rpWTh6XTeUP/7lTNSAR/
	 zfrNzhLh6JAKAtRG2dV3JoYntFPrs9WUiScyyui0lRDj3vNQyv0e9PVPW2oKcH3gEU
	 l5ZImvix85R0g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f2b95775so8092315e87.1;
        Wed, 23 Oct 2024 07:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAam/p0L1uNtSzUxqwiwEgOSKGADNCai+88TSiH5dQhncNX7f4JX4CtpueCw5QIDDslbRehMrVYnUsvq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+erYep70IqoZ3JMfC4ccvjXf0H0WLbK43GKgSOorn1+etUVn
	J9xpcwbww8h09TdQRgnLxtTKVe4E0t258cAXiM3TAsjKAEuhNpfFdSATvct/jZ9ZcgifNz7dsK2
	xN01oURSK89jbMUbHqGXFUutMYSY=
X-Google-Smtp-Source: AGHT+IErSv2TyfIO015D0XYR4nk5kT9g8cgaYUX3d8/dF01u4B3KxDE9vuwocD/eKJRX7AhMqGvpA5isqFU5n8WQ9oU=
X-Received: by 2002:a05:6512:104b:b0:539:9ee4:baab with SMTP id
 2adb3069b0e04-53b1a34cf32mr2584579e87.30.1729693736062; Wed, 23 Oct 2024
 07:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022181703.1710116-1-masahiroy@kernel.org>
 <20241022181703.1710116-2-masahiroy@kernel.org> <6fca7450-95e0-1bc0-7556-8889a398d0b6@w6rz.net>
In-Reply-To: <6fca7450-95e0-1bc0-7556-8889a398d0b6@w6rz.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 23:28:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmKsHzpg2+vbMNBrq06UX5+giQN98XQOAxsMP=MqXMtQ@mail.gmail.com>
Message-ID: <CAK7LNATmKsHzpg2+vbMNBrq06UX5+giQN98XQOAxsMP=MqXMtQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders
 build profile
To: Ron Economos <re@w6rz.net>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <benh@debian.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 10:06=E2=80=AFPM Ron Economos <re@w6rz.net> wrote:
>
> On 10/22/24 11:16 AM, Masahiro Yamada wrote:
> > Since commit f1d87664b82a ("kbuild: cross-compile linux-headers package
> > when possible"), 'make bindeb-pkg' may attempt to cross-compile the
> > linux-headers package, but it fails under certain circumstances.
> >
> > For example, when CONFIG_MODULE_SIG_FORMAT is enabled on Debian, the
> > following command fails:
> >
> >    $ make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- bindeb-pkg
> >        [ snip ]
> >    Rebuilding host programs with aarch64-linux-gnu-gcc...
> >      HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12=
.0-rc4/scripts/kallsyms
> >      HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12=
.0-rc4/scripts/sorttable
> >      HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12=
.0-rc4/scripts/asn1_compiler
> >      HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12=
.0-rc4/scripts/sign-file
> >    In file included from /usr/include/openssl/opensslv.h:109,
> >                     from debian/linux-headers-6.12.0-rc4/usr/src/linux-=
headers-6.12.0-rc4/scripts/sign-file.c:25:
> >    /usr/include/openssl/macros.h:14:10: fatal error: openssl/opensslcon=
f.h: No such file or directory
> >       14 | #include <openssl/opensslconf.h>
> >          |          ^~~~~~~~~~~~~~~~~~~~~~~
> >    compilation terminated.
> >
> > This commit adds a new profile, pkg.linux-upstream.nokernelheaders, to
> > guard the linux-headers package.
> >
> > There are two options to fix the above issue.
> >
> > [option 1] Set the pkg.linux-upstream.nokernelheaders build profile
> >
> >    $ DEB_BUILD_PROFILES=3Dpkg.linux-upstream.nokernelheaders \
> >      make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- bindeb-pkg
> >
> > This skips the building of the linux-headers package.
> >
> > [option 2] Install the necessary build dependencies
> >
> > If you want to cross-compile the linux-headers package, you need to
> > install additional packages. This is a one-time installation step.
> >
> > For example, on Debian, the packages necessary for cross-compiling it
> > to arm64 can be installed with the following commands:
> >
> >    # dpkg --add-architecture arm64
> >    # apt update
> >    # apt install gcc-aarch64-linux-gnu libssl-dev:arm64
> >
> > Fixes: f1d87664b82a ("kbuild: cross-compile linux-headers package when =
possible")
> > Reported-by: Ron Economos <re@w6rz.net>
> > Closes: https://lore.kernel.org/all/b3d4f49e-7ddb-29ba-0967-689232329b5=
3@w6rz.net/
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >   scripts/package/builddeb             | 2 +-
> >   scripts/package/install-extmod-build | 6 ++----
> >   scripts/package/mkdebian             | 9 ++++++++-
> >   3 files changed, 11 insertions(+), 6 deletions(-)
> >
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index 404587fc71fe..441b0bb66e0d 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -123,7 +123,7 @@ install_kernel_headers () {
> >       pdir=3Ddebian/$1
> >       version=3D${1#linux-headers-}
> >
> > -     "${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/sr=
c/linux-headers-${version}"
> > +     CC=3D"${DEB_HOST_GNU_TYPE}-gcc" "${srctree}/scripts/package/insta=
ll-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
> >
> >       mkdir -p $pdir/lib/modules/$version/
> >       ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/=
build
> > diff --git a/scripts/package/install-extmod-build b/scripts/package/ins=
tall-extmod-build
> > index d2c9cacecc0c..7ec1f061a519 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -44,13 +44,11 @@ mkdir -p "${destdir}"
> >       fi
> >   } | tar -c -f - -T - | tar -xf - -C "${destdir}"
> >
> > -# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebu=
ild host
> > -# programs using ${CC}. This assumes CC=3D${CROSS_COMPILE}gcc, which i=
s usually
> > -# the case for package building. It does not cross-compile when CC=3Dc=
lang.
> > +# When ${CC} and ${HOSTCC} differ, rebuild host programs using ${CC}.
> >   #
> >   # This caters to host programs that participate in Kbuild. objtool an=
d
> >   # resolve_btfids are out of scope.
> > -if [ "${CC}" !=3D "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
> > +if [ "${CC}" !=3D "${HOSTCC}" ]; then
> >       echo "Rebuilding host programs with ${CC}..."
> >
> >       cat <<-'EOF' >  "${destdir}/Kbuild"
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index 10637d403777..93eb50356ddb 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -179,6 +179,8 @@ fi
> >
> >   echo $debarch > debian/arch
> >
> > +host_gnu=3D$(dpkg-architecture -a "${debarch}" -q DEB_HOST_GNU_TYPE | =
sed 's/_/-/g')
> > +
> >   # Generate a simple changelog template
> >   cat <<EOF > debian/changelog
> >   $sourcename ($packageversion) $distribution; urgency=3Dlow
> > @@ -196,7 +198,11 @@ Priority: optional
> >   Maintainer: $maintainer
> >   Rules-Requires-Root: no
> >   Build-Depends: debhelper-compat (=3D 12)
> > -Build-Depends-Arch: bc, bison, cpio, flex, kmod, libelf-dev:native, li=
bssl-dev:native, rsync
> > +Build-Depends-Arch: bc, bison, cpio, flex,
> > + gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> > + kmod, libelf-dev:native,
> > + libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
> > + rsync
> >   Homepage: https://www.kernel.org/
> >
> >   Package: $packagename-$version
> > @@ -224,6 +230,7 @@ cat <<EOF >> debian/control
> >
> >   Package: linux-headers-$version
> >   Architecture: $debarch
> > +Build-Profiles: <!pkg.${sourcename}.nokernelheaders>
> >   Description: Linux kernel headers for $version on $debarch
> >    This package provides kernel header files for $version on $debarch
> >    .
>
> Tested with option 2 for RISC-V. On Ubuntu 24.04, the following must be
> added to the file /etc/apt/sources.list.d/ubuntu.sources for apt update
> to fetch the correct repositories:
>
> Types: deb
> URIs: http://ports.ubuntu.com/ubuntu-ports
> Suites: noble noble-updates noble-backports
> Components: main universe restricted multiverse
> Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
> Architectures: riscv64

Right, this is an annoyance of Ubuntu.

x86 and non-x86 architectures use different repositories.



>
> Then:
>
> sudo dpkg --add-architecture riscv64
> sudo apt-get update
> sudo apt-get install libssl-dev:riscv64
>
> The tool chain at https://github.com/riscv-collab/riscv-gnu-toolchain
> can also be made to work. See:
>
> https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1590


You can use any toolchain.

The linux-headers package is rebuilt with riscv64-linux-gnu-gcc,
not your own toolchain.



> Tested-by: Ron Economos <re@w6rz.net>
>
>


--=20
Best Regards
Masahiro Yamada

