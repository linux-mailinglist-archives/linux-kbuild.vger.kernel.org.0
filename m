Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2D1763B9BC
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Nov 2022 07:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbiK2GTq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Nov 2022 01:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbiK2GTq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Nov 2022 01:19:46 -0500
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1810A29CB4
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Nov 2022 22:19:44 -0800 (PST)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 2AT6JPqR032551
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Nov 2022 15:19:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 2AT6JPqR032551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669702766;
        bh=xPdOvPG/Xx4t/vZnJSXhAeaJNa7NgrjzimmldXIAAnI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vv9Q1S890PtRZQ3lxyUGg1A+hp7MblAhVUSnBaSfgD99zJTV6q+WBMFPQwSDKvOZ6
         4zyMJpsCJgQuK0OzdJscYGIEU9KvUCEhlJYwwRFrWW2Zneog7qx7MMneOxaIhzFRxr
         kmS/gp8+cSHONF/GqOZQwY8aD89UzNHMkt6bF6cWVUJGImSY7ZRL3ZG1XQQy8viEUc
         igTg2Wd2Qj+hqRJPvPEeBCmvZZZ0RiS3lrAeEa06j8LIlgrUypOFTd9IAu+0FHHuyK
         eYocc7dVA310Y8hBT6U/sOeshjW8jsUuTQt7iGee5d/yqxAb3dPHwclXmb95m1zf4a
         FmwTxfJCQrZhA==
X-Nifty-SrcIP: [209.85.160.49]
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-14263779059so15887679fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Nov 2022 22:19:26 -0800 (PST)
X-Gm-Message-State: ANoB5pkGyiIIYBrcEPmjjkgGKt6gDv2XU0i53UNp1eExD3ox03SEUxWj
        kDYpjeqp/cFuueesgsPqXXxUbXPKGvOH7YzrbKs=
X-Google-Smtp-Source: AA0mqf5zKmNEWLXv+1QiSrp2yv6pq2rFlL3okPqI6O8Qf6S5NLlkNhBHCwz3bd3jtBauoDFiS9t0ST7lZ5f1B81qCgk=
X-Received: by 2002:a05:6870:ea8e:b0:13b:a31f:45fd with SMTP id
 s14-20020a056870ea8e00b0013ba31f45fdmr33495313oap.194.1669702765184; Mon, 28
 Nov 2022 22:19:25 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CviRhBQqWfAPFDht+mWUJf4azPSZgOV0jrur_YSP23__A@mail.gmail.com>
 <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com> <CAG+Z0CvGfuMpM+VpMaPJVY9EjrDztJxMgYKW2Tp_XR1SX0Xxxg@mail.gmail.com>
In-Reply-To: <CAG+Z0CvGfuMpM+VpMaPJVY9EjrDztJxMgYKW2Tp_XR1SX0Xxxg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 29 Nov 2022 15:18:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQn248OsEGXCRFNURt7VC6eNfu-EEtphdtw9uNJPD_16Q@mail.gmail.com>
Message-ID: <CAK7LNAQn248OsEGXCRFNURt7VC6eNfu-EEtphdtw9uNJPD_16Q@mail.gmail.com>
Subject: Re: Port silent mode detection to future gnu make.
To:     Dmitry Goncharov <dgoncharov@users.sf.net>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 29, 2022 at 12:00 PM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
> Good morning.
>
> On Sun, Nov 27, 2022 at 1:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > Please come back after your patch is applied
> > (and please have the patch include the commit hash
> > causing the behaviour change)
>
>
>
> The change is available in git in sha dc2d963989b96161472b2cd38cef5d1f4851ea34.
>
> regards, Dmitry
>
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..c5d5558e9806 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -94,7 +94,7 @@ endif
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
>
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> +ifneq ($(findstring s,$(firstword -$(MAKEFLAGS))),)
>    quiet=silent_
>    KBUILD_VERBOSE = 0
>  endif



Yup, I saw that.



Paul said with GNU Make 4.4,
Kbuild is already having an issue in the -s detection.


$ export MAKEFLAGS=-I/usr/local/mk

 or

$ export MAKEFLAGS=-Orecurse



Commit 77881d228103 ("Ensure that MAKEFLAGS is set when invoking $(shell ...)")
is the commit that caused a change.


Please send v2 with $(firstword) and updated commit log.



Also, add this tag:

Link: https://lists.gnu.org/archive/html/bug-make/2022-11/msg00190.html



-- 
Best Regards
Masahiro Yamada
