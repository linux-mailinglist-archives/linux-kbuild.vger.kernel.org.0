Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1150D112CDD
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 14:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfLDNsx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Dec 2019 08:48:53 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:57053 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfLDNsx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 08:48:53 -0500
Received: from [192.168.1.155] ([77.9.37.28]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MMFdY-1iJKH617Ti-00JHVh; Wed, 04 Dec 2019 14:48:42 +0100
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
 <20191204041543.GA1086470@ArchLinux>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <6ff74f67-11d3-d16f-8aeb-828c01455961@metux.net>
Date:   Wed, 4 Dec 2019 14:48:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204041543.GA1086470@ArchLinux>
Content-Type: text/plain; charset=windows-1252
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rQIVarqS/mfesrZjkt5lAqLbU6vFNbEJjc6FQ1P0T6hgR7f1DFX
 d4kEALAgNCfgQd6BFYGXiVR+sTCv/aHdCGLYYaJSiUIX9QnZQwPl0o7Ora0p4SQQIFNItnV
 NRxNyPbQagCuBpVyBNFKEZ3wd1UNQiTxODAK0I2QDNL+Tu90jZQo2f8PzXfShJD0+2m0nRt
 cHwne+onFShMYgZRg11bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lo7bEjXTHo4=:B9dgbOwiewS8hx95KrTyF+
 2Y1jf2Xid7R4lj571gmGCgWYYpytxErGrVeDj48tq5m/mP+AuL7Ne9ktj5bQPfp1/vy4A00kY
 tVPZ6KyQGGYvV7gMXRd8FDP8Hs0RsLlmPU8EaGU02nvD/6QNolWdoj6jLrLteO0fKYRDiTFFQ
 u3rNRKgkkzamQ65mOiYJ3koFZ2ErJ4QpcQxPHlWvIbxg9r6Fx6eVNES9tQwY60rWjFIYAnSv2
 /BPGSkKE67eRcHw0as8KoFQAEFIhsmxVcxYLaotsmjS8VbbG+zmu9t0AzhTdeMqZm/bEZmqni
 UQfxGaIF4v1iBFPWrGvHDjhuCTzwmDJ2tzF3xnoT6LDM3bcuIt/kBr55wnrvOU36on2NM+xaC
 98BlnebnxPGPDAS91o43XAwtg9zQVZLXDMl8PlbuCsXpDKPlxnhlZzvw0pKjqOxPUI4VNyaaA
 xuLfmgh9Vd/Pk+rJ3eMTJ4rx5zBafLErEZYupbuqxHn5QBpy2mI5/e37HiaMY0CpD4oY2wM/e
 ZkRWP7cNpDJuKc7i75NFR+ZMN//lJqFySxCeIUvekjfeVSzQ4Vu61hxYsAIvh0nT3Ae5+ui5f
 Lx4usy2dk64E6a56fk6dJ4Ew1sG6tMFwHl0Hv+yScZi9sbic7SHIDyDfy2GeLU0tBPO+o2Z28
 6L1VOTX6WMJa5Mvndp6c12N9Na/Vst5iMgdEgh8ojF5EmeqtQRYciAzx+EjoKfi+khcwmwSF0
 fyf/YrbJH8kF1rTssMTTFbLv53HG/LMk5Xe4tST2Axug1i0X/AeGTuGQXU1zjD5P5RcOzoBYI
 JYavRk8XkmZ8Owp9a8LnpYTAfSRKakWBtRHnrEjhjIKyCsTiGfLsNhO+yEpEfHEOUuRtc0VFz
 WyJgShqW/pK8lo0xHOUQ==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 04.12.19 05:22, Bhaskar Chowdhury wrote:

Hi,

> I think the usefulness comes from developers wants to see what are the
> modules are using by the running kernel in formatted way.
> This is very simple way to enlist all the modules with descriptions of
> it.So , they can easily parse it with other scripts.

IMHO, this is a good thing to have. I can even imagine it shipped by
distros, for better bug reports.

OTOH, if it's about the currently running kernel and loaded modules, why
not putting this into /proc or /sys ?


--mtx

-- 
Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/öffenen,
selbst wenn diese von vermeintlich vertrauenswürdigen Absendern zu
stammen scheinen. Andernfalls droht Totalschaden.
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
