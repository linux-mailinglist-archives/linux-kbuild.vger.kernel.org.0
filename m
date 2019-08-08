Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26320862B0
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 15:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732645AbfHHNNN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 09:13:13 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:59231 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732375AbfHHNNN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 09:13:13 -0400
Received: from [192.168.1.110] ([77.4.95.67]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M3Upe-1hwGBc1pPm-000dS4; Thu, 08 Aug 2019 15:12:50 +0200
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Javier Martinez Canillas <javierm@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
 <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
 <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
 <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <620e0aec-e3d8-7289-6525-b720013e8dfa@metux.net>
Date:   Thu, 8 Aug 2019 15:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:IBK9Xm7wYE6zK76e7iHZaERZwlA5HaihmNgKog9rl292nI0WqjF
 PtrGixDaNMcmx4CyY0g0HQuEYZ/9mduxkUv6RSCs3hYj5Z5Hh+F8N6xFGrfZaX2s3UPBmkJ
 oB+kot/By4XS+pGXba4sdeE9LvdMWIijTMwfqdOmigf9tUAw1ch5C3kq14jlJjw2D+apDZq
 CXntaM4+3eqXKMvkgxEyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3M+d3uKvZSs=:yLNYLCiuD+SNXAdiAMehjW
 GAhYqJo1pts5wjxmrfm3q9PHoTEl/auOnNIiUymU5nQ6kZegUv7OINe5y3jgIIwhyTtjgti63
 3KQVZlS74z2HWDIiqmNcTAe24n0/KKjZoNstcoB8fTvdXc2x1MVHU/ybm7Vmqv/JF0bnBASfe
 A4q8igaAcDUoBlvUcu9F+Tma6qgYM+bz/iT2v6/0/Or/1/V8XyMnVEQFX6uiRBpQqDUSFZgui
 AvAZF8Ei7ft8focNVRd0A5eBMpyr/SbXyHunKNEotLF9t5nHx9AiBcU1oNvsw5h6kza7PNNH6
 pwTlUkq1ersEeabWvRtXk+CQqyrd+l3cdRJ7lSpEz/rs+NnrboMy0ccIzztuh0SAwdTwRAFLf
 JfdpyVssc3vMTsKYG2NJahpvi+DYB0afEumw12ItulLNSsjrEptmqZgWoWgq2aFevhC3K2ZAR
 XQJ9h2h6TIoS0Ax3y/WtBHDEXGoeoIOq43hBWPFz8XcKoU6pqoBhrY6U3VFaj1KXNwk6RfX4M
 S1MSdRzWrdpkpjDn4vje7kK05V4sswjCc2Qrn178RpmxgY2Py7/yRzOmVaY1UkWPKAG+PcIy7
 4ahyHVKIev8jqVOgae1LucWtwwRnR5BbMGxw7B1nFEpHydFUjVFr5LVvwNQHYqnlXiAujVvGc
 ii1W0Hes3Krb8L6pP/wMi9ghqVDzYYLjzgsaq9noAOCeuZuIkqm+wYV5DjdApJsv5vEIjUYn8
 yQtdouzt0j2sv7nw1w76z98d5bIQSyrerypLiYTt4ERSWSCGggf846HsQPE=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 06.08.19 19:12, Javier Martinez Canillas wrote:

> Right, we could add a macro for that. Although it should probably be called
> I2C_OF_MODULE_DEVICE_TABLE() or something like that since is specific to OF.

At that point it should be completely noop when OF is disabled, so we
also can get rid of many ifdef's.

I've got some patch somewhere for introducing a MODULE_OF_TABLE() macro
as replacement for many MODULE_DEVICE_TABLE(of, ...) cases, which noops
when CONFIG_OF is disabled. (and similar ones for other table types).

by the way: haven't followed whole discussion, just picked up some
proposed table changes ... does that require userland upgrades ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
