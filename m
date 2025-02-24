Return-Path: <linux-kbuild+bounces-5878-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A76A42326
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 15:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D80162F73
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F56314D28C;
	Mon, 24 Feb 2025 14:25:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69513AA2D;
	Mon, 24 Feb 2025 14:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407148; cv=none; b=appMPVDVIFd7jky8yjP/vaHsjA6XaJIRguF0zH6bkQIWQhoDwFOhJgW1Y3bURitX3p9ntNMnQYfSJRflz1cjMNpNqMu5cGgWwlRoXdr5bW7R5KVmeTo42drQbp4t9TUB4QRZxsfohk3rAQttt4awFX0soTVbDrPl+1Mz/8Ke6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407148; c=relaxed/simple;
	bh=lo4cANUE66X8njwHLhDW2tG+DZRDi3HBlrQ+pi9YCKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3uYC1itR/DRBHN291LBAhYC/gV64r/FRcNUiQVBiX7WoilQlAIMCfWyP6aENizfAUWuKcqmLgyUWepgHPOvQPRaj5jX570VQDcbPrIgqgyM6gMRrapYfklZQLCEB1KuvkE3YoVAo1+w/vTrKJ5v4+mU9y1dUrLfyYtMy2Hi4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 67bc815e-038b-7f0000032729-7f000001cd5c-1
	for <multiple-recipients>; Mon, 24 Feb 2025 15:25:34 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 24 Feb 2025 15:25:34 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 7F0998074B;
	Mon, 24 Feb 2025 15:25:34 +0100 (CET)
Received: from l-nschier-z2.ads.avm.de (unknown [IPv6:fde4:4c1b:acd5:7792::1])
	by buildd.core.avm.de (Postfix) with ESMTP id 72551181209;
	Mon, 24 Feb 2025 15:25:34 +0100 (CET)
Received: from nicolas by l-nschier-z2.ads.avm.de with local (Exim 4.98)
	(envelope-from <n.schier@avm.de>)
	id 1tmZOn-0000000BFOD-1i9a;
	Mon, 24 Feb 2025 15:25:33 +0100
Date: Mon, 24 Feb 2025 15:25:33 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add Kbuild bash completion
Message-ID: <20250224-vivid-merry-oriole-f0cb8a@l-nschier-z2>
References: <20250207193133.506076-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207193133.506076-1-masahiroy@kernel.org>
X-purgate-ID: 149429::1740407134-6CA44F57-49389224/0/0
X-purgate-type: clean
X-purgate-size: 16855
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Sat, Feb 08, 2025 at 04:31:31AM +0900, Masahiro Yamada wrote:
> Kernel build commands can sometimes be long, particularly when
> cross-compiling, making them tedious to type and prone to mistypes.
> 
> This commit introduces bash completion support for common variables
> and targets in Kbuild.
> 
> For installation instructions, please refer to the documentation in
> Documentation/kbuild/bash-completion.rst.
> 
> The following examples demonstrate how this saves typing.
> 
> [Example 1] a long command line for cross-compiling
> 
>   $ make A<TAB>
>    -> completes 'A' to 'ARCH='
> 
>   $ make ARCH=<TAB>
>    -> displays all supported architectures
> 
>   $ make ARCH=arm64 CR<TAB>
>    -> completes 'CR' to 'CROSS_COMPILE='
> 
>   $ make ARCH=arm64 CROSS_COMPILE=<TAB>
>    -> displays installed toolchains
> 
>   $ make ARCH=arm64 CROSS_COMPILE=aa<TAB>
>    -> completes 'CROSS_COMPILE=aa' to 'CROSS_COMPILE=aarch64-linux-gnu-'
> 
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- def<TAB>
>    -> completes 'def' to 'defconfig'
> 
> [Example 2] a single build target
> 
>   $ make f<TAB>
>    -> completes 'f' to 'fs/'
> 
>   $ make fs/<TAB>
>    -> displays objects and sub-directories in fs/
> 
>   $ make fs/xf<TAB>
>    -> completes 'fs/xf' to 'fs/xfs/'
> 
>   $ make fs/xfs/l<TAB>
>    -> completes 'fs/xfs/l' to 'fs/xfs/libxfs/xfs_'
> 
>   $ make fs/xfs/libxfs/xfs_g<TAB>
>    -> completes 'fs/xfs/libxfs/xfs_g' to 'fs/xfs/libxfs/xfs_group.o'
> 
> This does not aim to provide a complete list of variables and targets,
> as there are too many. However, it covers variables and targets used
> in common scenarios, and I hope this is useful enough.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Thanks!  I have been testing this a few days and find it quite handy;
especially I do like the toolchain completion!

> 
>  Documentation/kbuild/bash-completion.rst |  65 ++++
>  Documentation/kbuild/index.rst           |   2 +
>  MAINTAINERS                              |   1 +
>  scripts/bash-completion/make             | 451 +++++++++++++++++++++++
>  4 files changed, 519 insertions(+)
>  create mode 100644 Documentation/kbuild/bash-completion.rst
>  create mode 100644 scripts/bash-completion/make
> 
> diff --git a/Documentation/kbuild/bash-completion.rst b/Documentation/kbuild/bash-completion.rst
> new file mode 100644
> index 000000000000..2b52dbcd0933
> --- /dev/null
> +++ b/Documentation/kbuild/bash-completion.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +==========================
> +Bash completion for Kbuild
> +==========================
> +
> +The kernel build system is written using Makefiles, and Bash completion
> +for the `make` command is available through the `bash-completion`_ project.
> +
> +However, the Makefiles for the kernel build are complex. The generic completion
> +rules for the `make` command do not provide meaningful suggestions for the
> +kernel build system, except for the options of the `make` command itself.
> +
> +To enhance completion for various variables and targets, the kernel source
> +includes its own completion script at `scripts/bash-completion/make`.
> +
> +This script provides additional completions when working within the kernel tree.
> +Outside the kernel tree, it defaults to the generic completion rules for the
> +`make` command.
> +
> +Prerequisites
> +=============
> +
> +The script relies on helper functions provided by `bash-completion`_ project.
> +Please ensure it is installed on your system. On most distributions, you can
> +install the `bash-completion` package through the standard package manager.
> +
> +How to use
> +==========
> +
> +You can source the script directly::
> +
> +  $ source scripts/bash-completion/make
> +
> +Or, you can copy it into the search path for Bash completion scripts.
> +For example::
> +
> +  $ mkdir -p ~/.local/share/bash-completion/completions
> +  $ cp scripts/bash-completion/make ~/.local/share/bash-completion/completions/
> +
> +Details
> +=======
> +
> +The additional completion for Kbuild is enabled in the following cases:
> +
> + - You are in the root directory of the kernel source.
> + - You are in the top-level build directory created by the O= option
> +   (checked via the `source` symlink pointing to the kernel source).
> + - The -C make option specifies the kernel source or build directory.
> + - The -f make option specifies a file in the kernel source or build directory.
> +
> +If none of the above are met, it falls back to the generic completion rules.
> +
> +The completion supports:
> +
> +  - Commonly used targets, such as `all`, `menuconfig`, `dtbs`, etc.
> +  - Make (or environment) variables, such as `ARCH`, `LLVM`, etc.
> +  - Single-target builds (`foo/bar/baz.o`)
> +  - Configuration files (`*_defconfig` and `*.config`)
> +
> +Some variables offer intelligent behavior. For instance, `CROSS_COMPILE=`
> +followed by a TAB displays installed toolchains. The list of defconfig files
> +shown depends on the value of the `ARCH=` variable.
> +
> +.. _bash-completion: https://github.com/scop/bash-completion/
> diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
> index e82af05cd652..3731ab22bfe7 100644
> --- a/Documentation/kbuild/index.rst
> +++ b/Documentation/kbuild/index.rst
> @@ -23,6 +23,8 @@ Kernel Build System
>      llvm
>      gendwarfksyms
>  
> +    bash-completion
> +
>  .. only::  subproject and html
>  
>     Indices
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa065..cca379fbeb4f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12566,6 +12566,7 @@ F:	Makefile
>  F:	scripts/*vmlinux*
>  F:	scripts/Kbuild*
>  F:	scripts/Makefile*
> +F:	scripts/bash-completion/
>  F:	scripts/basic/
>  F:	scripts/clang-tools/
>  F:	scripts/dummy-tools/
> diff --git a/scripts/bash-completion/make b/scripts/bash-completion/make
> new file mode 100644
> index 000000000000..d06e642ddcf7
> --- /dev/null
> +++ b/scripts/bash-completion/make
> @@ -0,0 +1,451 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# bash completion for GNU make with kbuild extension       -*- shell-script -*-
> +
> +# Load the default completion script for make. It is typically located at
> +# /usr/share/bash-completion/completions/make, but we do not rely on it.
> +__kbuild_load_default_make_completion()
> +{
> +	local -a dirs=("${BASH_COMPLETION_USER_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion}/completions")
> +	local ifs=$IFS IFS=: dir compfile this_dir
> +
> +	for dir in ${XDG_DATA_DIRS:-/usr/local/share:/usr/share}; do
> +	        dirs+=("$dir"/bash-completion/completions)
> +	done
> +	IFS=$ifs
> +
> +	this_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
> +
> +	for dir in "${dirs[@]}"; do
> +		if [[ ! -d ${dir} || ${dir} = "${this_dir}" ]]; then
> +			continue
> +		fi
> +
> +		for compfile in make make.bash _make; do
> +			compfile=$dir/$compfile
> +			# Avoid trying to source dirs; https://bugzilla.redhat.com/903540
> +			if [[ -f ${compfile} ]] && . "${compfile}" &>/dev/null; then
> +
> +				__kbuild_default_make_completion=$(
> +					# shellcheck disable=SC2046 # word splitting is the point here
> +					set -- $(complete -p make)
> +
> +					while [[ $# -gt 1 && "$1" != -F ]]; do
> +						shift
> +					done
> +
> +					if [[ "$1" = -F ]]; then
> +						echo "$2"
> +					fi
> +				)
> +
> +				return
> +			fi
> +		done
> +	done
> +}
> +
> +__kbuild_load_default_make_completion
> +
> +__kbuild_handle_variable()
> +{
> +	local var=${1%%=*}
> +	local cur=${cur#"${var}"=}
> +	local srctree=$2
> +	local keywords=()
> +
> +	case $var in
> +	ARCH)
> +		# sub-directories under arch/
> +		keywords+=($(find "${srctree}/arch" -mindepth 1 -maxdepth 1 -type d -printf '%P\n'))
> +		# architectures hard-coded in the top Makefile
> +		keywords+=(i386 x86_64 sparc32 sparc64 parisc64)
> +		;;
> +	CROSS_COMPILE)
> +		# toolchains with a full path
> +		local cross_compile=()
> +		local c c2
> +		_filedir
> +
> +		for c in "${COMPREPLY[@]}"; do
> +			# eval for tilde expansion
> +			# suppress error, as this fails when it contains a space
> +			eval "c2=${c}" 2>/dev/null || continue
> +			if [[ ${c} == *-elfedit && ! -d ${c2} && -x ${c2} ]]; then
> +				cross_compile+=("${c%elfedit}")
> +			fi
> +		done
> +
> +		# toolchains in the PATH environment
> +		while read -r c; do
> +			if [[ ${c} == *-elfedit ]]; then
> +				keywords+=("${c%elfedit}")
> +			fi
> +		done < <(compgen -c)
> +
> +		COMPREPLY=()
> +		_filedir -d
> +
> +		# Add cross_compile directly without passing it to compgen.
> +		# Otherwise, toolchain paths with a tilde do not work.
> +		# e.g.)
> +		#   CROSS_COMPILE=~/0day/gcc-14.2.0-nolibc/aarch64-linux/bin/aarch64-linux-
> +		COMPREPLY+=("${cross_compile[@]}")
> +		;;
> +	LLVM)
> +		# LLVM=1 uses the default 'clang' etc.
> +		keywords+=(1)
> +
> +		# suffix for a particular version. LLVM=-18 uses 'clang-18' etc.
> +		while read -r c; do
> +			if [[ ${c} == clang-[0-9]* ]]; then
> +				keywords+=("${c#clang}")
> +			fi
> +		done < <(compgen -c)
> +
> +		# directory path to LLVM toolchains
> +		_filedir -d
> +		;;
> +	KCONFIG_ALLCONFIG)
> +		# KCONFIG_ALLCONFIG=1 selects the default fragment
> +		keywords+=(1)
> +		# or the path to a fragment file
> +		_filedir
> +		;;
> +	C | KBUILD_CHECKSRC)
> +		keywords+=(1 2)
> +		;;
> +	V | KBUILD_VERBOSE)
> +		keywords+=({,1}{,2})
> +		;;
> +	W | KBUILD_EXTRA_WARN)
> +		keywords+=({,1}{,2}{,3}{,c}{,e})
> +		;;
> +	KBUILD_ABS_SRCTREE | KBUILD_MODPOST_NOFINAL | KBUILD_MODPOST_WARN | \
> +		CLIPPY | KBUILD_CLIPPY | KCONFIG_NOSILENTUPDATE | \
> +		KCONFIG_OVERWRITECONFIG | KCONFIG_WARN_UNKNOWN_SYMBOL | \
> +		KCONFIG_WERROR )
> +		keywords+=(1)
> +		;;
> +	INSTALL_MOD_STRIP)
> +		keywords+=(1 --strip-debug --strip-unneeded)
> +		;;
> +	O | KBUILD_OUTPUT | M | KBUILD_EXTMOD | MO | KBUILD_EXTMOD_OUTPUT | *_PATH)
> +		# variables that take a directory.
> +		_filedir -d

Would it make sense to temporarily switch cwd to ${srctree} to allow
completion of KBUILD_OUTPUT and friends with relative paths from
${srctree}?

A simple approach (probably with some bad side-effects), works for me:

		local opwd=$OLDPWD
                cd ${srctree} && _filedir -d && cd $OLDPWD
                OLDPWD=$opwd

But this is quite a step further, if there is no clean solution right
now, I'd prefer leaving it as it is for now.

> +		return
> +		;;
> +	KBUILD_EXTRA_SYMBOL | KBUILD_KCONFIG | KCONFIG_CONFIG)
> +		# variables that take a file.
> +		_filedir
> +		return
> +	esac
> +
> +	COMPREPLY+=($(compgen -W "${keywords[*]}" -- "${cur}"))
> +}
> +
> +# Check the -C, -f options and 'source' symlink. Return the source tree we are
> +# working in.
> +__kbuild_get_srctree()
> +{
> +	local words=("$@")
> +	local cwd makef_dir
> +
> +        # see if a path was specified with -C/--directory
> +        for ((i = 1; i < ${#words[@]}; i++)); do

indent ^^: spaces instead of tab

> +		if [[ ${words[i]} == -@(C|-directory) ]]; then
> +			# eval for tilde expansion.
> +			# suppress error, as this fails when it contains a space
> +			eval "cwd=${words[i + 1]}" 2>/dev/null
> +			break
> +		fi
> +        done

indent ^: spaces instead of tab

> +
> +	if [[ -z ${cwd} ]]; then
> +		cwd=.
> +	fi
> +
> +        # see if a Makefile was specified with -f/--file/--makefile
> +        for ((i = 1; i < ${#words[@]}; i++)); do

indent ^^: spaces instead of tab

> +		if [[ ${words[i]} == -@(f|-?(make)file) ]]; then

(I am really impressed: everytime I am reviewing one of your new shell
scripts, I learn something new.  TIL: '-@()' and '?()'.)

> +			# eval for tilde expansion
> +			# suppress error, as this fails when it contains a space
> +			eval "makef_dir=${words[i + 1]%/*}" 2>/dev/null
> +			break
> +		fi
> +        done

indent ^: spaces instead of tab

> +
> +	if [ -z "${makef_dir}" ]; then
> +		makef_dir=${cwd}
> +	elif [[ ${makef_dir} != /* ]]; then
> +		makef_dir=${cwd}/${makef_dir}
> +	fi
> +
> +	# If ${makef_dir} is a build directory created by the O= option, there
> +	# is a symbolic link 'source', which points to the kernel source tree.
> +	if [[ -L ${makef_dir}/source ]]; then
> +		makef_dir=$(readlink "${makef_dir}/source")
> +	fi
> +
> +	echo "${makef_dir}"
> +}
> +
> +# Get SRCARCH to do a little more clever things
> +__kbuild_get_srcarch()
> +{
> +	local words=("$@")
> +	local arch srcarch uname_m
> +
> +        # see if ARCH= is explicitly specified
> +        for ((i = 1; i < ${#words[@]}; i++)); do

indent ^^: spaces instead of tab

> +		if [[ ${words[i]} == ARCH=* ]]; then
> +			arch=${words[i]#ARCH=}
> +			break
> +		fi
> +        done

indent ^: spaces instead of tab

> +
> +	# If ARCH= is not specified, check the build marchine's architecture
> +	if [[ -z ${arch} ]]; then
> +		uname_m=$(uname -m)
> +
> +		# shellcheck disable=SC2209 # 'sh' is SuperH, not a shell command
> +		case ${uname_m} in
> +		arm64 | aarch64*) arch=arm64 ;;
> +		arm* | sa110)     arch=arm ;;
> +		i?86 | x86_64)    arch=x86 ;;
> +		loongarch*)       arch=loongarch ;;
> +		mips*)            arch=mips ;;
> +		ppc*)             arch=powerpc ;;
> +		riscv*)           arch=riscv ;;
> +		s390x)            arch=s390 ;;
> +		sh[234]*)         arch=sh ;;
> +		sun4u)            arch=sparc64 ;;
> +		*)                arch=${uname_m} ;;
> +		esac
> +	fi
> +
> +	case ${arch} in
> +		parisc64)          srcarch=parisc ;;
> +		sparc32 | sparc64) srcarch=sparc ;;
> +		i386 | x86_64)     srcarch=x86 ;;
> +		*)                 srcarch=${arch} ;;
> +	esac
> +
> +	echo "$srcarch"
> +}
> +
> +# small Makefile to parse obj-* syntax
> +__kbuild_tmp_makefile()
> +{
> +cat <<'EOF'
> +.PHONY: __default
> +__default:
> +	$(foreach m,$(obj-y) $(obj-m) $(obj-),$(foreach s, -objs -y -m -,$($(m:%.o=%$s))) $(m))
> +EOF
> +echo "include ${1}"
> +}
> +
> +_make_for_kbuild ()
> +{
> +	# shellcheck disable=SC2034 # these are set by _init_completion
> +	local cur prev words cword split
> +	_init_completion -s || return
> +
> +	local srctree
> +	srctree=$(__kbuild_get_srctree "${words[@]}")
> +
> +	# If 'kernel' and 'Documentation' directories are found, we assume this
> +	# is a kernel tree. Otherwise, we fall back to the generic rule provided
> +	# by the bash-completion project.
> +	if [[ ! -d ${srctree}/kernel || ! -d ${srctree}/Documentation ]]; then
> +		if [ -n "${__kbuild_default_make_completion}" ]; then
> +			"${__kbuild_default_make_completion}" "$@"
> +		fi
> +		return
> +	fi
> +
> +	# make options with a parameter (copied from the bash-completion project)
> +	case ${prev} in
> +        --file | --makefile | --old-file | --assume-old | --what-if | --new-file | \

indent ^: spaces instead of tab

> +		--assume-new | -!(-*)[foW])
> +		_filedir
> +		return
> +		;;
> +	--include-dir | --directory | -!(-*)[ICm])
> +		_filedir -d
> +		return
> +		;;
> +	-!(-*)E)
> +		COMPREPLY=($(compgen -v -- "$cur"))
> +		return
> +		;;
> +	--eval | -!(-*)[DVx])
> +		return
> +		;;
> +	--jobs | -!(-*)j)
> +		COMPREPLY=($(compgen -W "{1..$(($(_ncpus) * 2))}" -- "$cur"))
> +		return
> +		;;
> +	esac
> +
> +	local keywords=()
> +
> +	case ${cur} in
> +	-*)
> +		# make options (copied from the bash-completion project)
> +		local opts
> +		opts="$(_parse_help "$1")"
> +		COMPREPLY=($(compgen -W "${opts:-$(_parse_usage "$1")}" -- "$cur"))
> +		if [[ ${COMPREPLY-} == *= ]]; then
> +			compopt -o nospace
> +		fi
> +		return
> +		;;
> +	*=*)
> +		__kbuild_handle_variable "${cur}" "${srctree}"
> +		return
> +		;;
> +	KBUILD_*)
> +		# There are many variables prefixed with 'KBUILD_'.
> +		# Display them only when 'KBUILD_' is entered.
> +		# shellcheck disable=SC2191 # '=' is appended for variables
> +		keywords+=(
> +			KBUILD_{CHECKSRC,EXTMOD,EXTMOD_OUTPUT,VERBOSE,EXTRA_WARN,CLIPPY}=
> +			KBUILD_BUILD_{USER,HOST,TIMESTAMP}=
> +			KBUILD_MODPOST_{NOFINAL,WARN}=
> +			KBUILD_{ABS_SRCTREE,EXTRA_SYMBOLS,KCONFIG}=

Did you leave-out KBUILD_OUTPUT by intention?  I think it would be nice
to complete it here, too.


I am unsure, if I like the mix of quoted and unquoted use of variables.
But as they all look correct to me, this is just a question of personal
style.



Thanks, I really appreciate this kbuild bash-completion.

Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Nicolas Schier <n.schier@avm.de>

Kind regards,
Nicolas

