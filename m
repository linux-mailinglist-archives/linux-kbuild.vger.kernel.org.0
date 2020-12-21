Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3086D2DFCDB
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 15:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbgLUObD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 09:31:03 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28732 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgLUObC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 09:31:02 -0500
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0BLETlte009471;
        Mon, 21 Dec 2020 23:29:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0BLETlte009471
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608560987;
        bh=PY+0ThPVWND3Lt3Y+ClnFLJcNefmldtQqyCaw9pnlNY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Bw3IaApZWwPkn22WMTgwWffkvKmG4J+ON3tiUcP/znPabxxBsef+qgZ83cTnKbNd5
         m+9m3XxggedPMEBaUkQqIbCTUrvYyZpDIPEDwpjbo8608V71MhqlZDlZuVXkvNqooL
         5BEdFagN3Pm2oSy0rq5AhfJv+4YfnXKWWIyaZ7PgJy1nRr7n1xWWNH3jy07Swv4WcZ
         OFTuvd0T1+ys6Q6Zzo5UCnhA2qUInjTnVkoGYjX50KIVvDz7PCwHmMYua7EIVJhO3X
         r5hp+FrzYzf0OJq8lKjAt3xZssv21iWdsQJDTf98DoLnZemJoxFTWRDbqLtodIGiFT
         PYtN/nZmmVgSg==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id z21so6454580pgj.4;
        Mon, 21 Dec 2020 06:29:47 -0800 (PST)
X-Gm-Message-State: AOAM532M7lBHV4iaBWKRykXaTkyZFu9WMrAjA0Zx1tFOYcrsEuCxGpoP
        FKzwLqtZutouQrA/9gan+LFswwWRwSuHls1Ehks=
X-Google-Smtp-Source: ABdhPJx1i2sUSv2jDc69OziBsRnfR7tJle94dwX/H2E9VzZIt1Ci5INaQwjjjE7NMi1cp7Bn8Afrnp6quqw2QDO0c4M=
X-Received: by 2002:aa7:9501:0:b029:155:3b11:d5c4 with SMTP id
 b1-20020aa795010000b02901553b11d5c4mr15472118pfp.76.1608560986910; Mon, 21
 Dec 2020 06:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20201212165431.150750-1-masahiroy@kernel.org> <20201212165431.150750-3-masahiroy@kernel.org>
 <ff1adc79f7884ba1a1dcbdd806e81d7b@AcuMS.aculab.com>
In-Reply-To: <ff1adc79f7884ba1a1dcbdd806e81d7b@AcuMS.aculab.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 21 Dec 2020 23:29:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT0-_C3N1AO9uPV-G9U99YMeusD5HULnSmX2CfswQsuYQ@mail.gmail.com>
Message-ID: <CAK7LNAT0-_C3N1AO9uPV-G9U99YMeusD5HULnSmX2CfswQsuYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
To:     David Laight <David.Laight@aculab.com>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 13, 2020 at 6:47 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Masahiro Yamada
> > Sent: 12 December 2020 16:55
> >
> > This script was written in awk in spite of the file extension '.sh'.
> > Rewrite it as a shell script.
> ...
> > +#
> > +# Usage: $ ./scripts/ld-version.sh ld
> > +#
> > +# Print the linker version of `ld' in a 5 or 6-digit form
> > +# such as `23501' for GNU ld 2.35.1 etc.
> > +
> > +first_line="$($* --version | head -n 1)"
> > +
> > +if ! ( echo $first_line | grep -q "GNU ld"); then
> > +     echo 0
> > +     exit 1
> > +fi
> > +
> > +# Distributions may append an extra string like 2.35-15.fc33
> > +# Take the part that consists of numbers and dots.
> > +VERSION=$(echo $first_line | sed 's/.* \([^ ]*\)$/\1/' | sed 's/^\(^[0-9.]*\).*/\1/')
> > +MAJOR=$(echo $VERSION | cut -d . -f 1)
> > +MINOR=$(echo $VERSION | cut -d . -f 2)
> > +PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> > +printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
>
>
> Hmmmm.....
> You've managed to convert an awk script into something that requires
> sh, head, grep, sed (twice), and cut (thrice).
> Plus (probably) a few sub-shells.
>
> It is quite ease to do it all in all in the shell.
>
>         David
>

OK, please rewrite the code.



-- 
Best Regards
Masahiro Yamada
