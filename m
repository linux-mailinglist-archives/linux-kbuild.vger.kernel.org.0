Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057A7366584
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Apr 2021 08:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbhDUGiQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Apr 2021 02:38:16 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:59135 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236179AbhDUGiP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Apr 2021 02:38:15 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FQ9pW5YjDz9vBL9;
        Wed, 21 Apr 2021 08:37:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id phNIlNfk3983; Wed, 21 Apr 2021 08:37:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FQ9pW4fphz9vBL5;
        Wed, 21 Apr 2021 08:37:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 897C08B814;
        Wed, 21 Apr 2021 08:37:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id jDdmFEAAGsOM; Wed, 21 Apr 2021 08:37:40 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A3458B770;
        Wed, 21 Apr 2021 08:37:40 +0200 (CEST)
Subject: Re: powerpc{32,64} randconfigs
To:     Randy Dunlap <rdunlap@infradead.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <21339633-16cb-c2ec-1517-2f5c4897fba1@csgroup.eu>
Date:   Wed, 21 Apr 2021 08:37:36 +0200
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
> --- linux-next-20210420.orig/arch/powerpc/kernel/vdso64/Makefile
> +++ linux-next-20210420/arch/powerpc/kernel/vdso64/Makefile
> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-bu
>   asflags-y := -D__VDSO64__ -s
>   
>   targets += vdso64.lds
> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
> +CPPFLAGS_vdso64.lds += -P -C -U$(SRCARCH)

Maybe it would be better to do -Upowerpc like in VDSO32

>   
>   # link rule for the .so file, .lds has to be first
>   $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
> --- linux-next-20210420.orig/arch/powerpc/Makefile
