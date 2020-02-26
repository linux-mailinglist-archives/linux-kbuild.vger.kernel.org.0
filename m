Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065A717067A
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 18:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgBZRsF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 12:48:05 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:59514 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgBZRsF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:48:05 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01QHlrqU018829;
        Thu, 27 Feb 2020 02:47:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01QHlrqU018829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582739274;
        bh=SDaslj3im9eGGF3GWkYw29Ie5s/mrO4oXtYg61NAUmg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TSAmf5YiR59vvSP5hW7HsQsk+UuON9lPxv8ggMkzklgJ60ttDBLTs80cPREFkVoCo
         aC1SepTe/mFTxqWwQLcwBJmWJq0OZBh0S4OfNZDiHAiQy9nJLm/LN8+IggTn0ZYTZn
         fKeUAF/4aYs2AQyohWL1Nb/AwLTqqnz5oub1NMBC1omVGHBSFRc424t6vRqtfgdlKt
         nEIsb0Ono4KNO6VBNmXA2k/CihTCFh6915uvoiak1KmfzgsYZFV4wkcVNfGjHIGrqe
         sdumET83GL/sPurNTyUFRx+59OsexvWo8vnYUqRw9c3disajhKarkba2tEMjv2GgHq
         bjGD44GtVm7LA==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id i4so1044069vkc.3;
        Wed, 26 Feb 2020 09:47:54 -0800 (PST)
X-Gm-Message-State: APjAAAVx71To1e0Pf6srG/mo5oE/3umRyVGvwn72FaEC1JpabV1lPHAK
        RnRJzC7Dm8rP7qnSlBiwB1fZVoDWB2rUrgUylFE=
X-Google-Smtp-Source: APXvYqzpehfk2yzFqtjIzlN57l6KrpJIDEr5QVAEBgcdOrwuouWmBqXYwTpOOjVHS2Vp3P09dydm2ACynKUaaC2vXyk=
X-Received: by 2002:a1f:6344:: with SMTP id x65mr231703vkb.26.1582739273088;
 Wed, 26 Feb 2020 09:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200224225253.GA27948@bogus>
 <CAK7LNAS+iOAonhxN2BK4D8TSb8F-BqPxDGFU0AOv9fZ2So4iqA@mail.gmail.com>
In-Reply-To: <CAK7LNAS+iOAonhxN2BK4D8TSb8F-BqPxDGFU0AOv9fZ2So4iqA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 27 Feb 2020 02:47:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS-Ozq8kwa4HixNQ=r8d3ToehFnsbh0F0TgAcnemXantA@mail.gmail.com>
Message-ID: <CAK7LNAS-Ozq8kwa4HixNQ=r8d3ToehFnsbh0F0TgAcnemXantA@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: fix DT binding schema rule to detect command
 line changes
To:     Rob Herring <robh@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 25, 2020 at 1:32 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
> On Tue, Feb 25, 2020 at 7:52 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Feb 23, 2020 at 04:04:31AM +0900, Masahiro Yamada wrote:
> > > This if_change_rule is not working; it cannot detect any command line
> > > changes.
> > >
> > > The reason is because cmd-check in scripts/Kbuild.include compares
> > > $(cmd_$@) and $(cmd_$1), but cmd_dtc_dt_yaml does not exist here.
> > >
> > > For if_change_rule to work properly, the stem part of cmd_* and rule_*
> > > must match. Because this cmd_and_fixdep invokes cmd_dtc, this rule must
> > > be named rule_dtc.
> > >
> > > Fixes: 4f0e3a57d6eb ("kbuild: Add support for DT binding schema checks")
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/Makefile.lib | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > For the series,
> >
> > Acked-by: Rob Herring <robh@kernel.org>
> >
> > I'm assuming you will take these? If not, I can in the DT tree.
>
> Yes, I will queue these to kbuild tree.
>
>


Applied with Rob's Ack.




-- 
Best Regards
Masahiro Yamada
