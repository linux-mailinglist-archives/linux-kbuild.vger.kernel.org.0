Return-Path: <linux-kbuild+bounces-2767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BE9944148
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 04:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E90D28381F
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 02:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA94132103;
	Thu,  1 Aug 2024 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/d59b/a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D91311B6;
	Thu,  1 Aug 2024 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722479888; cv=none; b=nSIVcSR4f0bykx+BiYZDfyZbkX62RfJE97toWd4+UIfWfE9ubmakA5y+mk9b8uMlnWQmSqmtx87xlxPPZVwPU01jiTerSgDyv+lPKZoWY1iXKNf6x2bmuhkKrZugzdpTXgcYknPd9X6o7XF5xR+LRA7xKJUbK/LiOugkMx7udZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722479888; c=relaxed/simple;
	bh=5m/hS6cOEhFI+tzG7atgJ9SF0x3k7JCimxBeStgZMeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQvUgCgDgafYpqhtGQIQk8UwvyDSCVR/te8eGfVh3Hu44pNsKlaULEX6vFjELenOErKQEF+K9mAtqlBVEmvsptZQJnbwbeerrZCiU+Ey3oVy6WobWhph9v7s9SO0I6Dd/cVeF+pvWiqTxc+C8M65BMtaYwwBr3rJANdPKNLYJQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/d59b/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201E5C4AF0C;
	Thu,  1 Aug 2024 02:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722479888;
	bh=5m/hS6cOEhFI+tzG7atgJ9SF0x3k7JCimxBeStgZMeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j/d59b/axARJgDPbb+3wdmLqI+usr32xs+vxf2sIoLu1u0UvtC+CSrxmnfPNcgeKx
	 hiejQ0l1aq33XLYc1UTbFnCooB62Y0g9qnDpT6/m7pCvQhBW23WL7hPut8pf3pRncn
	 3aaU4c01uTcR71TLUfwn3y0UaMKXMnnS6eh1Cd0ybiQ2OOEakSREjRvw7Gcc2Dj1kQ
	 +VBaihm2qUIV4XS36ji6+NdxTMRn4HF2SlROMrhqVYmDEYKs2VP9nbytdlLzSSLw5A
	 J5AysqGCt7/tYXv8gYLGQKNhZP0CPGVF2FBGFQnWD3u2ImrKOpYwGlU7erFaFisBOm
	 G6414zbld7xFA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f0277daa5so10104327e87.0;
        Wed, 31 Jul 2024 19:38:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8BeAi+Ef9AiWnbrYFeWYBqGtV5xCGlRiT7tocgSxT+HDiekEekDGZT2lpvMVEY0uRfDcE3y2WJLpQos7eJogu7aSUOZsr19ooN8yu
X-Gm-Message-State: AOJu0YzJ1iQwsEPatyOKSFBl6ZDLCyXgVHkqDEjh0CwDWs6Ta+jIkK1v
	sukgEuM0nD3kfIR610fmbvu1cdscuaJ01N6n71Op1KWDSGxTS/daxq/m9Q+TqhMLmPsI08cZ2Ke
	bfo20VubfFWLOuKrY8UsYUj9nvCo=
X-Google-Smtp-Source: AGHT+IH9k7sDeNPu7pkSfvgDn1Ot0CyvDmWqJDJ5PKpjsGLIVMeueT51YqJDeb9pR3JNPDCAjriFXubi9frzsv83u2o=
X-Received: by 2002:a05:6512:1597:b0:52c:f3fa:86c with SMTP id
 2adb3069b0e04-530b61aec7amr605261e87.18.1722479886770; Wed, 31 Jul 2024
 19:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org> <20240731-soft-kittiwake-of-election-a1dfa0@lindesnes>
In-Reply-To: <20240731-soft-kittiwake-of-election-a1dfa0@lindesnes>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 1 Aug 2024 11:37:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNASR4KtTnP5sq32DNsbauFwMrtw8Q800ZyjCiqetFooYdQ@mail.gmail.com>
Message-ID: <CAK7LNASR4KtTnP5sq32DNsbauFwMrtw8Q800ZyjCiqetFooYdQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when possible
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 6:10=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> On Sat, Jul 27, 2024 at 04:42:04PM +0900, Masahiro Yamada wrote:
> > A long standing issue in the upstream kernel packaging is that the
> > linux-headers package is not cross-compiled.
> >
> > For example, you can cross-build Debian packages for arm64 by running
> > the following command:
> >
> >   $ make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- bindeb-pkg
> >
> > However, the generated linux-headers-*_arm64.deb is useless because the
> > host programs in it were built for your build machine architecture
> > (likely x86), not arm64.
> >
> > The Debian kernel maintains its own Makefiles to cross-compile host
> > tools without relying on Kbuild. [1]
> >
> > Instead of adding such full custom Makefiles, this commit adds a small
> > piece of code to cross-compile host programs located under the scripts/
> > directory.
> >
> > A straightforward solution is to pass HOSTCC=3D${CROSS_COMPILE}gcc, but=
 it
> > would also cross-compile scripts/basic/fixdep, which needs to be native
> > to process the if_changed_dep macro. (This approach may work under some
> > circumstances; you can execute foreign architecture programs with the
> > help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
> > but it would require installing QEMU and libc for that architecture.)
> >
> > A trick is to use the external module build (KBUILD_EXTMOD=3D), which
> > does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
> > userspace programs (CONFIG_CC_CAN_LINK=3Dy).
> >
> > There are known limitations:
> >
> >  - GCC plugins
> >
> >    It would possible to rebuild GCC plugins for the target architecture
> >    by passing HOSTCXX=3D${CROSS_COMPILE}g++ with necessary packages
> >    installed, but gcc on the installed system emits
> >    "cc1: error: incompatible gcc/plugin versions". I did not find a
> >    solution for this because 'gcc' on a foreign architecture is a
> >    different compiler after all.
> >
> >  - objtool and resolve_btfids
> >
> >    These are built by the tools build system. They are not covered by
> >    the current solution.
> >
> > I only tested this with Debian, but it should work for other package
> > systems as well.
> >
> > [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/d=
ebian/rules.real#L586
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/scripts/package/install-extmod-build b/scripts/package/ins=
tall-extmod-build
> > index cc335945dfbc..0b56d3d7b48f 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
> >       fi
> >  } | tar -c -f - -T - | tar -xf - -C "${destdir}"
> >
> > +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebu=
ild host
> > +# programs using ${CC}. This assumes CC=3D${CROSS_COMPILE}gcc, which i=
s usually
> > +# the case for package building. It does not cross-compile when CC=3Dc=
lang.
> > +#
> > +# This caters to host programs that participate in Kbuild. objtool and
> > +# resolve_btfids are out of scope.
>
> Just for clarification: Why do you call both "out of scope" here?
> Because they're not being built by kbuild, or because they will never be
> needed for building oot kmods?


I meant the former.


Debian applies a tricky patch to the tools build system
in order to cross-compile objtool:

https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/pat=
ches/debian/fixdep-allow-overriding-hostcc-and-hostld.patch

It is not an elegant solution, though.


I still believe the right thing to do is
converting Makefiles for objtool and resolve_btfids into Kbuild style.


objtool and resolve_btfids are necessary for building external modules,
when CONFIG_OBJTOOL=3Dy and CONFIG_DEBUG_INFO_BTF=3Dy, respectively.
If these comments are confusing, I can delete them.







>
> > +if [ "${CC}" !=3D "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
> > +     echo "Rebuilding host programs with ${CC}..."
> > +
> > +     cat <<-'EOF' >  "${destdir}/Kbuild"
> > +     subdir-y :=3D scripts
> > +     EOF
> > +
> > +     # HOSTCXX is not overridden. The C++ compiler is used to build:
> > +     # - scripts/kconfig/qconf, which is unneeded for external module =
builds
> > +     # - GCC plugins, which will not work on the installed system even=
 with
> > +     #   being rebuilt.
> > +     #
> > +     # Use the single-target build to avoid the modpost invocation, wh=
ich
> > +     # would overwrite Module.symvers.
> > +     "${MAKE}" HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" scripts/
> > +
> > +     cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
> > +     subdir-y :=3D basic
> > +     hostprogs-always-y :=3D mod/modpost
> > +     mod/modpost-objs :=3D $(addprefix mod/, modpost.o file2alias.o su=
mversion.o symsearch.o)
> > +     EOF
> > +
> > +     # Run once again to rebuild scripts/basic/ and scripts/mod/modpos=
t.
> > +     "${MAKE}" HOSTCC=3D"${CC}" KBUILD_EXTMOD=3D"${destdir}" scripts/
> > +
> > +     rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
> > +fi
> > +
> >  find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
> > --
> > 2.43.0
> >
> >
>
> Thanks for fixing this; looks good to me.
>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>


--=20
Best Regards
Masahiro Yamada

