Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3119771863
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Aug 2023 04:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjHGCi0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Aug 2023 22:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjHGCiZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Aug 2023 22:38:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C51E6A
        for <linux-kbuild@vger.kernel.org>; Sun,  6 Aug 2023 19:38:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DA7161302
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 02:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AD7C433C9
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 02:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691375903;
        bh=qXM1eDBQja7Qyd7W7cUKYUC0UUVvRKhsi2LmrP3oRQo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AC3VqK6aZRkJm5yGL84bR9+cJzi5AJRQBeYBuD7m4g32gtc+Z59oL8xfiha88+Z0V
         1ivhs8EIv2ReJ+Cr+CFYYy9vPceaSRg2DObYmBbMzpQhnNt4V0RAumOXW0bi07YSRf
         5/pIt9wot9kglGyI8Z6NxqkxMQmz+IqmnqPSN5QpKzPpQ5r+40lQiyLO/WTBmblYmt
         7A8JgeKM2Gj5gY/0roNfl9wOm0P2wGlPGnkvY6fsddxrJV+eh3KhEkupDVHSOz/06J
         txcTY3vPHsRjAGH/zcIzleGtCFD/UickXHolTeKlwUOn9TrONDvE9Hdbfgkfk6YkVc
         IA0FqYTsiT1UA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-56c96982829so2858611eaf.0
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Aug 2023 19:38:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxTgys3vQ9VA2aZCiAsfO5tPWTkapUiSuD/WPSivqIpncKUcIrq
        HNLJ1nZGkGr0rciZ9kfDOY3WFdnHh0Qus1H+krA=
X-Google-Smtp-Source: AGHT+IEGBlJMkIwrht93lp66sYjlk2FKMUcmDQUGPc/AlP8VHGDPEMqyoHSzI5dDPR3KU2L9HX6+NyqdsCJNUC3qlt4=
X-Received: by 2002:a4a:3914:0:b0:55a:f44b:43cd with SMTP id
 m20-20020a4a3914000000b0055af44b43cdmr8035555ooa.7.1691375903002; Sun, 06 Aug
 2023 19:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230806032026.1718752-1-Mr.Bossman075@gmail.com>
 <9c86c832-9a2c-0500-292f-5449e21be7e3@infradead.org> <CAJFTR8QzSpopeooARoz8S2Dy7jr8p8gSQcgz_6ro2MM+D3Gjhg@mail.gmail.com>
In-Reply-To: <CAJFTR8QzSpopeooARoz8S2Dy7jr8p8gSQcgz_6ro2MM+D3Gjhg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 7 Aug 2023 11:37:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASj+_CGFnXHTnfrQv2h4QzwX8PCkRMDbteEd2mwVWitZw@mail.gmail.com>
Message-ID: <CAK7LNASj+_CGFnXHTnfrQv2h4QzwX8PCkRMDbteEd2mwVWitZw@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: nconf: Keep position after jump search
To:     Jesse T <mr.bossman075@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 7, 2023 at 7:17=E2=80=AFAM Jesse T <mr.bossman075@gmail.com> wr=
ote:
>
> On Sun, Aug 6, 2023 at 11:30=E2=80=AFAM Randy Dunlap <rdunlap@infradead.o=
rg> wrote:
> >
> > Hi Jesse,
> >
> > On 8/5/23 20:20, Jesse Taube wrote:
> > > In this Menuconfig, pressing the key in the (#) prefix will jump
> > > directly to that location. You will be returned to the current search
> > > results after exiting this new menu.
> > >
> > > In nconfig, exiting always returns to the top of the search output, n=
ot
> > > to where the (#) was displayed on the search output screen.
> > >
> > > This patch fixes that by saving the current position in the search.
> > >
> >
> > This patch fixes the reported problem. Thanks, Jesse.
> >
> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > Link: https://lore.kernel.org/r/20230805034445.2508362-1-Mr.Bossman07=
5@gmail.com/
> > > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> >
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> >
> > Now I have another issue. :(
> >
> > Here is my test case: x86_64 defconfig.
> >
> > SymSearch (F8) for MSR.
> > Page Down to #3. Select 3.
> > X86_MSR is about 7 lines below the highlighted line in the menu,
> > which is confusing and sometimes it's not obvious what the correct
> > line for the symbol is.
> >
> > In menuconfig, the highlighted line is precisely on X86_MSR.
>
> Oh jeez, how did I miss this?
> I will fix this asap as this seems to be a big issue as it can easily
> cause confusion.
> Weirdly all the test cases I used were fine, but I found a few more like =
this.


As it turns out, your initial nconf search is not mature enough.

I will drop it from my tree.





--=20
Best Regards
Masahiro Yamada
