Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA8F2CA033
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 11:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730037AbgLAKpA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 05:45:00 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52321 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgLAKpA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 05:45:00 -0500
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0B1Ai0v7015226;
        Tue, 1 Dec 2020 19:44:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0B1Ai0v7015226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606819441;
        bh=nlIJC5dLs9iL/Hx0gSfLus2WDlIkrfQ5jISZcrZvoik=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SNxpRONju18P7/2QOO3hhuNoaAnKchqtkTCd+5Q79at3U8mYoBXOJgOnNTOR6Udgh
         iJCHSwn9W+0EBJOxHHCHfTST+Zs8wQ6vPq3tQ5lRbwAsZZa+4Oin+cRbnZ82aj05D8
         vmeoND/Br3wgyZnoJOfGxu7SHI9hdOF/r1NJzKvyjZ3ZlDdBQRzIx8mcdJyYg2+8yG
         j9WgUp04oUd8Sh9I4uAoGXms7G4cMRMdqNPSCSts8SN+YiQYBFy9EuVphDs9zZAaXY
         XoxiWBRCTP3B3ZNT0yk84COgHeu4G6xN+H/40VGD87Y7XOJuOps5yQueNBC/+JkiNx
         9N+qiOaJgsKnQ==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id t21so997602pjw.2;
        Tue, 01 Dec 2020 02:44:01 -0800 (PST)
X-Gm-Message-State: AOAM533pXFZ1OZCH9w7VKIaYb4LaLPN+vY/eB1zhYYPJCngX1UNUQude
        19ov/fQm4qJhIdWDlLACj4YYLf/PSGT+njSuFX0=
X-Google-Smtp-Source: ABdhPJxhu45+Vpdxgwg5Wblv7jYaM6s3KnAmJUnKNRBpiPcjFMAYblxpeXwdIKyGwYxVSlvzq1EDgiRVh6U7KOKuqiQ=
X-Received: by 2002:a17:90a:5905:: with SMTP id k5mr2065791pji.198.1606819440476;
 Tue, 01 Dec 2020 02:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20201128115108.179256-1-masahiroy@kernel.org>
In-Reply-To: <20201128115108.179256-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 19:43:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNATpGFDiuAwWT47mwOmOcPoUQ_=YOn6E50xKA0vbGm+c1w@mail.gmail.com>
Message-ID: <CAK7LNATpGFDiuAwWT47mwOmOcPoUQ_=YOn6E50xKA0vbGm+c1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] kbuild: doc: update the description about kbuild Makefiles
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 28, 2020 at 8:51 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This line was written in 2003. Now we have much more Makefiles.
>
> The number of Makefiles is not important. The point is we have a
> Makefile in (almost) every directory.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.

>
> (no changes since v1)
>
>  Documentation/kbuild/makefiles.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 0d5dd5413af0..a7b874097a91 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -71,7 +71,7 @@ The Makefiles have five parts::
>         .config                 the kernel configuration file.
>         arch/$(ARCH)/Makefile   the arch Makefile.
>         scripts/Makefile.*      common rules etc. for all kbuild Makefiles.
> -       kbuild Makefiles        there are about 500 of these.
> +       kbuild Makefiles        exist in every subdirectory
>
>  The top Makefile reads the .config file, which comes from the kernel
>  configuration process.
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
