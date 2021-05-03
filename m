Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E06237118A
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 08:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhECGR5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 02:17:57 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:37149 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhECGR4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 02:17:56 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4FYXn84YcGz9sTN;
        Mon,  3 May 2021 08:17:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MGmplfnQL6Sb; Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4FYXn83Sl9z9sTM;
        Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5696A8B776;
        Mon,  3 May 2021 08:17:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id CP2hKwLive3m; Mon,  3 May 2021 08:17:00 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 140408B775;
        Mon,  3 May 2021 08:17:00 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
        linux-kbuild@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <20210501151538.145449-1-masahiroy@kernel.org>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
Date:   Mon, 3 May 2021 08:16:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Le 01/05/2021 à 17:15, Masahiro Yamada a écrit :
> The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> GCC 5.1.
> 
> When we discussed last time, we agreed to raise the minimum GCC version
> to 5.1 globally. [1]
> 
> I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.

One point I missed when I saw your patch first time, but I realised during the discussion:

Up to 4.9, GCC was numbered with 3 digits, we had 4.8.0, 4.8.1, ... 4.8.5, 4.9.0, 4.9.1, .... 4.9.4

Then starting at 5, GCC switched to a 2 digits scheme, with 5.0, 5.1, 5.2, ... 5.5

So, that is not GCC 5.1 or 5.2 that you should target, but only GCC 5.
Then it is up to the user to use the latest available version of GCC 5, which is 5.5 at the time 
begin, just like the user would have selected 4.9.4 when 4.9 was the minimum GCC version.

Christophe
