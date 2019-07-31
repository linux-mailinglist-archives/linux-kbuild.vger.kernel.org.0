Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18E97BC51
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2019 10:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfGaIzY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Jul 2019 04:55:24 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64931 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfGaIzX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jul 2019 04:55:23 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6V8svpa012390;
        Wed, 31 Jul 2019 17:54:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6V8svpa012390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564563299;
        bh=+6VnkpjvIjwaRHB0EeFGcKCol1oBBgahP6+w4Ilp5Ew=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pgdq/SN9RbWGSQz3b8aGMAR8L2MbVAlrkSAAgdgTJa3jfQWnkDJwSrrLJYF8zpSCs
         EmdSBg6XovFX19J8SuDfbc/mXjJ9DTPsw+qXzf2QNpvLishtsNZC3aUgfac9JrBo6b
         uuV32vyCE0jJ0Ikqu95O/e1C4U8A06iPML4Z8Y7sMY8R3Pmv4CCTB523c9ZjmH043Y
         Z+yVaEgpIHFoAPMVSlEOenQMhVmXpRhbvlA3zcZDWIiq1sDVlzWO1jgvhqU9XrrMIp
         6e703X87sTezCQuKtNOOm7M1U3fmnNQg/B+WoZdwb3oE3WQfaxa2z1GYd30Egr2O+M
         DaRYXo/+xHZ5A==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id v129so45633200vsb.11;
        Wed, 31 Jul 2019 01:54:59 -0700 (PDT)
X-Gm-Message-State: APjAAAUPliwwn6t0H1+Ugi0v1r0I0DBQA8jNx4zueVbn7PZe42XXN1mX
        2gmot+pqpZRDjPmvPxoUm/3PLfq5r8jRfVXjWco=
X-Google-Smtp-Source: APXvYqzNOUYxH3dkGmr5NVvz1LQM4uZuveEacwZhA0iB2msRv4KMUeu7A2oJHRpRDrWs9bSGwiKRG4QieuuK5VNqiPo=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr14825701vsq.179.1564563296511;
 Wed, 31 Jul 2019 01:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190730181146.6507-1-efremov@linux.com>
In-Reply-To: <20190730181146.6507-1-efremov@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 31 Jul 2019 17:54:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASW87=sWqEdPChiwxzS3Wwmtr7kO_=XLToLHYO6mDjotw@mail.gmail.com>
Message-ID: <CAK7LNASW87=sWqEdPChiwxzS3Wwmtr7kO_=XLToLHYO6mDjotw@mail.gmail.com>
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

Hi.



On Wed, Jul 31, 2019 at 3:12 AM Denis Efremov <efremov@linux.com> wrote:
>
> This patch adds a check to warn about static EXPORT_SYMBOL* functions
> during the modpost. In most of the cases, a static symbol marked for
> exporting is an odd combination that should be fixed either by deleting
> the exporting mark or by removing the static attribute and adding the
> appropriate declaration to headers.
>
> This check could help to detect the following problems:
> 1. 550113d4e9f5 ("i2c: add newly exported functions to the header, too")
> 2. 54638c6eaf44 ("net: phy: make exported variables non-static")
> 3. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
> 4. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
> 5. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
> 6. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
> 7. 14b4c48bb1ce ("gve: Remove the exporting of gve_probe")
> 8. 9b79ee9773a8 ("scsi: libsas: remove the exporting of sas_wait_eh")
> 9. ...
>
> Build time impact, allmodconfig, Dell XPS 15 9570 (measurements 3x):
> $ make mrproper; make allmodconfig; time make -j12; \
>   git checkout HEAD~1; \
>   make mrproper; make allmodconfig; time make -j12
> 1.
>    (with patch) 17635,94s user 1895,54s system 1085% cpu 29:59,22 total
>    (w/o  patch) 17275,42s user 1803,87s system 1112% cpu 28:35,66 total
> 2.
>    (with patch) 17369,51s user 1763,28s system 1111% cpu 28:41,47 total
>    (w/o  patch) 16880,50s user 1670,93s system 1113% cpu 27:46,56 total
> 3.
>    (with patch) 17937,88s user 1842,53s system 1109% cpu 29:42,26 total
>    (w/o  patch) 17267,55s user 1725,09s system 1111% cpu 28:28,17 total
>
> The check adds less than a minute to a usual build.


I am not convinced with this analysis.

Since commit  b7dca6dd1e591ad19,
scripts/mod/modpost is only invoked from scripts/Makefile.modpost.

So, it is much easier to to measure the elapsed time
of modpost directly.



I applied your patch on top next-20190731,
and the following:


diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 92ed02d7cd5e..e0db1a626e50 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -98,7 +98,7 @@ MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
-s -T - $(wildcard vmlinux)

 # We can go over command line length here, so be careful.
 quiet_cmd_modpost = MODPOST $(words $(modules)) modules
-      cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(MODPOST)
+      cmd_modpost = sed 's/ko$$/o/' $(modorder) | time -o
modpost-time.txt $(MODPOST)

 PHONY += modules-modpost
 modules-modpost:





The difference is less than 1 sec (not 1 min!) even for allmodconfig.
So, the performance regression is almost unnoticeable level.


-- 
Best Regards
Masahiro Yamada
