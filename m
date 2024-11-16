Return-Path: <linux-kbuild+bounces-4694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF0F9CFD2C
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 09:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1D16B2875B
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 08:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E4918A6C1;
	Sat, 16 Nov 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8WAU17y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49092B64A;
	Sat, 16 Nov 2024 08:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731744244; cv=none; b=MQVcKh9Ms8MBICD+CEooesIgPsxA8jQAE1EZyQNU2y/oBOHkgw9XUCH7wjtgXffmtX+YjO+UYBR/mSZzCDozwr+Mm+Mr0Ewic0CiCdPt+SNQVyyWmhulqIdQcYIewL12gtgt7Twaz9XuZi+KiB6XQhm0N6GVZbgymdoM9C7+Wh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731744244; c=relaxed/simple;
	bh=BXdz3BU4McVi7R8Ko8aKqwPYX/ohPcbHBugtt6RRUFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdTqNKz83nUzlqC2xBDI5PMGa8MMnGNF10Y9fSwiDbsv/PRSgB+RRflFNqWMeUBRyZsVKwpzEZNgibyatlZSJ2gbMieJubGF/ewuxYh4pzi2o6I3Auda0ZSV3GtTDao4t90yJVQbHEwuwuqcyprc2PoWNVtA+zta6mXI5WdUqio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8WAU17y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE12C4CEC3;
	Sat, 16 Nov 2024 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731744243;
	bh=BXdz3BU4McVi7R8Ko8aKqwPYX/ohPcbHBugtt6RRUFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8WAU17yMj1t79OYn5gcPm8UEaMD2UlLeFVepoH+H95pUMxiTu1u/WOzQo3kGMIDk
	 PzgdHYaohyJ82qPQAXYoIicTNymjEw49gFVyZCKs7sRbZqOI1uTFyxDBdzAKObj/yv
	 aExd1JvJ2TQdVgq8jjkTOOX6T+rk5NkE+OktrHa+xiq1705w3il6pcYWEZcjjGuEIi
	 WIb6RI5iOa5r7hxcc7i/jQUkAyg/xHk6TXVqXgkZ0xTtKoNChVSCdPKdkTc1NvJE2Q
	 6vUu0HK4y4NGtawbiSKUtiaiL2JW8sK5oV5JAvLD12MLg+9MLCxdVLUgGZt5BQJdYG
	 9rCvcLtKMV+/w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3040303e87.2;
        Sat, 16 Nov 2024 00:04:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWW7qv6+AVZMYVAzzJqpkaNqJ6JfenycrZuN+4jZAB47xapiO5Am63alSPC02x4HRsKnldx6jBE1IoavVAo@vger.kernel.org, AJvYcCXxQKVuwizxFeCyC3JaY2RrXQ6IWwg20agLbf5xLNyUlIrSlGyjMiv5gTcjLzVNeMcqmm3qFipZznzZ+K0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4tWLc80GOG2y9wA1ia1kuTFOZ4W+YBWWn7/sqz+qVlVyZiTc1
	YC3vUgHwbUuaO0l4vsyTFCxp1cb7IsKyznKEAhNeDmDjwAXFbBUbN5sdxuxIceW3Qet1pP0kp+p
	9risePkDEDMigPX3BCKa53JEnFkA=
X-Google-Smtp-Source: AGHT+IFvZl0nvtrBBV0j3MKAnLNM5dAGgTcs2TBBJDRV1QKOzfZxSXPDvVCrpc+QZGsKCUIBGj6P1cgk8lS4alxvdIQ=
X-Received: by 2002:a05:6512:6c9:b0:53d:a652:d085 with SMTP id
 2adb3069b0e04-53dab3bbf95mr2876057e87.50.1731744242438; Sat, 16 Nov 2024
 00:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org> <b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net>
 <ZxFkXyfs0jO2QzBv@fjasle.eu> <8e7802cc-7d76-6929-cb6e-cefc020dd8e2@w6rz.net> <ZzZkO_rNHpK1uhN-@ghost>
In-Reply-To: <ZzZkO_rNHpK1uhN-@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 Nov 2024 17:03:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5u6trSDUCC4Cvg1CsHZhwnDtTFcRaZZA=Qvt8yNO2iA@mail.gmail.com>
Message-ID: <CAK7LNAT5u6trSDUCC4Cvg1CsHZhwnDtTFcRaZZA=Qvt8yNO2iA@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when possible
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Ron Economos <re@w6rz.net>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 5:57=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Thu, Oct 17, 2024 at 12:34:49PM -0700, Ron Economos wrote:
> > On 10/17/24 12:24 PM, Nicolas Schier wrote:
> > > On Thu, Oct 17, 2024 at 07:45:57AM -0700 Ron Economos wrote:
> > > > On 7/27/24 12:42 AM, Masahiro Yamada wrote:
> > > > > A long standing issue in the upstream kernel packaging is that th=
e
> > > > > linux-headers package is not cross-compiled.
> > > > >
> > > > > For example, you can cross-build Debian packages for arm64 by run=
ning
> > > > > the following command:
> > > > >
> > > > >     $ make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- bindeb=
-pkg
> > > > >
> > > > > However, the generated linux-headers-*_arm64.deb is useless becau=
se the
> > > > > host programs in it were built for your build machine architectur=
e
> > > > > (likely x86), not arm64.
> > > > >
> > > > > The Debian kernel maintains its own Makefiles to cross-compile ho=
st
> > > > > tools without relying on Kbuild. [1]
> > > > >
> > > > > Instead of adding such full custom Makefiles, this commit adds a =
small
> > > > > piece of code to cross-compile host programs located under the sc=
ripts/
> > > > > directory.
> > > > >
> > > > > A straightforward solution is to pass HOSTCC=3D${CROSS_COMPILE}gc=
c, but it
> > > > > would also cross-compile scripts/basic/fixdep, which needs to be =
native
> > > > > to process the if_changed_dep macro. (This approach may work unde=
r some
> > > > > circumstances; you can execute foreign architecture programs with=
 the
> > > > > help of binfmt_misc because Debian systems enable CONFIG_BINFMT_M=
ISC,
> > > > > but it would require installing QEMU and libc for that architectu=
re.)
> > > > >
> > > > > A trick is to use the external module build (KBUILD_EXTMOD=3D), w=
hich
> > > > > does not rebuild scripts/basic/fixdep. ${CC} needs to be able to =
link
> > > > > userspace programs (CONFIG_CC_CAN_LINK=3Dy).
> > > > >
> > > > > There are known limitations:
> > > > >
> > > > >    - GCC plugins
> > > > >
> > > > >      It would possible to rebuild GCC plugins for the target arch=
itecture
> > > > >      by passing HOSTCXX=3D${CROSS_COMPILE}g++ with necessary pack=
ages
> > > > >      installed, but gcc on the installed system emits
> > > > >      "cc1: error: incompatible gcc/plugin versions". I did not fi=
nd a
> > > > >      solution for this because 'gcc' on a foreign architecture is=
 a
> > > > >      different compiler after all.
> > > > >
> > > > >    - objtool and resolve_btfids
> > > > >
> > > > >      These are built by the tools build system. They are not cove=
red by
> > > > >      the current solution.
> > > > >
> > > > > I only tested this with Debian, but it should work for other pack=
age
> > > > > systems as well.
> > > > >
> > > > > [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9=
.9-1/debian/rules.real#L586
> > > > >
> > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > > ---
> > > > >
> > > > >    scripts/package/install-extmod-build | 34 ++++++++++++++++++++=
++++++++
> > > > >    1 file changed, 34 insertions(+)
> > > > >
> > > > > diff --git a/scripts/package/install-extmod-build b/scripts/packa=
ge/install-extmod-build
> > > > > index cc335945dfbc..0b56d3d7b48f 100755
> > > > > --- a/scripts/package/install-extmod-build
> > > > > +++ b/scripts/package/install-extmod-build
> > > > > @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
> > > > >         fi
> > > > >    } | tar -c -f - -T - | tar -xf - -C "${destdir}"
> > > > > +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling=
. Rebuild host
> > > > > +# programs using ${CC}. This assumes CC=3D${CROSS_COMPILE}gcc, w=
hich is usually
> > > > > +# the case for package building. It does not cross-compile when =
CC=3Dclang.
> > > > > +#
> > > > > +# This caters to host programs that participate in Kbuild. objto=
ol and
> > > > > +# resolve_btfids are out of scope.
> > > > > +if [ "${CC}" !=3D "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK=
; then
> > > > > +       echo "Rebuilding host programs with ${CC}..."
> > > > > +
> > > > > +       cat <<-'EOF' >  "${destdir}/Kbuild"
> > > > > +       subdir-y :=3D scripts
> > > > > +       EOF
> > > > > +
> > > > > +       # HOSTCXX is not overridden. The C++ compiler is used to =
build:
> > > > > +       # - scripts/kconfig/qconf, which is unneeded for external=
 module builds
> > > > > +       # - GCC plugins, which will not work on the installed sys=
tem even with
> > > > > +       #   being rebuilt.
> > > > > +       #
> > > > > +       # Use the single-target build to avoid the modpost invoca=
tion, which
> > > > > +       # would overwrite Module.symvers.
> > > > > +       "${MAKE}" HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" s=
cripts/
> > > > > +
> > > > > +       cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
> > > > > +       subdir-y :=3D basic
> > > > > +       hostprogs-always-y :=3D mod/modpost
> > > > > +       mod/modpost-objs :=3D $(addprefix mod/, modpost.o file2al=
ias.o sumversion.o symsearch.o)
> > > > > +       EOF
> > > > > +
> > > > > +       # Run once again to rebuild scripts/basic/ and scripts/mo=
d/modpost.
> > > > > +       "${MAKE}" HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" s=
cripts/
> > > > > +
> > > > > +       rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
> > > > > +fi
> > > > > +
> > > > >    find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
> > > > This patch causes a build error when cross-compiling for RISC-V. I'=
m using
> > > > the cross-compiler from https://github.com/riscv-collab/riscv-gnu-t=
oolchain.
> > > > When trying to build .debs with:
> > > >
> > > > make CROSS_COMPILE=3Driscv64-unknown-linux-gnu- ARCH=3Driscv INSTAL=
L_MOD_STRIP=3D1
> > > > "KCFLAGS=3D-mtune=3Dsifive-7-series" LOCALVERSION=3D bindeb-pkg
> > > >
> > > > I get the following error:
> > > >
> > > > Rebuilding host programs with riscv64-unknown-linux-gnu-gcc...
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/genksyms/genksyms.o
> > > >    YACC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.=
0-rc3/scripts/genksyms/parse.tab.[ch]
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/genksyms/parse.tab.o
> > > >    LEX debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0=
-rc3/scripts/genksyms/lex.lex.c
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/genksyms/lex.lex.o
> > > >    HOSTLD debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/genksyms/genksyms
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/selinux/genheaders/genheaders
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/selinux/mdp/mdp
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/kallsyms
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/sorttable
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/asn1_compiler
> > > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.1=
2.0-rc3/scripts/sign-file
> > > >
> > > > debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/sc=
ripts/sign-file.c:25:10:
> > > > fatal error: openssl/opensslv.h: No such file or directory
> > > >     25 | #include <openssl/opensslv.h>
> > > >        |          ^~~~~~~~~~~~~~~~~~~~
> > > > compilation terminated.
> > > I guess you have openssl/opensslv.h available on your system, do you?=
  (In
> > > Debian/Ubuntu package libssl-dev or similar)
> > >
> > > Can you natively build a kernel with a similar kernel config?
> > >
> > > Kind regards,
> > > Nicolas
> >
> > Yes, I have /usr/include/openssl/opensslv.h on my system. But that's th=
e x86
> > version. The cross compiler can't use that.
>
> You'll need to add the package for cross-compilation. If you are using
> ubuntu and the ubuntu riscv64 toolchain, you can add the riscv64
> architecture `dpkg --add-architecture riscv64`, swap out your
> sources.list file to specify the architecture `sed -i 's/^deb/deb
> [arch=3Damd64]/' /etc/apt/sources.list`, add the riscv64 debs to your
> sources.list:
>
> deb [arch=3Driscv64] http://ports.ubuntu.com/ubuntu-ports jammy main rest=
ricted multiverse universe
> deb [arch=3Driscv64] http://ports.ubuntu.com/ubuntu-ports jammy-updates m=
ain
> deb [arch=3Driscv64] http://ports.ubuntu.com/ubuntu-ports jammy-security =
main
>
> Then `apt update` and `apt install libssl-dev:riscv64`. I imagine there
> is a similar procedure for other distros. If using a custom compiler,
> you'll need to copy over the installed headers to whatever location your
> compiler is looking for them.


Right, this build dependency is enforced since commit
e2c318225ac13083cdcb4780cdf5b90edaa8644d






>
> - Charlie
>
> >
> > A native build works fine.
> >
> > Ron
> >
> >



--=20
Best Regards
Masahiro Yamada

