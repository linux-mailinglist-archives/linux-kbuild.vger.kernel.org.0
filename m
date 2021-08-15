Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F303EC6FB
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Aug 2021 05:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbhHODhm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Aug 2021 23:37:42 -0400
Received: from pb-smtp20.pobox.com ([173.228.157.52]:59859 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234662AbhHODhl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Aug 2021 23:37:41 -0400
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 7A085150947;
        Sat, 14 Aug 2021 23:37:12 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
        :to:cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=+Bh+pmAIc7qJu01G4M/9wseFv9UnkmsoNLSMWi
        QyuC8=; b=LBITQQa3wa6qnf7xiNv727MtOv3rnTY/iD9r8QK7RaGGCjgbYSQ/3V
        46W/AkPxu9xDWstTzkmTf0xzCd8tGfHxkb4BbXdJDF9ImFz/3weCBPvBWzXaY94G
        Mny5gd4w0r+Lxfnk8AduAwCfsdsVat1FWdbfcDxNoA0aBOXSOAF4Q=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id 651CE150945;
        Sat, 14 Aug 2021 23:37:12 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=+Bh+pmAIc7qJu01G4M/9wseFv9UnkmsoNLSMWiQyuC8=; b=OW0wUQ6rSHffsv6kEkvs7ASOUoPzCBdGeSJrkDxlFWxKekJxeq80L5P5ysSBJ8P1bdJOx0dpZU/caYSs7Rjww6k2oI7GBiVLNdIRBQ6p6Tg7eykyDTQkwWoagilEHMpKrSWaBAbFtzum/2Y2Ez1Upr2dMmRwHjb+ir637UFe8AE=
Received: from yoda.home (unknown [96.21.170.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 49CE2150944;
        Sat, 14 Aug 2021 23:37:09 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 9FAD92DA0098;
        Sat, 14 Aug 2021 23:37:07 -0400 (EDT)
Date:   Sat, 14 Aug 2021 23:37:07 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] kbuild: Fix 'no symbols' warning when
 CONFIG_TRIM_UNUSD_KSYMS=y
In-Reply-To: <20210814234102.2315551-1-masahiroy@kernel.org>
Message-ID: <r3rr2q2-1o70-o012-4ns1-or1qrs665753@syhkavp.arg>
References: <20210814234102.2315551-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 11E7D40E-FD7A-11EB-9ADE-D5C30F5B5667-78420484!pb-smtp20.pobox.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 15 Aug 2021, Masahiro Yamada wrote:

> When CONFIG_TRIM_UNUSED_KSYMS is enabled, I see some warnings like this:
> 
>   nm: arch/x86/entry/vdso/vdso32/note.o: no symbols
> 
> $NM (both GNU nm and llvm-nm) warns when no symbol is found in the
> object. Suppress the stderr.
> 
> Fixes: bbda5ec671d3 ("kbuild: simplify dependency generation for CONFIG_TRIM_UNUSED_KSYMS")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/gen_ksymdeps.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
> index 1324986e1362..5493124e8ee6 100755
> --- a/scripts/gen_ksymdeps.sh
> +++ b/scripts/gen_ksymdeps.sh
> @@ -4,7 +4,10 @@
>  set -e
>  
>  # List of exported symbols
> -ksyms=$($NM $1 | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
> +#
> +# If the object has no symbol, $NM warns 'no symbols'.
> +# Suppress the stdout.
> +ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)

You mean stderr.


Nicolas


