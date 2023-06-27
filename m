Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE74973EFC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jun 2023 02:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjF0Aif (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Jun 2023 20:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjF0Aie (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Jun 2023 20:38:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E869AB
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jun 2023 17:38:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EEBB060F91
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jun 2023 00:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59705C433C0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jun 2023 00:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687826312;
        bh=hv+iy/rFYtmPPgKHwYphFObAulICrgnmJHiSEK3yWT8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SXyXZGF1jK1GL0HhSr/TTMc43soQCoaTOhcPJy1qeWlt3S6JQT8irn4U8UeS2kLGA
         z1E4mlcgNSjzCRcBDh3t5bjOgejzk0mwF5IWmq8s1KvxQg2DrAwUqrB7mjmsf0/GQL
         1l7nBUuZWT6+3BJ+1t/FI0we8/Mhhxs2QNsCmpAMOwiogOAlrLG1k1/yR7iDC+YY/o
         7WEWkZJ88gJIBmYUK+g8p+7lR37Og6T4ty2ohwk+mi6bCxMVAKBiCyp53+kyDurpbb
         xoaFzq2AIwJmsKptktGFXjnfC3GX73xs4cdKMJVgJVw/tn5YSDb/1Zjnjxz+eCL/63
         13Y9soBMLHGZg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5633b7e5f90so1371482eaf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jun 2023 17:38:32 -0700 (PDT)
X-Gm-Message-State: AC+VfDzAIPJ+8X+MvCmfv6lCegq7wpPdygD0Z0qLBI9QilVEn7O03BFH
        qMgogYpPFQ+WeXurLIU359WnLzy4Bt8ZjqzdYb4=
X-Google-Smtp-Source: ACHHUZ4S2s4P36HVKlRb0sDIgHxOo8J30iQmg76KSJ/+d4X+NjPqWrFNKLzeR4IqQoQkrWicRkexMqZbyUJM9f/5yA4=
X-Received: by 2002:a4a:c607:0:b0:558:b793:f10c with SMTP id
 l7-20020a4ac607000000b00558b793f10cmr18813938ooq.3.1687826311712; Mon, 26 Jun
 2023 17:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230618001646.1228521-1-Mr.Bossman075@gmail.com>
 <CAK7LNAT=jKNFcQmrrZsF5Lis_fmex+1KZe0U-VpsxeekH7aZYw@mail.gmail.com> <CAJFTR8QexS3wyWTv+9_9=Z3OMnwyJtysBucwqLizDsczLW8Vjg@mail.gmail.com>
In-Reply-To: <CAJFTR8QexS3wyWTv+9_9=Z3OMnwyJtysBucwqLizDsczLW8Vjg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 27 Jun 2023 09:37:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARG+m8RPJWKyOXHB=deF+yRN-2soXWO-ohBEc3nLDYF5A@mail.gmail.com>
Message-ID: <CAK7LNARG+m8RPJWKyOXHB=deF+yRN-2soXWO-ohBEc3nLDYF5A@mail.gmail.com>
Subject: Re: [PATCH v1] scripts: kconfig: nconf: Add search jump feature
To:     Jesse T <mr.bossman075@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 25, 2023 at 5:36=E2=80=AFAM Jesse T <mr.bossman075@gmail.com> w=
rote:
>
> On Sat, Jun 24, 2023 at 4:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Sun, Jun 18, 2023 at 9:16=E2=80=AFAM Jesse Taube <mr.bossman075@gmai=
l.com> wrote:
> > >
> > > Menuconfig has a feature where you can "press the key in the (#) pref=
ix
> > > to jump directly to that location. You will be returned to the curren=
t
> > > search results after exiting this new menu."
> > >
> > > This commit adds this feature to nconfig, with almost identical code.
> > >
> > > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> >
> >
> > Setting the code duplication aside,
>
>
> If it does function as expected will you accept the patch?


Probably.

The menuconfig code you copied is really ugly.
Actually, I was refactoring the search jump code a few
months ago, but I did not get around to completing it.








> Should I mark the copied codes'  original location?
>
> > does this patch work correctly?
> >
> >
> >
> >
> > $ make defconfig
> > $ make nconfig
> >
> > Press F8
> >
> > Input "MODULES" in the search box.
> >
> > You will see:
> >
> > (1) -> Enable loadable module support
> >
> > Press the "1" key.
> >
> >
> > It will navigate to "General setup"
> > instead of "Enable loadable module support".
>
>
> Hmm, this is a confusing issue.
> It will take you to the parent menu of the option, it should move you
> to the parent option and
> move the cursor to the option location. I will see if I can resolve
> this oversight.
>
> Thanks,
> Jesse Taube
>
> >
> >
> >
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--=20
Best Regards
Masahiro Yamada
