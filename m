Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C5B332D66
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 18:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhCIRhy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 12:37:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:44102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231278AbhCIRhu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 12:37:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5CF364E20;
        Tue,  9 Mar 2021 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615311470;
        bh=/j7Ct5HW88FpNdPSKUdh7NR6RMhOoo/YHHvgXcnFijw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mu/HY4EW2VxjkonuSzSnIYXbVUK8JWGcGLiSK6KgqhoEs3man/c6FCCey7JVjQ0gI
         idfVNd02i69I9qJd4y6rfXTbxrT7tp5l6xIU+0aq0bocHuW5vDkFY/F9FxD73ea4yw
         5NdlKeaxI0cpS7n4mhXfd647ClPoWAyRg69HEbRRlog3OdASa8z+1k7s5fu2Cx8kWE
         rAidnPr36o6M7xRSV4XXk3evchG82/G3A3bJ42ns5HDNsvpclXopZ7UrPyqO0xKjV7
         xKnAN0+kdGIzIFTn8GpyDDfV2S0eM1NotCHIcSche7KEdzEyS3mM02dzW6YIxJsVWK
         9+YZ9XOgBjVvw==
Date:   Tue, 9 Mar 2021 10:37:45 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>,
        Jiri Slaby <jirislaby@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: dummy-tools: adjust to scripts/cc-version.sh
Message-ID: <20210309173745.lbinnmjrmamld2rs@archlinux-ax161>
References: <20210309162545.637647-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309162545.637647-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 01:25:45AM +0900, Masahiro Yamada wrote:
> Commit aec6c60a01d3 ("kbuild: check the minimum compiler version in
> Kconfig") changed how the script detects the compiler version.
> 
> Get 'make CROSS_COMPILE=scripts/dummy-tools/' back working again.
> 
> Fixes: aec6c60a01d3 ("kbuild: check the minimum compiler version in Kconfig")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Perhaps, Jiri may have already noticed this issue, and have a similar patch.
> I just checked ML, but I did not find a patch to fix this.
> 
> 
>  scripts/dummy-tools/gcc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
> index 7b10332b23ba..39e65fee59bd 100755
> --- a/scripts/dummy-tools/gcc
> +++ b/scripts/dummy-tools/gcc
> @@ -57,9 +57,9 @@ if arg_contain --version "$@"; then
>  fi
>  
>  if arg_contain -E "$@"; then
> -	# For scripts/gcc-version.sh; This emulates GCC 20.0.0
> +	# For scripts/cc-version.sh; This emulates GCC 20.0.0
>  	if arg_contain - "$@"; then
> -		sed 's/^__GNUC__$/20/; s/^__GNUC_MINOR__$/0/; s/^__GNUC_PATCHLEVEL__$/0/'
> +		sed -n '/^GCC/{s/__GNUC__/20/; s/__GNUC_MINOR__/0/; s/__GNUC_PATCHLEVEL__/0/; p;}'
>  		exit 0
>  	else
>  		echo "no input files" >&2
> -- 
> 2.27.0
> 
