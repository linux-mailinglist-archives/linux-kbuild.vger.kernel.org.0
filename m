Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1416722CC01
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 19:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgGXRWu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 13:22:50 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30769 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgGXRWt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 13:22:49 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 06OHMPw1031479;
        Sat, 25 Jul 2020 02:22:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 06OHMPw1031479
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595611346;
        bh=LWMEPECGL2KW6K1W/e+nfX6uJGebj/WZA9gxTGugdzo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qyv5xd2ljXpyciIB+0OqabxFlqkAGXGfJQ9FGmI9cpwkpJYvBOIcvjI5etfx+cYof
         lTu50cvr0EvfB7YT/1JdajQ21jcntjKrm7N0cTgLBsIil8WWYYHCV+jNCN90cPps7B
         ndiDPKmSdfTKqrt0z4hQj94SnDkbtiIBfgUsLm3+5slde/dh83rNWv4XQFDEi72QsJ
         wQVigobjrPG0bra/E7R3iKDeHJkQFKwL2nzlyyC5Vie4Z09Ouuf/bN4S3GDlyA0k66
         uXnHqvMuVhiyrXeTMU3LXP7VKmClxM1YsblgBG966xuJbD3zLnuJfbfBvjWKbQhbxF
         qp5ELz6VrYQ9g==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id p6so3177012uaq.12;
        Fri, 24 Jul 2020 10:22:26 -0700 (PDT)
X-Gm-Message-State: AOAM531M4kgMBcE3X9ByWvCCmnpv7fjNmSHRKmB8hhIbdB17fPVOrjTf
        PLIZ7A03+foEPbMt+lq5inSXQ5EUGzHVMP0ISek=
X-Google-Smtp-Source: ABdhPJxbjvpAaJiZ5L5sJbMXAn13ZFEXyR/FxrgcsToH6oJqNRKWx2ujUIdsWuyibk+0/voJmJm+Oi6qkmN+5yeLkmA=
X-Received: by 2002:ab0:71d3:: with SMTP id n19mr9059170uao.25.1595611345151;
 Fri, 24 Jul 2020 10:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200722053417.5915-1-jcmvbkbc@gmail.com> <20200722053417.5915-3-jcmvbkbc@gmail.com>
In-Reply-To: <20200722053417.5915-3-jcmvbkbc@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Jul 2020 02:21:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtFJidvPTJSP3JE0c=xPq4vegvCRETbO0n5TQeb+j6KA@mail.gmail.com>
Message-ID: <CAK7LNAQtFJidvPTJSP3JE0c=xPq4vegvCRETbO0n5TQeb+j6KA@mail.gmail.com>
Subject: Re: [PATCH 2/2] xtensa: add uImage and xipImage to targets
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Chris Zankel <chris@zankel.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 22, 2020 at 2:34 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> uImage and xipImage are always rebuilt in the xtensa kernel build
> process. Add them to 'targets' to avoid that.
>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


>  arch/xtensa/boot/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/xtensa/boot/Makefile b/arch/xtensa/boot/Makefile
> index 801fe30b4dfe..f6bb352f94b4 100644
> --- a/arch/xtensa/boot/Makefile
> +++ b/arch/xtensa/boot/Makefile
> @@ -18,6 +18,7 @@ export BIG_ENDIAN
>
>  subdir-y       := lib
>  targets                += vmlinux.bin vmlinux.bin.gz
> +targets                += uImage xipImage
>
>  # Subdirs for the boot loader(s)
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
