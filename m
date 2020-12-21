Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99B52DF948
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 07:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgLUGc6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 01:32:58 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42495 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgLUGc6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 01:32:58 -0500
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0BL6VgSF002651;
        Mon, 21 Dec 2020 15:31:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BL6VgSF002651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608532303;
        bh=rOg4QxSAfTkT+BcR9P4hFXzodLlmtw/3pK0eFUW1oi8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=U+xdLu6Qt9wfzw4FdCIV5/yqI7WuNuBB6j1enVCchT7nE2Fll10ylSDWzedhJ+504
         wzKlJBKmIfbJkdTefNMrVCeU7xa1hwOULUkJFaGaGaRFm4+jSUYNyaIMNpqNkE19O+
         D3dhz+7IGChs++F8vl6mXJDvwnFKxptM3l9DstrJikytWoaB3wIwGE0q9bvQV/anwF
         nvd1zLbGNv5WsRvYu//BGwcnjtNpq7mikOs1DURniVuzbbRMD9MCF6cnoOdWGFVOuv
         BNALUeQ+M/U9LsoBbZHNm7yzMYd2Mo+NegMlAFQR4pCyGAE+z25Vr6BZsq8nRAC3kA
         RwYlyICLHRgkQ==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id f14so5575002pju.4;
        Sun, 20 Dec 2020 22:31:43 -0800 (PST)
X-Gm-Message-State: AOAM533VbTxG9emYptq+coAxlfB5fxgbCrkFX2OuHK+s3C3QpVoXggEq
        Hjs7+S1YtMU07LMWXar3J0sM7qGkvMhzfdrVjF8=
X-Google-Smtp-Source: ABdhPJwlop1E6Syo0vlC/BnCAMyR5npqc2l4JDOg5C481V+RD/UPDiIMcq7gjql1DQ3c/Qp7NnT8QXBfXaGWTKU5mik=
X-Received: by 2002:a17:902:9b91:b029:db:f003:c5eb with SMTP id
 y17-20020a1709029b91b02900dbf003c5ebmr14921530plp.1.1608532302351; Sun, 20
 Dec 2020 22:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20201117104736.24997-1-olaf@aepfle.de> <CAK7LNATq68FyLEuck34uD6zTOfsOu2UP=yS=TX4Bvq+OR-zoNA@mail.gmail.com>
In-Reply-To: <CAK7LNATq68FyLEuck34uD6zTOfsOu2UP=yS=TX4Bvq+OR-zoNA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 21 Dec 2020 15:31:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNATfmiOvLekU9G=4eGE2kv5RSLFgQr2WzG-DpAoboYWXLQ@mail.gmail.com>
Message-ID: <CAK7LNATfmiOvLekU9G=4eGE2kv5RSLFgQr2WzG-DpAoboYWXLQ@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: enforce -Werror=unused-result
To:     Olaf Hering <olaf@aepfle.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 1, 2020 at 7:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Nov 17, 2020 at 7:47 PM Olaf Hering <olaf@aepfle.de> wrote:
> >
> > It is a hard error if a return value is ignored.
> > In case the return value has no meaning, remove the attribute.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
>
> Applied to linux-kbuild.
> Thanks.

I will postpone this by the next MW.

Some instances of __must_check violation are still remaining,
which end up with build breakages.





>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index e2c3f65c4721..c7f9acffad42 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -497,7 +497,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
> >  KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
> >                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
> >                    -Werror=implicit-function-declaration -Werror=implicit-int \
> > -                  -Werror=return-type -Wno-format-security \
> > +                  -Werror=return-type -Werror=unused-result -Wno-format-security \
> >                    -std=gnu89
> >  KBUILD_CPPFLAGS := -D__KERNEL__
> >  KBUILD_AFLAGS_KERNEL :=
>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
