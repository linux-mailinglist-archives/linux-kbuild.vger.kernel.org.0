Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3702310755
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 10:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhBEJJI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 04:09:08 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:45248 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBEJEA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 04:04:00 -0500
Received: by mail-ot1-f44.google.com with SMTP id o12so6169626ote.12;
        Fri, 05 Feb 2021 01:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7Sh3OKLYK8/nf4Ykbw6S9nNzg4ZLGDikm1EE1e+r9w=;
        b=BAJliugn1VP7rzDxtX5QFmZOoCdMLCRpQHTD1ZQHv9dDdr6hOpp4Lup7OmQAInlv85
         4ZzXLhCSB7xX228VLxZhwOkqsdX17VImR5c875iACbtxeVUQiWRYk6yhmVQXyilmxI/H
         zxSgoUkDZBYfmVnnhyinH3Ej7eilgxWbMG4pYH+uN3Zc7yYy0tafkCBhyudG83rTLgRm
         87mvseeFQ9F0fBQaKZCKZoTpqjYBlcTPt2fhhfKsRpSDftIzpr52dKEenles6Yt7hxQr
         X+WFLasyn4BizDMJ8KLKXV8HtSu2Q2EyapMd6yaUR4UeHPLXbGhO6d3nocxNrk95fI+F
         MOSA==
X-Gm-Message-State: AOAM531qirj9Jy27no4bdO9q5FUWwRDucVnK9eLHh7YK8KrFN7KYhQ/R
        5r8XN2M5hnadRTwtJxBb1vE2i3EYlLQw/rtXnjbFAwss2xQ=
X-Google-Smtp-Source: ABdhPJwj49VQVnIUkrsrhrUkZIoxqLtC0zpgNHTh266wX+Jh32XKOa1YFkFARheJBx+QtP0uUm1taeVX6kVZxfNJOKo=
X-Received: by 2002:a9d:3604:: with SMTP id w4mr2673501otb.107.1612515758371;
 Fri, 05 Feb 2021 01:02:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611904394.git.viresh.kumar@linaro.org> <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
In-Reply-To: <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Feb 2021 10:02:27 +0100
Message-ID: <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

Thanks for your patch
(which I only noticed because it appeared in dt-rh/for-next ;-)

On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> Add support for building DT overlays (%.dtbo). The overlay's source file
> will have the usual extension, i.e. .dts, though the blob will have

Why use .dts and not .dtso for overlays?
Because you originally (until v5) had a single rule for building .dtb
and .dtbo files?

> .dtbo extension to distinguish it from normal blobs.
>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
