Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0591E770DC1
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Aug 2023 06:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjHEEmu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Aug 2023 00:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHEEmt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Aug 2023 00:42:49 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2856468C;
        Fri,  4 Aug 2023 21:42:47 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-55c993e26ffso1589867a12.0;
        Fri, 04 Aug 2023 21:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691210567; x=1691815367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM+/tf+PMpomwOT8LjsuZ+VMBXiQw4kgIeHW9CdG7Oc=;
        b=qzp5yHqoIaVs1OgM8Ys96pH9Bv8JATMhfRmYOt+5CfpXxQsQ3ZZM3aKJ80+pEBw15t
         P1FR1g5ziOE3HsfMoKr/q0BmqnccxAbbHGWKOQvT88bYBiDwGVJLTz2WAK3USNvXoN2M
         PDE8ChnxynCA/lNp2MYfjQXDbIyNe7p6eYGqB69rgmEzvgoTX2VFbxYvxFujJ1Lt0jnB
         tzHU0fIvdj1SDZfrXQaiOk/m50q8nnb7LHj5BClP7tmFOho2cL5m4PPTdHgkEshxsBq5
         HcjcV46wblzALhSZOAD2r8piMxhCwJiwmIAohIOgV2yDvdBQbMftH1oY82S1bPOb4ZrA
         IL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691210567; x=1691815367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aM+/tf+PMpomwOT8LjsuZ+VMBXiQw4kgIeHW9CdG7Oc=;
        b=QRsQFYSg9QipIASGL0P+B23AiHpwoNLWrhflykm8ee8dozat4cZ23Muzhv6Ua/JtcE
         PxBKpPHohXKk83Yx4Jd5UlL2QMd5taYIkRnGdZC28OCxwp0j2rRWA9zJQK71rxNCUZx9
         Y3TxA4jTuJpg21hVdMvO6FiCB6sWwTTcuoWt1W73KkUhN5EPYBFkkcZDvaQ5nhaX8cpO
         s77KIbsx9fkCoWc3VKGSsBBna30gPpk1rbrT6SV6JsoL/KFROD3K605vWNK7iuih14Sz
         RZPVoXf4Cmwox/CjAyho/42cMGtURevdL6ySTzeinNm0IdWZ6YqT0ngIv4BJM01Q0ZW0
         o2jw==
X-Gm-Message-State: AOJu0YzFLIrK7bKFgeAE4c+DF2PSMvuzIIAqkpTtXCTtOFYd8s+43qfG
        vb8U04sdys3r6VzuWepeayq9Uc0lFxqhRf4NVm3SSN+5wXw=
X-Google-Smtp-Source: AGHT+IFdPyhx7F/oGGgykqNLbwwc58Pb6HFxbrVpEifuB3WA2XCJlBNAwsYYBnF5l92qvVqM482oL/CS36AnjSji3Ow=
X-Received: by 2002:a17:90a:8b02:b0:268:2f2:cc88 with SMTP id
 y2-20020a17090a8b0200b0026802f2cc88mr3297937pjn.12.1691210567193; Fri, 04 Aug
 2023 21:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230805034445.2508362-1-Mr.Bossman075@gmail.com> <25eadbd0-425f-403c-4359-eba79e73ab47@infradead.org>
In-Reply-To: <25eadbd0-425f-403c-4359-eba79e73ab47@infradead.org>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Sat, 5 Aug 2023 00:42:36 -0400
Message-ID: <CAJFTR8S_8huT10kPiqAVzHhMp+uPmv67S9n888-n4VA2Rx99ig@mail.gmail.com>
Subject: Re: [PATCH v1] docs: kbuild: Document search jump feature
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 5, 2023 at 12:08=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 8/4/23 20:44, Jesse Taube wrote:
> > Menuconfig has a feature where you can "press the key in the (#) prefix
> > to jump directly to that location. You will be returned to the current
> > search results after exiting this new menu."
> >
> > This feature is poorly documented,
> > so add it to the kconfig.rst documentation.
> >
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.
>
>
> More below...
>
> > ---
> >  Documentation/kbuild/kconfig.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kc=
onfig.rst
> > index 5967c79c3baa..463914a7fdec 100644
> > --- a/Documentation/kbuild/kconfig.rst
> > +++ b/Documentation/kbuild/kconfig.rst
> > @@ -210,6 +210,10 @@ Searching in menuconfig:
> >       first (and in alphabetical order), then come all other symbols,
> >       sorted in alphabetical order.
> >
> > +     In this menu, pressing the key in the (#) prefix will jump
> > +     directly to that location. You will be returned to the current
> > +     search results after exiting this new menu.
> > +
>
> In menuconfig, exiting returns to the correct location in the search outp=
ut,
> but in nconfig, exiting always returns to the top of the search output, n=
ot
> to where the (#) was displayed on the search output screen.

I honestly didn't notice this, in nconfig thank you for pointing it out.

> This is annoying.
> Is this something that you have possibly already fixed?

No, but I will look into it, hopefully, it's a trivial fix.
I will submit a patch soon to fix this.

Thanks,
Jesse Taube
>
> >  ----------------------------------------------------------------------
> >
> >  User interface options for 'menuconfig'
> > @@ -262,6 +266,10 @@ Searching in nconfig:
> >       F8 (SymSearch) searches the configuration symbols for the
> >       given string or regular expression (regex).
> >
> > +     In the SymSearch, pressing the key in the (#) prefix will
> > +     jump directly to that location. You will be returned to the
> > +     current search results after exiting this new menu.
> > +
> >  NCONFIG_MODE
> >  ------------
> >  This mode shows all sub-menus in one large tree.
>
> --
> ~Randy
