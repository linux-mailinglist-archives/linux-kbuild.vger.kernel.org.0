Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3436B67C3D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Jan 2023 05:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjAZEXI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Jan 2023 23:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjAZEXH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Jan 2023 23:23:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1991F48E
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jan 2023 20:23:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56A3FB81CC8
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Jan 2023 04:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD124C433A1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Jan 2023 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674706978;
        bh=wZ7PBz2jqDU4NDuGlZAPATfEy7lDMc9qS1F/oyAFONs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bcwaD85RmG0IF/8n9eiuYAxS1/mDWuiE7h92nOHq50+2X3uBTrYl2g1flqpKQ3bst
         AaVXetWxjY7Ih6cD7DWMGyg3PJ5dI6/7CRmtd2RF5mGCFS0SOVe2OWaQJfJrwjBqK/
         /wtAi/zz5L2swU4Tn/VwCik2aMS/Q5yMBdCGbHBj9/MTKtFTKNjkf9Iuh1LpI704gi
         XTOyG/5FPcXwzkWkOd54rV6DOwJOcs5ze6GoJGlOaeL+tn9pfbiKvdYMCrnj08Qf4v
         6DKALZRd68tzlM8/gJo2SRnlMoaLmCtONLcDbzqz/zhuUxL9xO45ZO7q/58/hFYBnJ
         gUiv73BJnCqTg==
Received: by mail-ot1-f43.google.com with SMTP id m18-20020a05683026d200b0068661404380so402254otu.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jan 2023 20:22:58 -0800 (PST)
X-Gm-Message-State: AFqh2kpd1purklhZeBNV26kY/wRM/LrKayVngEZ+VTnttGzTEMZXtSAl
        bBaWOdbhga1WvSEs/9De7j80R2vpMqmgkcXWGnQ=
X-Google-Smtp-Source: AMrXdXufR6pDOeFuIyPbmDS6WVQNM1DgbYqV35b5aVOlVeaHNoWPRyY/PmXldGSKTEdajVesmoVacTD3KgGFr1aoMXE=
X-Received: by 2002:a05:6830:2330:b0:670:5fd5:1ea3 with SMTP id
 q16-20020a056830233000b006705fd51ea3mr1950794otg.85.1674706978079; Wed, 25
 Jan 2023 20:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
 <871qnjqmmq.fsf@mpe.ellerman.id.au> <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
 <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
In-Reply-To: <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 26 Jan 2023 13:22:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
Message-ID: <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>, ndesaulniers@google.com,
        nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 26, 2023 at 11:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jan 26, 2023 at 10:29:54AM +0900, Masahiro Yamada wrote:
> > On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >
> > > Nathan Chancellor <nathan@kernel.org> writes:
> > > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > > points out that KBUILD_AFLAGS contains a linker flag, which will be
> > > > used:
> > >
> > > Should that say "unused" ?
> >
> >
> >
> > Nathan, shall I fix it up locally?
> > (it will change the commit hash, though.)
>
> Yes please, if you would not mind. Sorry about that and thank you for
> spotting it Michael!
>
> Since you have to rebase to fix it, you can include Michael's acks?
>
> Cheers,
> Nathan



Done.








-- 
Best Regards
Masahiro Yamada
