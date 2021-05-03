Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7511A3715D9
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 15:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbhECNSh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 09:18:37 -0400
Received: from mout.gmx.net ([212.227.17.20]:48233 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234234AbhECNSh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 09:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620047851;
        bh=TmR7smPPbyIXc3idtmR5f78hGH40oDdZ4CxoXbIedYc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=RNwxb+s4MAb2ZK3gpW0qd7SSOoF/sF/fKmRRPcggKsbLKXOAjKaS9tKfLnQlQIMXU
         7uDCPhXWbgKYhInig/GV7bvMPveLYosnwxoJISj1cwfwR6mgTDtgU9yQZkE6Ihs8lY
         wdvlMtzW8PqPB8XaqPNe4s5tjqBZdtT9q8mOkl54=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.2]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1lDnLK2NMT-00qBpd; Mon, 03
 May 2021 15:17:31 +0200
Subject: Re: [PATCH 2/2] arch: use cross_compiling to check whether it is a
 cross build or not
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org
References: <20210501172437.156926-1-masahiroy@kernel.org>
 <20210501172437.156926-2-masahiroy@kernel.org>
From:   Helge Deller <deller@gmx.de>
Message-ID: <939b93cf-a116-da76-8fde-fa4fe1b42ce4@gmx.de>
Date:   Mon, 3 May 2021 15:16:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210501172437.156926-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+BWosmDLZL+SwICEc9moO+GCLWjW3cWM69iEf7Du7KjLcVNghcL
 +aIUj4GvD2LvQvte8kMgImNMLp6UgaEp8nobmB6wFwpL7YnCwq/+iwDKPiBoj/qZF6cEKjk
 LDOf1pPVli7KWZr68QsV/ewAPgX3tGLKnmo2Ob/izzOYNTQmVNBt6Zsw2XZUKgel/oWIT4J
 daLIq3nNmRKedAe1VOXTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NNTFDPnPx0A=:14K/UbOvRZpS1Wo61BrZl2
 rh53Cse1MU3HmTUtCH/wuZTVmP1QBB0XwMRsuWedqP/1JG8ZB/mDA7wpzsPJElVSvgdNPp+7w
 EfYblIkWUunNe4wuwGshi+W1+fTZw7dIaBaagO8o89UF/XuIhry08GMqNTRD51ewpTFcMOwWT
 WrHHFEiDdyPAkR+WKEFU1PBjF9DHKKHYu+HFxhs8T5AH82lVAaQLVtt1Cmki29rd8aVlcVP7Q
 IXpNKufvWkt9SOiStCH09FmHuUNssSvAphvK4gGzki2b53rjklfLWj0zUikJVauFH8OR7uugx
 bxg6TT3rH3FvMTY0F245GifLANa6vu9ggAkwiNgxW/9cTG5Eaf2eoG7hh7JeJN7Al2fTbKYYz
 NCLplGUSJN2Z+aidcxVBvY6nFbDbiUiclQm7wVEOMyYvJczBozp6jTpVKZfAwnBSmkSaC2sEa
 5+1YTYcOz62aPnv00/23QlJF5hriarN46IJC+lMLuetpjueg6oT/kiuzL4QgHLs+0ambW9JQs
 Q5WUgb7a1STv3y+uij1bipsy724UL6qGfnTmVldUgJhdUQwP/UU/NVHOZzBvF+fnD9JiLO1Gg
 8snk78k1B6dKVW20N9ivWIg53RjceJD3fFhjDYv3f0JuYuggMSQW8l19JDz3y3EpTWp82T5Qj
 MMZ0UBlNfZL8fX3uYDqmX/64WK9DEC8/7IgFPRMQq1qLqiM9fHORGemj4dJM4iHufXL3GOgSB
 MQXt5CFfqzEJGNfiTTduPEglimTv10uvb7dRXH7sRAAfJViGb7UVbcuuqeoUyUpR5YmPVCArw
 iGQdQPHwSK6g9v7tm2W2/LpzDOnFP5HQYA/gV2B/rlHGWUhLeEkEgk6HulH/Kr54rjwwVPRLN
 x7nMuPIBLRTG4VLxmn55Ez3X+Cu4FiynOXx+uIAELa2zMIm9Q4sI5QWjQG4Q1uusktkcbce0m
 6gJYgJdIZm1CunIv+9PffbDLUqBuNxCFITH1bCY/fnPFVmfd1WaVLBXiKbvUasJb8JPiTouRQ
 XfRMCBNyFQcyyg+Wh6HOVDGl5ElN2c+HXOrZDz7gZ9ZRPUfR/K+ysUPr5DpP5nj40IPGEa/3j
 PeBIMyLNAUU339xt7fh3gA3S/W+wSAIEOq/D4PieBEn8gvCUJmdn2qH3gprCt4xe5MEaarKnM
 aTPCBDNrlLe2wSBUdq2hhHP2LdgXFf3LdtFsypulpXiwwL5EcTjv6Ey0NjI4TuPKHxOUQ=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/1/21 7:24 PM, Masahiro Yamada wrote:
> 'cross_compiling' is defined by the top Makefile and available for
> arch Makefiles to check whether it is a cross build or not. A good
> thing is the variable name 'cross_compiling' is self-documenting.
>
> This is a simple replacement for m68k, mips, sh, for which $(ARCH)
> and $(SRCARCH) always match.
>
> No functional change is intended for xtensa, either.
>
> This is rather a fix for parisc because arch/parisc/Makefile defines
> UTS_MATCHINE depending on CONFIG_64BIT, therefore cc-cross-prefix
> is not working in Kconfig time.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>   arch/m68k/Makefile   | 2 +-
>   arch/mips/Makefile   | 2 +-
>   arch/parisc/Makefile | 2 +-

Acked-by: Helge Deller <deller@gmx.de>  # parisc

Thanks!
Helge
