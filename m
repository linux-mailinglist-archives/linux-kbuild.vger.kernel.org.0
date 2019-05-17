Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22C6621338
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 06:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfEQEqA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 00:46:00 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:50867 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfEQEqA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 00:46:00 -0400
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4H4jm0a023816;
        Fri, 17 May 2019 13:45:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4H4jm0a023816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558068349;
        bh=Qn7DNZWaczGYT+EoYw97KLq0hjtJgpMogyakqDUKKJs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ki17k6GL10zubUsSj926QbZ9JOfvYTdpt+etQ7NBS/vNEPfo06UO+eo5gAewC26TH
         g1r70SYtalPE0L+pxBElnnONwmxELC0XrRtDuoYj3HCWPfAITs6D5ANINHbYqt7Xim
         fdQ6HE4BGQANutbOlouVskeYSAZkWAOAf0Dlt54zZrak057UXDmZ8cH2SIPHE59bKG
         9oHl57qfCgXkas5MoUZblJCMcDydzkDabls6oVQaXbYEdRluD3g0Mt7fthL/4W5O2j
         3a1DDcq67DH20HwwPY3qdsoheh2nUHspOYU6QV+ll9m2C+j6jg+LJsFj0sCFRIH3qy
         vD+gW261xGHhg==
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id o187so1672040vkg.4;
        Thu, 16 May 2019 21:45:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWmqRw79/0iQ4JY1Gji+ATYN4R1/9nhJwRtEsPnHsNokkUyttI1
        dt3H6/c9Y9783I5A1gGO4o93CEKc7XBTH1tHfHo=
X-Google-Smtp-Source: APXvYqzGuYVwx+PmAR3w6mksl8n4Iqn1f0pKRu/8urTOc6d+8VibAY+jntCkqEuxXukHLeAP+ngWhVfhAaWwupRqU0Q=
X-Received: by 2002:a1f:30d4:: with SMTP id w203mr1444390vkw.0.1558068347755;
 Thu, 16 May 2019 21:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190517042753.25857-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 17 May 2019 13:45:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNARvQUPPBzdq7ac67h-xhB6tHZ4WPzBHZy+c3iHE_bi_Fg@mail.gmail.com>
Message-ID: <CAK7LNARvQUPPBzdq7ac67h-xhB6tHZ4WPzBHZy+c3iHE_bi_Fg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 1:29 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> In the recent build test of linux-next, Stephen saw a build error
> caused by a broken .tmp_versions/*.mod file:
>
>   https://lkml.org/lkml/2019/5/13/991
>
> drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> basename, and there is a race in generating .tmp_versions/asix.mod
>
> Kbuild has not checked this before, and it suddenly shows up with
> obscure error message when this kind of race occurs.
>
> Non-unique module names cause various sort of problems, but it is
> not trivial to catch them by eyes.
>
> Hence, this script.
>
> It checks not only real modules, but also built-in modules (i.e.
> controlled by tristate CONFIG option, but currently compiled with =y).
> Non-unique names for built-in modules also cause problems because
> /sys/modules/ would fall over.
>
> I tested allmodconfig on the latest kernel, and it detected the
> following:
>
> warning: same basename if the following are built as modules:
>   drivers/regulator/88pm800.ko
>   drivers/mfd/88pm800.ko
> warning: same basename if the following are built as modules:
>   drivers/gpu/drm/bridge/adv7511/adv7511.ko
>   drivers/media/i2c/adv7511.ko
> warning: same basename if the following are built as modules:
>   drivers/net/phy/asix.ko
>   drivers/net/usb/asix.ko
> warning: same basename if the following are built as modules:
>   fs/coda/coda.ko
>   drivers/media/platform/coda/coda.ko
> warning: same basename if the following are built as modules:
>   drivers/net/phy/realtek.ko
>   drivers/net/dsa/realtek.ko
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> ---


One more question popped up.

External modules are out of scope of the community,
but it is possible that people create an external module
that happens to have the same name as an upstream driver.

drivers/this/is/upstream/subsystem/foo.ko
/home/fred/my/own/external/module/foo.ko

Is modprobe confused in this case too?

Perhaps, checking for the M= build
might be good too...



-- 
Best Regards
Masahiro Yamada
