Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0221121C7
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 04:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLDDLP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Dec 2019 22:11:15 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:40734 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfLDDLP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 22:11:15 -0500
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xB43B2G7013793;
        Wed, 4 Dec 2019 12:11:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xB43B2G7013793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1575429063;
        bh=OD6ZQkAKcfx+YiJQA3rzeNZXiVaoJsqUibyp2cAgwHE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C+PE5c2J+nN44agT+fzZT75ONd0sul+LPjjMDpeeX0NcLRCfP6hz9jzRex3LIstfC
         U9s+/qKyl/ZMlFKKJ08AMW+Nkz7+Uj64yVdW3gDh277EEMOoO3I8LZABSXGVvEmzNv
         8NRj8ArRE3O5YUlSaxQExMxTTv2G04jqLExZeqOVOEfb/W53wQYGoms2UxXu7GREzY
         lUw45WDDgXGy7ljI1Fc4mYM+NVdE2oGZjWRfYCAsm9KNWMl6FXijV1rfpTxtQdM8IL
         5mTwryE2B+SBfUHc5x3mgtE2v8bWIei7LHqT8dn+eWpG4elhJIm/rjTXub0xoffRa4
         HBF8wW1gMX1Cw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id g23so3880832vsr.7;
        Tue, 03 Dec 2019 19:11:02 -0800 (PST)
X-Gm-Message-State: APjAAAUWaQnCnBAtgDb8uQnlWo7P7XjVDIPugSO7zNIZ0CKBJmUnko5j
        wa7Y8aVMU2boQQMNu9cx0NEhdlvgOkw3SCETXE8=
X-Google-Smtp-Source: APXvYqw+AlfTjSelh5hDgmM9BpC8X+GbvHpy0XY4uyDgJW384KMB/Sc0nnEaybp/Ufha0RQ2lmfcMqDlvlGLzq+hqv4=
X-Received: by 2002:a67:30c3:: with SMTP id w186mr328431vsw.179.1575429061823;
 Tue, 03 Dec 2019 19:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
In-Reply-To: <20191203094845.610692-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 4 Dec 2019 12:10:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
Message-ID: <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> This is new file to show running kernel modules list.One line bash
> script.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/kernel_modules_info.sh | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100755 scripts/kernel_modules_info.sh
>
> diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
> new file mode 100755
> index 000000000000..f005c47a3aa6
> --- /dev/null
> +++ b/scripts/kernel_modules_info.sh
> @@ -0,0 +1,23 @@
> +#!/bin/bash -
> +#SPDX-License-Identifier: GPL-2.0
> +#===============================================================================
> +#
> +#          FILE: kernel_modules_info.sh
> +#
> +#         USAGE: ./kernel_modules_info.sh
> +#
> +#   DESCRIPTION:  Running kernel modules information.
> +#
> +#       OPTIONS: ---
> +#  REQUIREMENTS: awk
> +#          BUGS: ---
> +#         NOTES: ---
> +#        AUTHOR: Bhaskar Chowdhury (https://about.me/unixbhaskar), unixbhaskar@gmail.com
> +#  ORGANIZATION: Independent
> +#       CREATED: 12/03/2019 13:52
> +#      REVISION:  ---
> +#===============================================================================
> +
> +set -o nounset                              # Treat unset variables as an error
> +
> +awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|desc|depends)/'



I want to see a good reason (e.g. useful for other developers) for upstreaming.
This script looks like your custom script, which you can maintain locally.



-- 
Best Regards
Masahiro Yamada
