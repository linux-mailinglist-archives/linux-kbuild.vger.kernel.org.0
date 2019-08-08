Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0B9A863D0
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 16:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733005AbfHHOAl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 10:00:41 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52877 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732866AbfHHOAl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 10:00:41 -0400
Received: from [192.168.1.110] ([77.4.95.67]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N3sVq-1iMIFu3pg0-00zqa8; Thu, 08 Aug 2019 16:00:19 +0200
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
 <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
 <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
 <51451f89-9193-2be6-e724-e9ca44a25f52@redhat.com>
 <620e0aec-e3d8-7289-6525-b720013e8dfa@metux.net>
 <20190808132417.GU30120@smile.fi.intel.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <9f03f364-77b1-3ee5-cd93-0908bf863380@metux.net>
Date:   Thu, 8 Aug 2019 16:00:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808132417.GU30120@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:csfxQRdjtiNOl7i40o2/B7IYxkxAzKT92ybeBveWYrCtR86JV94
 SFwsN8hQWV6RD+HwY9yJEn2UGnlkry538yjexNvWkDl5F0nbE/kH8kqxMm+liGrea5cZWeq
 ndypCaSKSMWH69mKBexN70YWQvraS0lMUXNsjl0wgNi0N4JUmxVjHIMDenMUDzbFUvMfDWK
 2Oj7CpXD65h0Sytfb7ljQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:104H55ooDy8=:toD2MsvpW6tFeoz7dWLl4O
 t4QQS5H9F7C5gTVwvr0oTGIIC7j7VXp2xIYN5vyqBwgSClm2yn2g8F1/SD7W34XUIR7VOIhWV
 Fsfm5PKGECOFhwoi8sPG60uo8kteK5a+BAwsop7oBrafd3lKOdY+FNDRjuIkGtl56jXmNCpRT
 SHgOp9gdlhjCO3HhWoXWuMT79fbCGlu1FL/exeZN9Y+eumPU2NJMzUiRtgOJYHkfG2+QaT6Mw
 ftPCAOafd5OZFtdZJiqRXHUxFVp40IRUrpgLNFppWVMnaHijq1H/8o5cTngeUSlRke8BYoTWi
 zpMpHyosVaVsRd+zHoDCGzVmuSpHVenz9M7AhcZX/eUC1itTw+BOW3mJTNFdfnEi3EMs8BIdL
 oHoTg3EtzAU9moDUCt72PVl0wQlq31ND5hu4gnU7taLlTDILx37jtaXK7Fza6r0HLT7rotTT/
 uqsDJLS71mS+sbZEapEd9gi9HrziiEL4Z6UAuZt99Vwn4l1IcqxolNrRKSSINH/mesLsMwsa5
 LQ/qtCr7rcaOuoXouyKTPBA43pefhoXM5jfWnB/+ZWbKUP+6HeIQYZv6kRkjv0x9nK6VF/0NM
 jZRWJrW9Uc8YOCkIVcv1nraeeXUzQbDS3L5O70Mcy3SII4pOTUrx1TubNxw8SBAgewKSslHzF
 OYOESPlVzkXsZSSZaRCQ2DQsfmpBGNwlUD3lFb21qrClXWy8NkhOEObrUqNcmaqL+v5fIFpJm
 MwCctagiW2hU+BRY7DkLPzParpbsc0R4OJwMkAeaiYF+FpuWF31OdMiulE0=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 08.08.19 15:24, Andy Shevchenko wrote:
> On Thu, Aug 08, 2019 at 03:12:47PM +0200, Enrico Weigelt, metux IT consult wrote:
>> On 06.08.19 19:12, Javier Martinez Canillas wrote:
>>
>>> Right, we could add a macro for that. Although it should probably be called
>>> I2C_OF_MODULE_DEVICE_TABLE() or something like that since is specific to OF.
>>
>> At that point it should be completely noop when OF is disabled, so we
>> also can get rid of many ifdef's.
> 
> Why?

For cases where drivers work w/ or w/o oftree. Not sure whether it
applies to i2c specifically, but there're other places where we still
need nasty ifdef's (eg. gpio-keyboard).

>> I've got some patch somewhere for introducing a MODULE_OF_TABLE() macro
>> as replacement for many MODULE_DEVICE_TABLE(of, ...) cases, which noops
>> when CONFIG_OF is disabled. (and similar ones for other table types).
> 
> It's simple wrong to have #ifdef CONFIG_OF without counterpart of_match_ptr().

Of course, but that's just a part of the story. (actually I'd prefer
using it everywhere, even if the driver only supports oftree).

> And taking into consideration that ID table itself doesn't depend to OF at all,
> why not simple drop that #ifdef and of_match_ptr() all together?

Consumes less space. Yes, it isn't much, but in some scenarios one needs
to heavily reduce the kernel size. And I wouldn't like to use
of_match_ptr() inside a MODULE_DEVICE_TABLE() call :o


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
