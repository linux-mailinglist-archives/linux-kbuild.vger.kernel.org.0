Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B9377172D
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Aug 2023 00:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjHFWRQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Aug 2023 18:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHFWRP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Aug 2023 18:17:15 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723811721
        for <linux-kbuild@vger.kernel.org>; Sun,  6 Aug 2023 15:17:14 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2683add3662so2773577a91.1
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Aug 2023 15:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691360232; x=1691965032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ABo29ymxxIdC/QmsuddqLzeWADkvZ6JVMMBdiIK+xk=;
        b=S8eenWO/NEtLlFtID1w/lGkgg1UjNZKGFzcmnG/D65o1/Psqp/k66HaWuDQs3YHM//
         IPowBkeGB1ApwRprjTx/M+y0ijM+Rtne8tuIE3Tun9XB7OBrE36scfXJMlD3O2Dk+Mp4
         2xxkYxFOOiZMp31AGniKfhtYQ+NhJkgM4uvPiHmzEgwtxjVz42hbm9/Q1t0Xf39C8XTW
         H/gQ2eI6VBCI9VVxCga5WZDNTR1kfKQvzU7Rj1iUQIf1qFGU3QPXiifLlbbp4dgUcrlz
         eY53+RnNBV+0SgYFomUJJIMfaTAXLBwLci/LTo2ZDoAdU/mGLBoUpXyHdmh/y93eDzvp
         1vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691360232; x=1691965032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ABo29ymxxIdC/QmsuddqLzeWADkvZ6JVMMBdiIK+xk=;
        b=IB3ys2fb7P8PJndenGuZwM4s7dlSzHl6Bp590KDMUjMHAzS+m4nXT5j22kH76EjE2T
         ewGbiIy0mkUpITrHV0EHWvU6GHccHTd161oVzhwaIOW9S8QzLT9iffkZv5qnCYpckE1g
         jgZ64vWYQEBc2azwiukvOxDv+KCNZqqLGBf72wG44794MDUoGwxCMD6mcBBdtX5yDozu
         CnBHsXJdRwABvLA4/5Jvh5GhyImY5yNnLkqGop45AXA0cYk5zQwOGSqSWnSRsps81yB5
         /+/RUBra6yDA6zEWnv6qnjVmXp7wEzGgX/5v6ZDjPV7sZMDhb+HTqXXmIONoHHDHCqZz
         2Nhw==
X-Gm-Message-State: AOJu0YwU6cCt1P0qPkQvYoqlX/mb1NsbuPao/XsQuxVUpY5Iu63lwTo4
        l1Eeop4puTvxxq7pq9T6P1TO3HygzEIASaaS+M4=
X-Google-Smtp-Source: AGHT+IFPz6ZOPg6wIOPRa4Qde3EWTXQDTma2rx9+ZQUulPAXrxYMd4C/gml1wJ26ktI4LL1DRdrYzzVfF1UYiQPD+7E=
X-Received: by 2002:a17:90a:e605:b0:269:18f5:683e with SMTP id
 j5-20020a17090ae60500b0026918f5683emr6891907pjy.3.1691360231637; Sun, 06 Aug
 2023 15:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230806032026.1718752-1-Mr.Bossman075@gmail.com> <9c86c832-9a2c-0500-292f-5449e21be7e3@infradead.org>
In-Reply-To: <9c86c832-9a2c-0500-292f-5449e21be7e3@infradead.org>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Sun, 6 Aug 2023 18:17:00 -0400
Message-ID: <CAJFTR8QzSpopeooARoz8S2Dy7jr8p8gSQcgz_6ro2MM+D3Gjhg@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: nconf: Keep position after jump search
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 6, 2023 at 11:30=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi Jesse,
>
> On 8/5/23 20:20, Jesse Taube wrote:
> > In this Menuconfig, pressing the key in the (#) prefix will jump
> > directly to that location. You will be returned to the current search
> > results after exiting this new menu.
> >
> > In nconfig, exiting always returns to the top of the search output, not
> > to where the (#) was displayed on the search output screen.
> >
> > This patch fixes that by saving the current position in the search.
> >
>
> This patch fixes the reported problem. Thanks, Jesse.
>
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Link: https://lore.kernel.org/r/20230805034445.2508362-1-Mr.Bossman075@=
gmail.com/
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>
> Now I have another issue. :(
>
> Here is my test case: x86_64 defconfig.
>
> SymSearch (F8) for MSR.
> Page Down to #3. Select 3.
> X86_MSR is about 7 lines below the highlighted line in the menu,
> which is confusing and sometimes it's not obvious what the correct
> line for the symbol is.
>
> In menuconfig, the highlighted line is precisely on X86_MSR.

Oh jeez, how did I miss this?
I will fix this asap as this seems to be a big issue as it can easily
cause confusion.
Weirdly all the test cases I used were fine, but I found a few more like th=
is.

Thanks,
Jesse Taube
>
> Can nconfig be more precise about which menu line it highlights?
>
> Thanks for your help.
>
> > ---
> >  scripts/kconfig/nconf.c     |  3 ++-
> >  scripts/kconfig/nconf.gui.c | 12 +++++++++++-
> >  scripts/kconfig/nconf.h     |  1 +
> >  3 files changed, 14 insertions(+), 2 deletions(-)
>
>
> --
> ~Randy
