Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01A437D349
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2019 04:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfHACVv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Jul 2019 22:21:51 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:57106 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfHACVv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jul 2019 22:21:51 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x712LZNg004188;
        Thu, 1 Aug 2019 11:21:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x712LZNg004188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564626096;
        bh=ImezOrOFRv8W55zMlcFjiaKjT+vV5SqiZobKDdu5voc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2ZH+KXG06dYMo6hvewKZCVMY5ZvXL/VDkJRwn/B2EFQ+oRJTFjjss/etPxRjhD15A
         4y72yZ9PrsDxE8LBh5fRcUndpOmPqD4ltiDMz8BWfnZrxGltYfemcARgtbN4ZODtI5
         SLAkTgXzoez9LuVvm5lJfJPCiuQizLta9DbrzFEscLqbHTfdtu5do95n1/JWJ8jPTw
         KT9C4HD3dhTMkAVLxKZHxjGKlihlAy5dQKy1Lb+mlrXDKReQjZAadju8D/CyKKJS6l
         5bk+Y1SiOGDZyVipk0q/SV1qC5R8mioCsOFcK5pFm0NCL4Fhlz7xibwsTxGrs/mf4E
         tluHGPBsMdr7g==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id r3so47753992vsr.13;
        Wed, 31 Jul 2019 19:21:36 -0700 (PDT)
X-Gm-Message-State: APjAAAUwyoTnarXf5VcJhUFabfv6uLW9oK+VGt9Jzq8zyiOavWpE3m3n
        khKHOkVMFhiwz5NSMuZ7Qc9VF47b2qM5TK/AMzw=
X-Google-Smtp-Source: APXvYqzEztzxoyF2rJMs2hYfy5+w/c1qqbycGIswhSz6Sd9tg8o1rvaCYSMzaDFTLhu2t3v0AxyFZ7lEy5cLnWBTiiE=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr18943935vsq.179.1564626095385;
 Wed, 31 Jul 2019 19:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190730181146.6507-1-efremov@linux.com>
 <CAK7LNASW87=sWqEdPChiwxzS3Wwmtr7kO_=XLToLHYO6mDjotw@mail.gmail.com>
In-Reply-To: <CAK7LNASW87=sWqEdPChiwxzS3Wwmtr7kO_=XLToLHYO6mDjotw@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 1 Aug 2019 11:20:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrA7dKWaqqtbNUS2yOJfkign4CNvcn_bp2BLyvVAj2FQ@mail.gmail.com>
Message-ID: <CAK7LNARrA7dKWaqqtbNUS2yOJfkign4CNvcn_bp2BLyvVAj2FQ@mail.gmail.com>
Subject: Re: [PATCH v4] modpost: check for static EXPORT_SYMBOL* functions
To:     Denis Efremov <efremov@linux.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 31, 2019 at 5:54 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi.
>
>
>
> On Wed, Jul 31, 2019 at 3:12 AM Denis Efremov <efremov@linux.com> wrote:
> >
> > This patch adds a check to warn about static EXPORT_SYMBOL* functions
> > during the modpost. In most of the cases, a static symbol marked for
> > exporting is an odd combination that should be fixed either by deleting
> > the exporting mark or by removing the static attribute and adding the
> > appropriate declaration to headers.
> >
> > This check could help to detect the following problems:
> > 1. 550113d4e9f5 ("i2c: add newly exported functions to the header, too")
> > 2. 54638c6eaf44 ("net: phy: make exported variables non-static")
> > 3. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
> > 4. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
> > 5. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
> > 6. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
> > 7. 14b4c48bb1ce ("gve: Remove the exporting of gve_probe")
> > 8. 9b79ee9773a8 ("scsi: libsas: remove the exporting of sas_wait_eh")
> > 9. ...
> >
> > Build time impact, allmodconfig, Dell XPS 15 9570 (measurements 3x):
> > $ make mrproper; make allmodconfig; time make -j12; \
> >   git checkout HEAD~1; \
> >   make mrproper; make allmodconfig; time make -j12
> > 1.
> >    (with patch) 17635,94s user 1895,54s system 1085% cpu 29:59,22 total
> >    (w/o  patch) 17275,42s user 1803,87s system 1112% cpu 28:35,66 total
> > 2.
> >    (with patch) 17369,51s user 1763,28s system 1111% cpu 28:41,47 total
> >    (w/o  patch) 16880,50s user 1670,93s system 1113% cpu 27:46,56 total
> > 3.
> >    (with patch) 17937,88s user 1842,53s system 1109% cpu 29:42,26 total
> >    (w/o  patch) 17267,55s user 1725,09s system 1111% cpu 28:28,17 total
> >
> > The check adds less than a minute to a usual build.

The build time impact is very limited.
I guess this measurement is unnecessary in the commit log.


-- 
Best Regards
Masahiro Yamada
