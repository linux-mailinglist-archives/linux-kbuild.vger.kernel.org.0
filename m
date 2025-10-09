Return-Path: <linux-kbuild+bounces-9059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F11ABC7C9C
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 09:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B8AD4E71C5
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 07:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735BF2D0618;
	Thu,  9 Oct 2025 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCvzlzXY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8FA2BE648
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Oct 2025 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759996324; cv=none; b=ahesmUDyIs/KVCPsXR14XRE0Hl7IhWM5l7StECOI5toXZTD5kSLEdAOQMZbv+AnGiwPzZv5AWRax8Kujx9nPs3ho2BwuHxmkmQkGWORrL1Qpx8Dc6aUB8Eu1+uLiGRryJyYQWXdVlrS43vDJKAZeXR/+FztPsWxq6sgHVHE8qL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759996324; c=relaxed/simple;
	bh=i9Z80guMca+sPD/TMXl+vTjZYLstDVRXzHS+lM+wG3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyHx/RNnZFt7DaxsJbATAvL5C+DOSS7LaPFs+Bt/oiZZUfKhzO0cmO/chGzUg6uMGsgUpDO5VQRK47S7+WkaCuX7UDl9p+ANarLmLxNBlNAb2ZyKuL9hj2WLCP7QXuV2uYFurmSPCYQgp7JpyZb8si8iSiPoo3Mwh4xP3bm26J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCvzlzXY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f0308469a4so413608f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Oct 2025 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759996320; x=1760601120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dq0wjjBNXf0WK9D3ya79rVciEE/qzZqTtznAwxjgERM=;
        b=XCvzlzXYu3nnP3q+TaySbt2kkcQXRZufaYSmLok5gn6i0ehXKj+uGZ3ToQIfq3vJUo
         VfF8pGLcAYIDHd8qqyGG4yz6VzP1Yqgne/YghKSYPlUjkLLXjuF6ybEa9UgYfOWPVSDF
         eIGq/L72XudQ8/Xv2qyiZX2hnzNGoMOl70IS8fBsHDKsoi6OW8FTLkjsrvAYQ8njkNsO
         QAM6PwPqAh+ATp38/RUTt+ZHCASJZiZtPuN8fyyamtdX7xTs215bgPXRHoBcO+4XRoHM
         oCYlEhf0xMBrDFlzHxIo8ERjITGJ2jJfCE1RvfWBRsQFkGu1LzG1/mNriGNPbNOJyRgd
         Tddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996320; x=1760601120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq0wjjBNXf0WK9D3ya79rVciEE/qzZqTtznAwxjgERM=;
        b=pCoO89cOEo3q+bfUrfaJUFH2h2b2qeGJi6WJOwSZ8gBF2qU8NFPaU3Q0/4eM6DZ7rT
         ps3OI4RU3ydvrRUeL8VuOFekR2bTSfYxdcSToj45Oo8366guGyNhmCg9NPai1oQthYes
         3gOtTwZOOuSk9GC2m2IbYmPZZKPsiIhH2qF5UT04nlJmJwQbrBj2vEJWe4Ljcq3wkgkS
         hxTkguLfk7EQjyoasSqx6q798LiBLUIvFI0BOpDxrZEwAMG4H+fNxwuAd63cgvpC7Z58
         zPzGoHmTInWMpFklLe7DxejjzN79t0ebr3lTJ0mTKeWUoJ1JfGOK8eunyema5tH0oEQ9
         MKTg==
X-Gm-Message-State: AOJu0YzppRfTUHX/4wL94yfEOF98huYdDleMy+kny198HYiY64N0TkHH
	9tIOupYAl3iHOIc7rb678T3xU+GOfqtzuEeFlhJftGMFwkyCJpIPgAYOpvUq1ShC
X-Gm-Gg: ASbGnctnERt+cfCVaJbUQ+x+JCX0zAz5EbzpNPss49a37qyYWnXBES/Rvw2QKPdwJwJ
	4pWce0CCCoa47CjkDzJ5AsL5vqQ+Qxp3w7mPYGhkTFrP18r0RCZ2kEKDNpZx6OTLPYtwinZzKwB
	dpOipvylQ5TM3I+cf2eNq5Yi+QIEz4X5uFUDZ5TOf47ydaRulXRAV2WmL+Ix7+U8hzGKbFK6rsT
	CXE8j6Sx7u50neGOQyPz6fIlDvKvLX/uY7+8YnTy1SCF5HnwBz1qHCWqiO2jRjBVfiZbxKuwS0q
	X7iHFP6XF78LF3fQPpqm1Jr318Fle4nOfRkUa54MAVHj+ZCT/VHvQr/q8EA8PmQSbAgXJlEwsC6
	SbNz2/lWnogClVW2J6oWnEiRgcInSUX9G/JJHETcd09mhoNCmJAR26A==
X-Google-Smtp-Source: AGHT+IEF2QgSVmoekGeeDdR+attcsPoP4ux+ZobTKCXEPtqIEA2gTGTVY1Xfifkg2IiD0GzYxV+OEw==
X-Received: by 2002:a5d:5f82:0:b0:3fd:eb15:772 with SMTP id ffacd0b85a97d-42666ac39d7mr3287299f8f.9.1759996320291;
        Thu, 09 Oct 2025 00:52:00 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8a6bbesm33252549f8f.12.2025.10.09.00.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:51:59 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	regressions@lists.linux.dev
Cc: nathan@kernel.org,
	linux-kernel@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	nsc@kernel.org,
	ojeda@kernel.org,
	sam@gentoo.org,
	thomas.weissschuh@linutronix.de,
	Daniel Xu <dxu@dxuuu.xyz>
Subject: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
Date: Thu,  9 Oct 2025 10:51:49 +0300
Message-ID: <20251009075149.1083040-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

#regzbot introduced: d1d0963121769d8d16150b913fe886e48efefa51

As well as I understand, if you want to disable warnings, you
should pass "CFLAGS=3D-w" to "make". Starting with d1d096312176,
this no longer works.

Steps to reproduce:

$ cd linux
$ git clean -f -q -d -x  # To clean everything not controlled by git
$ echo 'CONFIG_64BIT=3Dy' > /tmp/minimini
$ make allnoconfig KCONFIG_ALLCONFIG=3D/tmp/minimini
$ make -j32 CFLAGS=3D-w

My system info:

d-user@comp:~$ gcc -v
Using built-in specs.
COLLECT_GCC=3Dgcc
COLLECT_LTO_WRAPPER=3D/usr/libexec/gcc/x86_64-linux-gnu/14/lto-wrapper
OFFLOAD_TARGET_NAMES=3Dnvptx-none:amdgcn-amdhsa
OFFLOAD_TARGET_DEFAULT=3D1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Debian 14.2.0-19'=
 --with-bugurl=3Dfile:///usr/share/doc/gcc-14/README.Bugs --enable-language=
s=3Dc,ada,c++,go,d,fortran,objc,obj-c++,m2,rust --prefix=3D/usr --with-gcc-=
major-version-only --program-suffix=3D-14 --program-prefix=3Dx86_64-linux-g=
nu- --enable-shared --enable-linker-build-id --libexecdir=3D/usr/libexec --=
without-included-gettext --enable-threads=3Dposix --libdir=3D/usr/lib --ena=
ble-nls --enable-bootstrap --enable-clocale=3Dgnu --enable-libstdcxx-debug =
--enable-libstdcxx-time=3Dyes --with-default-libstdcxx-abi=3Dnew --enable-l=
ibstdcxx-backtrace --enable-gnu-unique-object --disable-vtable-verify --ena=
ble-plugin --enable-default-pie --with-system-zlib --enable-libphobos-check=
ing=3Drelease --with-target-system-zlib=3Dauto --enable-objc-gc=3Dauto --en=
able-multiarch --disable-werror --enable-cet --with-arch-32=3Di686 --with-a=
bi=3Dm64 --with-multilib-list=3Dm32,m64,mx32 --enable-multilib --with-tune=
=3Dgeneric --enable-offload-targets=3Dnvptx-none=3D/build/reproducible-path=
/gcc-14-14.2.0/debian/tmp-nvptx/usr,amdgcn-amdhsa=3D/build/reproducible-pat=
h/gcc-14-14.2.0/debian/tmp-gcn/usr --enable-offload-defaulted --without-cud=
a-driver --enable-checking=3Drelease --build=3Dx86_64-linux-gnu --host=3Dx8=
6_64-linux-gnu --target=3Dx86_64-linux-gnu --with-build-config=3Dbootstrap-=
lto-lean --enable-link-serialization=3D3
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 14.2.0 (Debian 14.2.0-19)=20
d-user@comp:~$ cat /etc/os-release=20
PRETTY_NAME=3D"Debian GNU/Linux 13 (trixie)"
NAME=3D"Debian GNU/Linux"
VERSION_ID=3D"13"
VERSION=3D"13 (trixie)"
VERSION_CODENAME=3Dtrixie
DEBIAN_VERSION_FULL=3D13.1
ID=3Ddebian
HOME_URL=3D"https://www.debian.org/"
SUPPORT_URL=3D"https://www.debian.org/support"
BUG_REPORT_URL=3D"https://bugs.debian.org/"

Culpit commit (d1d096312176) produces this output:

d-user@comp:/rbt$ cd linux
d-user@comp:/rbt/linux$ git clean -f -q -d -x
d-user@comp:/rbt/linux$ echo 'CONFIG_64BIT=3Dy' > /tmp/minimini
d-user@comp:/rbt/linux$ make allnoconfig KCONFIG_ALLCONFIG=3D/tmp/minimini
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
d-user@comp:/rbt/linux$ make -j32 CFLAGS=3D-w
  GEN     arch/x86/include/generated/asm/orc_hash.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  UPD     include/generated/uapi/linux/version.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  UPD     include/generated/compile.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/fprobe.h
  HOSTCC  scripts/kallsyms
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/mmzone.h
  HOSTCC  scripts/sorttable
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  UPD     include/config/kernel.release
  WRAP    arch/x86/include/generated/asm/rwonce.h
  DESCEND objtool
  UPD     include/generated/utsrelease.h
  INSTALL /rbt/linux/tools/objtool/libsubcmd/include/subcmd/exec-cmd.h
  INSTALL /rbt/linux/tools/objtool/libsubcmd/include/subcmd/help.h
  INSTALL /rbt/linux/tools/objtool/libsubcmd/include/subcmd/pager.h
  INSTALL /rbt/linux/tools/objtool/libsubcmd/include/subcmd/parse-options.h
  INSTALL /rbt/linux/tools/objtool/libsubcmd/include/subcmd/run-command.h
  INSTALL libsubcmd_headers
  HOSTLD  arch/x86/tools/relocs
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  CC      /rbt/linux/tools/objtool/libsubcmd/exec-cmd.o
  CC      /rbt/linux/tools/objtool/libsubcmd/help.o
  CC      /rbt/linux/tools/objtool/libsubcmd/pager.o
  CC      /rbt/linux/tools/objtool/libsubcmd/parse-options.o
  CC      /rbt/linux/tools/objtool/libsubcmd/run-command.o
  CC      /rbt/linux/tools/objtool/libsubcmd/sigchain.o
  CC      /rbt/linux/tools/objtool/libsubcmd/subcmd-config.o
exec-cmd.c:2:10: fatal error: linux/compiler.h: No such file or directory
    2 | #include <linux/compiler.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/rbt/linux/tools/build/Makefile.build:86: /rbt/linux/tools/ob=
jtool/libsubcmd/exec-cmd.o] Error 1
make[5]: *** Waiting for unfinished jobs....
parse-options.c:2:10: fatal error: linux/compiler.h: No such file or direct=
ory
    2 | #include <linux/compiler.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/rbt/linux/tools/build/Makefile.build:86: /rbt/linux/tools/ob=
jtool/libsubcmd/parse-options.o] Error 1
In file included from sigchain.c:3:
subcmd-util.h:8:10: fatal error: linux/compiler.h: No such file or directory
    8 | #include <linux/compiler.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/rbt/linux/tools/build/Makefile.build:86: /rbt/linux/tools/ob=
jtool/libsubcmd/sigchain.o] Error 1
  MKELF   scripts/mod/elfconfig.h
In file included from help.c:12:
subcmd-util.h:8:10: fatal error: linux/compiler.h: No such file or directory
    8 | #include <linux/compiler.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
  HOSTCC  scripts/mod/modpost.o
make[5]: *** [/rbt/linux/tools/build/Makefile.build:85: /rbt/linux/tools/ob=
jtool/libsubcmd/help.o] Error 1
  HOSTCC  scripts/mod/sumversion.o
In file included from run-command.c:11:
subcmd-util.h:8:10: fatal error: linux/compiler.h: No such file or directory
    8 | #include <linux/compiler.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
  HOSTCC  scripts/mod/symsearch.o
make[5]: *** [/rbt/linux/tools/build/Makefile.build:85: /rbt/linux/tools/ob=
jtool/libsubcmd/run-command.o] Error 1
  UPD     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
make[4]: *** [Makefile:78: /rbt/linux/tools/objtool/libsubcmd/libsubcmd-in.=
o] Error 2
make[3]: *** [Makefile:83: /rbt/linux/tools/objtool/libsubcmd/libsubcmd.a] =
Error 2
make[2]: *** [Makefile:73: objtool] Error 2
make[1]: *** [/rbt/linux/Makefile:1430: tools/objtool] Error 2
make[1]: *** Waiting for unfinished jobs....
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 include/linux/atomic/atomic-instrumented.h
  CHKSHA1 include/linux/atomic/atomic-long.h
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
make: *** [Makefile:251: __sub-make] Error 2

--=20
Askar Safin

