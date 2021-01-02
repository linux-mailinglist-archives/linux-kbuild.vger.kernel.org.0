Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF862E8739
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jan 2021 13:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbhABMEH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jan 2021 07:04:07 -0500
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:3391 "EHLO
        esgaroth.tuxoid.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbhABMEH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jan 2021 07:04:07 -0500
Received: from thorin.petrovitsch.priv.at (80-110-120-81.cgn.dynamic.surfer.at [80.110.120.81])
        (authenticated bits=0)
        by esgaroth.tuxoid.at (8.15.2/8.15.2) with ESMTPSA id 102B5Llo015542
        (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
        Sat, 2 Jan 2021 12:05:22 +0100
Message-ID: <b9d3c1063d4c3f9a0cb71442cc92ad77a859d438.camel@petrovitsch.priv.at>
Subject: Re: Linux 5.11-rc1
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
To:     sedat.dilek@gmail.com, Masahiro Yamada <masahiroy@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sat, 02 Jan 2021 12:05:11 +0100
In-Reply-To: <CA+icZUXyfv0sOP=UG6oeoxpHbEpOrufJzzUWb3ZOpE_TMQerwQ@mail.gmail.com>
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
         <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
         <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
         <20210101161435.GA344@duo.ucw.cz>
         <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
         <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
         <CA+icZUXyfv0sOP=UG6oeoxpHbEpOrufJzzUWb3ZOpE_TMQerwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-DCC--Metrics: esgaroth.tuxoid.at 1480; Body=6 Fuz1=6 Fuz2=6
X-Virus-Scanned: clamav-milter 0.97 at esgaroth.tuxoid.at
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,UNPARSEABLE_RELAY
        autolearn=unavailable version=3.3.1
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5029]
        *  0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on esgaroth.tuxoid.at
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 2021-01-02 at 10:13 +0100, Sedat Dilek wrote:
[...]
> To be honest I wondered why there were no more reports on this.

Perhaps I'm not the only one who has /sbin and /usr/sbin in the
$PATH of normal accounts too (and idk what's the default
behaviour of distributions is - my .bashrc "fixes" the
$PATH).

MfG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
There is no cloud, just other people computers. - FSFE
                     LUGA : http://www.luga.at


