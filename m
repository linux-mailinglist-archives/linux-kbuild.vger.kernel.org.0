Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11DFF32C1C2
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243980AbhCCT1N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:27:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:41114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1449771AbhCCEDh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 23:03:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7D1664E59;
        Wed,  3 Mar 2021 04:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614744162;
        bh=91G6ZKRf37fWuu1odP9b28TaOBkx5TQKKg1BV00uG20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mPOHOyWws7WAZ3FG0F4n7Gw7c3z2FelRnIziscQ+Hwo8JHQGWBvsxKfFe5IrcMpfG
         FIadSedZhN2xmV1kNCwAsskmuwANw1DtF68gqcbghrqz9Ij0iLxLRlVyJ/qAzK0GeN
         8eyS67lkLf14lgICuuqM4FT2lG1wx9ZPdRw0Aibx1N4qpu6udah8dUXSarsqCDnFD6
         l+k0SwH92ib/wkH9J209QWa5p1NBAppzrLMGBlB+EkDQDQspIec2zqraFm/EmXJROt
         jVE3+hyubtnWOWCi7Nb2+hZ2r/opYSlC2TuDpq27PFHeeN0ez21M2aOlYlLvUCrI5y
         62cwf1R9PPvJw==
Date:   Tue, 2 Mar 2021 21:02:37 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@lindev.ch>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] Fix ld-version.sh script if LLD was built with LLD_VENDOR
Message-ID: <20210303040237.tvwo34j322tzqnwz@archlinux-ax161>
References: <20210302221211.1620858-1-bero@lindev.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210302221211.1620858-1-bero@lindev.ch>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Bernhard,

I have added the ClangBuiltLinux mailing list, kbuild mailing list, and
Masahiro and Nick to CC. Maybe ld-version.sh and cc-version.sh should be
added to a MAINTAINERS entry to make sure we get CC'd (I can send one
along tomorrow).

On Tue, Mar 02, 2021 at 11:12:11PM +0100, Bernhard Rosenkränzer wrote:
> If LLD was built with -DLLD_VENDOR="xyz", ld.lld --version output
> will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
> LLD identifier isn't guaranteed to be $2 either.

TIL about LLD_VENDOR...

> Adjust the version checker to handle such versions of lld.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@lindev.ch>
> ---
>  scripts/ld-version.sh | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index a463273509b5..4c042a306e22 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -49,6 +49,18 @@ elif [ "$1" = LLD ]; then
>  	min_version=$lld_min_version
>  	name=LLD
>  	disp_name=LLD
> +elif echo "$@" |grep -q ' LLD '; then
> +	# if LLD was built with -DLLD_VENDOR="xyz", it ld.lld --version
> +	# says "xyz LLD [...]". Since LLD_VENDOR may contain spaces, we
> +	# don't know the exact position of "LLD" and the version info
> +	# at this point
> +	while [ "$1" != "LLD" ]; do
> +		shift
> +	done
> +	version=$2
> +	min_version=$lld_min_version
> +	name=LLD
> +	disp_name=LLD
>  else
>  	echo "$orig_args: unknown linker" >&2
>  	exit 1
> -- 
> 2.30.1
> 

I am not sure what a better fix would be of the top of my head but
wouldn't it be better to avoid the duplication? This diff below works
for me with or without LLD_VENDOR defined.

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index a463273509b5..84f9fc741f09 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -44,7 +44,10 @@ if [ "$1" = GNU -a "$2" = ld ]; then
 elif [ "$1" = GNU -a "$2" = gold ]; then
 	echo "gold linker is not supported as it is not capable of linking the kernel proper." >&2
 	exit 1
-elif [ "$1" = LLD ]; then
+elif echo "$*" | grep -q LLD; then
+	while [ "$1" != "LLD" ]; do
+		shift
+	done
 	version=$2
 	min_version=$lld_min_version
 	name=LLD
