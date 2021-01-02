Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9271E2E870A
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 12:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbhABL1Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 06:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbhABL1X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 06:27:23 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3FBC061573;
        Sat,  2 Jan 2021 03:26:43 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id x15so21020509ilq.1;
        Sat, 02 Jan 2021 03:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ilqSGevT+DyYr8MeIp8qHL893rQcqVgolA4bHX/apQI=;
        b=kfFwW3KUC+iOyuBvNc1vFQfnl6f7Ld3zhYu2uvUR7gFdXKJE/01yg6ci89az7nfV7o
         BUgo4DTt9KFPa8HE5yFnJUZso3N4yob65jQe4yZ9I2UhLwhG/Nt9tk4hyloPmbW3R+lK
         bHIVoErrGtWtJ7lO20b1mglLWsQHlBjNZ1RAY5D6Fpd0ZjtGvzOebYdB0OGSav0yNQDe
         l9brnioQKdT9oHSrGIUeV2kYKyG5QI8G902FRP+o2yhUDitRQ3LUlHWT+fMDdDayumyC
         r4sxoBbGM7d/AvLb8z9jXa49wZkvW3H4xxJXVHy0GjN8rr2GIbP9lLJsWlXcfVW/cAxp
         YavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ilqSGevT+DyYr8MeIp8qHL893rQcqVgolA4bHX/apQI=;
        b=UC9c/lybyrp+ax9dKjXq7ihRSsO6lEkhBwguwtvDN868gueRXt99dG5aziFYE7uwte
         LtA2eaxcHIc/pdkQPg4cpkF0zSWpRruSCRlOrjwqoLLEXRECr3eNBvU0k1AkDHLzjpT9
         96sbZag6RNxTonF7YInJk03brSlwsrJpaQtIKNrScb56LlxazpBg4hYTGtwMbgNq+KeE
         ajY+quX3aWWdjAmrh2L1yBVE1zRCcLGFuTbIX1yqXqYOgqRlx6cwZ5hhYixVb77EeO2g
         rMUrZ9oDjalzrsfZgKgn4cPBxqtD9T7X0JFzhnT4+d9TGorjH0jWqQR5k/Jj+vCNwjJD
         l4ow==
X-Gm-Message-State: AOAM530i60Hi5tWzM2ZTI4VufCtZcO6280NCREXQDs2kk62JWk4br8aW
        BRrAqG3u6Ya/LdVEP8vVj7RoVBzGjrCT9nDLhT8=
X-Google-Smtp-Source: ABdhPJyGy7BFoDfRwsBKcxFQ/IDLdrWCpXpe+KuzWl+Mlf7vz4gvGsMOAyKWsIjsUs08w73eeji0Qzo2HuM06/iqvK8=
X-Received: by 2002:a92:d1cd:: with SMTP id u13mr45985648ilg.186.1609586801514;
 Sat, 02 Jan 2021 03:26:41 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
 <20210101161435.GA344@duo.ucw.cz> <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
 <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
 <CA+icZUXyfv0sOP=UG6oeoxpHbEpOrufJzzUWb3ZOpE_TMQerwQ@mail.gmail.com> <b9d3c1063d4c3f9a0cb71442cc92ad77a859d438.camel@petrovitsch.priv.at>
In-Reply-To: <b9d3c1063d4c3f9a0cb71442cc92ad77a859d438.camel@petrovitsch.priv.at>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 2 Jan 2021 12:26:30 +0100
Message-ID: <CA+icZUWsffXuBUTcjLhrGvDKRp8fut=k_HdyhQ-QLZHjfXpqmg@mail.gmail.com>
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

On Sat, Jan 2, 2021 at 12:05 PM Bernd Petrovitsch
<bernd@petrovitsch.priv.at> wrote:
>
> On Sat, 2021-01-02 at 10:13 +0100, Sedat Dilek wrote:
> [...]
> > To be honest I wondered why there were no more reports on this.
>
> Perhaps I'm not the only one who has /sbin and /usr/sbin in the
> $PATH of normal accounts too (and idk what's the default
> behaviour of distributions is - my .bashrc "fixes" the
> $PATH).
>

I was thinking more towards maxim/dictum:
"Never break userspace!" or "It worked before but now it is not."

Think of automated kernel build and test setups based on Debian.

Debian/testing AMD64 has...

[ /etc/login.defs ]

# *REQUIRED*  The default PATH settings, for superuser and normal users.
#
# (they are minimal, add the rest in the shell startup files)
ENV_SUPATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV_PATH        PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

IMHO users should not need to fix their environment.
( The discussion is a bit obsolete as we now have a fix. )

- Sedat -
