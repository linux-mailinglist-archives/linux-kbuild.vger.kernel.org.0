Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0821C28AC78
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 05:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbgJLD0t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Oct 2020 23:26:49 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49850 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbgJLD0t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Oct 2020 23:26:49 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 09C3QWXj021418;
        Mon, 12 Oct 2020 12:26:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 09C3QWXj021418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602473193;
        bh=9p4s4oJaH5mjIXyudNPeSbieITUIJ+uUmv4z644D440=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=c/ngzg79WIcJESayTf0W7AG1NfNPw20jFPJHpbhE0ThF3e3hK7KB1M62WKncf49c8
         IBu6qJ92HyyHti6U4lDhOo6Rp22XS0VP7iNbAtVOAoEzMxPqWYgplip6bHmzlmW4CZ
         UrmTTPpBx5v/nVVMwyonfPAKTBwIvSl2fBFhhPnMaK0HCDE+WU0IvH8/jixH9JhRow
         rkwYnYj0m/pLz91n1XQD6BKN/sTPqBmZ61Sc7QYxf57oQ8jFq5TNwNQ5xreHQqTH1T
         IX6gSE5D9vg7OdUatR4EDytXbrD8yqbvbdo34Ksn4uSPv2TNbn9nksxZraei2dudew
         B3QL+ViMpQgkA==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id w21so5086274plq.3;
        Sun, 11 Oct 2020 20:26:32 -0700 (PDT)
X-Gm-Message-State: AOAM53376pNzPYGU7BW1rip1LafnmexRJT8f8nM4iH15ipMwzVSx773N
        BSKILpGa+S+vvZ6bYbU3PDbrpolWtAm3kSMKe9E=
X-Google-Smtp-Source: ABdhPJwyemJlrf2EUY3xvE81WrCdUDyCQ0w0NmKsiVWHTi3IiBmu0Ulq0uq4dW39oba4bmFsIPK19ho+oQ5Eik+XyvA=
X-Received: by 2002:a17:902:c3d4:b029:d3:df24:1619 with SMTP id
 j20-20020a170902c3d4b02900d3df241619mr20907169plj.1.1602473192007; Sun, 11
 Oct 2020 20:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201011185431.24094-1-olaf@aepfle.de>
In-Reply-To: <20201011185431.24094-1-olaf@aepfle.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 12 Oct 2020 12:25:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnxOy+Wa66yTtj4EuSut=uv5pi5c=ToENv-6w4fYTn0g@mail.gmail.com>
Message-ID: <CAK7LNATnxOy+Wa66yTtj4EuSut=uv5pi5c=ToENv-6w4fYTn0g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enforce -Werror=return-type
To:     Olaf Hering <olaf@aepfle.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 12, 2020 at 3:54 AM Olaf Hering <olaf@aepfle.de> wrote:
>
> Catch errors which at least gcc tolerates by default:
>  warning: 'return' with no value, in function returning non-void [-Wreturn-type]


Applied to linux-kbuild. Thanks.



> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index f84d7e4ca0be..965e7259e6e8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -497,7 +497,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
>  KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
>                    -Werror=implicit-function-declaration -Werror=implicit-int \
> -                  -Wno-format-security \
> +                  -Werror=return-type -Wno-format-security \
>                    -std=gnu89
>  KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_AFLAGS_KERNEL :=



-- 
Best Regards
Masahiro Yamada
