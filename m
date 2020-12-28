Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB092E6C1F
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Dec 2020 00:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730396AbgL1Wzq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Dec 2020 17:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729310AbgL1TlX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Dec 2020 14:41:23 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1664C061793
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Dec 2020 11:40:41 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m25so26129816lfc.11
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Dec 2020 11:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KC0IvukBXrMezsZLkepZEAdyw/KWhE6PVpb9k71bqjU=;
        b=B5N91RmLSyl9z2bK12UgU1zpbdLtQxsgPSz4HhqBb9TfajaOGwZrI8UJBfFq8CG5Jm
         tx1oGbxKN/CRscqeYPn3lRrzLrhMTi2xOebdgNBSM727I2YAEZNpDNrrg4X44B6SpCeM
         r4zaG0pelWFqnRT3uIdt5HGySYHoAWwJBezk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KC0IvukBXrMezsZLkepZEAdyw/KWhE6PVpb9k71bqjU=;
        b=Jk8AX0nXmSXgEeLQGgFQ3u/HOVer30HLpjXHF9nCSQbigRuFnQ8jQKpHdZStqFLoZD
         47i0lmb1SQOXPxsKnb28W413iVZfnXF0zdfR08DEAxMw4zl5viSSN0XpEulvDDqcOWcK
         xcBJ0ZLwxrd9i6aDsvnATfQPsXiTSAZlFb4ro2kNH5ieRZIBGMfkcvA7h3i+JUun0AUv
         sHAuonTb0nDxa/sCrJvwNp6rQJwEUZiSN79SIEkg0dvvOVDTUh6+gW4uAqrsDkN/MQUv
         ZuOHC6zcyS0nKULrpu+DHvqYOYsPtWsh3EUXQhWEmwEc91i7CsrelPaiW8qR4mDJRcBG
         +4MQ==
X-Gm-Message-State: AOAM533D3GujglDWKAG6GPKOxqJRduV8b0Ykvw1o8AICeGWMSKmIipcz
        9nYeiGTewu90smfqg23W8+pEAB8YDpnLqw==
X-Google-Smtp-Source: ABdhPJzfNOeTsdcfEb2ictcItZW8JYisGtKE0HRtEUgxceVf3wjucsFL3MR88IhdTNE8h3EwmwxdLQ==
X-Received: by 2002:ac2:5685:: with SMTP id 5mr21145080lfr.325.1609184439860;
        Mon, 28 Dec 2020 11:40:39 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id l205sm5387391lfd.284.2020.12.28.11.40.38
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Dec 2020 11:40:39 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id h205so26167525lfd.5
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Dec 2020 11:40:38 -0800 (PST)
X-Received: by 2002:a2e:6f17:: with SMTP id k23mr23617958ljc.411.1609184438626;
 Mon, 28 Dec 2020 11:40:38 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
In-Reply-To: <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Dec 2020 11:40:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
Message-ID: <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 28, 2020 at 12:04 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> > $ dpkg -L kmod | grep bin | grep depmod
> > /sbin/depmod
> >
> > $ which depmod
> > [ empty ]
> >
> > $ echo $PATH
> > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

Ok, I think this is a broken setup that has a separate /sbin but does
not have it in the PATH.

As you noticed, you can fix it with

   DEPMOD=/sbin/depmod

or you could just make /sbin part of your PATH.

It looks like on your distro, /sbin is restricted to just the
super-user PATH, which is odd, but I guess there's at least _some_
logic to it.

I guess we could have some compatibility thing in scripts/depmod.sh,
something like

  diff --git a/scripts/depmod.sh b/scripts/depmod.sh
  index e083bcae343f..a93261207453 100755
  --- a/scripts/depmod.sh
  +++ b/scripts/depmod.sh
  @@ -15,6 +15,8 @@ if ! test -r System.map ; then
        exit 0
   fi

  +# legacy behavior: "depmod" in /sbin
  +PATH="$PATH:/sbin"
   if [ -z $(command -v $DEPMOD) ]; then
        echo "Warning: 'make modules_install' requires $DEPMOD. Please
install it." >&2
        echo "This is probably in the kmod package." >&2

or similar. Does that work for you?

                Linus
