Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DA72DF053
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Dec 2020 16:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgLSP6j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Dec 2020 10:58:39 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24008 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgLSP6i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 10:58:38 -0500
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BJFvgWN015140;
        Sun, 20 Dec 2020 00:57:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BJFvgWN015140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608393463;
        bh=njfYk6yCENxr5nODGh6LjpRYo/eTNuiSHAFjALJ+yAA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dqzxV1TTcfccglEHNpy5DnRc0j+Ufd+aYQcgOiGOfqUMlq8qmreXalRaICWDozPxL
         hgDpIPo/KF0lpRhzpIkmVF1y8jsOgd/QibVRufXfsyCNSHM59qY/366I7A2sA187A7
         4v71nBPZbJXbXhUhuAhJ5n/OJKlVSbX1B/5+cYL9cZXZnSBOhEpBrXtDGdFB6xOICO
         myYOa71ooLt80aB9VBVagYu/SzqlAkJ7ophrJndZYWW7PQT88SxHWcI6FT8BX4wmwT
         glqOZljG6t/9hmSw1wTIXQ2K5Ammh9si2QA2SbCOnPerl3hE8Rr4RkErKGFzLlwDLa
         O/J7eUxSJJiRA==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id t6so3080402plq.1;
        Sat, 19 Dec 2020 07:57:43 -0800 (PST)
X-Gm-Message-State: AOAM533ClvJNl5A+iuXY0fCGTty2/yBFu7LxvaVVVBdS+2TdLNa4P7gF
        +mGwINfYv1TDDfZSOnp2o1/0QR/kjgjFvfzahxU=
X-Google-Smtp-Source: ABdhPJylY/91XNaUYFftOqNy3dhP1fAhPnI72GygEGn8Q+eBmSOaxt9lRmDAb9zRdPNpwEY1jiT0PLWGOPqJN1SDSEA=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr9639035pjb.87.1608393462287;
 Sat, 19 Dec 2020 07:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20201219055947.29587-1-rdunlap@infradead.org> <CAK7LNASxzs8DxqzkaF0LiEA7Y4N+sf+bQ7=DdyYdgFWZWMP0tw@mail.gmail.com>
In-Reply-To: <CAK7LNASxzs8DxqzkaF0LiEA7Y4N+sf+bQ7=DdyYdgFWZWMP0tw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 20 Dec 2020 00:57:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4+5Z3sqVapF9rbQ8KTmFy0O_Q8eLDVE15Obt+_m-dnQ@mail.gmail.com>
Message-ID: <CAK7LNAQ4+5Z3sqVapF9rbQ8KTmFy0O_Q8eLDVE15Obt+_m-dnQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: config script: add a little user help
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 20, 2020 at 12:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Dec 19, 2020 at 3:00 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Give the user a clue about the problem along with the 35 lines of
> > usage/help text.
> >
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Andi Kleen <ak@linux.intel.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > ---
> >  scripts/config |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- linux-next-20201218.orig/scripts/config
> > +++ linux-next-20201218/scripts/config
> > @@ -223,6 +223,7 @@ while [ "$1" != "" ] ; do
> >                 ;;
> >
> >         *)
> > +               echo "bad cmd: $CMD"
>
> Please send this to stderr.


Also, "bad command" instead of "bad cmd"




>
>
>
> >                 usage
> >                 ;;
> >         esac
>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
