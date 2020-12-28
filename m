Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB492E34EB
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Dec 2020 09:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgL1IF3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Dec 2020 03:05:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgL1IF3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Dec 2020 03:05:29 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8065C061794;
        Mon, 28 Dec 2020 00:04:48 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id o6so8677076iob.10;
        Mon, 28 Dec 2020 00:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=9zWhIOBC+uKtAPWtbV8t8nUwu5LnFjTCjvkYB55rVP8=;
        b=rgb6Sb8y7lOg3f3Q1735T0BW4xloDAUpOplQmLmEre+w7SmveLwemqiXqVTbeA+HG4
         jBgPknIL2APgo8/fIAPc3ic1CGwE5CNr4GBQk0VGUlcxSmN5iJPZdQ4xl1LzETRBVN2v
         2ANK7LHUMeiYbOP+XYhHpfZ8sNT41Jife7GqhJFB1D2Q/9RNhJuge8kSU88GML7w90Dq
         B7xZXrvqzo0XR23/pw4gdLDfbYzewggI92OT3Payuhb9qPyUfN5eRCJbzI0dlOHJ52W4
         kIVFFZMbK/5nNN2L5bBzWxMMDUMZf/0/QiHAc57QbvEuXlMLB0meaplMpvErMi5wehy2
         RWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=9zWhIOBC+uKtAPWtbV8t8nUwu5LnFjTCjvkYB55rVP8=;
        b=W54i5a/ujVsrixyV5jbxy3QkgIwRcIl06MeohuuVsmYEjvlUaml42fcIn5TP80Ka9g
         mvZeJlQvZTHQnA2dcegPK+kTW2hsKEs2gX4cO9DpbW6S/zHX2W9CweFNqu8PjrjD99kn
         vWfKedssGGc8TDAedezCe8Wugz/yZ57qoes8VNj31IrzO39LVed8rWuz9R5jc2d0CloQ
         uihmjC4cjWNYExpO7n6wePWyYgzSSecZmgz2wrKqY2VDVYEPJ1L+GYVM5J7IyTStwS43
         r1ExKW8FMQZ0J4CUjwdg8saakAMuxV6/bxP5wzPMmhytSwzpKYbpxIrwFWy3NV63BJQe
         RLkA==
X-Gm-Message-State: AOAM532FWb471yQMvTgO76g0kB7H9VbWHGVG5K8tZOSOrP+K5s3BiZHr
        x8ooTxEpx4gF6PAhsVP/gDQexDsV+G5kvhtcEiM9W2m+Y63rEQ==
X-Google-Smtp-Source: ABdhPJx4QcrV8ujH1lxQk4P3Dl094IRBoST06eFFxbqTEjyFrw64FcT0Z//KiZDtY7ylAGTCGMsv/N8h57gNlAkdRts=
X-Received: by 2002:a05:6638:48:: with SMTP id a8mr37563334jap.138.1609142687661;
 Mon, 28 Dec 2020 00:04:47 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
In-Reply-To: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 28 Dec 2020 09:04:36 +0100
Message-ID: <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 28, 2020 at 8:30 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ Please CC me I am not subscribed to LKML and linux-kbuild ML ]
>
> Hi Linus, Hi Mashiro,
>
> thanks for the Linux v5.11-rc1 release.
>
> With a new release I always do my first builds with my distro's
> default compiler and linker (GCC v10.2.1 and GNU/ld BFD v2.35.1).
> ( It's approx. 40% faster than LLVM toolchain v11.0.1-rc2 here on
> Debian/testing AMD64. )
>
> The only warning I see for the first time (with v5.10.3 not observed):
>
>   sh ./scripts/depmod.sh depmod 5.11.0-rc1-1-amd64-gcc10-bfd
> Warning: 'make modules_install' requires depmod. Please install it.
> This is probably in the kmod package.
>
> The only change I see in this area is:
>
> 436e980e2ed5 kbuild: don't hardcode depmod path
>
> depmod from kmod Debian package is placed and I have no /sbin in my
> user's path (and not before?):
>
> $ dpkg -L kmod | grep bin | grep depmod
> /sbin/depmod
>
> $ which depmod
> [ empty ]
>
> $ echo $PATH
> /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
>
> OK, this is a warning, but might confuse other users.
>
> Please, let me know if you need further information and keep me CCed.
>
> Thanks.
>
> Regards,
> - Sedat -
>
> [1] https://git.kernel.org/linus/436e980e2ed526832de822cbf13c317a458b78e1

[ Correct email-address of linux-kbuild ML ]

This might be distro-specific:

[ /etc/login.defs ]

99:# *REQUIRED*  The default PATH settings, for superuser and normal users.
100:#
101:# (they are minimal, add the rest in the shell startup files)
102:ENV_SUPATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
103:ENV_PATH    PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

What is your recommendation?

- Sedat -
