Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF4BC7D335
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2019 04:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbfHACSX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Jul 2019 22:18:23 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:41137 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729603AbfHACSU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jul 2019 22:18:20 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x712I9jD007756;
        Thu, 1 Aug 2019 11:18:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x712I9jD007756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564625890;
        bh=bXXXUmyTcVtdjMx8G5OoQyejaocjSPDe16O/9zTAkoQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t4aFmpM+PFuTAVsZVLiF1SoU65IJA84Ahaw2ehugDuK2yZw8wiUN46sTurIfP4xYp
         MD2DlJKF2zCHAe+QmpIML4laLG/JHHd7qzt4FgusuXGAZJY5NH5wyuVIqGsfS/yyBZ
         +W2ftIl6Dcf6rZlfMdOkwBk4WX0y5nRV0rkTjlKZ26F39/DMZVPFRWQesP3VUw1E0t
         LShcc5Jkb+Gw5wvy3+zwjVMfV28RRTO1/1lCY0TIOeTiuaDHcYHuMMuQCk5iuRmq/C
         kuPkzCq39+xJCtTjG6F5Hr+P9OhMP6cgRot3RRIr3XNoWtoUXwVpYcDwkn5JR3tOPD
         zIs3hlPlAlyDw==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id m23so47794602vso.1;
        Wed, 31 Jul 2019 19:18:09 -0700 (PDT)
X-Gm-Message-State: APjAAAWr4fRdNKTFt1y3mGAdqEOQj47Ihl1TwetbMf3cYC79cm2pRpRx
        sAjV2k8lekwhE/U/O6lC1XSMq7qSm3Vq2/H7gR8=
X-Google-Smtp-Source: APXvYqyKYbsfX9QIAmkSUdwHw2bT7AgoOn++jSjSKiO+rYMkyJP7vGE+fDBiuC4AOMDk9t/lW5TUjnDTLiPNpUkCN1I=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr18937841vsq.179.1564625888758;
 Wed, 31 Jul 2019 19:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com> <20190731194419.GB4084@kunai>
In-Reply-To: <20190731194419.GB4084@kunai>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 1 Aug 2019 11:17:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6siWHU+N2c+6gqh7hHEJ_aDrVoiWnrTq1jiXQWSYYBA@mail.gmail.com>
Message-ID: <CAK7LNAQ6siWHU+N2c+6gqh7hHEJ_aDrVoiWnrTq1jiXQWSYYBA@mail.gmail.com>
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Thu, Aug 1, 2019 at 4:44 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi Javier,
>
> thank you for providing the extra information.
>
> (And Kieran, thanks for the patch!)
>
> > The other option is to remove i2c_of_match_device() and don't make OF match
> > to fallback to i2c_of_match_device_sysfs(). This is what happens in the ACPI
> > case, since i2c_device_match() just calls acpi_driver_match_device() directly
> > and doesn't have a wrapper function that fallbacks to sysfs matching.
> >
> > In this case an I2C device ID table would be required if the devices have to
> > be instantiated through sysfs. That way the I2C table would be used both for
> > auto-loading and also to match the device when it doesn't have an of_node.
>
> That would probably mean that only a minority of drivers will not add an I2C
> device ID table because it is easy to add an you get the sysfs feature?
>
> Then we are back again with the situation that most drivers will have
> multiple tables. With the minor change that the I2C device id table is
> not required anymore by the core, but it will be just very useful to
> have? Or?
>
> > If the former is the correct way to solve this then the patch looks good to me.
> >
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> For this actual patch from Kieran, I'd like to hear an opinion from the
> people maintaining modpost.


As you see 'git log scripts/mod/file2alias.c',
this file is touched by every subsystem.

So, the decision is up to you, Wolfram.
And, you can pick this to your tree if you like.


The implementation is really trivial.


As Javier pointed out, this discussion comes down to
"do we want to fall back to i2c_of_match_device_sysfs()?"

If a driver supports DT and devices are instantiated via DT,
in which situation is this useful?
Do legacy non-DT platforms need this?



> The aproach looks okay to me, yet I can't
> tell how "easy" we are with adding new types like 'i2c_of'.

As far as I understood, this patch provides a shorthand.
You can save one table, but still get the
same MODULE_ALIAS in the *.mod.c file.
You need to add two MODULE_DEVICE_TABLE() though.

MODULE_DEVICE_TABLE(of, si4713_of_match);
MODULE_DEVICE_TABLE(i2c_of, si4713_of_match);


-- 
Best Regards
Masahiro Yamada
