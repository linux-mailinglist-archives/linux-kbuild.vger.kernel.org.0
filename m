Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C3932C909
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 02:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352892AbhCDBCD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 20:02:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:47700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1391322AbhCDAMk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 19:12:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 398EF64EA4;
        Thu,  4 Mar 2021 00:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614816705;
        bh=m4L5RvaxaTE08bGOKFwv2wIZz3/lswQliNHK3hL5tcw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J+WyZeDLgVRZjHzQ7sTPh8z/TXwdFp0YZzhgo5zLWMannz5HK5g8qo4OzbD3i0QAB
         qgdfbUnChZh97AQws6J3pgDvkd5+Eaapq4GI+YmAd4N3iNJPp7LucpdjANZilT71V0
         A7I3Wg3I8QPnRZ74KZQANunaFqtf7APxYpGoHsjPX1lxXYMCnmewYsLT+jjtr9aIcV
         5IrAjjJLNg117iSpYIKJ/q8HsENs/IzbJYnY9bJFZ9TiLsdyrhihq7mOFbB2w5U696
         JJXLgsSo9gfNM2Poew4rsUpVAyKvKjcyXTzpcCRMzKTB8+qO5lBmzsbcOr94TU1Rik
         VaDRbCa/vjmTA==
Date:   Wed, 3 Mar 2021 17:11:41 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] kbuild: collect minimum tool versions into
 scripts/tool-version.sh
Message-ID: <20210304001141.7lejurony2poqkid@archlinux-ax161>
References: <20210303183333.46543-1-masahiroy@kernel.org>
 <20210303183333.46543-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303183333.46543-2-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 04, 2021 at 03:33:31AM +0900, Masahiro Yamada wrote:
> The kernel build uses various tools, many of which are provided by the
> same software suite, for example, LLVM and Binutils.
> 
> When we raise the minimal version of Clang/LLVM, we need to update
> clang_min_version in scripts/cc-version.sh and also lld_min_version in
> scripts/ld-version.sh.
> 
> In fact, Kbuild can handle CC=clang and LD=ld.lld independently, and we
> could manage their minimal version separately, but it does not make
> much sense.
> 
> Make scripts/tool-version.sh a central place of minimum tool versions
> so that we do not need to touch multiple files.
> 
> This script prints the minimal version of the given tool.
> 
>   $ scripts/tool-version.sh gcc
>   4.9.0
>   $ scripts/tool-version.sh llvm
>   10.0.1
>   $ scripts/tool-version.sh binutils
>   2.23.0
>   $ scripts/tool-version.sh foo
>   foo: unknown tool
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Two comments below.

> ---
> 
>  scripts/cc-version.sh   | 20 +++++---------------
>  scripts/ld-version.sh   | 11 ++++-------
>  scripts/tool-version.sh | 27 +++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 22 deletions(-)
>  create mode 100755 scripts/tool-version.sh
> 
> diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> index 3f2ee885b116..4772f1ef9cac 100755
> --- a/scripts/cc-version.sh
> +++ b/scripts/cc-version.sh
> @@ -6,18 +6,6 @@
>  
>  set -e
>  
> -# When you raise the minimum compiler version, please update
> -# Documentation/process/changes.rst as well.
> -gcc_min_version=4.9.0
> -clang_min_version=10.0.1
> -icc_min_version=16.0.3 # temporary
> -
> -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> -# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> -if [ "$SRCARCH" = arm64 ]; then
> -	gcc_min_version=5.1.0
> -fi
> -
>  # Print the compiler name and some version components.
>  get_compiler_info()
>  {
> @@ -48,18 +36,20 @@ set -- $(get_compiler_info "$@")
>  
>  name=$1
>  
> +tool_version=$(dirname $0)/tool-version.sh

I realize these scripts are currently called by their full path but is
it worth making this '$(dirname "$(readlink -f "$0")")' here and in
ld-version.sh just in case that does not happen?

>  case "$name" in
>  GCC)
>  	version=$2.$3.$4
> -	min_version=$gcc_min_version
> +	min_version=$($tool_version gcc)
>  	;;
>  Clang)
>  	version=$2.$3.$4
> -	min_version=$clang_min_version
> +	min_version=$($tool_version llvm)
>  	;;
>  ICC)
>  	version=$(($2 / 100)).$(($2 % 100)).$3
> -	min_version=$icc_min_version
> +	min_version=$($tool_version icc)
>  	;;
>  *)
>  	echo "$orig_args: unknown compiler" >&2
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index a463273509b5..e824f7675693 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -6,11 +6,6 @@
>  
>  set -e
>  
> -# When you raise the minimum linker version, please update
> -# Documentation/process/changes.rst as well.
> -bfd_min_version=2.23.0
> -lld_min_version=10.0.1
> -
>  # Convert the version string x.y.z to a canonical 5 or 6-digit form.
>  get_canonical_version()
>  {
> @@ -35,10 +30,12 @@ set -- $("$@" --version)
>  IFS=' '
>  set -- $1
>  
> +tool_version=$(dirname $0)/tool-version.sh
> +
>  if [ "$1" = GNU -a "$2" = ld ]; then
>  	shift $(($# - 1))
>  	version=$1
> -	min_version=$bfd_min_version
> +	min_version=$($tool_version binutils)
>  	name=BFD
>  	disp_name="GNU ld"
>  elif [ "$1" = GNU -a "$2" = gold ]; then
> @@ -46,7 +43,7 @@ elif [ "$1" = GNU -a "$2" = gold ]; then
>  	exit 1
>  elif [ "$1" = LLD ]; then
>  	version=$2
> -	min_version=$lld_min_version
> +	min_version=$($tool_version llvm)
>  	name=LLD
>  	disp_name=LLD
>  else
> diff --git a/scripts/tool-version.sh b/scripts/tool-version.sh
> new file mode 100755
> index 000000000000..b4aa27e2c3d3
> --- /dev/null
> +++ b/scripts/tool-version.sh
> @@ -0,0 +1,27 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Print the minimum supported version of the given tool.
> +
> +set -e
> +
> +# When you raise the minimum version, please update
> +# Documentation/process/changes.rst as well.
> +gcc_min_version=4.9.0
> +llvm_min_version=10.0.1
> +icc_min_version=16.0.3 # temporary
> +binutils_min_version=2.23.0
> +
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> +# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> +if [ "$SRCARCH" = arm64 ]; then
> +	gcc_min_version=5.1.0
> +fi
> +
> +eval min_version="\$${1}_min_version"
> +if [ -z "$min_version" ]; then
> +	echo "$1: unknown tool" >&2
> +	exit 1
> +fi
> +
> +echo "$min_version"
> -- 
> 2.27.0
> 

Would scripts/tool-version.sh be easier to read and interpret using a
case statement?

#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
#
# Print the minimum supported version of the given tool.
# When you raise the minimum version, please update
# Documentation/process/changes.rst as well.

case "$1" in
binutils)
    echo "2.23.0"
    ;;
gcc)
    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
    # https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
    if [ "$SRCARCH" = arm64 ]; then
        echo "5.1.0"
    else
        echo "4.9.0"
    fi
    ;;
icc)
    # temporary
    echo "16.0.3"
    ;;
llvm)
    echo "10.0.1"
    ;;
*)
    echo "$1: unknown tool" >&2
    exit 1
    ;;
esac
