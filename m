Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D0491ADC
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 03:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfHSBqx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Aug 2019 21:46:53 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:33077 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfHSBqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Aug 2019 21:46:52 -0400
Received: by mail-vs1-f48.google.com with SMTP id i7so175802vsp.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Aug 2019 18:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L/MD6/wwuc0w1beAVHOO6Se4f5r6k9Eg6+GHPt1SGXQ=;
        b=qvshfJ5hvUoqxm/Y2YJTzV2hBIosPnsquLtf5P1xo1d4QZDMN3cPfxWZ4PnD0DcNRQ
         OwdyRhsCiKQfRwF0QK283o9qgMy/ZU4wlP1nhRU+optpTswT1YBF9St8fAdQVQvzPEZC
         Btx5W7Etb1qTG4LAPdZcPUTAqYSkyIcIwv+3rQoDYYiKrNMZvoEy9R4emTm+8EMn8hBn
         yIavim2TwAiTUTTTPzd0smCEBybdZAGkxyeOlBeyuEsWcbMszQuXiS+XG74PeIkO9xbt
         3jxGrYwu9EoMqMyU85oqWB6NjOKuaNaBpL0SyIUdMVjNVvTZJaAR+fXfpg3kNeeuSha3
         fSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L/MD6/wwuc0w1beAVHOO6Se4f5r6k9Eg6+GHPt1SGXQ=;
        b=pLbpWCRGnVKTBv+/yNbO5FzlyKiCH4Z8JFVZzYPiPKqPgU9W4LKMf3BB15HTEy5bYu
         9zt3BUeQwEYbx7STOnkp4C/FgrY6SA01o6Q+vGzgxEnNGiFN1Dg7Wy6ikzMgohPNGIQd
         wtjHRTQmiMOb7CMtlH+Afdol8Xe80Ggkug6QlbnnobZhJLFbyd5B7ScomeCUlvSMAFDE
         K3Yz5r+sj1KNX7s9wqNGvQSlrU0DCs9Bp68CfVCQc005bdjjG157cb7HCZowjS2AF5+W
         8HuYyjaVquYmi/yFh9v5TurmnZuR7E4KJXs0/T6efUSg4uuKLgnKSZu6J7oe/fcS4Ual
         rqIw==
X-Gm-Message-State: APjAAAWbM0BgRngQLro9dLTDCU/NjqkVehesbmNGJhH27BCb3WHz3+QN
        ZhMU6Y5Bad5mtcP1qaIToAvroco1XcG2XHqB5tU=
X-Google-Smtp-Source: APXvYqzvgbd7M8IdEOV4yj3Ef77vXox8L58lmmVuFg6O1Opb92oA/c1uDRHT3M9AauTs6AV1CQ9MJN0MSTUpX+4dsII=
X-Received: by 2002:a67:f450:: with SMTP id r16mr13092835vsn.119.1566179211767;
 Sun, 18 Aug 2019 18:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
 <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net> <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
 <e14fa0ff-e12c-85d1-7fc8-69e1d937b04f@metux.net>
In-Reply-To: <e14fa0ff-e12c-85d1-7fc8-69e1d937b04f@metux.net>
From:   Thomas Albers <thomas.gameiro@googlemail.com>
Date:   Sun, 18 Aug 2019 20:46:40 -0500
Message-ID: <CALYGOBWWKzDUyLthcroq=R4Vefqy3kp9HWG-cEweABBhf0zmMg@mail.gmail.com>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello!

> Maybe have a closer look what it passes in $PKG_CONFIG (probably a
> wrapper script) and what the actual call behind is.

Openwrt does use a wrapper script for pkg-config, and when it comes to
making any kernel target a certain environment variable is undefined.
Consequently, pkg-config fails, returning the empty string, and the
kconfig scripts fall back to default values, which do no apply here.

It's an Openwrt issue; see Openwrt bug # 2423:
https://bugs.openwrt.org/index.php?do=details&task_id=2423

Regards,
Thomas
