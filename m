Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922FB359C22
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 12:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhDIKbd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 06:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhDIKbc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 06:31:32 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AC0C061760;
        Fri,  9 Apr 2021 03:31:18 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id t14so4312753ilu.3;
        Fri, 09 Apr 2021 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=gHv/U8gMzmWYmxPZpDQ1KtCKvLhvSOEVZdAJZtNMABQ=;
        b=fPeGj6b7nLmrr4LUOwxg88E5nKlnRg7tiyI5gOnwi2Cmd3k9qK1O05HNpkhhH6sjfH
         DUrKZXhiWyfar4DoINfTI0/KOSSU+JbXFh0OZ13C1dCBOZ5DoHACA2luK9b3WBq1asTq
         mTX1hZ45xyGCFr0yz3kWz3wTYrrT8wfuJT+wqR1orUYYGpCiP4+AW7uDI1CUPNKOpR2k
         7xxfs7jiz1PPNUO4y41x++ckLVz1cNSunnt3KWgE2r9P6FwTcZ07mTEeAxwcV1u9Ra8H
         BEG7ia9/4DipN3VLP6gawzgMzeS9xzUPDAHzlAXfolmw0gwZrPSaa85N++AKlDwCenQK
         gQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=gHv/U8gMzmWYmxPZpDQ1KtCKvLhvSOEVZdAJZtNMABQ=;
        b=fwH2sOpUxUOhcsmBx1UZA2TyGPzIOwVY5K2xyagI/7puwYu2ZclosmkqZU71xjtvjt
         QvFfDlDeDgTyb3a3UzHbaOMKoPn3uCqE+G453oUf6PzvlA8WmOatXA8vSShLVdPVXxE7
         m3XNyK/Jq3dNXJkbZX7M9Dzy3yGB2kD/9Z1j2MUCKXXEZToolLI+CXZHIWBDEk9pGZGb
         htpVvwjeNCMjYBaTpVnXO7Sa5vjfNbwY1SONv2yLS+/qCJe+1eH+KU7UlnX1htkw6tWQ
         uJ6NYQLD+Sp9xRGMkw3xE+8vpQn8ZKMLT4WY8xyPcrXORINqN6TGZyYmgY/4GvuFvsdU
         HASw==
X-Gm-Message-State: AOAM531qqAtLSIY0ni6qKZojiViuJZ+2UUfF0i7INL+j91lZyjWuKA9V
        5tyOihc9xiGXPVOOWZrJI1qMAtp4aTbD3Cj89tFMIeKn1c3G7g==
X-Google-Smtp-Source: ABdhPJz9qabirxbOvIvHiWUXG9wSJk26KAP2/XVHVEO2CKJtLPL2dEscGDaDJw+RIgNm9Y+EN8m+xcbZ/KA0QZ4UVVY=
X-Received: by 2002:a05:6e02:dea:: with SMTP id m10mr3746322ilj.112.1617964277961;
 Fri, 09 Apr 2021 03:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210407160927.222092-1-lucjan.lucjanov@gmail.com> <20210408210448.1850553-1-lucjan.lucjanov@gmail.com>
In-Reply-To: <20210408210448.1850553-1-lucjan.lucjanov@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 9 Apr 2021 12:30:56 +0200
Message-ID: <CA+icZUVnrNJ2=LYF_mre6npUvGHP8xAxdAAipLN_sQEvsK0wmg@mail.gmail.com>
Subject: Re: Subject: Re: [PATCH v3] kbuild: add support for zstd compressed modules
To:     Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, oleksandr@natalenko.name
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 8, 2021 at 11:05 PM Piotr Gorski <lucjan.lucjanov@gmail.com> wr=
ote:
>
> No, the --rm option is essential. xz and gzip have the --rm option built =
in as opposed to zstd, which is why I used it. I've been using zstd module =
compression since last december (although I set a different compression lev=
el on mine) and everything works fine. Oleksandr also tested it at his plac=
e and didn't report any objections.

[ CC me I am not subscribed to linux-kbuild or linux-kernel ]
[ CC Nick ]

Unfortunately, I do not find my initial posting which has all information.
I add the link to the thread on linux-kbuild ML.

So, I gave you as much information as I have (linux-config, make-line
etc.) and you write "everything works fine"?
What do you mean by "everything" - different compressors and none?
Is that working "fine"?

What build environment do you use?
Here: Debian/testing AMD64.

Did you try with...

CONFIG_DEBUG_INFO=3Dy
CONFIG_DEBUG_INFO_DWARF5=3Dy
CONFIG_MODULE_COMPRESS_ZSTD=3Dy

...Kconfigs enabled?

As said I use builddeb from scripts directory to generate my Debian package=
s.
Any chance you can test with builddeb?

I have enabled Clang-LTO Kconfig.
Tried with Clang-LTO Kconfig?

This worked *before* and *after*...

kbuild: add support for zstd compressed modules
kbuild: remove CONFIG_MODULE_COMPRESS (CC Nick as he is listed as a
reviewer here)

... not within my build-environment.
For me this is a *regression*.

- Sedat -

[1] https://marc.info/?t=3D161790914600002&r=3D1&w=3D2
