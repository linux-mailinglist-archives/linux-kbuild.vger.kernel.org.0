Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E882E873C
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 13:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbhABMMm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 07:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbhABMMl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 07:12:41 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2205BC061573;
        Sat,  2 Jan 2021 04:12:01 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id d9so20790868iob.6;
        Sat, 02 Jan 2021 04:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Zia7YjD81hBGAI5yZOzHqZVEQYTe6YXjIf2zZ75X41Y=;
        b=hOSuah95K0svAcYLL52cUU95FM8NpMHWq9pNsckGUgE9NCEeSDKsk2HUJDLlLzbW/3
         8wuISAtgQnEnrq49gaQY6tFLj0/9m+qWafRmPwWfm3sAonYkdIlCK8yw2ZULhwr0gEJ/
         CYnF5XRXLvtL8aZ8TMzxGnZTFwc2pis0rYAhBG1g1RM6i+e8lyh0hbRgyoyBM1iksXJv
         cJ+/7ZhHTYF3Fa7zsU4Zj7FVqNWnnkxEwzoDzfB+8t/0k0SBLoNYgIdPb58U/yR1ecw7
         GhRSb2GBi40Dp9HXkrrSRrh2Bn0WMZjgO5Uclhk4CnpZ9i/3W62J5oG/R975Sk81rfGC
         ftSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Zia7YjD81hBGAI5yZOzHqZVEQYTe6YXjIf2zZ75X41Y=;
        b=q2BxaE1wq1WGn4Gey+lLZE7vVlJB8K9yImfHy40cVyWuhh9CRN8EQWX9hgfEDAlayc
         I1nRtNSoqe28v8sklc6XchcXyDIxOZ1RHgu7uYhtdYpEFQzcG6ksfuUDvHTI8pp9CQ0J
         GuLNWm6ZFgPyzdlcegn2W4EI5bEHP01VYrUdOpcS/MtNHHiU7fLjEfNU8mcvTqrQNEZq
         AuZaEp2HSIKxGYfTAWNE2nR5Uj7b1TaHN9JZZ8jA9gqK6wvbqJwqFrroYJAhpIWgO0UJ
         J4TMAOnEXR2mY1XtypJguJxOisizAjATNW1wU+1m+GaQPbGtwGhtRqA0fRYE0N/k+qXm
         UnWg==
X-Gm-Message-State: AOAM533j/PBscvldqszTEGGvYI1tXdCR15FPHbcd0d7F+vn+RtsseVpv
        OyNnf+TnT2X/qIDmEn9sThlH4MPR0DqXJ16pEjY=
X-Google-Smtp-Source: ABdhPJzyUF8qG0JcJzis3vCKIjJZSirsEXij9KA3QmlhPCs6wnjVSA6Qa/EAVEsLoPlIE9mIVQNxB5/FHlReaLz5WWU=
X-Received: by 2002:a5e:9b06:: with SMTP id j6mr53019260iok.171.1609589520440;
 Sat, 02 Jan 2021 04:12:00 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
 <20210101161435.GA344@duo.ucw.cz> <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
 <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
 <CA+icZUXyfv0sOP=UG6oeoxpHbEpOrufJzzUWb3ZOpE_TMQerwQ@mail.gmail.com>
 <b9d3c1063d4c3f9a0cb71442cc92ad77a859d438.camel@petrovitsch.priv.at>
 <CA+icZUWsffXuBUTcjLhrGvDKRp8fut=k_HdyhQ-QLZHjfXpqmg@mail.gmail.com> <0b797d40843b2cd54a5840ee97a9f77fb60e4658.camel@petrovitsch.priv.at>
In-Reply-To: <0b797d40843b2cd54a5840ee97a9f77fb60e4658.camel@petrovitsch.priv.at>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 2 Jan 2021 13:11:49 +0100
Message-ID: <CA+icZUV8hjw47ixSNf3ZbpyEPKFdcWwiCYn8F4dzSETuQO-gFg@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> > IMHO users should not need to fix their environment.
> > ( The discussion is a bit obsolete as we now have a fix. )
>
> FWIW, I have no (and don't see any) problems simply appending
> /sbin:/usr/sbin to the $PATH in/for the kernel's scripts.
>

Another workaround is to pass DEPMOD=/path/to/depmod in the kernel-build script.

Again, such custom workarounds should not be necessary.

- Sedat -
