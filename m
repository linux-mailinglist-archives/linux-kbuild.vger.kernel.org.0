Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7F8429B4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 04:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhJLCFj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Oct 2021 22:05:39 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38826 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhJLCFj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Oct 2021 22:05:39 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 19C23Asr022851;
        Tue, 12 Oct 2021 11:03:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 19C23Asr022851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634004191;
        bh=R9JRz7swgkXEBmHUNR4wFHuRpevBbW8mrsCesIA9m6U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=muNEQA8WeAYGvE6IlJvpyCH7KJ2cCfc/7fU3ORJWmQFTvRuOt3dosbM9Z4Sy7uoXe
         yBgciD7pazv7xEGgscmqNvE74bB8BNcOizpWBKfZ7cvjA/l8lQj9Fq/bdDX7bNwp1O
         cOlKrf+o0w53m/BweZLf3tsk7pV91hCdwEOooM0T/G8OTslfKlUrKEQig3tDataiZX
         KEH/rI0idIdv4NhvrGD1WIBnxEO1wITNPNogcUeKybxX+VSqHnvX05PVqq/VrVr+UY
         NxOx4lelRSf5Jq0P1pJkcYfot2cccv6OCi+4AE9sBEGrXRoIXTB9mlxfxz9M0BHMTN
         dJ7gM4k8Y1Rcw==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so755118pjb.1;
        Mon, 11 Oct 2021 19:03:10 -0700 (PDT)
X-Gm-Message-State: AOAM530YvPpf4M9qUbFWXIY7v14Ur23mPMA4Bv77XerKZBcjQbDclKe4
        TpQCWR3nm/G7VdLYutel26hoK69nBcDMN4I+zZU=
X-Google-Smtp-Source: ABdhPJxuU0yUUCrzfHYFF8sGQP9SoCuZ5/jfaymL6RT40hWuLcJewfV2v54NzwlA7raVFXnVc4qcJ2uTKJC5wHgGxk0=
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id
 h3-20020a170902f703b029012c0982c9aemr27831626plo.20.1634004190051; Mon, 11
 Oct 2021 19:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211007185900.2801788-1-nicolas@fjasle.eu>
In-Reply-To: <20211007185900.2801788-1-nicolas@fjasle.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 Oct 2021 11:02:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDu7RK0vLtx1991abx880DtQHK+U2FK3qKbH5Kcz3ipw@mail.gmail.com>
Message-ID: <CAK7LNASDu7RK0vLtx1991abx880DtQHK+U2FK3qKbH5Kcz3ipw@mail.gmail.com>
Subject: Re: [PATCH] initramfs: Check timestamp to prevent broken cpio archive
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        =?UTF-8?Q?Thomas_K=C3=BChnel?= <thomas.kuehnel@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 8, 2021 at 3:59 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> Cpio format reserves 8 bytes for an ASCII representation of a time_t time=
stamp.
> While 2106-02-07 06:28:15 (time_t =3D 0xffffffff) is still some years in =
the
> future, a poorly chosen date string for KBUILD_BUILD_TIMESTAMP, converted=
 into
> seconds since the epoch, might lead to exceeded cpio timestamp limits tha=
t
> results in a broken cpio archive.  Add timestamp checks to prevent overru=
n of
> the 8-byte cpio header field.

Out of curiosity, how did you figure out
"2106-02-07 06:28:15" was the overflow point?
Is it affected by leap seconds?


I got ffff816f


$ printf "%x"  $(date -d'2106-02-07 06:28:15'  +%s)
ffff816f




> My colleague Thomas K=C3=BChnel discovered the behaviour, when we acciden=
tally fed
> SOURCE_DATE_EPOCH to KBUILD_BUILD_TIMESTAMP as is: some timestamps (e.g.
> 1607420928 =3D 2021-12-08 10:48:48) will be interpreted by `date` as a va=
lid date
> specification of science fictional times (here: year 160742).  Even thoug=
h this
> is bad input for KBUILD_BUILD_TIMESTAMP, it should not break the initramf=
s
> cpio format.
>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Thomas K=C3=BChnel <thomas.kuehnel@avm.de>
> ---
>  usr/gen_init_cpio.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> index 03b21189d58b..983dcdd35925 100644
> --- a/usr/gen_init_cpio.c
> +++ b/usr/gen_init_cpio.c
> @@ -320,6 +320,12 @@ static int cpio_mkfile(const char *name, const char =
*location,
>                 goto error;
>         }
>
> +       if (buf.st_mtime > 0xffffffff) {
> +               fprintf(stderr, "%s: Timestamp exceeds maximum cpio times=
tamp, clipping.\n",
> +                       location);
> +               buf.st_mtime =3D 0xffffffff;
> +       }
> +
>         filebuf =3D malloc(buf.st_size);
>         if (!filebuf) {
>                 fprintf (stderr, "out of memory\n");
> @@ -551,6 +557,17 @@ int main (int argc, char *argv[])
>                 }
>         }
>
> +       /*
> +        * Timestamps after 2106-02-07 06:28:15 have an ascii hex time_t
> +        * representation that exceeds 8 chars and breaks the cpio header
> +        * specification.
> +        */
> +       if (default_mtime > 0xffffffff) {
> +               fprintf(stderr, "ERROR: Timestamp 0x%08x too large for cp=
io format\n",
> +                       default_mtime);
> +               exit(1);
> +       }
> +
>         if (argc - optind !=3D 1) {
>                 usage(argv[0]);
>                 exit(1);
> --
> 2.30.1
>


--=20
Best Regards
Masahiro Yamada
