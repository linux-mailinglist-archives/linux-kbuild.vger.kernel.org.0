Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4649A2CA031
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 11:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729538AbgLAKoU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 05:44:20 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:58145 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729324AbgLAKoU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 05:44:20 -0500
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0B1AhFxh002630;
        Tue, 1 Dec 2020 19:43:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0B1AhFxh002630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606819395;
        bh=pMIMQvJ5hrz3FqswIIZKhGNQpY6MFXLxRQkeQgLnDqM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sh82VYY8qV3Oq9A/eOqKCgG43FzFvvLteHZj++uNT+v7RlJSHMr/UNkFu9fL1udVp
         DTTMjQWokwZWEmQ/Fn4mEMcZN7itGNa6bmkjbow8XJMZ6JswNadXPducC5M3SfnS6+
         sc/knl0Hq0E/BNOhoEoLPDMjFeSw+hEaKhUu0mD/Q7WPZPm45YNmOeVIOhGqZNwN3j
         0BeGHCGX0e4dKym4mGUqvjbHbYQw/usKptdBAyHcFLJ7nEqqMtEvmoE+wPMq4sYsn1
         LxdYUbqr/3xhtOg76JNG3Jqew/HgP4F+fBpmWApq2P7mJ9WElYN0V7gqxRTIdaYpaQ
         HZbhDPCfbS2SA==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id bj5so929983plb.4;
        Tue, 01 Dec 2020 02:43:15 -0800 (PST)
X-Gm-Message-State: AOAM533X64oSETEM5iw5zxNpnqNlUdEQ9yfuC0YUTRoHbiZZjRKjFkEB
        jT0cTqcJqQ1h1dnqUibMZrYVd/9Oy01KwPW3Rnw=
X-Google-Smtp-Source: ABdhPJzU9mhbmZrWnB67E+X7PCt4UV40yWzMeu2zDhscE9PrkWjTvxP7Whk3SFEd5nK4FCl10HJnDlSbWJS6MRvA3Uw=
X-Received: by 2002:a17:90a:5304:: with SMTP id x4mr2048220pjh.153.1606819394577;
 Tue, 01 Dec 2020 02:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20201117104736.24997-1-olaf@aepfle.de>
In-Reply-To: <20201117104736.24997-1-olaf@aepfle.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 19:42:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATq68FyLEuck34uD6zTOfsOu2UP=yS=TX4Bvq+OR-zoNA@mail.gmail.com>
Message-ID: <CAK7LNATq68FyLEuck34uD6zTOfsOu2UP=yS=TX4Bvq+OR-zoNA@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: enforce -Werror=unused-result
To:     Olaf Hering <olaf@aepfle.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 17, 2020 at 7:47 PM Olaf Hering <olaf@aepfle.de> wrote:
>
> It is a hard error if a return value is ignored.
> In case the return value has no meaning, remove the attribute.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Applied to linux-kbuild.
Thanks.


> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index e2c3f65c4721..c7f9acffad42 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -497,7 +497,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
>  KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
>                    -Werror=implicit-function-declaration -Werror=implicit-int \
> -                  -Werror=return-type -Wno-format-security \
> +                  -Werror=return-type -Werror=unused-result -Wno-format-security \
>                    -std=gnu89
>  KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_AFLAGS_KERNEL :=



-- 
Best Regards
Masahiro Yamada
