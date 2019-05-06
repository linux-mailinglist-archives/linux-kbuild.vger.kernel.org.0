Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A98714A09
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2019 14:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfEFMnu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 08:43:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:59666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfEFMnu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 08:43:50 -0400
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E33F20B7C;
        Mon,  6 May 2019 12:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557146629;
        bh=DNWnmOA9+8/peUclwcHIiaNUB6n4agXqNN0dwmEYgDU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LMsozzTdeTbP5Mjl6/PfLeoD2/rOob6JPmeOazS00Lv/QytA7nYsdG9DUxsXGSSIZ
         eucfPIRMvE2AhYwuH7KMAr4iizu5IRSwCqJGYLPB8Fm0hM4eZxeOBPhh5rogFIV7Ig
         qZGBV2tGVnzpFD6RjiiHtUj3tx5dPEfabUAs7wqo=
Received: by mail-lj1-f181.google.com with SMTP id s7so5519305ljh.1;
        Mon, 06 May 2019 05:43:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWVyEANqfbFYlZ52eLWA/mH0lxZrn9U+berJAZjjYnnDNozMa+i
        +xdUq9woErYvqp3iW7g4wRGh2JpKpv7/LOv25jg=
X-Google-Smtp-Source: APXvYqyHoTtDJnj+p7Oe5akt97nyAz23XmgLKwkQGwCOcanqWHuurllw29Tp/NRZa/c/2eg8oTVS/Uu/hBbk0fnN2BI=
X-Received: by 2002:a2e:82cb:: with SMTP id n11mr13450389ljh.183.1557146627691;
 Mon, 06 May 2019 05:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <1557146400-12269-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1557146400-12269-1-git-send-email-krzk@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 6 May 2019 14:43:36 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfAbn=OV8v=6VOH6avgGSfpW+_Wksu5qNLtXcGbATFs3g@mail.gmail.com>
Message-ID: <CAJKOXPfAbn=OV8v=6VOH6avgGSfpW+_Wksu5qNLtXcGbATFs3g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix cross compile link with ccache
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andriin@fb.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+cc linux-kbuild@vger.kernel.org, Michal Marek (somehow
get_maintainers did not mention them)

On Mon, 6 May 2019 at 14:40, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Fix calling objcopy in case of cross compile environments:
>
>         ARCH="arm" CROSS_COMPILE="ccache arm-linux-gnueabi-" make
>         scripts/link-vmlinux.sh: line 211: ccache arm-linux-gnueabi-objcopy: command not found
>
> Fixes: 6a26793a7891 ("moduleparam: Save information about built-in modules in separate file")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 62b9fc561af7..42ea6f9264ef 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -208,7 +208,7 @@ modpost_link vmlinux.o
>  ${MAKE} -f "${srctree}/scripts/Makefile.modpost" vmlinux.o
>
>  info MODINFO modules.builtin.modinfo
> -"${OBJCOPY}" -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
> +${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
>
>  kallsymso=""
>  kallsyms_vmlinux=""
> --
> 2.7.4
>
