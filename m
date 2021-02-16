Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F2B31D0AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 20:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhBPTIa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Feb 2021 14:08:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:49734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhBPTI0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Feb 2021 14:08:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D88264E65;
        Tue, 16 Feb 2021 19:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613502465;
        bh=za0f4uTtITaFEJOqwUTcVvoex4g75ZLG8Pcc8BKH4g0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P8i3UQPrBLwH+fsKASY+R+zY/g1sjwWcAl56BePTubnk2bL3x/jBT28nKHpRgT0Pe
         VaGJxMXpr2LL34VQaepvu2DlIJrZyv9HcIO3ZIWWV2vbYmwjBvi1RjQT6Mt95oq5K6
         Oe+1YuHYdjeTF0aSpXTiMf/WyaIPGXl3+BK9pswLKIhxvQ7uF46DuEFP4BWtllsDor
         CG7DgISab9Rv0PgwGOKbHFOuBW8ShqKcxi7bXuOc0dwiQLLgjJ5UaGE2mTF7jEHRc2
         8zW10fqWSQybWMMn5cxsLtHlNwkY/sdYs40V38JjQ2QPUz7jDNcPOGGXp1hK87snQN
         Ouqwf5srMN40A==
Date:   Tue, 16 Feb 2021 12:07:43 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        David Laight <david.laight@aculab.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Quentin Perret <qperret@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: check the minimum linker version in Kconfig
Message-ID: <20210216190743.GA18370@24bbad8f3778>
References: <20210216031004.552417-1-masahiroy@kernel.org>
 <20210216031004.552417-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216031004.552417-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 16, 2021 at 12:10:04PM +0900, Masahiro Yamada wrote:
> Unify the two scripts/ld-version.sh and scripts/lld-version.sh, and
> check the minimum linker version like scripts/cc-version.sh did.
> 
> I tested this script for some corner cases reported in the past:
> 
>  - GNU ld version 2.25-15.fc23
>    as reported by commit 8083013fc320 ("ld-version: Fix it on Fedora")
> 
>  - GNU ld (GNU Binutils) 2.20.1.20100303
>    as reported by commit 0d61ed17dd30 ("ld-version: Drop the 4th and
>    5th version components")
> 
> This script show an error message if the linker is too old:
> 
>   $ make LD=ld.lld-9
>     SYNC    include/config/auto.conf
>   ***
>   *** Linker is too old.
>   ***   Your LLD version:    9.0.1
>   ***   Minimum LLD version: 10.0.1
>   ***
>   scripts/Kconfig.include:50: Sorry, this linker is not supported.
>   make[2]: *** [scripts/kconfig/Makefile:71: syncconfig] Error 1
>   make[1]: *** [Makefile:600: syncconfig] Error 2
>   make: *** [Makefile:708: include/config/auto.conf] Error 2
> 
> I also moved the check for gold to this script, so gold is still rejected:
> 
>   $ make LD=gold
>     SYNC    include/config/auto.conf
>   gold linker is not supported as it is not capable of linking the kernel proper.
>   scripts/Kconfig.include:50: Sorry, this linker is not supported.
>   make[2]: *** [scripts/kconfig/Makefile:71: syncconfig] Error 1
>   make[1]: *** [Makefile:600: syncconfig] Error 2
>   make: *** [Makefile:708: include/config/auto.conf] Error 2
> 
> Thanks to David Laight for suggesting shell script improvements.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  MAINTAINERS             |  1 -
>  init/Kconfig            | 21 +++++++----
>  scripts/Kconfig.include |  7 +++-
>  scripts/ld-version.sh   | 82 ++++++++++++++++++++++++++++++++++++-----
>  scripts/lld-version.sh  | 20 ----------
>  5 files changed, 90 insertions(+), 41 deletions(-)
>  delete mode 100755 scripts/lld-version.sh
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df820969be1f..6b82ad6990b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4314,7 +4314,6 @@ C:	irc://chat.freenode.net/clangbuiltlinux
>  F:	Documentation/kbuild/llvm.rst
>  F:	include/linux/compiler-clang.h
>  F:	scripts/clang-tools/
> -F:	scripts/lld-version.sh
>  K:	\b(?i:clang|llvm)\b
>  
>  CLEANCACHE API
> diff --git a/init/Kconfig b/init/Kconfig
> index 7bcfa24524c2..42b69ee29dca 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -33,24 +33,29 @@ config GCC_VERSION
>  	default $(cc-version) if CC_IS_GCC
>  	default 0
>  
> -config LD_VERSION
> -	int
> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> -
>  config CC_IS_CLANG
>  	def_bool $(success,test "$(cc-name)" = Clang)
>  
> -config LD_IS_LLD
> -	def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
> -
>  config CLANG_VERSION
>  	int
>  	default $(cc-version) if CC_IS_CLANG
>  	default 0
>  
> +config LD_IS_BFD
> +	def_bool $(success,test "$(ld-name)" = BFD)
> +
> +config LD_VERSION
> +	int
> +	default $(ld-version) if LD_IS_BFD
> +	default 0
> +
> +config LD_IS_LLD
> +	def_bool $(success,test "$(ld-name)" = LLD)
> +
>  config LLD_VERSION
>  	int
> -	default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
> +	default $(ld-version) if LD_IS_LLD
> +	default 0
>  
>  config CC_CAN_LINK
>  	bool
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 0228cb9c74aa..58fdb5308725 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -45,8 +45,11 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not su
>  cc-name := $(shell,set -- $(cc-info) && echo $1)
>  cc-version := $(shell,set -- $(cc-info) && echo $2)
>  
> -# Fail if the linker is gold as it's not capable of linking the kernel proper
> -$(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
> +# Get the linker name, version, and error out if it is not supported.
> +ld-info := $(shell,$(srctree)/scripts/ld-version.sh $(LD))
> +$(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supported.)
> +ld-name := $(shell,set -- $(ld-info) && echo $1)
> +ld-version := $(shell,set -- $(ld-info) && echo $2)
>  
>  # machine bit flags
>  #  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index 0f8a2c0f9502..a463273509b5 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -1,11 +1,73 @@
> -#!/usr/bin/awk -f
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
> -# extract linker version number from stdin and turn into single number
> -	{
> -	gsub(".*\\)", "");
> -	gsub(".*version ", "");
> -	gsub("-.*", "");
> -	split($1,a, ".");
> -	print a[1]*10000 + a[2]*100 + a[3];
> -	exit
> -	}
> +#
> +# Print the linker name and its version in a 5 or 6-digit form.
> +# Also, perform the minimum version check.
> +
> +set -e
> +
> +# When you raise the minimum linker version, please update
> +# Documentation/process/changes.rst as well.
> +bfd_min_version=2.23.0
> +lld_min_version=10.0.1
> +
> +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> +get_canonical_version()
> +{
> +	IFS=.
> +	set -- $1
> +
> +	# If the 2nd or 3rd field is missing, fill it with a zero.
> +	#
> +	# The 4th field, if present, is ignored.
> +	# This occurs in development snapshots as in 2.35.1.20201116
> +	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> +}
> +
> +orig_args="$@"
> +
> +# Get the first line of the --version output.
> +IFS='
> +'
> +set -- $("$@" --version)
> +
> +# Split the line on spaces.
> +IFS=' '
> +set -- $1
> +
> +if [ "$1" = GNU -a "$2" = ld ]; then
> +	shift $(($# - 1))
> +	version=$1
> +	min_version=$bfd_min_version
> +	name=BFD
> +	disp_name="GNU ld"
> +elif [ "$1" = GNU -a "$2" = gold ]; then
> +	echo "gold linker is not supported as it is not capable of linking the kernel proper." >&2
> +	exit 1
> +elif [ "$1" = LLD ]; then
> +	version=$2
> +	min_version=$lld_min_version
> +	name=LLD
> +	disp_name=LLD
> +else
> +	echo "$orig_args: unknown linker" >&2
> +	exit 1
> +fi
> +
> +# Some distributions append a package release number, as in 2.34-4.fc32
> +# Trim the hyphen and any characters that follow.
> +version=${version%-*}
> +
> +cversion=$(get_canonical_version $version)
> +min_cversion=$(get_canonical_version $min_version)
> +
> +if [ "$cversion" -lt "$min_cversion" ]; then
> +	echo >&2 "***"
> +	echo >&2 "*** Linker is too old."
> +	echo >&2 "***   Your $disp_name version:    $version"
> +	echo >&2 "***   Minimum $disp_name version: $min_version"
> +	echo >&2 "***"
> +	exit 1
> +fi
> +
> +echo $name $cversion
> diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
> deleted file mode 100755
> index d70edb4d8a4f..000000000000
> --- a/scripts/lld-version.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# Usage: $ ./scripts/lld-version.sh ld.lld
> -#
> -# Print the linker version of `ld.lld' in a 5 or 6-digit form
> -# such as `100001' for ld.lld 10.0.1 etc.
> -
> -linker_string="$($* --version)"
> -
> -if ! ( echo $linker_string | grep -q LLD ); then
> -	echo 0
> -	exit 1
> -fi
> -
> -VERSION=$(echo $linker_string | cut -d ' ' -f 2)
> -MAJOR=$(echo $VERSION | cut -d . -f 1)
> -MINOR=$(echo $VERSION | cut -d . -f 2)
> -PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> -printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> -- 
> 2.27.0
> 
