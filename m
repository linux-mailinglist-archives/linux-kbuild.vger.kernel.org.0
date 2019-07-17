Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A676BE11
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 16:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfGQOQ7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 10:16:59 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58329 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfGQOQ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 10:16:59 -0400
Received: from [192.168.1.110] ([77.7.13.186]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkHEH-1iBlku1J9t-00kfCy; Wed, 17 Jul 2019 16:16:41 +0200
Subject: Re: [PATCH 4/4] debian: add generic rule file
To:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
 <20190715191245.GD3068@mit.edu>
 <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
 <20190716123431.GB2999@mit.edu>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <77f82ca2-f89b-e8e2-507a-c37bce1343a5@metux.net>
Date:   Wed, 17 Jul 2019 16:16:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190716123431.GB2999@mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8HnEQhX5qC0lbl/5iJtYcFfeJ0Kw333zWG878y65QFvMazOMKER
 WHM/m1Ezx3M1tX80++6gg/P7sJ7xS69gwKfMLSzdNgGCYvFya0T3VZQCHM0U1inFUEri+a8
 GiOVyeW37SZ681d9hkRJZMu5QQNf3BowK45qR2u42VZ9o2aJuzXyxDzcKeLaHoj211cD2MN
 KLPjrLUbq3j+8tC7yAiSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iqJCQL2Ve+M=:eLA7MM/kzThA5XWvEsiQfx
 FqCpQSrv85qNdT1iaOWhC8bCBMiQV1vf6FOlR+R/KY9pj2ve5MZZ128EYsKNlSlpo4283aJpJ
 Iu00EI+e7IC9m7PqrJ7cGHqpM1KGM1J0ZY3ouApUNbuF9ILgTxJIzQwV5c4hKCNCUNaxikERj
 7HeT0CEW5VyzpzS1S0Scg4ELM8yVakZ5wHqzQHQ+6OT8UVR12sPfySw+WVum8Jax5mvx6cqx6
 igNAtoAVdttDEuX4Am5DZp2/hIL4y5SYKp2ZWj8OtjqYaZ7DbjV9rHYbSJQwdddqkCDy6FiJ6
 DTms95X+fwEa0o1nfxKExtIyQgghHOkGFoHfhLJZGiMLOoGN8Y6E1r2RQSJyLS5zPTrtDp+Rv
 GXZlicSwpoZXzWYH4ROm0XC7uqVMk5QHStfGDpNYuYCIWl3E0+fbcseAhcdzJh9jbmIyhnwhg
 5gPNg3WAxaXTW/trnRdCBG0MB01BJC+Z/lhBymKXyGX3BqLQbRfCmDH8ZXMluG/Bp2twCYo5M
 Ck27fR1WA5kNyM6BbMt6PG1+w14CTgPapAbmo8dpSfux7kh5JhgcInF2cjDJERPW009OgxiAC
 HzljwX2k+bxfyzUkE7RO97wjJQdua0RlMJMQ9mp0tHkvL9N4PkwyOtfibYge2Orb4bkaZ5SLt
 AKjqjN/xTd3cgVGyuHWI1nzbvYs/7zO6HmJuqVaAqof3ug9dTR7DF9ZWJ+DXxBrBKWsnJT77D
 9te7Li0DfCy067+cxIpEtAUS11vbfdPe0wz2XBP9M4lZhoQBwxDrmg5hGAc=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16.07.19 14:34, Theodore Y. Ts'o wrote:

Hi,

> In practice, that's not going to be a problem for most distributions.
> The traditional way Debian-derived systems have done builds is
> completely outside of git.  So there will be a linux_5.2.orig.tar.gz
> and a linux_5.2-1.debian.tar.xz.  dpkg_source -x will first unpackage
> the orig.tar.gz, and then the debian.tar.xz, and if the second
> overwrites the first, it's no big deal.

ACK. IIRC they already filter out debian/ directories when generating
upstream tarballs - other upstreams already provide their debian/
stuff, too.

> First, once it's checked in, I expect changes to the default
> debian/rules file will be relatively rare.  

ACK. I currently don't see much reasons for future changes. If anybody
sees something missing, just let me know, and I'll take it up for the
next review round.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
