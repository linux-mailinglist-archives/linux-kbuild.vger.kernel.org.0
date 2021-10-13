Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCBF42B279
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 03:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhJMCAs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 22:00:48 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:38898 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhJMCAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 22:00:48 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 19D1wULh005134;
        Wed, 13 Oct 2021 10:58:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 19D1wULh005134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634090310;
        bh=N2P+wGiOWhyYqt9vyW2meo0KmQGfx73r8hrK4hY9Dvg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UGnD18sn0+yOwQVy80ozyXYV06V8SEs/m3f5NrD3e7oCxLjTX1fixtNcKUXD9Ym7F
         5U5y+zv497mRIaBOhvm2LRQ/tld+vAdbHDQM0YHm9GN2y3rJz+syRI3q7ItWCgupQE
         uWr23raj8b+2Dcx6KSDxFtcoUORYCk8pgHPzfxsq0kGsMnNRumN0OHrbNGyOHJBRrU
         O3n7cKnMNfACiJ6dUNT1ZZxRbI/15boR/F3T9fOqDjkJ3in52A9oorvOw5QaEMNg4T
         aQf225l9DCk3OfGQDFc6HbfZUKQFivq1qkgaiL1zTvM1StpEMu5v5hbo2GPCf2R6lW
         Q3SY+BYzvZ2+g==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id pf6-20020a17090b1d8600b0019fa884ab85so3224316pjb.5;
        Tue, 12 Oct 2021 18:58:30 -0700 (PDT)
X-Gm-Message-State: AOAM531QHY4JCc3YQ6vfXK8n5PHpER0eqeOJEa646y7yMPzYUQUS2vTj
        +U6Dajqtp9SpV68wp+CbNmXvLXm2NCRO/A7qckI=
X-Google-Smtp-Source: ABdhPJzYKt4jSgb+KSxlCNbP9a1/x8UQ4fs/7fppIek36EWa0aMDHCFrLAKE79yMTQFzSMK7KITLTgp9W4K5caATIzE=
X-Received: by 2002:a17:90b:4ac1:: with SMTP id mh1mr10037241pjb.144.1634090309642;
 Tue, 12 Oct 2021 18:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211012201220.3310806-1-nicolas@fjasle.eu>
In-Reply-To: <20211012201220.3310806-1-nicolas@fjasle.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 13 Oct 2021 10:57:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ+4ACpqJ0-9vj02hTfN1AUELS34JMukeB-0_LE=_dHSg@mail.gmail.com>
Message-ID: <CAK7LNAQ+4ACpqJ0-9vj02hTfN1AUELS34JMukeB-0_LE=_dHSg@mail.gmail.com>
Subject: Re: [PATCH v3] initramfs: Check timestamp to prevent broken cpio archive
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        =?UTF-8?Q?Thomas_K=C3=BChnel?= <thomas.kuehnel@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 13, 2021 at 5:12 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> Cpio format reserves 8 bytes for an ASCII representation of a time_t time=
stamp.
> While 2106-02-07 06:28:15 UTC (time_t =3D 0xffffffff) is still some years=
 in the
> future, a poorly chosen date string for KBUILD_BUILD_TIMESTAMP, converted=
 into
> seconds since the epoch, might lead to exceeded cpio timestamp limits tha=
t
> result in a broken cpio archive.  Add timestamp checks to prevent overrun=
 of
> the 8-byte cpio header field.
>
> My colleague Thomas K=C3=BChnel discovered the behaviour, when we acciden=
tally fed
> SOURCE_DATE_EPOCH to KBUILD_BUILD_TIMESTAMP as is: some timestamps (e.g.
> 1607420928 =3D 2021-12-08 9:48:48 UTC) will be interpreted by `date` as a=
 valid
> date specification of science fictional times (here: year 160742).  Even =
though
> this is bad input for KBUILD_BUILD_TIMESTAMP, it should not break the ini=
tramfs
> cpio format.
>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Thomas K=C3=BChnel <thomas.kuehnel@avm.de>
> ---

Applied to linux-kbuild. Thanks.



>  usr/gen_init_cpio.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> index 03b21189d58b..97aeeecf7386 100644
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
> @@ -551,6 +557,16 @@ int main (int argc, char *argv[])
>                 }
>         }
>
> +       /*
> +        * Timestamps after 2106-02-07 06:28:15 UTC have an ascii hex tim=
e_t
> +        * representation that exceeds 8 chars and breaks the cpio header
> +        * specification.
> +        */
> +       if (default_mtime > 0xffffffff) {
> +               fprintf(stderr, "ERROR: Timestamp too large for cpio form=
at\n");
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
