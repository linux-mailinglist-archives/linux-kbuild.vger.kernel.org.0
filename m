Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40FF45E8FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Nov 2021 09:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242935AbhKZILO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Nov 2021 03:11:14 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30337 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243068AbhKZIJN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Nov 2021 03:09:13 -0500
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1AQ85ReW007942;
        Fri, 26 Nov 2021 17:05:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1AQ85ReW007942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1637913927;
        bh=xV82un84SA1pxZd0d3WZun40uvU7CdhSQtixOQLcY+k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RRffPrU5OUtNbCIhpEglYnf1uYwVq2PWqpM6mtVWL/PsFha9TMhaqbDC7UZw0ATWZ
         bfVAikEe9FC0kyTfOev/JxpgixHDoFvj9CHvWeBuDVN2j2liIoycW7v0kh3PM8NQ2R
         BqfPxiExJA0z0dPMl3C0W5V/l311t3xSM2hY/a2wyk4zmetWvf2VxE/2gA5dzOTb0R
         vUD2qtiY+070CMr3puRasES1JJoiyFHrnRjXZFjWbQSYAJmKsMJAQYFBzmo6fGc3hn
         eFCQyFvNyIPNP+Vbyy6X8VL9xIA1iQfoJu5jqyC44vACRva55wMAypeVTVG2fz2bwf
         ETPBZVH6D2l+g==
X-Nifty-SrcIP: [209.85.215.180]
Received: by mail-pg1-f180.google.com with SMTP id s137so7513774pgs.5;
        Fri, 26 Nov 2021 00:05:27 -0800 (PST)
X-Gm-Message-State: AOAM532Ynfwa0J/JOw2lc0fVIJh2Mh525in6WStHRscqdLf9fhyrlXJZ
        TXOKBBAyTBTFG1AKcbTccvYvzZZx0Rk/82HvsG8=
X-Google-Smtp-Source: ABdhPJxHVJf+5wo0HH7EZXOME6q3X45+vNx8ZTz7oRjJGVwlHhzJmMt/tNRSKQI2E9RWCFfk6eeISOKMqlI7CmaFm8o=
X-Received: by 2002:a05:6a00:807:b0:49f:d6ab:590c with SMTP id
 m7-20020a056a00080700b0049fd6ab590cmr19717957pfk.32.1637913926600; Fri, 26
 Nov 2021 00:05:26 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211125162141eucas1p288a33941afc09ce74bd59368495c8581@eucas1p2.samsung.com>
 <20211125162055.3583991-1-l.stelmach@samsung.com>
In-Reply-To: <20211125162055.3583991-1-l.stelmach@samsung.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 26 Nov 2021 17:04:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUqA-6tkQXFkvLQXvd4Hc=2Vu1ueoFC8gS6A3qQG1UiQ@mail.gmail.com>
Message-ID: <CAK7LNARUqA-6tkQXFkvLQXvd4Hc=2Vu1ueoFC8gS6A3qQG1UiQ@mail.gmail.com>
Subject: Re: [PATCH] streamline_config.pl: show the full Kconfig name
To:     =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 26, 2021 at 1:21 AM =C5=81ukasz Stelmach <l.stelmach@samsung.co=
m> wrote:
>
> Show the very same file name that was passed to open()
> in case the operation failed.
>
> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index 1a5fea0519eb..3387ad7508f7 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -170,7 +170,7 @@ sub read_kconfig {
>         $source =3D~ s/\$\($env\)/$ENV{$env}/;
>      }
>
> -    open(my $kinfile, '<', $source) || die "Can't open $kconfig";
> +    open(my $kinfile, '<', $source) || die "Can't open $source";
>      while (<$kinfile>) {
>         chomp;
>
> --
> 2.30.2
>


--=20
Best Regards
Masahiro Yamada
