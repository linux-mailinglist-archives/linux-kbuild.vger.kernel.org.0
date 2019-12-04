Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEAC112CC2
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 14:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbfLDNiw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Dec 2019 08:38:52 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:52545 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfLDNiw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 08:38:52 -0500
Received: from [192.168.1.155] ([77.9.37.28]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2EHo-1hdLgq007y-013dvM; Wed, 04 Dec 2019 14:38:42 +0100
Subject: Re: [RFC scripts] Modules info in one liner script
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rdunlap@infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191203072802.GA224932@ArchLinux>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <f38056b7-9633-7ff9-c0f5-19c4ba71bee4@metux.net>
Date:   Wed, 4 Dec 2019 14:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203072802.GA224932@ArchLinux>
Content-Type: text/plain; charset=windows-1252
Content-Language: tl
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DuuhXuvAsD3oFuMQufszYEVdrbefFdC/4UvZPdr56b+QifaBq6T
 133Y26e/wlaaiXOYWkr8MIVBU0k93363gFy8NLI7g5WLN6tc1sN5NgumxdWY8DlQyfINqHu
 jy/swGb7wyWE4NitkHUOBtuBPfvKJR4mOH9ZuapkdqK1ay6FzpXPpq2vKoTk2MhGL/hJPwO
 niYwxvWoFIBgdXS2ZIrZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2so0N0ijyow=:U4d5MDA2MZLAaxGt32LTJH
 HDvCYA/wzQep7F40zbB6vUI1CSW6F4CiORRBpTxuW4JCBcB4czAGPAnzk2AJFVMfwZKyznYzu
 yl0IdEZ6DDmi890lQqpeGyo9DXqD615F9wtOWGHN2kNOve9W4yKRLFBprLuN23GgHKWnsYRWd
 5ZnVHEx2vpvWzZg6QVL/WNQd2RqE7/KWk7IsQqftaeoiMVwz5SGvxuGVGw5lhHmkr1eXGCNqe
 wOdNl4P6vKPWc4yuNP0d2r00375zsMXRYS65bp84slivcXum/OqDCemJs8AsQz0EALaY/DYjc
 sJRaLcipMIaU1uXPHJeQ7IrPzoR1sS6vYbJTmIPspbCeVrSjTj1CF8vyJNftbH4zxQsDOfG/8
 wi112wrNwhzZHBvV3n8r0Qw2/6XMDP468lCpi2WNKpoGLxG+hUPmVdLCV3s/h3DjYu52a8Q3R
 5naEuEYOFeM9OnmHCv64NRtROUWYOQbX/fbqgs7u7K6iqsK5oRiNsQTLuPZLj21dr0SoRLVn3
 gQFuBFiVpK7oOvFEK4a3Zs1yAp3XHPFSug3ZMt62z9Y7jTofqJYKiLQcJSQ+xLrxbUiBx9Rs6
 Q7BxowJkd0Vx0pmx5nay5c4Im0v9pS97UwuzabksbVpCeRzkjJhQetTHtYmbhfJ71LAm2rosb
 lOn8cR0j0c0WjIrrzpguH2Pbypi0xF2/m2ZLygNdp38MDI7Jm8ndMAcP5eJY4t9qipqvYwJ/J
 MvwbxhwJA4gk86WVWdeuIKblKo9VwnBgp8yL7gyRGTZEATwuaRwmbH1qIzPOSLYwHZxPKHlyG
 edJgDyxAbH1KJx0zDwBuG9Od3fjMpGpDTnhyzJxwAiF2GiDCRunFEphEdWBKpuyQ1DhIxop7E
 4hihFKhaPzDw/kAg/zJg==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 03.12.19 08:28, Bhaskar Chowdhury wrote:

> Can we put in a script called "kernel_modules_info.sh"
> under scripts dir??

I'd like to welcome that.


--mtx

---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
