Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D50E144104
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 16:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgAUPyc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 10:54:32 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47304 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgAUPyc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 10:54:32 -0500
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 00LFsQ4j026151;
        Wed, 22 Jan 2020 00:54:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 00LFsQ4j026151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579622066;
        bh=JU3pN3c8/XRG815QK0vLDCcMaIT7EtAG3kyh7/ARG3E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yKKH+AeLbu8JFDV44NEghqZT+z/w3kaAPOyagqmxcGzqJNf9nUgD4kSKTues2PG7S
         4BaSm2WAIgcRTI93BzSI2+fieLD4MlL45usBqDcQtj97k3vviZxoZ9aLxvmw+DUnOr
         u1JjRm6sBB6Hc4NHcwwLZRlBCtA3JtT8xvR0c6HwsNjWk/r+b7Z5swxWyxrmjQGsAo
         YFNb7WQvgyYbpaEcagsGuZFGlG+yV0pYa2AE9VylW1RkxKBujaaWQTZ8KKPdCtgJTM
         HHaZjI8vy1CDdpnxEytdzFsFGJCdiNOuLDk7bW1ImhKQVPNsO9hOv1OX6pQXommQ0V
         Io8w4rdDANXYw==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id y125so2119075vsb.6;
        Tue, 21 Jan 2020 07:54:26 -0800 (PST)
X-Gm-Message-State: APjAAAUmeEhOc2m8PKXhUZEUpEw9zGfyXs8hA5Wfcz8T/v24LPP1B+or
        ds/1o38QwfUVo/OPAd7YgOl/uXfZpmuMheJkJO8=
X-Google-Smtp-Source: APXvYqxe5wIDBnscwpBHbBYvMLy4c73hBL0sW2LyaAUR5vLuA1z5eh7PxsXGFpQzh3WPrSpVGR2iZU5tc4/W7wdpzXM=
X-Received: by 2002:a05:6102:2334:: with SMTP id b20mr3183118vsa.155.1579622065327;
 Tue, 21 Jan 2020 07:54:25 -0800 (PST)
MIME-Version: 1.0
References: <e026b0d7a2eceaa1745a001baa9f950ce546addb.1579025325.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <e026b0d7a2eceaa1745a001baa9f950ce546addb.1579025325.git.mirq-linux@rere.qmqm.pl>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Jan 2020 00:53:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNASOLPkhk8CFN9Awbh8xav-bxLmDcc=eR7r4vN+NUKKUeg@mail.gmail.com>
Message-ID: <CAK7LNASOLPkhk8CFN9Awbh8xav-bxLmDcc=eR7r4vN+NUKKUeg@mail.gmail.com>
Subject: Re: [PATCH v2] builddeb: allow selection of .deb compressor
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 15, 2020 at 3:11 AM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.=
qmqm.pl> wrote:
>
> Select deb compression using KDEB_COMPRESS make variable. This allows to
> use gzip compression for local or test builds, and that's way faster
> than now-default xz compression.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---


Applied to linux-kbuild.
Thanks.

>  v2: rename KPKG_COMPRESS to KDEB_COMPRESS as suggested by Masahiro Yamad=
a
> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index c4c580f547ef..b68aaeece7c9 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,7 @@ create_package() {
>
>         # Create the package
>         dpkg-gencontrol -p$pname -P"$pdir"
> -       dpkg --build "$pdir" ..
> +       dpkg-deb ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
>  }
>
>  version=3D$KERNELRELEASE
> --
> 2.20.1
>


--=20
Best Regards
Masahiro Yamada
