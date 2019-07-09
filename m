Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E3263420
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 12:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfGIKUz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 06:20:55 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58287 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGIKUz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 06:20:55 -0400
Received: from [192.168.1.110] ([95.118.92.226]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MTzOe-1hu2Lk1AY6-00R3x3; Tue, 09 Jul 2019 12:20:46 +0200
Subject: Re: [PATCH v4] builddeb: generate multi-arch friendly linux-libc-dev
 package
To:     Cedric Hombourger <Cedric_Hombourger@mentor.com>,
        yamada.masahiro@socionext.com
Cc:     ben@decadent.org.uk, isar-users@googlegroups.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, riku.voipio@linaro.org
References: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
 <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com>
 <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <37f96102-34bf-db52-720a-d8c83965f8dc@metux.net>
Date:   Tue, 9 Jul 2019 12:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:01KwzInSFIyuMjI2/YRlkHr4Oxu90BE2Uv/1vfXjAicPnoFNneY
 b1cvTmxwIcNFk9HW9awTpwm4NqrvQkEgaC0Lzpx/b8Zkmt/wcYhE8nAAXt24stQUkzjAHP/
 +DQ5naQopMMJcWukvr4QHtnNTmLXGkI+6R+v6DZnVC6LWa31P64mRsi2IJ1DWo07K6K52K5
 pSb4oP0fHtyQ+oifMcJZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dh7WokawuoU=:r9SjN0kX4WbSyymqJE2xXe
 PlSEDMl7RY67Hz/lP08/a0N9mQb9Fc8eev0zTgNuFTHIHR3lR/c1pASTRvU96yHG9d3egqqHP
 ZoXYO0Uaf2aBX16Ot02XQxmt0tiDDFlWlMlHUYtp8QH1LBOPBG8Fp/3gUQvQX4RR5z70rKCk0
 bzpxh3qlpBBod4CjjLrN6oDOZuq+SSpFxrEXJSL3D1LWeq9VWhCV0HzcKngi/gX5ZTeZ0hmIg
 CIYg1TdiSk+Ofbtw8onSb2c7/yhaq7FBnLEsvNG7hhehubkdZUhoL+fG/F1Yce4mf22SBTkwJ
 ihwcfU30EJfvutEjyxsZ3eP6+OKz8otwOpGGqQ5eaw4ZX2QoFmiwluQDpgtNTPydlSM61DS3y
 BS91Yw6lrdsUbsN8YT3bCoOqRv2p6nym6tQxc3DFLVQOW8nGNjjQbuuoLKzQgy5nZkC8q7z6w
 KJhcNExKp6Ir0k7+bKQ+WF/A5gzM/0M6caJmmEqfi9Jhnykh5dhQeaMrMkLpBgQCr0KSploda
 YXRgNL4F1F0zeBKglxmkNN2fIZPiTP0q162q95eR8maZlH55qOo7LvxHw/9d2opsYksbVcO+G
 8hG/fToF/6ztddvmWVv+J9KmcP3pHVI7bh5LhmNX2dbcx1fidP+p02ODi9bO9gRP89wkj7v+r
 2vIn7BkMJxW90FZvITz/zpqKXkXkScHLRKf+8uk0G1fXcODCsXGm34oQn6ut6AwvLKYFUZShc
 9zzEn44ZHPY96OVpx/xLxM8ieLfc99b4pEeHUaZWSKEVlWMXmitW59Apqew=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 09.07.19 09:43, Cedric Hombourger wrote:
> Debian-based distributions place libc header files in a machine
> specific directory (/usr/include/<libc-machine>) instead of
> /usr/include/asm to support installation of the linux-libc-dev
> package from multiple architectures. Move headers installed by
> "make headers_install" accordingly using Debian's tuple from
> dpkg-architecture (stored in debian/arch).

Is it correct the packages currently are not multiarch-compatible ?

If so, your patch would be another step towards completely replacing
the downstream's utterly complex build process :)

I'll give it some test cycles.

thx.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
