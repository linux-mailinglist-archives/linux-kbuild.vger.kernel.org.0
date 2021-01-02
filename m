Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D062E8736
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 12:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbhABL6q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 06:58:46 -0500
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:3380 "EHLO
        esgaroth.tuxoid.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbhABL6p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 06:58:45 -0500
X-Greylist: delayed 3129 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 Jan 2021 06:58:44 EST
Received: from thorin.petrovitsch.priv.at (80-110-120-81.cgn.dynamic.surfer.at [80.110.120.81])
        (authenticated bits=0)
        by esgaroth.tuxoid.at (8.15.2/8.15.2) with ESMTPSA id 102BvWc1015719
        (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
        Sat, 2 Jan 2021 12:57:33 +0100
Message-ID: <0b797d40843b2cd54a5840ee97a9f77fb60e4658.camel@petrovitsch.priv.at>
Subject: Re: Linux 5.11-rc1
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
To:     sedat.dilek@gmail.com
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sat, 02 Jan 2021 12:57:32 +0100
In-Reply-To: <CA+icZUWsffXuBUTcjLhrGvDKRp8fut=k_HdyhQ-QLZHjfXpqmg@mail.gmail.com>
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
         <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
         <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
         <20210101161435.GA344@duo.ucw.cz>
         <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
         <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
         <CA+icZUXyfv0sOP=UG6oeoxpHbEpOrufJzzUWb3ZOpE_TMQerwQ@mail.gmail.com>
         <b9d3c1063d4c3f9a0cb71442cc92ad77a859d438.camel@petrovitsch.priv.at>
         <CA+icZUWsffXuBUTcjLhrGvDKRp8fut=k_HdyhQ-QLZHjfXpqmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-DCC--Metrics: esgaroth.tuxoid.at 1480; Body=6 Fuz1=6 Fuz2=6
X-Virus-Scanned: clamav-milter 0.97 at esgaroth.tuxoid.at
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=5.0 tests=AWL,UNPARSEABLE_RELAY
        autolearn=unavailable version=3.3.1
X-Spam-Report: *  0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
        *  0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on esgaroth.tuxoid.at
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 2021-01-02 at 12:26 +0100, Sedat Dilek wrote:
> On Sat, Jan 2, 2021 at 12:05 PM Bernd Petrovitsch
> <bernd@petrovitsch.priv.at> wrote:
> > On Sat, 2021-01-02 at 10:13 +0100, Sedat Dilek wrote:
> > [...]
> > > To be honest I wondered why there were no more reports on this.
> > 
> > Perhaps I'm not the only one who has /sbin and /usr/sbin in the
> > $PATH of normal accounts too (and idk what's the default
> > behaviour of distributions is - my .bashrc "fixes" the
> > $PATH).
> 
> I was thinking more towards maxim/dictum:
> "Never break userspace!" or "It worked before but now it is not."

But if userspace changed (and that could be a change by the
distribution which the user isn't aware) than ...

> Think of automated kernel build and test setups based on Debian.
> 
> Debian/testing AMD64 has...
OK.
> [ /etc/login.defs ]
> 
> # *REQUIRED*  The default PATH settings, for superuser and normal users.
> #
> # (they are minimal, add the rest in the shell startup files)
> ENV_SUPATH
> PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
> ENV_PATH        PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

Well, "minimal" and /usr/local/games:/usr/games ...
/usr/local/* is the next ...

Yes, it's hard for the distribution to "guess" the local admins
habits and policies ....

> IMHO users should not need to fix their environment.
> ( The discussion is a bit obsolete as we now have a fix. )

FWIW, I have no (and don't see any) problems simply appending
/sbin:/usr/sbin to the $PATH in/for the kernel's scripts.

MfG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
There is no cloud, just other people computers. - FSFE
                     LUGA : http://www.luga.at


