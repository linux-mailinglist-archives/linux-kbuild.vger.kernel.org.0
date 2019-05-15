Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12BFE1E9D8
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 10:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbfEOIIa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 04:08:30 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37806 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOIIa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 04:08:30 -0400
Received: by mail-qk1-f195.google.com with SMTP id d10so943904qko.4;
        Wed, 15 May 2019 01:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bhA0LuqCZqJEF4lMtM5YHyohAQSEwU+dsHyXICITMo=;
        b=V/SI276YrBv2WQkqCULdWbG0BicaTvfBdJ9UatW3ikaBDCmFA7wjEAxwWB+4A90ldV
         b9bjbl3fEqKhZM63YMmzf9vGoHXmTRYKQ+hD5EordOtaqb9uUdDOuRYIbXeriTX2NO/5
         9ldkyBDz9TAZroKvu4RJr42nRWHPAHs+km8k6exZXzI45eCUwGC9NSXJci5UUg0q0OPm
         ADMmBpLyZ5Qj9b5IT5CeVJJxmeIbivY1+XvsGpkBcNGlNu1Vw2HBIl92QRHDG3tLhHw6
         I3rvLNkBLELNITJVcX4+OOXjor8IT75GIpB4oDJqZtc4MIHJBusFU8FJY1ViYGnIWfVA
         Rcsw==
X-Gm-Message-State: APjAAAVpEdmQHE2Au4aPVmZ86g9dRSonlmFiCWNaeB76zCgS1Nz48/Ec
        JAs4PVc8nbw+5M9NTp8RyN0qGKNZiEdIFCqCERI=
X-Google-Smtp-Source: APXvYqzfIi2FhNg1egOmEg3VQsWKGHCmPVFnWQVdUzhkPmjpjhHSeOHYpd46nlWOcVoGo9Hggvyr5BSZr4K26uOQoy4=
X-Received: by 2002:a37:c441:: with SMTP id h1mr5286138qkm.291.1557907709049;
 Wed, 15 May 2019 01:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190515073818.22486-1-yamada.masahiro@socionext.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 15 May 2019 10:08:12 +0200
Message-ID: <CAK8P3a1y7hxME0me_Zu-F8a8jU6n=T+c32mv83utOtsL-+gc0A@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
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

On Wed, May 15, 2019 at 9:39 AM Masahiro Yamada
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
> Kbuild has not checked this before, and it occasionally shows up with
> obscure error message when this kind of race occurs.
>
> It is not trivial to catch this potential issue by eyes.
>
> Hence, this script.
>
> I compile-tested allmodconfig for the latest kernel as of writing,
> it detected the following:
>
> warning: same basename '88pm800.ko' if the following are built as modules:
>   drivers/regulator/88pm800.ko
>   drivers/mfd/88pm800.ko
> warning: same basename 'adv7511.ko' if the following are built as modules:
>   drivers/gpu/drm/bridge/adv7511/adv7511.ko
>   drivers/media/i2c/adv7511.ko
> warning: same basename 'asix.ko' if the following are built as modules:
>   drivers/net/phy/asix.ko
>   drivers/net/usb/asix.ko
> warning: same basename 'coda.ko' if the following are built as modules:
>   fs/coda/coda.ko
>   drivers/media/platform/coda/coda.ko
> warning: same basename 'realtek.ko' if the following are built as modules:
>   drivers/net/phy/realtek.ko
>   drivers/net/dsa/realtek.ko
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

That looks great!

> ---
>
>  [Alternative fix ? ]
>
> I do not know about the user experience of modprobe etc.
> when two different modules have the same name.
> It does not matter if this is correctly handled by modules.order?
>
> If this is just a problem of the build system, it is pretty easy to fix.
> For example, if we prepend the directory path, parallel build will
> never write to the same file simultanously.
>
>   asix.mod -> drivers/net/phy/asix.mod
>   asix.mod -> drivers/net/usb/asix.mod

non-unique module names cause all kinds of problems, and
modprobe can certainly not handle them correctly, and there
are issues with symbols exported from a module when another
one has the same name.

     Arnd
