Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840DC2E34C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Dec 2020 08:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgL1HeU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Dec 2020 02:34:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgL1HeU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Dec 2020 02:34:20 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58B9C061794
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Dec 2020 23:33:39 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id r17so8725849ilo.11
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Dec 2020 23:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to;
        bh=QKNiGGdlJRHU6tNaNc0JB9aZkK6AAVcU5541+Et+KKo=;
        b=DeK9XTQINDknQtEh9z3HSit7EmK0Qg9FcGvrblgDj/WQ2E+6e8m24SX9+Uuer6wjFb
         VNh2XZKZrX0sAuhXivmF955ZaXAmRwibNxJob3v18MH386V/3kPCDpKoFKuOE7r/7tP/
         2ePG2E+GTGp7awvDYZYOIRdZl1fOU1yIBb+90ha3hZwg2dZDw/TOVel/J7OHAGYOGMsJ
         +CnXziJXohxj6TgPDxsOiVVi5a47o00W8AiXFrXnuFiay8D5yIRxStDoBgfjG9JSBpWr
         i0vNpquAxoM1zet2g1eevEwjQFeMOe8JIKQZoyQFuC2dhHrLqJOZWQxhJeGOGO2MPMJH
         +8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to;
        bh=QKNiGGdlJRHU6tNaNc0JB9aZkK6AAVcU5541+Et+KKo=;
        b=Mnrh+cgH7juLZb7m/EuawcAEEHRbc7BsqxTjcB2ARW9oS+a1H1blDpAx+15QAuP43t
         GR1VbttPdWB620k+UlLvlO1/p7ShoMm7Nc+by6Jaqsn19BdLgtvM3jDWBDu7QzeFbLlC
         2IKHqUR4+hgnm5GgKl61nH/9gq0S5ueyFIT2ZA4FAqvzmEogUcKsN9sSUgzK8/ZfdOeu
         cSPV9/gMCrzVbeit9qkF8g+dcAoZbx108+oKSXQz004GkNZT5vY6Nwlq6H2GX6XEzQCv
         5tXWfTPwUU7k7NTd8Pzzy06OVOXbvFGM0aOFOaocsRNhexHBlFJiKeEgEMZYkuV3Vz5d
         ZrFQ==
X-Gm-Message-State: AOAM53065Pe6bq9L378ydOkpzM9O0Pj35drqOAiOVTWnLXHg3vGI/UH2
        sFhMhB6eLi8LpAp6cs2jSC6PRkh1gD+ViWmjanZmFp9TOrN4hQ==
X-Google-Smtp-Source: ABdhPJzX5dMxKVFUcWWWhsxGDdzfA57oj5DQCcB0S8Gf6REudZkDA6yHHfw+hmnf5qOD8YbHoDXSlA1S9KELFy+oR78=
X-Received: by 2002:a05:6e02:1ba3:: with SMTP id n3mr43130979ili.10.1609140819208;
 Sun, 27 Dec 2020 23:33:39 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
In-Reply-To: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 28 Dec 2020 08:33:27 +0100
Message-ID: <CA+icZUV5VnJBFD50jLENU4Js1-vT7FX_z7EH-y2de2UKebO=wA@mail.gmail.com>
Subject: Linux 5.11-rc1
To:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Grrr, wrong email it should be <linux-kbuild@vger.kernel.org>

- sed@ -

---------- Forwarded message ---------
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, Dec 28, 2020 at 8:30 AM
Subject: Re: Linux 5.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada
<masahiroy@kernel.org>
Cc: <inux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>


[ Please CC me I am not subscribed to LKML and linux-kbuild ML ]

Hi Linus, Hi Mashiro,

thanks for the Linux v5.11-rc1 release.

With a new release I always do my first builds with my distro's
default compiler and linker (GCC v10.2.1 and GNU/ld BFD v2.35.1).
( It's approx. 40% faster than LLVM toolchain v11.0.1-rc2 here on
Debian/testing AMD64. )

The only warning I see for the first time (with v5.10.3 not observed):

  sh ./scripts/depmod.sh depmod 5.11.0-rc1-1-amd64-gcc10-bfd
Warning: 'make modules_install' requires depmod. Please install it.
This is probably in the kmod package.

The only change I see in this area is:

436e980e2ed5 kbuild: don't hardcode depmod path

depmod from kmod Debian package is placed and I have no /sbin in my
user's path (and not before?):

$ dpkg -L kmod | grep bin | grep depmod
/sbin/depmod

$ which depmod
[ empty ]

$ echo $PATH
/opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

OK, this is a warning, but might confuse other users.

Please, let me know if you need further information and keep me CCed.

Thanks.

Regards,
- Sedat -

[1] https://git.kernel.org/linus/436e980e2ed526832de822cbf13c317a458b78e1
