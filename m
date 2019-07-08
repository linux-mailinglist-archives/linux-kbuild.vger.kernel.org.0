Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F2762080
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2019 16:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbfGHOck (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jul 2019 10:32:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33110 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729936AbfGHOcj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 10:32:39 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so16155908ljg.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jul 2019 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAw/aU6LZwIL6FVu56mHN3vVX8j9GNHFwvAGIAISsSo=;
        b=yFqK2Fa5FNVeLOgjpxiFNic8jzO/GwJcdLUaJGStjJNMhZz60Qo9R01U6fDs8KmWG4
         GplEP1TLR3Pfsfch/6zDCoois6dE+JkDPJCZxL53pMK4aVXM+32qSKQovQelrf7BMije
         Wb34buu0hSbVOhACpS1mqqhzcrpPeHcfvY0UrPjnphdg+bYXKFoXA/5tEdcSyOk+4y8L
         LH7xym5vOdPlASdtQEntkguxyuXCVlObt47p67yK8XYa/3FY5Z0oORjMBRGzmTEebBVZ
         QI1RP6a6eCQoe1mahq5d2fxAQzp/5GciyTf9t845dUVI5n/dqxrMk62beqjm37oYGp1n
         lpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAw/aU6LZwIL6FVu56mHN3vVX8j9GNHFwvAGIAISsSo=;
        b=digktoOelIUovNCLCV/XwcAD1jOsNkbKn2HhVSMkK1Ej+JwznGuAKkVnjvCLGV+lrq
         1W/LFaujEFBseV4g9NPbHS3P25YBkOUc+ZjKzOLBeWuO1xFrJbixGEXokRWv/IRGeZrf
         ITgybhdsGyyZuCF5WcDSJTmrSescDeQWpSKYSYrfL3s0IUFBd6bOwv3/lgdiEPlY8RmC
         TL4EcRIJOrCH8Bc6LZJTYzhcCm3ivD1Qvtn6WVuwTVwA+OETilG6I3B1JLsQoOuJEAEh
         I/QLmA6UqIILVVx5NJf09CurOvwkG0uG1Nxf7gAI55Qf5C2GBKMtkQ872xChvYdocQKj
         TYTA==
X-Gm-Message-State: APjAAAVVaSYilnAycDIRhN0xXysFwgS1Dp5iEaQw0/TRCh2zO/kbYDyZ
        xLLpSeho/m681Ackq08mTrX0ptFmHl/5KVk0RS9NBdD4
X-Google-Smtp-Source: APXvYqzA7Vn8bG35rz7cR5NV9vyloKLEVm/Czse88spJybT0Aob5DfBfCdBt1z7MfJ3MzJlZPvwkGqI5V1izfq1OR94=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr7413475ljh.69.1562596357740;
 Mon, 08 Jul 2019 07:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190703205527.955320-1-arnd@arndb.de> <20190703205527.955320-2-arnd@arndb.de>
In-Reply-To: <20190703205527.955320-2-arnd@arndb.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 Jul 2019 16:32:26 +0200
Message-ID: <CACRpkdYnuSqiYBPMe_+u6dx_X1zSYKCnCtFznWtxkMf-BGBwjA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kasan: disable CONFIG_KASAN_STACK with clang on arm32
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kasan-dev@googlegroups.com,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Will Deacon <will@kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 3, 2019 at 10:56 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The CONFIG_KASAN_STACK symbol tells us whether we should be using the
> asan-stack=1 parameter. On clang-8, this causes explosive kernel stack
> frame growth, so it is currently disabled, hopefully to be turned back
> on when a future clang version is fixed. Examples include
>
> drivers/media/dvb-frontends/mb86a20s.c:1942:12: error: stack frame size of 4128 bytes in function
> drivers/net/wireless/atmel/atmel.c:1307:5: error: stack frame size of 4928 bytes in function 'atmel_open'
> drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1521:1: error: stack frame size of 5440 bytes in function
> drivers/media/i2c/mt9t112.c:670:12: error: stack frame size of 9344 bytes in function 'mt9t112_init_camera'
> drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:185:12: error: stack frame size of 10048 bytes
>
> For the 32-bit ARM build, the logic I introduced earlier does
> not work because $(CFLAGS_KASAN_SHADOW) is empty, and we don't add
> those flags.
>
> Moving the asan-stack= parameter down fixes this. No idea of any
> of the other parameters should also be moved though.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For some reason the RealView doesn't boot after this patch. Trying to figure
out why.

Yours,
Linus Walleij
