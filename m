Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657B440FB53
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Sep 2021 17:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239181AbhIQPIl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Sep 2021 11:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237944AbhIQPIl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Sep 2021 11:08:41 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EDEC061574;
        Fri, 17 Sep 2021 08:07:19 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id a22so12576539iok.12;
        Fri, 17 Sep 2021 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=01aK1+qs2ony0wtCQjSv+7PH8MX0z1DNX/5puDnYAWQ=;
        b=biO/72ML/F+PPNWDuVwkDDkLg2Z4jjzWk/o5+eoWrS8dH8z2f3TqTrCuDEl84cUwwt
         7LIsbRSHwlZKmb+aag6R5lpml1WbaUESR9WiUuKXXjBCez1pdcBVTDXDGx1/eLXkA8Pr
         J7xN3RWrz5vdtmg53+goJyUSpZbKyuHScstZEj6hWJBq51ng40CgHRGQmtLMO938L+Aq
         zydcrME1WLaypBvvcW6nZq7G156eG0bFe5UKAQXfA5YKaBwbkqgC6Zb+bj4ngOOkaHFG
         +10JzOLDGgt9WDTBMjCUUApVzgclvWALYtpjjlYjyKMOl1sqG549vZoR3nh+szp5oUaO
         msCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=01aK1+qs2ony0wtCQjSv+7PH8MX0z1DNX/5puDnYAWQ=;
        b=fKXu4sFWl7wER0I15wPEIPnA3RF7FLw30Khb2pprjj/n2S4YFtD2ybCmAwTRVO/Krj
         uWY8ZOIo+FR7IK/QQm9o6+yAj8GgOOTIbLZzGAY+qLOrFqnYNL8aBMi5XQ93N8+z49oc
         lpqZ2Zb6vJ8/67LLmZCCxwBa9ChmD/PSwEfVRoNBNKbm6Zb899FmQnxBgZVGKQCOeJe9
         5iQs0baKkmOo/oWcRlQaIvfXprdxcouytEE7GZ68B70bLrLEPJFnaiB/yyRdXZ5KmJzh
         2HpvaO83ywne+rwk3IGWMs9Bz5pvFGsMtnJ1JkNpB3Y/w1UuO4uSic6pRorJ2UP8SHMt
         XiGw==
X-Gm-Message-State: AOAM53216T2aXjSyKVjtZx3XKfKa10RpPcKJ5gNSewDSQUvb9D96ONtS
        qEt2coL9XKTYksH9tLxrXomwguVZgr3wuPpWxdQApBc3
X-Google-Smtp-Source: ABdhPJz/hW2EPv/26N4Tu75FdUs6UoMyYVOrMMC+eV3FmlUjSROonOgk5A7zua0dDEkAZX2m/aZSZehjX9Q2R9/KAag=
X-Received: by 2002:a6b:7104:: with SMTP id q4mr1230501iog.29.1631891238494;
 Fri, 17 Sep 2021 08:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130954.1392104-1-lucjan.lucjanov@gmail.com>
In-Reply-To: <20210910130954.1392104-1-lucjan.lucjanov@gmail.com>
From:   =?UTF-8?Q?Piotr_G=C3=B3rski?= <lucjan.lucjanov@gmail.com>
Date:   Fri, 17 Sep 2021 17:07:06 +0200
Message-ID: <CAL2Yj0QvoNZ3VeYfk63oMUTenP3eypJx+fB6f09rprV-fCphGw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use smaller dictionary size for zstd module compression
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Ping...

pt., 10 wrz 2021 o 15:10 Piotr Gorski <lucjan.lucjanov@gmail.com> napisa=C5=
=82(a):
>
> By default, zstd without parameters uses a dictionary size of 8 MB.
> However, most modules are much smaller than that.
> Use a dictionary size of 2 MB for module compression, resulting in
> slightly higher compression speed while still maintaining a good
> compression ratio.
> The --zstd=3Dwlog=3D21 option is equivalent to --lzma2=3Ddict=3D2MiB used=
 in XZ compression.
>
> Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> ---
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index ff9b09e4cfca..c3475e5aca7c 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -97,7 +97,7 @@ quiet_cmd_gzip =3D GZIP    $@
>  quiet_cmd_xz =3D XZ      $@
>        cmd_xz =3D $(XZ) --lzma2=3Ddict=3D2MiB -f $<
>  quiet_cmd_zstd =3D ZSTD    $@
> -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> +      cmd_zstd =3D $(ZSTD) --zstd=3Dwlog=3D21 -T0 --rm -f -q $<
>
>  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
>         $(call cmd,gzip)
> --
> 2.33.0.142.ge0a2f5cbc5
>
