Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991BC3EC69A
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Aug 2021 03:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbhHOBQE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Aug 2021 21:16:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229453AbhHOBQE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Aug 2021 21:16:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3952A60F42;
        Sun, 15 Aug 2021 01:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628990134;
        bh=xm2MmxBVlGGmcR4apMCW/PxA8/7pv+pLgFu4V1KvynQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iBQq5vznQNIYhM7LryVSxZioOKSDAOOFMU3FnfKSXB4hFw1SRgLdFN9WP/M/bDSSz
         Ku+9JieIGEbQKmyUcf18q0A1jeOhCgdPDnHoQvly0mKfVj01P9B8ajE2GuaYhDjC8c
         TJ4Ln0XRK+rxT3F3opPvSYRudn9BlxIQ+cVny1KKtT/gtEiKqhp8Cx2NV4QOQexoxh
         7VW97DsY56B1i+85OrFckWen777c7yUrLwH5QG9v62mSKqokrQNKrRn2Ldhiae0EZV
         Yu5FZx5DcgHV+molUdDrc2aZhIC+hW/Zclf0GvFQPYf0VIBs9B6jTznz+M7mgVi163
         w+BP85CJMQq+A==
Subject: Re: [PATCH] kbuild: Fix 'no symbols' warning when
 CONFIG_TRIM_UNUSD_KSYMS=y
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        clang-built-linux@googlegroups.com
References: <20210814234102.2315551-1-masahiroy@kernel.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <3afe5054-8129-fe42-b5a4-00bd091b1a0c@kernel.org>
Date:   Sat, 14 Aug 2021 18:15:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210814234102.2315551-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/14/2021 4:41 PM, Masahiro Yamada wrote:
> When CONFIG_TRIM_UNUSED_KSYMS is enabled, I see some warnings like this:
> 
>    nm: arch/x86/entry/vdso/vdso32/note.o: no symbols
> 
> $NM (both GNU nm and llvm-nm) warns when no symbol is found in the
> object. Suppress the stderr.
> 
> Fixes: bbda5ec671d3 ("kbuild: simplify dependency generation for CONFIG_TRIM_UNUSED_KSYMS")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>   scripts/gen_ksymdeps.sh | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
> index 1324986e1362..5493124e8ee6 100755
> --- a/scripts/gen_ksymdeps.sh
> +++ b/scripts/gen_ksymdeps.sh
> @@ -4,7 +4,10 @@
>   set -e
>   
>   # List of exported symbols
> -ksyms=$($NM $1 | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
> +#
> +# If the object has no symbol, $NM warns 'no symbols'.
> +# Suppress the stdout.
> +ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
>   
>   if [ -z "$ksyms" ]; then
>   	exit 0
> 
