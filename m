Return-Path: <linux-kbuild+bounces-4165-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 479599A256B
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 16:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7E08B292FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 14:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74771DE4EE;
	Thu, 17 Oct 2024 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="YifJpcnw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635B1DE4E2
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2024 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176370; cv=none; b=o4cx+swiFD8LK61fQ4ddiemhA4SEx7vNchrU+AaKTEdsK3k6c80AVNaKK//H9pHzrTM4yZy8vPMANaSx89LJzdEpbx0ngWwLQYPNd2W5Fa+zfiH29IqKQ+8DazjvVnAEGZpF7ATpv/Hl83icDB+X67UD6iU7AUD5VhOq3AjVkic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176370; c=relaxed/simple;
	bh=zBUk8Hw8SyNAc2VUWUi81hwo1SPdeKm0rPSCksO/rN4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Q4VQPUSSXCqMNk+kiv/koGbCH5YFJAm1U2ZXyyapmLsgMQgs7ygdDTSDRUWCpvgMjM9GkrFP/v6hrG7nblvfSTrraRhR6vgqgTdvt7NpHAiThYB+HKrE4zMqbpq3GdkjxnKtLQG/trUQ3MexeJjRNKVh6axzCm26Jkm5bJS4FUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=YifJpcnw; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id 1OFst53bhqvuo1RlItjHdb; Thu, 17 Oct 2024 14:46:00 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 1RlHtJp5BTVml1RlHtEshA; Thu, 17 Oct 2024 14:45:59 +0000
X-Authority-Analysis: v=2.4 cv=X8hUKnTe c=1 sm=1 tr=0 ts=67112327
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=7vwVE5O1G3EA:10 a=xNf9USuDAAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=rw3-Be7tuW_GFFp2FDUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iFpSl1G44UPHE3qQYXRjpX1spknstwijqa/2wGbs2ms=; b=YifJpcnwNz+vs7z8DHrb63fcz9
	q3988F779kQ5Lv6Ioh6YNFUBgxGKbXVDS+XcB3WtZqrNy2VTBXbKwvo/1bEkEp7nYw6QD1XiBMzt9
	10CtwHVLY7qfWnP1fcfKeqQeGde3AUHAJo09PEe3CEiTB0yb/HuS58KUeNqpEKNFsg3NK7RKBoI8p
	QAWvGW6KN6yYYzpCZ1UXadjG2cIAbTjF4ljrRFqHKqxZVdAm21iPBiLcQWp+4fLrgsli2RWra1b3s
	FXWsGjFE4t2iQ6V28mjhNVi0OSbGbU0deO331dGg5avJfhyj8B68WLXBwDVkU9xTBsDjUWk+zyIBV
	fSej4spA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:48408 helo=[10.0.1.47])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1t1RlG-001TYH-2L;
	Thu, 17 Oct 2024 08:45:58 -0600
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when
 possible
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Ben Hutchings <ben@decadent.org.uk>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org>
From: Ron Economos <re@w6rz.net>
Message-ID: <b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net>
Date: Thu, 17 Oct 2024 07:45:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240727074526.1771247-5-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1t1RlG-001TYH-2L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.47]) [73.223.253.157]:48408
X-Source-Auth: re@w6rz.net
X-Email-Count: 2
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJ/tAyZEdPnLDhXVWXvarEQ61ek5foSoJhiukXroa3rxgvMo4vw590e4YYkYmtdKtsJ7NgnCFLwB+K/JwmbsYhZbA7vfRHxTnssCFQgJH0EQubiRphHd
 dE81ZNJRYKios4+NXpOF4i4s+FZ6h2KAlbticJpMBLA01JwrKJykcvgLZKWZRhtZ3iJlMmvTu9XKsk9+C3+W87q6jjqdSI7SbFk=

On 7/27/24 12:42 AM, Masahiro Yamada wrote:
> A long standing issue in the upstream kernel packaging is that the
> linux-headers package is not cross-compiled.
>
> For example, you can cross-build Debian packages for arm64 by running
> the following command:
>
>    $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
>
> However, the generated linux-headers-*_arm64.deb is useless because the
> host programs in it were built for your build machine architecture
> (likely x86), not arm64.
>
> The Debian kernel maintains its own Makefiles to cross-compile host
> tools without relying on Kbuild. [1]
>
> Instead of adding such full custom Makefiles, this commit adds a small
> piece of code to cross-compile host programs located under the scripts/
> directory.
>
> A straightforward solution is to pass HOSTCC=${CROSS_COMPILE}gcc, but it
> would also cross-compile scripts/basic/fixdep, which needs to be native
> to process the if_changed_dep macro. (This approach may work under some
> circumstances; you can execute foreign architecture programs with the
> help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
> but it would require installing QEMU and libc for that architecture.)
>
> A trick is to use the external module build (KBUILD_EXTMOD=), which
> does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
> userspace programs (CONFIG_CC_CAN_LINK=y).
>
> There are known limitations:
>
>   - GCC plugins
>
>     It would possible to rebuild GCC plugins for the target architecture
>     by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
>     installed, but gcc on the installed system emits
>     "cc1: error: incompatible gcc/plugin versions". I did not find a
>     solution for this because 'gcc' on a foreign architecture is a
>     different compiler after all.
>
>   - objtool and resolve_btfids
>
>     These are built by the tools build system. They are not covered by
>     the current solution.
>
> I only tested this with Debian, but it should work for other package
> systems as well.
>
> [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/rules.real#L586
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>   scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> index cc335945dfbc..0b56d3d7b48f 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
>   	fi
>   } | tar -c -f - -T - | tar -xf - -C "${destdir}"
>   
> +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
> +# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
> +# the case for package building. It does not cross-compile when CC=clang.
> +#
> +# This caters to host programs that participate in Kbuild. objtool and
> +# resolve_btfids are out of scope.
> +if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
> +	echo "Rebuilding host programs with ${CC}..."
> +
> +	cat <<-'EOF' >  "${destdir}/Kbuild"
> +	subdir-y := scripts
> +	EOF
> +
> +	# HOSTCXX is not overridden. The C++ compiler is used to build:
> +	# - scripts/kconfig/qconf, which is unneeded for external module builds
> +	# - GCC plugins, which will not work on the installed system even with
> +	#   being rebuilt.
> +	#
> +	# Use the single-target build to avoid the modpost invocation, which
> +	# would overwrite Module.symvers.
> +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> +
> +	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
> +	subdir-y := basic
> +	hostprogs-always-y := mod/modpost
> +	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
> +	EOF
> +
> +	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
> +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> +
> +	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
> +fi
> +
>   find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete

This patch causes a build error when cross-compiling for RISC-V. I'm 
using the cross-compiler from 
https://github.com/riscv-collab/riscv-gnu-toolchain. When trying to 
build .debs with:

make CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv 
INSTALL_MOD_STRIP=1 "KCFLAGS=-mtune=sifive-7-series" LOCALVERSION= 
bindeb-pkg

I get the following error:

Rebuilding host programs with riscv64-unknown-linux-gnu-gcc...
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms.o
   YACC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.[ch]
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.o
   LEX 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.c
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.o
   HOSTLD 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/genheaders/genheaders
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/mdp/mdp
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/kallsyms
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sorttable
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/asn1_compiler
   HOSTCC 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file

debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file.c:25:10: 
fatal error: openssl/opensslv.h: No such file or directory
    25 | #include <openssl/opensslv.h>
       |          ^~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[7]: *** [scripts/Makefile.host:116: 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file] 
Error 1
make[6]: *** [scripts/Makefile.build:478: 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts] 
Error 2
make[5]: *** [Makefile:1936: 
debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3] Error 2
make[4]: *** [Makefile:2063: run-command] Error 2
make[3]: *** [debian/rules:61: binary-headers] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess 
returned exit status 2
make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
make[1]: *** [/home/re/xfer/linux/Makefile:1557: bindeb-pkg] Error 2
make: *** [Makefile:224: __sub-make] Error 2


