Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1671F366539
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Apr 2021 08:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbhDUGNU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Apr 2021 02:13:20 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:27856 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230440AbhDUGNT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Apr 2021 02:13:19 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FQ9Fm5p1Yz9txtZ;
        Wed, 21 Apr 2021 08:12:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id uoidS_nNDIN5; Wed, 21 Apr 2021 08:12:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FQ9Fm52lxz9txtY;
        Wed, 21 Apr 2021 08:12:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C05E8B815;
        Wed, 21 Apr 2021 08:12:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id B5fpCyXSl8YB; Wed, 21 Apr 2021 08:12:45 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 03E478B814;
        Wed, 21 Apr 2021 08:12:44 +0200 (CEST)
Subject: Re: powerpc{32,64} randconfigs
To:     Randy Dunlap <rdunlap@infradead.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <11333059-50b4-35e6-4101-d21e28ffec7d@csgroup.eu>
Date:   Wed, 21 Apr 2021 08:12:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Le 21/04/2021 à 01:31, Randy Dunlap a écrit :
> --- linux-next-20210420.orig/arch/powerpc/platforms/Kconfig.cputype
> +++ linux-next-20210420/arch/powerpc/platforms/Kconfig.cputype
> @@ -1,11 +1,12 @@
>   # SPDX-License-Identifier: GPL-2.0
>   config PPC32
>   	bool
> -	default y if !PPC64
> +	default y if !PPC64 || "$(ARCH)" = "ppc32"

I don't think you need that change. If the ARCH is neither 'powerpc' not 'ppc64' CONFIG_PPC64 isn't 
set so CONFIG_PPC32 is set.


>   	select KASAN_VMALLOC if KASAN && MODULES
>   
>   config PPC64
> -	bool "64-bit kernel"
> +	bool "64-bit kernel" if "$(ARCH)" = "powerpc"
> +	default y if "$(ARCH)" = "ppc64"
>   	select ZLIB_DEFLATE
>   	help
>   	  This option selects whether a 32-bit or a 64-bit kernel
