Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30FD373CCD
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 15:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhEEN7q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 09:59:46 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:43197 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbhEEN7q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 09:59:46 -0400
Received: from [192.168.1.155] ([95.114.117.51]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDPuq-1lnbSE2UBK-00AVJs; Wed, 05 May 2021 15:58:44 +0200
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Thomas Schoebel-Theuer <tst@schoebel-theuer.de>,
        Kajetan Puchalski <mrkajetanp@gmail.com>,
        mceier+kernel@gmail.com
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com>
 <7999ba57-9b95-265e-a189-d9ca01304b13@schoebel-theuer.de>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <53413f58-269a-a1f6-2a97-e33819446609@metux.net>
Date:   Wed, 5 May 2021 15:58:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7999ba57-9b95-265e-a189-d9ca01304b13@schoebel-theuer.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:muzYRpD1WAxLx2Cq+LC97YoKU1FJ8xnbrcx4Y75aR6nYpweJIMA
 VN+KI57sg34AcQovmwb6xXXjtVWTRd4MFqtEA/DO6h1z7Jpdlko7yWcneGw2G2gsil4SI7/
 49/XHEjPLt8oiOHD3I1WNQuAUTyXp0CYN49XIrMLC0pOyjO28NxFxWrxF9GTlFRD8G8t5/f
 IEA3ZflvXKdPiUDB4IsFA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HOWavIaJf8Q=:QEurQ0FuI1CJ9o37a/gjJB
 AZzAq/Ckn/aN38Ge87A0jy+gQMein9wpQvW3C/6i8EqZmqYuqyf5RJ8Q1ae2iK6yVI/DvJ3Xd
 Z/0r/L/fQgz//rw/J8Fd8ufeLN29pa82thxoWrHz/QYEwREAZb4flHX8objle7MFrosIf3Csi
 VmExdnC3CA4dxwituS9PzXTatN5Y5kOnecgJ4lLkhqF6mShjYvUZtccEur9X0ZRHmq2gLQebW
 AwzkuNQmWpofUYm/z6LfhAYku0KxUAsb33Fnu+yu9iw9rXZZPXZrDY7XzCkBAKAQZ2nVqZT9C
 Rsj/cPbga84e2sBRkwybf+YgWSNJbkckWQLl6FvBzM+CXkucWKuqH26n0pkaj5O7sWn5Y7bcs
 3FMVBLV0se8TCTmFMOHYc+HRHig4MCrVgl/2aTOvQl9j4DOpw54QFYLZVCQ58Gxzr97YAxKvu
 hEH5wg81QDE2E1e/nj0D0sq54sxquyi8aMz+57UkCMsgXoyB3DA6zUZCsLkv/vzPZEZZIIQ6I
 AEViP5sIRCeQygZvdEBzA8=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 30.04.21 08:39, Thomas Schoebel-Theuer wrote:

Hi,

> IMO this is a _requirement_ for Linux, otherwise its "business model" 
> wouldn't work in the long term (decades as is always necessary for basic 
> infrastructure / system software).

ACK. And speaking for embedded world, 20+ product lifetime is pretty
common. During that lifetime you'd need to be able to pick out old
sources, so some changes and rebuild your code and having your system
still running seamlessly after the update. IOW: long-term
reproducability is absolutely vital. Linux does much better here than
many competitors (that eg. need proprietary build tools that don't
even run later machine generations)

> If the requirement "second source" (by either way) is not met by Rust at 
> the moment, this needs to be fixed first.

Yes, and also adding long-term reproducability as another vital requirement.

Rust seems to be a fast moving target. Even building a Rust compiler can
be a pretty complex task (if you're not a full time rust developer).

Gcc, in constrast, itself can be built on older compilers (even non-
gcc). How to do that w/ rustc ? According to my observations some while
ago, it needs a fairly recent rustc to compile recent rustc, so when
coming with an old version, one has to do a longer chain of rustc
builds first. Doesn't look exactly appealing for enterprise grade and
long term support.

> Other limitations like "development resources" might lead to similar 
> effects than lock-in. I am seeing the latter nearly every workday. 
> Software becomes "unmanageable" due to factors like technical debts / 
> resource restrictions / etc. Typical main reasons are almost always at a 
> _social_ / _human_ level, while purely technical reasons are playing 
> only a secondary role.

Correct, the amount of people who understand rust is pretty low, those
who also understand enough of linux kernel development, probably just
a hand full world wide. For any practical business use case this
practically means: unsupported.

I don't like the idea of Linux being catapulted back from enterprise
grade to academic toy.


--mtx
-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
