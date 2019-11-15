Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8763AFD2E4
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 03:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKOCZW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 21:25:22 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64942 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbfKOCZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 21:25:22 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xAF2PJqW002262
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2019 11:25:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xAF2PJqW002262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573784720;
        bh=fFwAUfdrtOev0b606H0lE61j1V9gRQLUiaw7PbyFQHw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jgkcvXs+KswRpqahIZTtn1AQMZOHeeXs80UFo9llCoGSr8VXMB8Y8WRT9jRA2aMYW
         n27qdW4J6tmowkBS9WTsLgNdqetg0eeDsh0CPXLdaaLELe1HW7KrypYf3SuENt9J9Z
         bSfDPXw2Up9fYVprXfe3uFZu3dQ/vKZnQval30NShkZA2DTmuV6i/g6zesAGoruBAi
         wJIn7gHGttc/tyfZOttZruqEKv5tf/L43NXGyi/o9BR0MoaJOPJbskrhCgIurfUnDL
         4DR7TRUauEXpowEBEfJJTm0TxttYOE6KfV8GiL17DKNITJG13OOGGo9s4Wpw4BJfZ6
         LQFe95gMQ5D+w==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id b16so5346791vso.10
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Nov 2019 18:25:19 -0800 (PST)
X-Gm-Message-State: APjAAAUXBP55xBJHTQbQG/yUQWCDP0PMU8UxWpUDJPIlynOOtbTv7j6B
        YRgzfbdwcBkkF9EY9+Uvq6zl2zEfBMbmSWs6Xxw=
X-Google-Smtp-Source: APXvYqx6lqiW3wIg8zJHTFNbgpIgjS0hzf+o9qLYM+sDxmhgL89eVA1HMMju/TNNq8j7QY1wcoLCIOy9Ehj8qTR3OSo=
X-Received: by 2002:a05:6102:726:: with SMTP id u6mr6634450vsg.179.1573784718559;
 Thu, 14 Nov 2019 18:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20191114060236.GA13066@oxygen>
In-Reply-To: <20191114060236.GA13066@oxygen>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 15 Nov 2019 11:24:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDczMHTx_T2bY4ujQ0NmbxVV2fdzHWckV-uSwk8ue9gg@mail.gmail.com>
Message-ID: <CAK7LNAQDczMHTx_T2bY4ujQ0NmbxVV2fdzHWckV-uSwk8ue9gg@mail.gmail.com>
Subject: Re: KBUILD_IMAGE-reg
To:     Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 14, 2019 at 3:02 PM Vijai Kumar K
<vijaikumar.kanagarajan@gmail.com> wrote:
>
> Hi All,
>
> I see that we have moved from directly using KBUILD_IMAGE to "make image_name"
> to decide the image to be included in the final deb package. Long ago when
> I remember we could override KBUILD_IMAGE in the environment to include
> the image of our choice in the deb pkg.

I checked the old code, but I think it is unrelated to
the image_name conversion.

As far as I saw the code, it is not possible to
override it from the environment variable,
but possible from the command line.

>
> Is this possible now by any other means? Because there are times when I
> would like to include vmlinux instead of vmlinuz and just wondering how
> one could go about accomplishing that.


make bindeb-pkg KBUILD_IMAGE=vmlinux

might work?



-- 
Best Regards
Masahiro Yamada
