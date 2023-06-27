Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 418F173F12B
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jun 2023 05:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjF0DIc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Jun 2023 23:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjF0DIa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Jun 2023 23:08:30 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6C1BB
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jun 2023 20:08:29 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-262e66481c4so794504a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jun 2023 20:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835309; x=1690427309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfj6b7bMFszR7gws8VEivHN95+uDnkqyG3o+LVVgG6s=;
        b=p/GXfUYp0ALy3KiNTWVY2/+3AxB51AKwHmGJRtzZBFmQzAjIKNAB2HIzgEDeHyrF8h
         Ff3LBOhI0FkvrX7bJYnq8s+P4w6QRMByAiCqPDVdyjPLi/09Yo91UXpv7KzUhfHwWDuu
         8I7LkM3XaranKMIxthfkfXlHWoqLctUUnkJbOl14bJeBDXWnC2eW9FSX22zqvjOWFl9m
         K7s0jzmkb3dkNIA3NnNLtfcvwTuhSQlPDhsK/9OFgli0nRySzh+zvOHZbnL5Mbe/bp99
         JQrtxEi2nG13lmaJAQ/PL1w+fLwYcYLzWu86Bz8WEYlNGCKvW8qqRm0S/BB2CbodB/Tm
         eavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835309; x=1690427309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kfj6b7bMFszR7gws8VEivHN95+uDnkqyG3o+LVVgG6s=;
        b=Y/MnOCqnu/CVL29S9ekDgfrkRSVE+h79NP6h/AmJfQVkHi1UmOkHfJMiJY6fdPIKkn
         URFSQH+xriAa3kTCpJd+prD/jjbaZFEgGJVMMXSjRoY7DmshKyE67tNFwPg15zyPnbfj
         JZME6S8xtBnDjivJXGHyp1nWXNCM8hx9qBVyfuKmSoyJifXteyI9u5v+cdtNzWtPfZb4
         V90eiGaMfiZUvjZEdcb/+UhUkQEjj4V/n5IKf0ptc+DW6WbJJHeMm3q0W6eJ8AxYuv54
         r0fN0LF6Y23nEO9kKiLEKCU4mzSoPoYZ39zEu0ezqYTXdvNFo9ArsnK6k9LiEabJJDCC
         SXag==
X-Gm-Message-State: AC+VfDzsIj+LSLMfmam3+nt9Dcok9P0teSJNRa6kOz+R5FcVbLQ5WDWu
        N+8gYsq0BES1rYVKpM2uiXJKop09/PqGdbqNlPY=
X-Google-Smtp-Source: ACHHUZ4d+1BzAfOaNHRSTs+rKKpccU89AqSF7O/CBotEvhjHA5FQh83ehafaxghgkhSaYDRv6cMTPUq5poxnvY87BaI=
X-Received: by 2002:a17:90b:1050:b0:263:129e:80ac with SMTP id
 gq16-20020a17090b105000b00263129e80acmr1020509pjb.38.1687835308744; Mon, 26
 Jun 2023 20:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230618001646.1228521-1-Mr.Bossman075@gmail.com>
 <CAK7LNAT=jKNFcQmrrZsF5Lis_fmex+1KZe0U-VpsxeekH7aZYw@mail.gmail.com>
 <CAJFTR8QexS3wyWTv+9_9=Z3OMnwyJtysBucwqLizDsczLW8Vjg@mail.gmail.com> <CAK7LNARG+m8RPJWKyOXHB=deF+yRN-2soXWO-ohBEc3nLDYF5A@mail.gmail.com>
In-Reply-To: <CAK7LNARG+m8RPJWKyOXHB=deF+yRN-2soXWO-ohBEc3nLDYF5A@mail.gmail.com>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Mon, 26 Jun 2023 23:08:17 -0400
Message-ID: <CAJFTR8STYYmcqJNr2sLCfsWAHBkzLuDUnLLr5Ke-JfbUoKefBA@mail.gmail.com>
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

On Mon, Jun 26, 2023 at 8:38=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sun, Jun 25, 2023 at 5:36=E2=80=AFAM Jesse T <mr.bossman075@gmail.com>=
 wrote:
> >
> > On Sat, Jun 24, 2023 at 4:11=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Sun, Jun 18, 2023 at 9:16=E2=80=AFAM Jesse Taube <mr.bossman075@gm=
ail.com> wrote:
> > > >
> > > > Menuconfig has a feature where you can "press the key in the (#) pr=
efix
> > > > to jump directly to that location. You will be returned to the curr=
ent
> > > > search results after exiting this new menu."
> > > >
> > > > This commit adds this feature to nconfig, with almost identical cod=
e.
> > > >
> > > > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > >
> > >
> > > Setting the code duplication aside,
> >
> >
> > If it does function as expected will you accept the patch?
>
>
> Probably.
>
> The menuconfig code you copied is really ugly.

Yes, I saw and was surprised it was allowed, grandfathered in I guess.

> Actually, I was refactoring the search jump code a few
> months ago, but I did not get around to completing it.

This isn't on git.kernel.org, would you mind sharing it?
If you have any ideas on the best way to implement this,
I would love suggestions.

Thanks,
Jesse T

>
>
>
>
>
>
>
>
> > Should I mark the copied codes'  original location?
> >
> > > does this patch work correctly?
> > >
> > >
> > >
> > >
> > > $ make defconfig
> > > $ make nconfig
> > >
> > > Press F8
> > >
> > > Input "MODULES" in the search box.
> > >
> > > You will see:
> > >
> > > (1) -> Enable loadable module support
> > >
> > > Press the "1" key.
> > >
> > >
> > > It will navigate to "General setup"
> > > instead of "Enable loadable module support".
> >
> >
> > Hmm, this is a confusing issue.
> > It will take you to the parent menu of the option, it should move you
> > to the parent option and
> > move the cursor to the option location. I will see if I can resolve
> > this oversight.
> >
> > Thanks,
> > Jesse Taube
> >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
>
>
>
> --
> Best Regards
> Masahiro Yamada
