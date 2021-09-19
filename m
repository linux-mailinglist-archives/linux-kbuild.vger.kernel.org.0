Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB515410B4C
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Sep 2021 13:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhISLi2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Sep 2021 07:38:28 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32406 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhISLi2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Sep 2021 07:38:28 -0400
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 18JBam15016555;
        Sun, 19 Sep 2021 20:36:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 18JBam15016555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632051409;
        bh=wDEK8hkdweS2PIzKbc3TjqmEdv9Hq1OPbScjxMt9QOY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hUV7kwRbVKAgr1qc7SpyWa5gXe7fBjUil2Sr3A8A9KDKZTIGkveQyJSK5AAsAzKDG
         Uz042kXOA5xWy7B89XhwiwzwxIwKUsJLJtUNxKP3f9AD/RIhHtobHgFMkDMeufKU/B
         dkzH02n1sj1A6m/6oUEWW5WlL1PLODyMc1oFvXdwMXr6nb1XeUkU4YFY2o1qptZrMJ
         RsArVQ6sXJoyCRk/VuMEak+VJ6CH+UG/xQctJTQzcQ8QLU0McnesQYXhlc2KsWtoys
         +LAErYZ4iuuHI1Rhvgzs0qSFYEagfQnzyY15ct3OiwtH5Aqyv63vwzdfx5K2A39t3I
         4hR6uCLlrNCZQ==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id me1so1376134pjb.4;
        Sun, 19 Sep 2021 04:36:48 -0700 (PDT)
X-Gm-Message-State: AOAM533JgT2o9H4xf/RGSl/Rv/K0jSC6tPSJNfZdj4UHPeFuQbGexK+r
        RRawKKCnflVSGpCpxW18xBQOTdoEEBzdO6D+12I=
X-Google-Smtp-Source: ABdhPJw2ZdewXhDn/bjSvRAh/1hGO1Ls5xPU0f7dnJEHIxSzaqxh/mQfSsMv9BPnl3VvmjBwJ9PPG+cfJOmiEKZ7Siw=
X-Received: by 2002:a17:902:6b42:b0:13a:54d0:39c4 with SMTP id
 g2-20020a1709026b4200b0013a54d039c4mr17778287plt.42.1632051407751; Sun, 19
 Sep 2021 04:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130954.1392104-1-lucjan.lucjanov@gmail.com> <CAL2Yj0QvoNZ3VeYfk63oMUTenP3eypJx+fB6f09rprV-fCphGw@mail.gmail.com>
In-Reply-To: <CAL2Yj0QvoNZ3VeYfk63oMUTenP3eypJx+fB6f09rprV-fCphGw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 19 Sep 2021 20:36:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBvZBmuznFaFQgZeOO_F_UsisPYBobDC7LYDMVW3Yd=w@mail.gmail.com>
Message-ID: <CAK7LNATBvZBmuznFaFQgZeOO_F_UsisPYBobDC7LYDMVW3Yd=w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use smaller dictionary size for zstd module compression
To:     =?UTF-8?Q?Piotr_G=C3=B3rski?= <lucjan.lucjanov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 18, 2021 at 12:07 AM Piotr G=C3=B3rski <lucjan.lucjanov@gmail.c=
om> wrote:
>
> Ping...
>
> pt., 10 wrz 2021 o 15:10 Piotr Gorski <lucjan.lucjanov@gmail.com> napisa=
=C5=82(a):
> >
> > By default, zstd without parameters uses a dictionary size of 8 MB.
> > However, most modules are much smaller than that.
> > Use a dictionary size of 2 MB for module compression, resulting in
> > slightly higher compression speed while still maintaining a good
> > compression ratio.
> > The --zstd=3Dwlog=3D21 option is equivalent to --lzma2=3Ddict=3D2MiB us=
ed in XZ compression.



What is a benefit of this patch?

It claims "slightly higher compression", but I do not see a difference.
(15.0577 sec   --> 15.013 sec)


[1] build  allmodconfig
[2] collect *.ko files whose size is less than 2MB
[3] measure the time elapsed for compressing all of them

I did 'perf stat --repeat 10'.






The default zstd:



 Performance counter stats for '/tmp/zstd2/test.sh' (10 runs):

         19,250.23 msec task-clock                #    1.278 CPUs
utilized            ( +-  0.49% )
            65,424      context-switches          #    0.003 M/sec
               ( +-  0.03% )
             5,609      cpu-migrations            #    0.291 K/sec
               ( +-  0.25% )
         4,207,419      page-faults               #    0.219 M/sec
               ( +-  0.19% )
    54,349,495,038      cycles                    #    2.823 GHz
               ( +-  0.15% )  (85.93%)
     3,833,225,032      stalled-cycles-frontend   #    7.05% frontend
cycles idle     ( +-  0.47% )  (86.34%)
    20,789,203,221      stalled-cycles-backend    #   38.25% backend
cycles idle      ( +-  0.31% )  (85.92%)
    65,385,071,612      instructions              #    1.20  insn per
cycle
                                                  #    0.32  stalled
cycles per insn  ( +-  0.09% )  (86.54%)
    11,033,842,879      branches                  #  573.180 M/sec
               ( +-  0.10% )  (86.38%)
       288,314,097      branch-misses             #    2.61% of all
branches          ( +-  0.16% )  (86.33%)

           15.0577 +- 0.0728 seconds time elapsed  ( +-  0.48% )



zstd --zstd=3Dwlog=3D21:




 Performance counter stats for '/tmp/zstd2/test2.sh' (10 runs):

         19,203.08 msec task-clock                #    1.279 CPUs
utilized            ( +-  0.85% )
            65,404      context-switches          #    0.003 M/sec
               ( +-  0.05% )
             5,617      cpu-migrations            #    0.293 K/sec
               ( +-  0.15% )
         4,214,502      page-faults               #    0.219 M/sec
               ( +-  0.12% )
    54,495,218,169      cycles                    #    2.838 GHz
               ( +-  0.29% )  (85.55%)
     3,867,166,903      stalled-cycles-frontend   #    7.10% frontend
cycles idle     ( +-  0.26% )  (87.22%)
    20,950,577,113      stalled-cycles-backend    #   38.44% backend
cycles idle      ( +-  0.38% )  (86.51%)
    65,500,859,667      instructions              #    1.20  insn per
cycle
                                                  #    0.32  stalled
cycles per insn  ( +-  0.12% )  (86.65%)
    11,045,504,296      branches                  #  575.194 M/sec
               ( +-  0.12% )  (85.90%)
       288,729,169      branch-misses             #    2.61% of all
branches          ( +-  0.12% )  (85.59%)

            15.013 +- 0.129 seconds time elapsed  ( +-  0.86% )






> > Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> > ---
> >  scripts/Makefile.modinst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index ff9b09e4cfca..c3475e5aca7c 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -97,7 +97,7 @@ quiet_cmd_gzip =3D GZIP    $@
> >  quiet_cmd_xz =3D XZ      $@
> >        cmd_xz =3D $(XZ) --lzma2=3Ddict=3D2MiB -f $<
> >  quiet_cmd_zstd =3D ZSTD    $@
> > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > +      cmd_zstd =3D $(ZSTD) --zstd=3Dwlog=3D21 -T0 --rm -f -q $<
> >
> >  $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> >         $(call cmd,gzip)
> > --
> > 2.33.0.142.ge0a2f5cbc5
> >



--
Best Regards
Masahiro Yamada
