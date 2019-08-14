Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5EB88D019
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 11:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfHNJxi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 05:53:38 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:34163 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfHNJxi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 05:53:38 -0400
Received: from [192.168.1.110] ([95.114.77.161]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MXHBo-1hnKXC2nJm-00Yhzn; Wed, 14 Aug 2019 11:53:32 +0200
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
To:     Thomas Albers <thomas.gameiro@googlemail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
 <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
 <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <e14fa0ff-e12c-85d1-7fc8-69e1d937b04f@metux.net>
Date:   Wed, 14 Aug 2019 11:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YbhoAFzDDhRAfHTEgatGW2tGYZUJxxjjxUIoivv0wxZX1GzD7KH
 r5T4c+VPu0ZOx5mbt5qjI/4soDE+2dyXfetvQMK8WdRCfqSs8x5S1hYUttrh9C4WyBrVZzn
 fEIhW50n/TggMqgFAYlSsb0NO4f4fZQD3Nj/NixRiwL7ibeaBoNu5uTD3MUvRhp5fBJV9bp
 lBKOf9Nqe9VMrfCl5Up5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:t+gUBM0O25k=:jILX8XG/SdkPOYb6Nj95Qb
 Lrxa/eDYjUzzaN8QQBVwISPo3ThiRzzBorI7JTCkYdik0VeccYU1WB2Mm0ItKhje9PG1erBZF
 IcqbWP/NgUK3CWBevjLuckmkFvb02wSlM56ytVYAy6gtElXmbWpSMjN81XUCJ3BZ5+2dLyGkx
 t4GJcaOIhwOFDy8s37kDRdUdXKJz3Wo+Vf1hyOA9dk2+40zblXCj6JsqR1LCnknhk2VT15VPW
 PWVADINqUxtEwcR6mDxdVydzmQcqEEMazxvbaBVPT8EOYfbNKnEbkTj031nAdZ7XTuIxQW1OF
 OHhxranU5CuwS9SW0+g2nzo1LjHZ/2o9ZtvtREqSPgAdZukxPDsNo1aqnIOBRgEDFmEA/Y5q4
 VWoqikiVrchToaCHPUZAFiGIVnb0viEnel0KUTrgeSPAHbPVFdHMZ6qEHPdvzN6IZr/Hte+Vx
 cBWzrSiXMM+nfKRdUI3zQeq9ZTZX4cUYfwVQn9W1mspLE7GPoajGJE1tpQxxdp070SRhys3lQ
 8wyhYNcT0pxBU4FdxCjPD+GfcVrff9sybu4mQfCIxko/xlkSt7i499uHpuNvcY2Ath4Zkh88V
 lDXiWb4Wu1Yf0eTW0By7tJWkevCFqbP6ODhqosKSNnrCMAyGpAUEFkXkYDTa7qcLG8He1q9BX
 hbGP214wn+MKnYoomVXaL+e4+1MtMKBt8g4F/csFxl5ZDJz1mlq+0DfmaSzsnmDmpinaR38z4
 5zktZl2meWosxriFUiuDrPqmw5XZaQEg7UO/IXurOhzUAs8K8ezqL8xl2C4=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10.08.19 17:44, Thomas Albers wrote:
> Hello!
> 
>>> Somehow, kconfig is not linked against libtinfow.
>>
>> can you make sure you don't have any ncurses pieces in your sysroot and
>> retry ?
> 
> No ncurses in sysroot. The kconfig script worked when the sysroot's
> pkg-config was disabled. Right now I think there are issues with the
> way OpenWRT uses pkg-config.

hmm, has been a long time since last time I used openwrt.

Maybe have a closer look what it passes in $PKG_CONFIG (probably a
wrapper script) and what the actual call behind is.

Maybe you have a really ancient pkg-config that doesn't have sysroot
support yet ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
