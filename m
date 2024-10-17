Return-Path: <linux-kbuild+bounces-4169-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 766169A2DBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 21:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2371F25379
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 19:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA70C21D657;
	Thu, 17 Oct 2024 19:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="P3do24bV";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="Rinl8qyj";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="EjmLiDXo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e3i122.smtp2go.com (e3i122.smtp2go.com [158.120.84.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1121BB0A
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729193070; cv=none; b=j/Obx9+Ld5SYiR70hVOKI7s0gBmnHBZ43mK4XjxMYB0Qqpl5HWcms2237/m/P1vgVFXI1jAi+Op9BTgCIqgq9bI+nJlv1aDQX9hwD2XJJiPCrM1PbqoeGhtZFIyKTuXMzDQBnD3Bd0fxKSU6N/55AXVzafaBHeMuuRQyzIUXRC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729193070; c=relaxed/simple;
	bh=gFKgzeE/ZauvTc40+kc1ZCpG82IQ5sf0SexsQDq8u7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qm0R7Y8OBJt+u2lTYMZDcGCy+bzUQlv/fGJN2XLsRutiWyTGH/wiZ/NRDwQJEWbpGGAsnP9ISlo1W7uDDROHwYBznWu3neqzuAlw2tg0mXWhXginK3tJ+WVJ4LSKwu0D7gQsBvOElyw0kNm4LYQoER2/2VxGQBuXazI5CsNf37Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=P3do24bV; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=Rinl8qyj; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=EjmLiDXo; arc=none smtp.client-ip=158.120.84.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1729193062; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=QaZJB7VtPb6Ficd5xom0d1ZB+uspGEK5oHHe4+QV+34=;
 b=P3do24bV62eBpdPLHePSFTPFpX3UK3Jpr4G6fMqUEFgRz9GEJIbCQaBsFjrFm0Uoxu5xu
 4+XgV8e2eKqGkK3gMrauiMpJpNHmNiOilD4Ylww5IrIB9dr92t/MvzvgDI01h/rivqpUkaa
 Khg68eJsy8YGSScLHj/B6clnf2IlRe2gXo3kiAuAdn21u3Z/q5ylWPbmIAIMgx12jeMMg2b
 HzwDI/7fBw7R9cqF8bzecuQbTSzEakDr1jzMHne5PnGVpAiugUCN5EpmkJHjBSSbqDDykAN
 BSYouBsRyAIFkEcrBcwtEsPCYLRT+Fo2azYQMZSvIwo6Vxvf9/3WNjk+CAAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1729193062; h=from : subject :
 to : message-id : date;
 bh=QaZJB7VtPb6Ficd5xom0d1ZB+uspGEK5oHHe4+QV+34=;
 b=Rinl8qyj9JHWmLygR8huvqO5pKYet5CMXPgivqwUf3KdiBEhfFDEv4Vh0+DU1WORxBXT2
 xjZZc+j3C7seoNp3g2tZOLsWA8uu84NDXmRonACg1dRsmktKci6kcOwHFLS39dRnnp/EBWe
 zYgBDTRt3zqFABRw2b776x3+HSBiivQWHxRIzOZxJefdm2K9dV4tKY6lmajmu0PqPEN2uQU
 xyrakUw8KK912C8yBOa8MjR85+9QD3Ajrn0ulQaw7Xt3DdldpzPwxpxckpV98ryNYEMQl+8
 JXOCjtC3+MGfapDkJWDlyTu7sywQPY0eVzADE6W6bXrlYJkyuRGCC6isvYcA==
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <nicolas@fjasle.eu>)
	id 1t1W6c-AIkwcC8yyQH-H2dG;
	Thu, 17 Oct 2024 19:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1729193055; bh=gFKgzeE/ZauvTc40+kc1ZCpG82IQ5sf0SexsQDq8u7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjmLiDXoqRkWjuuvGJxxLV5+aTCDOrWLbvlR5lMckKvY/H0XxAO944jsq04kKP23W
	 a7oHrR5a/RehEXoCX37Bnn9nBEYK3zrG3pTWJEitbXkwkG0uokxOgmlNnxEdKJYBzU
	 d/ixP73e0olpxUThVwOlAFWPDG9DHu3qIfb/laNU=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 6D0BB3D187; Thu, 17 Oct 2024 21:24:15 +0200 (CEST)
Date: Thu, 17 Oct 2024 21:24:15 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Ron Economos <re@w6rz.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when
 possible
Message-ID: <ZxFkXyfs0jO2QzBv@fjasle.eu>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org>
 <b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sZpGuzd6fP
X-smtpcorp-track: saC-9m61PNao.yT_UlwfUZ_XW.oEfa9gvgfVz

On Thu, Oct 17, 2024 at 07:45:57AM -0700 Ron Economos wrote:
> On 7/27/24 12:42 AM, Masahiro Yamada wrote:
> > A long standing issue in the upstream kernel packaging is that the
> > linux-headers package is not cross-compiled.
> > 
> > For example, you can cross-build Debian packages for arm64 by running
> > the following command:
> > 
> >    $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
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
> > A straightforward solution is to pass HOSTCC=${CROSS_COMPILE}gcc, but it
> > would also cross-compile scripts/basic/fixdep, which needs to be native
> > to process the if_changed_dep macro. (This approach may work under some
> > circumstances; you can execute foreign architecture programs with the
> > help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
> > but it would require installing QEMU and libc for that architecture.)
> > 
> > A trick is to use the external module build (KBUILD_EXTMOD=), which
> > does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
> > userspace programs (CONFIG_CC_CAN_LINK=y).
> > 
> > There are known limitations:
> > 
> >   - GCC plugins
> > 
> >     It would possible to rebuild GCC plugins for the target architecture
> >     by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
> >     installed, but gcc on the installed system emits
> >     "cc1: error: incompatible gcc/plugin versions". I did not find a
> >     solution for this because 'gcc' on a foreign architecture is a
> >     different compiler after all.
> > 
> >   - objtool and resolve_btfids
> > 
> >     These are built by the tools build system. They are not covered by
> >     the current solution.
> > 
> > I only tested this with Debian, but it should work for other package
> > systems as well.
> > 
> > [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/rules.real#L586
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> > 
> >   scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
> >   1 file changed, 34 insertions(+)
> > 
> > diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> > index cc335945dfbc..0b56d3d7b48f 100755
> > --- a/scripts/package/install-extmod-build
> > +++ b/scripts/package/install-extmod-build
> > @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
> >   	fi
> >   } | tar -c -f - -T - | tar -xf - -C "${destdir}"
> > +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
> > +# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
> > +# the case for package building. It does not cross-compile when CC=clang.
> > +#
> > +# This caters to host programs that participate in Kbuild. objtool and
> > +# resolve_btfids are out of scope.
> > +if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
> > +	echo "Rebuilding host programs with ${CC}..."
> > +
> > +	cat <<-'EOF' >  "${destdir}/Kbuild"
> > +	subdir-y := scripts
> > +	EOF
> > +
> > +	# HOSTCXX is not overridden. The C++ compiler is used to build:
> > +	# - scripts/kconfig/qconf, which is unneeded for external module builds
> > +	# - GCC plugins, which will not work on the installed system even with
> > +	#   being rebuilt.
> > +	#
> > +	# Use the single-target build to avoid the modpost invocation, which
> > +	# would overwrite Module.symvers.
> > +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> > +
> > +	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
> > +	subdir-y := basic
> > +	hostprogs-always-y := mod/modpost
> > +	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
> > +	EOF
> > +
> > +	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
> > +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> > +
> > +	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
> > +fi
> > +
> >   find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
> 
> This patch causes a build error when cross-compiling for RISC-V. I'm using
> the cross-compiler from https://github.com/riscv-collab/riscv-gnu-toolchain.
> When trying to build .debs with:
> 
> make CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv INSTALL_MOD_STRIP=1
> "KCFLAGS=-mtune=sifive-7-series" LOCALVERSION= bindeb-pkg
> 
> I get the following error:
> 
> Rebuilding host programs with riscv64-unknown-linux-gnu-gcc...
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms.o
>   YACC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.[ch]
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.o
>   LEX debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.c
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.o
>   HOSTLD debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/genheaders/genheaders
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/mdp/mdp
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/kallsyms
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sorttable
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/asn1_compiler
>   HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file
> 
> debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file.c:25:10:
> fatal error: openssl/opensslv.h: No such file or directory
>    25 | #include <openssl/opensslv.h>
>       |          ^~~~~~~~~~~~~~~~~~~~
> compilation terminated.

I guess you have openssl/opensslv.h available on your system, do you?  (In
Debian/Ubuntu package libssl-dev or similar)

Can you natively build a kernel with a similar kernel config?

Kind regards,
Nicolas

