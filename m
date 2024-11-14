Return-Path: <linux-kbuild+bounces-4684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1079C9398
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 21:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FB0D1F21409
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 20:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B3B1AD41F;
	Thu, 14 Nov 2024 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AHzvpj4D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1EE1AC8AE
	for <linux-kbuild@vger.kernel.org>; Thu, 14 Nov 2024 20:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731617857; cv=none; b=tq8cGBsnQ1zfYaQDDlklvVqZN9S5i5WqsgLUugYWydQXtQBzoafbMCWDfJhjj9s37cJZU3QSo/Z7dyFIq9B8n1edlm3dJ+MSZvVCo91DOpLrp5Wp+hsC3VcwaPAOtHVvGoRH+b93OV/XViozjcLiUeUyL6tiVdcGbwU8K5CDRwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731617857; c=relaxed/simple;
	bh=OK25xQOJtFbeKAxS8qfF80zE2Lq/LgsyAGSyZjToe9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MejPFwCh4Mn46skeAQbpWLCBusNjoADy51Ib4Z5mU9Bxc7wHZhkcfzUz/G+sxPPwymamn43jpGoWYjB7Ip9fO7fJD+ZWF/aulOIqg6Y538bwa9gTqo6qFcEulc5goMb4h9h/nuAoFW6tdGzHmX9abMOS3/XpHviYD5/b4aqv6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AHzvpj4D; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-72041ff06a0so790701b3a.2
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Nov 2024 12:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731617854; x=1732222654; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IBy7W6q8d6SsCHUuoZjykTnFInThsbTdbvyrfywJgD8=;
        b=AHzvpj4Dyj8RYWcX6xdoHxgyGwx6fY8oayz0CSaO00MsieQc2I8tbvs6u9qjdV8tOr
         TYwK5F7vP0rSA5edlLz5NpoQ1YWukzniwlxdP3MDRv0RPfnXXB4sDEGABjz7sl6/sjcr
         KTWhFyoipaJY+rW7CVpOIQ40eD1FHyxSMncWW0WSdgnxYUU8X+OPmHi1wuSEZVlUtPQb
         ZIHWQAkZVWMe3fDSRXGph3RwVNw614cD7UwEJ7LPdbN7oyvJM7EfmC7Xc+p7SbOBxZgu
         B7Wm37Go1DhZYVrT6GMGsQxPZ2oP3IbI4gpR7lYB40ysBF59n0e8a3X7/5d7e7q0Gc6J
         UIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731617854; x=1732222654;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBy7W6q8d6SsCHUuoZjykTnFInThsbTdbvyrfywJgD8=;
        b=eZH3sfLr+moESxheRpTPOIDuSxhGwYNEnsiKpHlrnug9UpFHMjZzMl3JmmZ27nhTxv
         gHHT6e3MvvM1Q8TmbcL6auNZ6NTSoCkJL+qgQEfx3crVIBJ0yX+cs9FgCcYdkd7GfScr
         /AvP03mAbReG9fe6n5+a/YQpQPNuQLJeiNqkA9VcomxUAl4vmICuZ78xHzHyS1bU0xWO
         hPG94Wp+mJs6hEaoMrdp8FbXkyVPtvOpbwh1Ml7BGaMH6k8sebJkTgJiixZJ3G35HWVg
         2UEIaCf5Uk2afizN097+/HQ0rnekX7M6wsWB9oiJrecOCJsAzgOw6DVJROukwlPXDPuW
         1k6g==
X-Forwarded-Encrypted: i=1; AJvYcCUU0VFZyYA7LQcg+HlSG5MVQAofobq4mXZi5S0mH0tIEBwEcQqGSDBIsgliw9/c8UPsRGk/LhGbBzj/9kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuCkqFs8dFrfwLY7BO/Z/ZIxnW0KiviOU3KRackPWKRWav0ztx
	HA3cIZLnxCDmMkoMZi8tLORXTqYaw2RAsgqoZbZZ6ta4iHuUtB0FRSgWPpaXm/E=
X-Google-Smtp-Source: AGHT+IFGnvWYCA15QDOkROw4CkS5RCgvkj3mwr+Q5/EEaXgB8GSi/P3YPHip5tvv+X/rsu2YBjYuoA==
X-Received: by 2002:a05:6a00:188e:b0:71e:f14:869c with SMTP id d2e1a72fcca58-72476b96f7emr406568b3a.6.1731617854517;
        Thu, 14 Nov 2024 12:57:34 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:8011:b5fc:6663:cd73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771c04e3sm62882b3a.102.2024.11.14.12.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 12:57:33 -0800 (PST)
Date: Thu, 14 Nov 2024 12:57:31 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ron Economos <re@w6rz.net>
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 4/4] kbuild: cross-compile linux-headers package when
 possible
Message-ID: <ZzZkO_rNHpK1uhN-@ghost>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-5-masahiroy@kernel.org>
 <b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net>
 <ZxFkXyfs0jO2QzBv@fjasle.eu>
 <8e7802cc-7d76-6929-cb6e-cefc020dd8e2@w6rz.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e7802cc-7d76-6929-cb6e-cefc020dd8e2@w6rz.net>

On Thu, Oct 17, 2024 at 12:34:49PM -0700, Ron Economos wrote:
> On 10/17/24 12:24 PM, Nicolas Schier wrote:
> > On Thu, Oct 17, 2024 at 07:45:57AM -0700 Ron Economos wrote:
> > > On 7/27/24 12:42 AM, Masahiro Yamada wrote:
> > > > A long standing issue in the upstream kernel packaging is that the
> > > > linux-headers package is not cross-compiled.
> > > > 
> > > > For example, you can cross-build Debian packages for arm64 by running
> > > > the following command:
> > > > 
> > > >     $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
> > > > 
> > > > However, the generated linux-headers-*_arm64.deb is useless because the
> > > > host programs in it were built for your build machine architecture
> > > > (likely x86), not arm64.
> > > > 
> > > > The Debian kernel maintains its own Makefiles to cross-compile host
> > > > tools without relying on Kbuild. [1]
> > > > 
> > > > Instead of adding such full custom Makefiles, this commit adds a small
> > > > piece of code to cross-compile host programs located under the scripts/
> > > > directory.
> > > > 
> > > > A straightforward solution is to pass HOSTCC=${CROSS_COMPILE}gcc, but it
> > > > would also cross-compile scripts/basic/fixdep, which needs to be native
> > > > to process the if_changed_dep macro. (This approach may work under some
> > > > circumstances; you can execute foreign architecture programs with the
> > > > help of binfmt_misc because Debian systems enable CONFIG_BINFMT_MISC,
> > > > but it would require installing QEMU and libc for that architecture.)
> > > > 
> > > > A trick is to use the external module build (KBUILD_EXTMOD=), which
> > > > does not rebuild scripts/basic/fixdep. ${CC} needs to be able to link
> > > > userspace programs (CONFIG_CC_CAN_LINK=y).
> > > > 
> > > > There are known limitations:
> > > > 
> > > >    - GCC plugins
> > > > 
> > > >      It would possible to rebuild GCC plugins for the target architecture
> > > >      by passing HOSTCXX=${CROSS_COMPILE}g++ with necessary packages
> > > >      installed, but gcc on the installed system emits
> > > >      "cc1: error: incompatible gcc/plugin versions". I did not find a
> > > >      solution for this because 'gcc' on a foreign architecture is a
> > > >      different compiler after all.
> > > > 
> > > >    - objtool and resolve_btfids
> > > > 
> > > >      These are built by the tools build system. They are not covered by
> > > >      the current solution.
> > > > 
> > > > I only tested this with Debian, but it should work for other package
> > > > systems as well.
> > > > 
> > > > [1]: https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.9.9-1/debian/rules.real#L586
> > > > 
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > ---
> > > > 
> > > >    scripts/package/install-extmod-build | 34 ++++++++++++++++++++++++++++
> > > >    1 file changed, 34 insertions(+)
> > > > 
> > > > diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> > > > index cc335945dfbc..0b56d3d7b48f 100755
> > > > --- a/scripts/package/install-extmod-build
> > > > +++ b/scripts/package/install-extmod-build
> > > > @@ -43,4 +43,38 @@ mkdir -p "${destdir}"
> > > >    	fi
> > > >    } | tar -c -f - -T - | tar -xf - -C "${destdir}"
> > > > +# When ${CC} and ${HOSTCC} differ, we are likely cross-compiling. Rebuild host
> > > > +# programs using ${CC}. This assumes CC=${CROSS_COMPILE}gcc, which is usually
> > > > +# the case for package building. It does not cross-compile when CC=clang.
> > > > +#
> > > > +# This caters to host programs that participate in Kbuild. objtool and
> > > > +# resolve_btfids are out of scope.
> > > > +if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
> > > > +	echo "Rebuilding host programs with ${CC}..."
> > > > +
> > > > +	cat <<-'EOF' >  "${destdir}/Kbuild"
> > > > +	subdir-y := scripts
> > > > +	EOF
> > > > +
> > > > +	# HOSTCXX is not overridden. The C++ compiler is used to build:
> > > > +	# - scripts/kconfig/qconf, which is unneeded for external module builds
> > > > +	# - GCC plugins, which will not work on the installed system even with
> > > > +	#   being rebuilt.
> > > > +	#
> > > > +	# Use the single-target build to avoid the modpost invocation, which
> > > > +	# would overwrite Module.symvers.
> > > > +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> > > > +
> > > > +	cat <<-'EOF' >  "${destdir}/scripts/Kbuild"
> > > > +	subdir-y := basic
> > > > +	hostprogs-always-y := mod/modpost
> > > > +	mod/modpost-objs := $(addprefix mod/, modpost.o file2alias.o sumversion.o symsearch.o)
> > > > +	EOF
> > > > +
> > > > +	# Run once again to rebuild scripts/basic/ and scripts/mod/modpost.
> > > > +	"${MAKE}" HOSTCC="${CC}" KBUILD_EXTMOD="${destdir}" scripts/
> > > > +
> > > > +	rm -f "${destdir}/Kbuild" "${destdir}/scripts/Kbuild"
> > > > +fi
> > > > +
> > > >    find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
> > > This patch causes a build error when cross-compiling for RISC-V. I'm using
> > > the cross-compiler from https://github.com/riscv-collab/riscv-gnu-toolchain.
> > > When trying to build .debs with:
> > > 
> > > make CROSS_COMPILE=riscv64-unknown-linux-gnu- ARCH=riscv INSTALL_MOD_STRIP=1
> > > "KCFLAGS=-mtune=sifive-7-series" LOCALVERSION= bindeb-pkg
> > > 
> > > I get the following error:
> > > 
> > > Rebuilding host programs with riscv64-unknown-linux-gnu-gcc...
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms.o
> > >    YACC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.[ch]
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/parse.tab.o
> > >    LEX debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.c
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/lex.lex.o
> > >    HOSTLD debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/genksyms/genksyms
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/genheaders/genheaders
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/selinux/mdp/mdp
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/kallsyms
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sorttable
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/asn1_compiler
> > >    HOSTCC debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file
> > > 
> > > debian/linux-headers-6.12.0-rc3/usr/src/linux-headers-6.12.0-rc3/scripts/sign-file.c:25:10:
> > > fatal error: openssl/opensslv.h: No such file or directory
> > >     25 | #include <openssl/opensslv.h>
> > >        |          ^~~~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > I guess you have openssl/opensslv.h available on your system, do you?  (In
> > Debian/Ubuntu package libssl-dev or similar)
> > 
> > Can you natively build a kernel with a similar kernel config?
> > 
> > Kind regards,
> > Nicolas
> 
> Yes, I have /usr/include/openssl/opensslv.h on my system. But that's the x86
> version. The cross compiler can't use that.

You'll need to add the package for cross-compilation. If you are using
ubuntu and the ubuntu riscv64 toolchain, you can add the riscv64
architecture `dpkg --add-architecture riscv64`, swap out your
sources.list file to specify the architecture `sed -i 's/^deb/deb
[arch=amd64]/' /etc/apt/sources.list`, add the riscv64 debs to your
sources.list:

deb [arch=riscv64] http://ports.ubuntu.com/ubuntu-ports jammy main restricted multiverse universe
deb [arch=riscv64] http://ports.ubuntu.com/ubuntu-ports jammy-updates main
deb [arch=riscv64] http://ports.ubuntu.com/ubuntu-ports jammy-security main

Then `apt update` and `apt install libssl-dev:riscv64`. I imagine there
is a similar procedure for other distros. If using a custom compiler,
you'll need to copy over the installed headers to whatever location your
compiler is looking for them.

- Charlie

> 
> A native build works fine.
> 
> Ron
> 
> 

