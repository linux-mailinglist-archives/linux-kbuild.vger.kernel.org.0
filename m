Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBCF7429E7
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jun 2023 17:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjF2PvE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Jun 2023 11:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjF2PvD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jun 2023 11:51:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A9130D1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jun 2023 08:51:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33A796150E
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jun 2023 15:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968CAC433C8
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jun 2023 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688053861;
        bh=Jtgw3odh+GLq+lUTPEqZS0iPo1sMbAGB2ih16Wmske4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MJQyqQ/oZDquI08zzso7L4/ROTAq94jmB2YNQlsdDQfDfN+9W6h/EIDRoooDvnFsd
         vZhPSCcm3Qh491zlpc7RuFkIb9GFmMErODkRdv11Q/vJPxcJNqfM1k0b2noJS45ZP4
         MNppBtQooqkfD/eOGs66zIIamD8ZuPfo2Bl0JOLadCCo4UdOQ+81e5H1gCephIRzqI
         roVrcS3wBeL5bRKa2KhL3D/yT9zM4v6PkJ0tRrlCgOcE8O33NstSItd+AFsIn/0wr0
         VRf2ST/wvIx3cugA8A4FT/pusFFGkqZ3bwUmRj3BUI9KPdamt/dQ0xLXwa+ok0H/sd
         GdAqwaKVbL8cg==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1b0156a1c4bso591841fac.1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jun 2023 08:51:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDywKdmr+U+Af2zjmUKJVQvvgAWe8ByVCDa+rPWqI/AlOpptSfn1
        xTgtHR0B0FH8fw4ZFZTQByZlq9th/5e+BL3C3cI=
X-Google-Smtp-Source: APBJJlE2X8KYP9eByL1Vjfcsd91PxRRoduq+LkQjHMdFZYyj6vXAwB6Jv24GYfr5zPcUFLv/wASIxq+p7zaOxRRg8+Y=
X-Received: by 2002:a05:6870:c8a8:b0:1ad:4a74:9d63 with SMTP id
 er40-20020a056870c8a800b001ad4a749d63mr216064oab.53.1688053860900; Thu, 29
 Jun 2023 08:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230618001646.1228521-1-Mr.Bossman075@gmail.com>
 <CAK7LNAT=jKNFcQmrrZsF5Lis_fmex+1KZe0U-VpsxeekH7aZYw@mail.gmail.com>
 <CAJFTR8QexS3wyWTv+9_9=Z3OMnwyJtysBucwqLizDsczLW8Vjg@mail.gmail.com>
 <CAK7LNARG+m8RPJWKyOXHB=deF+yRN-2soXWO-ohBEc3nLDYF5A@mail.gmail.com> <CAJFTR8STYYmcqJNr2sLCfsWAHBkzLuDUnLLr5Ke-JfbUoKefBA@mail.gmail.com>
In-Reply-To: <CAJFTR8STYYmcqJNr2sLCfsWAHBkzLuDUnLLr5Ke-JfbUoKefBA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 30 Jun 2023 00:50:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR2jO8cdHLVx1+qW9N+PQuiofu8Kf0Z1AN2caDUSOSJcQ@mail.gmail.com>
Message-ID: <CAK7LNAR2jO8cdHLVx1+qW9N+PQuiofu8Kf0Z1AN2caDUSOSJcQ@mail.gmail.com>
Subject: Re: [PATCH v1] scripts: kconfig: nconf: Add search jump feature
To:     Jesse T <mr.bossman075@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 27, 2023 at 12:08=E2=80=AFPM Jesse T <mr.bossman075@gmail.com> =
wrote:
>
> On Mon, Jun 26, 2023 at 8:38=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Sun, Jun 25, 2023 at 5:36=E2=80=AFAM Jesse T <mr.bossman075@gmail.co=
m> wrote:
> > >
> > > On Sat, Jun 24, 2023 at 4:11=E2=80=AFAM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > >
> > > > On Sun, Jun 18, 2023 at 9:16=E2=80=AFAM Jesse Taube <mr.bossman075@=
gmail.com> wrote:
> > > > >
> > > > > Menuconfig has a feature where you can "press the key in the (#) =
prefix
> > > > > to jump directly to that location. You will be returned to the cu=
rrent
> > > > > search results after exiting this new menu."
> > > > >
> > > > > This commit adds this feature to nconfig, with almost identical c=
ode.
> > > > >
> > > > > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > > >
> > > >
> > > > Setting the code duplication aside,
> > >
> > >
> > > If it does function as expected will you accept the patch?
> >
> >
> > Probably.
> >
> > The menuconfig code you copied is really ugly.
>
> Yes, I saw and was surprised it was allowed, grandfathered in I guess.


Yes, you are grandfathered in.

Code refactoring is one of maintainer's jobs.




>
> > Actually, I was refactoring the search jump code a few
> > months ago, but I did not get around to completing it.
>
> This isn't on git.kernel.org, would you mind sharing it?
> If you have any ideas on the best way to implement this,
> I would love suggestions.


Digging into my local repository, it looks like
I had written up functional code already.

I just filled in the commit description.

I will post it.






> Thanks,
> Jesse T
>
> >
> >
> >
> >
> >
> >
> >
> >
> > > Should I mark the copied codes'  original location?
> > >
> > > > does this patch work correctly?
> > > >
> > > >
> > > >
> > > >
> > > > $ make defconfig
> > > > $ make nconfig
> > > >
> > > > Press F8
> > > >
> > > > Input "MODULES" in the search box.
> > > >
> > > > You will see:
> > > >
> > > > (1) -> Enable loadable module support
> > > >
> > > > Press the "1" key.
> > > >
> > > >
> > > > It will navigate to "General setup"
> > > > instead of "Enable loadable module support".
> > >
> > >
> > > Hmm, this is a confusing issue.
> > > It will take you to the parent menu of the option, it should move you
> > > to the parent option and
> > > move the cursor to the option location. I will see if I can resolve
> > > this oversight.
> > >
> > > Thanks,
> > > Jesse Taube
> > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > --
> > > > Best Regards
> > > > Masahiro Yamada
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--=20
Best Regards
Masahiro Yamada
