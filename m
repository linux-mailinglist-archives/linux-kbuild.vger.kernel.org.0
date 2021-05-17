Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4FC382518
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 09:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234483AbhEQHLv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 May 2021 03:11:51 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57046 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhEQHLv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 May 2021 03:11:51 -0400
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 14H7AA92009952;
        Mon, 17 May 2021 16:10:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 14H7AA92009952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621235410;
        bh=gl+dr5L8eegH2FU+Zxi5YlBiIEtrTUPYEHSSBWnGe0E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=A2hwPE6ymUWR3TDJz6ASDpizlqYU1jO53dVBZfN/rdS0/0gp6+27QKBP6T7ZYvcbO
         9QtKXk0ZV7XH0uPoXaytYtY+IYmxQfX6oewCQHjd+jXWGRgyyLPjEsh0j6ckBCsPv1
         iZPfIlftoGP3AGsr1/XfR5kRkAh5z/worePL3ODV48nMk8ZH/QU+n225OB4mX5DyQq
         8Y9is5pZBIqiFRpe6Z0xxsUDXfEymiislr+/9Y7TcfUgugaWeks6I4UB/AuvxZzGj+
         wZjwk/C8EePvvKy4LkT8l9hevVf9DSbMV3wyNw7UTVIQKnI4WAfTEg83nwbaQYOwmT
         4yL6/OHs40U8w==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id b13so571895pfv.4;
        Mon, 17 May 2021 00:10:10 -0700 (PDT)
X-Gm-Message-State: AOAM532/Yo34FBcoL0jGIdWWzS2oW1gXOjDBsOvoqZRDsIKVPbjOmevr
        1WlmZx9MIHb0UO3OiAU8ZAi0e6Dg9FiCrkSZNGQ=
X-Google-Smtp-Source: ABdhPJyVfNZ4pLLeuZZX0ENyRx+ycMWDlsFRXrhdv/nvvdaVPThB4/DEbLY8bypsbSpgdVjAoerpUm33CK+NOt7m68M=
X-Received: by 2002:a63:a547:: with SMTP id r7mr59739129pgu.7.1621235409713;
 Mon, 17 May 2021 00:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210514135752.2910387-1-arnd@kernel.org>
In-Reply-To: <20210514135752.2910387-1-arnd@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 17 May 2021 16:09:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjwrqja-qsOhTSw7Lje0=U6o7HNEu0ESOkb446TdWYwQ@mail.gmail.com>
Message-ID: <CAK7LNARjwrqja-qsOhTSw7Lje0=U6o7HNEu0ESOkb446TdWYwQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: shut up uboot mkimage output when building quietly
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 14, 2021 at 10:58 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When building with 'make -s', most architectures produce no output
> at all unless there are warnings. However, on at leat mips and nios2
> there is output from /usr/bin/mkimage when that is installed:
>
>   Image Name:   Linux-5.12.0-next-20210427-00716
>   Created:      Wed Apr 28 22:03:30 2021
>   Image Type:   NIOS II Linux Kernel Image (gzip compressed)
>   Data Size:    2245876 Bytes = 2193.24 KiB = 2.14 MiB
>   Load Address: d0000000
>   Entry Point:  d0000000
>
> Make these behave like the others and check for the '${quiet}'
> variable to see if we should redirect the output to /dev/null.
> Any errors and warnings from mkimage will still be seen as those
> get sent to stderr.

Thanks for the report, but I rather want to suppress stdout
in the kbuild core macro.

I wrote this patch.
https://lore.kernel.org/patchwork/patch/1429409/




> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  scripts/mkuboot.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/mkuboot.sh b/scripts/mkuboot.sh
> index 4b1fe09e9042..031b5d6b839f 100755
> --- a/scripts/mkuboot.sh
> +++ b/scripts/mkuboot.sh
> @@ -17,4 +17,8 @@ if [ -z "${MKIMAGE}" ]; then
>  fi
>
>  # Call "mkimage" to create U-Boot image
> -${MKIMAGE} "$@"
> +if [ "${quiet}" != "silent_" ]; then
> +${MKIMAGE} "$@" ${REDIRECT}
> +else
> +${MKIMAGE} "$@" ${REDIRECT} > /dev/null
> +fi
> --
> 2.29.2
>


-- 
Best Regards
Masahiro Yamada
