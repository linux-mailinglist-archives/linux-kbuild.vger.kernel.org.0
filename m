Return-Path: <linux-kbuild+bounces-6450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCA4A7CCDB
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 07:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43853AA3F4
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 05:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0979C8CE;
	Sun,  6 Apr 2025 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b="MsiYGGkA";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="lNrjeoLb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from b224-13.smtp-out.eu-central-1.amazonses.com (b224-13.smtp-out.eu-central-1.amazonses.com [69.169.224.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E717F7;
	Sun,  6 Apr 2025 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.169.224.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743918195; cv=none; b=nQ/JJ3hapZyIYdVzWnBqx5Inxo9b5RPncHdt3WmizZDnRhFDBevXI9xq1OESj5c4VKhEHzsD3Lrgdo0sZQyQULqu7+Hmx/fq6FP30WU+Pqnn4JxNdC0WP5gpJCxoTlGC62XiKbmGPA8GZMkISoK7RL5Bd31K33YC7p6jb0KhZpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743918195; c=relaxed/simple;
	bh=X132Zuzj+UyFTooiYzFIYSnK9nlTk5dnLjrsA+EU9Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIVoKvxNgaWAJ+2qXYYgiCdLOBM1tkoT5FoscKgtpjJo4HnWHWSJyGKeQXuVSOrzTAR4WMABYVpFcRSPoSczHJ4Krk5AQxDJt1mbvwjU82TH9nVvG9vt6/zHYrgdkg97UxR7dHvI5dFVVrMTi68gQVWEkwi+JTC0+iAw9wgIHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de; spf=pass smtp.mailfrom=mail.riscv-rocks.de; dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b=MsiYGGkA; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=lNrjeoLb; arc=none smtp.client-ip=69.169.224.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.riscv-rocks.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=2kaovp6zxy5nzp5wqunvdq5vkiqbeqln; d=riscv-rocks.de; t=1743918190;
	h=Date:From:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
	bh=X132Zuzj+UyFTooiYzFIYSnK9nlTk5dnLjrsA+EU9Us=;
	b=MsiYGGkApY/79G2FW1zdUQd6ZxL4CdW7Bohu6wgAg3tAeyTHaLBtQP1e25SE7I5I
	c0bJcrF6tVFVylqx7HLFLqmqGlbxBdF36cWClcww54CYJPb8yBzYGOozJ/4aXGGkleG
	8SAbJLn0XcdBl41Exrd547aGDFgc12Ijnpb398TaeUio6k65VN2WvRk08CYdFUlX81r
	RBa77RbhAdxWJRM8rSHJ0YiuODqCyNGUpM62OyC7kHBetvp7EGgDN0Jg1gQjn1gWETK
	/HB5BmgisKzOEL+HKyM4BlpCvpWhjspAW+QI8OkvacitqdAmOwC+nfRYV9fqUtdFKg5
	jfEdwb/e5Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=54ecsf3zk7z4mwxwwox7z7bg6e5gwjsz; d=amazonses.com; t=1743918190;
	h=Date:From:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Feedback-ID;
	bh=X132Zuzj+UyFTooiYzFIYSnK9nlTk5dnLjrsA+EU9Us=;
	b=lNrjeoLbHWa+/UmyIiKsKhRAzepE4PlUAKmhVZdAHtbTXkbB3IzWtEfMtEYK1hbk
	/XlWhYczbvGtxXXW5YE050YlDc+WLgqhIwYjNQw9TR7qlolBHDzwE0WScD9zr2jkN/A
	MAaeY+5lXkGS/INqCQxR3uGGQu68dS6eRFL/wOvU=
Date: Sun, 6 Apr 2025 05:43:10 +0000
From: Damian Tometzki <damian@riscv-rocks.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.15-rc1
Message-ID: <01070196099fd059-e8463438-7b1b-4ec8-816d-173874be9966-000000@eu-central-1.amazonses.com>
Reply-To: Damian Tometzki <damian@riscv-rocks.de>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
User-Agent: Mutt
X-Operating-System: Linux Fedora release 42 (Adams) (Kernel 6.14.0)
Organization: Linux hacker
Feedback-ID: ::1.eu-central-1.yMcBPu/jK26Vj3HVmCFyFk75QMsS8V3QY5HbXP/Qrys=:AmazonSES
X-SES-Outgoing: 2025.04.06-69.169.224.13

On Sun, 06. Apr 07:04, Masahiro Yamada wrote:
> Hello Linus,
> 
> Please pull Kbuild updates for v6.15-rc1.
> 
> You will get a merge conflict in rust/Makefile.
> You can find the resolution in linux-next.
> 
> Thank you
> 
> 
> 
> The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:
> 
>   Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> tags/kbuild-v6.15
> 
> for you to fetch changes up to a7c699d090a1f3795c3271c2b399230e182db06e:
> 
>   kbuild: rpm-pkg: build a debuginfo RPM (2025-04-06 06:22:01 +0900)
> 
> ----------------------------------------------------------------
> Kbuild updates for v6.15
> 
>  - Improve performance in gendwarfksyms
> 
>  - Remove deprecated EXTRA_*FLAGS and KBUILD_ENABLE_EXTRA_GCC_CHECKS
> 
>  - Support CONFIG_HEADERS_INSTALL for ARCH=um
> 
>  - Use more relative paths to sources files for better reproducibility
> 
>  - Support the loong64 Debian architecture
> 
>  - Add Kbuild bash completion
> 
>  - Introduce intermediate vmlinux.unstripped for architectures that need
>    static relocations to be stripped from the final vmlinux
> 
>  - Fix versioning in Debian packages for -rc releases
> 
>  - Treat missing MODULE_DESCRIPTION() as an error
> 
>  - Convert Nios2 Makefiles to use the generic rule for built-in DTB
> 
>  - Add debuginfo support to the RPM package
> 
> ----------------------------------------------------------------
> Alexandru Gagniuc (1):
>       kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION unconditionally
> 
> Ard Biesheuvel (4):
>       kbuild: link-vmlinux.sh: Make output file name configurable
>       kbuild: Introduce Kconfig symbol for linking vmlinux with relocations
>       kbuild: Create intermediate vmlinux build with relocations preserved
>       x86: Get rid of Makefile.postlink
> 
> Daniel Gomez (1):
>       kconfig: merge_config: use an empty file as initfile
> 
> Jeff Johnson (1):
>       modpost: require a MODULE_DESCRIPTION()
> 
> Kefan Liu (1):
>       Documentation/kbuild: Fix indentation in modules.rst example
> 
> Kris Van Hees (1):
>       kbuild: exclude .rodata.(cst|str)* when building ranges
> 
> Krzysztof Kozlowski (1):
>       docs: kconfig: Mention IS_REACHABLE as way for optional dependency
> 
> Masahiro Yamada (17):
>       kbuild: remove EXTRA_*FLAGS support
>       gen_compile_commands.py: remove code for '\#' replacement
>       genksyms: factor out APP for the ST_NORMAL state
>       kconfig: do not clear SYMBOL_VALID when reading include/config/auto.conf
>       kconfig: remove unnecessary cast in sym_get_string()
>       modpost: introduce get_basename() helper
>       modpost: use strstarts() to clean up parse_source_files()
>       kbuild: move -fzero-init-padding-bits=all to the top-level Makefile
>       kbuild: remove KBUILD_ENABLE_EXTRA_GCC_CHECKS support
>       kbuild: add Kbuild bash completion
>       Revert "kheaders: Ignore silly-rename files"
>       kbuild: do not generate .tmp_vmlinux*.map when CONFIG_VMLINUX_MAP=y
>       kbuild: deb-pkg: fix versioning for -rc releases
>       kbuild: deb-pkg: remove "version" variable in mkdebian
>       kbuild: deb-pkg: add comment about future removal of KDEB_COMPRESS
>       kbuild: pacman-pkg: hardcode module installation path
>       nios2: migrate to the generic rule for built-in DTB
> 
> Miguel Ojeda (2):
>       kbuild: rust: add rustc-min-version support function
>       rust: kbuild: skip `--remap-path-prefix` for `rustdoc`
> 
> Sami Tolvanen (1):
>       gendwarfksyms: Add a separate pass to resolve FQNs
> 
> Seyediman Seyedarab (1):
>       kbuild: fix argument parsing in scripts/config
> 
> Thomas Wei�schuh (4):
>       kbuild: implement CONFIG_HEADERS_INSTALL for Usermode Linux
>       kbuild, rust: use -fremap-path-prefix to make paths relative
>       x86: drop unnecessary prefix map configuration
>       kbuild: make all file references relative to source root
> 
> Uday Shankar (2):
>       scripts: make python shebangs specific about desired version
>       kbuild: rpm-pkg: build a debuginfo RPM
> 
> WangYuli (1):
>       kbuild: deb-pkg: add debarch for ARCH=loongarch64
> 
> Xi Ruoyao (1):
>       kbuild: add dependency from vmlinux to sorttable
> 
> Xin Li (Intel) (1):
>       kbuild: Add a help message for "headers"
> 
>  .gitignore                                   |   1 +
>  Documentation/dev-tools/checkpatch.rst       |  18 --
>  Documentation/kbuild/bash-completion.rst     |  65 ++++
>  Documentation/kbuild/index.rst               |   2 +
>  Documentation/kbuild/kconfig-language.rst    |  29 +-
>  Documentation/kbuild/makefiles.rst           |  17 +-
>  Documentation/kbuild/modules.rst             |   2 +-
>  Documentation/kbuild/reproducible-builds.rst |  17 --
>  MAINTAINERS                                  |   1 +
>  Makefile                                     |  23 +-
>  arch/Kconfig                                 |   7 +
>  arch/arm64/Makefile                          |   2 +-
>  arch/mips/Kconfig                            |   1 +
>  arch/mips/Makefile                           |   4 -
>  arch/mips/Makefile.postlink                  |   2 +-
>  arch/nios2/Kbuild                            |   2 +-
>  arch/nios2/boot/dts/Makefile                 |   4 +-
>  arch/nios2/kernel/prom.c                     |   2 +-
>  arch/nios2/platform/Kconfig.platform         |  11 +-
>  arch/riscv/Kconfig                           |   1 +
>  arch/riscv/Makefile                          |   2 +-
>  arch/riscv/Makefile.postlink                 |  11 +-
>  arch/riscv/boot/Makefile                     |   5 +-
>  arch/s390/Kconfig                            |   1 +
>  arch/s390/Makefile                           |   2 +-
>  arch/s390/Makefile.postlink                  |   4 +-
>  arch/x86/Kconfig                             |   1 +
>  arch/x86/Makefile                            |   6 -
>  arch/x86/Makefile.postlink                   |  40 ---
>  arch/x86/boot/Makefile                       |   1 -
>  arch/x86/boot/compressed/Makefile            |  10 +-
>  kernel/gen_kheaders.sh                       |   1 -
>  lib/Kconfig.debug                            |   7 +-
>  rust/Makefile                                |   8 +-
>  scripts/Makefile.build                       |   4 -
>  scripts/Makefile.compiler                    |   4 +
>  scripts/Makefile.extrawarn                   |   3 -
>  scripts/Makefile.lib                         |   8 -
>  scripts/Makefile.vmlinux                     |  34 ++-
>  scripts/bash-completion/make                 | 451 ++++++++++++++++++++++++++++
>  scripts/checkpatch.pl                        |  14 -
>  scripts/clang-tools/gen_compile_commands.py  |   8 +-
>  scripts/config                               |  26 +-
>  scripts/gendwarfksyms/die.c                  |   2 +-
>  scripts/gendwarfksyms/dwarf.c                | 154 +++++-----
>  scripts/gendwarfksyms/gendwarfksyms.h        |   2 +
>  scripts/gendwarfksyms/types.c                |   2 +-
>  scripts/generate_builtin_ranges.awk          |   5 +
>  scripts/genksyms/lex.l                       |   6 +-
>  scripts/kconfig/confdata.c                   |  19 +-
>  scripts/kconfig/merge_config.sh              |   4 +-
>  scripts/kconfig/symbol.c                     |   2 +-
>  scripts/link-vmlinux.sh                      |  24 +-
>  scripts/mod/modpost.c                        |  45 ++-
>  scripts/mod/modpost.h                        |   1 +
>  scripts/mod/sumversion.c                     |  17 +-
>  scripts/package/PKGBUILD                     |   6 +-
>  scripts/package/debian/rules                 |  10 +-
>  scripts/package/kernel.spec                  |  46 ++-
>  scripts/package/mkdebian                     |  23 +-
>  scripts/package/mkspec                       |  10 +
>  scripts/show_delta                           |   2 +-
>  scripts/tracing/draw_functrace.py            |   2 +-
>  63 files changed, 892 insertions(+), 352 deletions(-)
>  create mode 100644 Documentation/kbuild/bash-completion.rst
>  delete mode 100644 arch/x86/Makefile.postlink
>  create mode 100644 scripts/bash-completion/make
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
Hi together, 

i got the following error after this pull request.

 MODPOST Module.symvers
ERROR: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
make[3]: *** [/home/damian/kernel/linux/scripts/Makefile.modpost:147: Module.symvers] Error 1
make[2]: *** [/home/damian/kernel/linux/Makefile:1956: modpost] Error 2
make[1]: *** [/home/damian/kernel/linux/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/home/damian/kernel/build'
make: *** [Makefile:248: __sub-make] Error 2

-- 
VG
Damian Tometzki

