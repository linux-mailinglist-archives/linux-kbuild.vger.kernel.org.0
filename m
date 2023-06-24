Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF93D73CCAC
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jun 2023 22:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjFXUgW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Jun 2023 16:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjFXUgV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jun 2023 16:36:21 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142C7E0
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 13:36:20 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-25eee11a9f1so903080a91.1
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687638979; x=1690230979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ul7EroSEXmDVAzlRaDn6kl7vTeP1JJnUM4Tp9d1UPPE=;
        b=OEHRfAgUuBMWaV//sbNn9DcgUIsvg2TmqZOeGo42PugVa+8kb1gFwVfAenC6yEvzlj
         28hPSN5twax9mQ8v7x632N8CAMNBtBsll3RxMASsUuX4HVDr2oOr2uvN9GZIPkqxFEgJ
         GAaH3guf/MviANCieY2ivp3C5mtFqlEq0tjCFx3ZBafFJVh2wwCyL8KvGxRT63mttF0v
         g8OE87Us248GdF5Hik5BB9vWQjTrmH3pzOcoT0K4Tz2HlBBFGOu0dZXLMGzpPZrcDnjk
         Tfsyz/AftDXBST6bjmDQr4BmGqmNrFw12QUcef2sQ2UW6vZuSbeFmFbnINWBfPrYaj/8
         EW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687638979; x=1690230979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ul7EroSEXmDVAzlRaDn6kl7vTeP1JJnUM4Tp9d1UPPE=;
        b=XiXQa4UKdHNiot+Q0PTGFAxEFmxPcZGMZxn8vzowp2VhWqrLdLzSlpABET+xn1a7kS
         XfvvuQ9MnlsbE7tjv1BKEkVhWtvG8zM526rx5aIN33XBoNNA4Q7DmP4iuu9YTGyAAXoG
         RvdFkQGeVaXThjBd0dJQopNguprJb2tue16uvLiYEah3fqf8oFdN+uA6WY2iif8kCYhi
         fnoDmooMETptt0+MC5moFS9w4gimIWvbRZap6rKEqXOgZWhwpdBlrVg4/GbFEfWPCICS
         QXXM3j5xWlEbWcTJ3AnN5vm7P3j1SKA6XLzt4o/9o3u90VobaJePq55jdiqHftkM54lM
         LC2Q==
X-Gm-Message-State: AC+VfDxoA/yHhqwl1A1FGHx7ZOwzlA9igzDSbslomUGEm/TM7Y7o6ZG7
        4tNB3ukM2FBLbgiBP84XPwE5RhaIyCyg+JOZKOFdlhXD5RA=
X-Google-Smtp-Source: ACHHUZ5tzDIfSNFY1z8Er4X+kUOPpwelOTMWSFc9puNL4MGYE6T05AccMPpGrxueM+BKN7HU3oZLp2fS88ry2C5fHHc=
X-Received: by 2002:a17:90a:7102:b0:262:ded7:63d with SMTP id
 h2-20020a17090a710200b00262ded7063dmr738665pjk.17.1687638979350; Sat, 24 Jun
 2023 13:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230618001646.1228521-1-Mr.Bossman075@gmail.com> <CAK7LNAT=jKNFcQmrrZsF5Lis_fmex+1KZe0U-VpsxeekH7aZYw@mail.gmail.com>
In-Reply-To: <CAK7LNAT=jKNFcQmrrZsF5Lis_fmex+1KZe0U-VpsxeekH7aZYw@mail.gmail.com>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Sat, 24 Jun 2023 16:36:08 -0400
Message-ID: <CAJFTR8QexS3wyWTv+9_9=Z3OMnwyJtysBucwqLizDsczLW8Vjg@mail.gmail.com>
Subject: Re: [PATCH v1] scripts: kconfig: nconf: Add search jump feature
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 24, 2023 at 4:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sun, Jun 18, 2023 at 9:16=E2=80=AFAM Jesse Taube <mr.bossman075@gmail.=
com> wrote:
> >
> > Menuconfig has a feature where you can "press the key in the (#) prefix
> > to jump directly to that location. You will be returned to the current
> > search results after exiting this new menu."
> >
> > This commit adds this feature to nconfig, with almost identical code.
> >
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>
>
> Setting the code duplication aside,


If it does function as expected will you accept the patch?
Should I mark the copied codes'  original location?

> does this patch work correctly?
>
>
>
>
> $ make defconfig
> $ make nconfig
>
> Press F8
>
> Input "MODULES" in the search box.
>
> You will see:
>
> (1) -> Enable loadable module support
>
> Press the "1" key.
>
>
> It will navigate to "General setup"
> instead of "Enable loadable module support".


Hmm, this is a confusing issue.
It will take you to the parent menu of the option, it should move you
to the parent option and
move the cursor to the option location. I will see if I can resolve
this oversight.

Thanks,
Jesse Taube

>
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
