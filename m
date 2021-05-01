Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3354F37084C
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 May 2021 19:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhEARvI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 May 2021 13:51:08 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:57807 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230450AbhEARvH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 May 2021 13:51:07 -0400
X-Greylist: delayed 719 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 May 2021 13:51:07 EDT
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4FXc090hfmz9sS5;
        Sat,  1 May 2021 19:38:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1YuCsbxWugQ6; Sat,  1 May 2021 19:38:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4FXc086Xtbz9sS4;
        Sat,  1 May 2021 19:38:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id C4A668B770;
        Sat,  1 May 2021 19:38:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 1mDE3OxKH6Jr; Sat,  1 May 2021 19:38:16 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BD8A88B763;
        Sat,  1 May 2021 19:38:15 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2ecdbfed-82c4-b0cb-85dc-857b3b06b353@csgroup.eu>
Date:   Sat, 1 May 2021 19:38:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Le 01/05/2021 à 17:52, Miguel Ojeda a écrit :
> On Sat, May 1, 2021 at 5:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> More cleanups will be possible as follow-up patches, but this one must
>> be agreed and applied to the mainline first.
> 
> +1 This will allow me to remove the __has_attribute hack in
> include/linux/compiler_attributes.h.
> 
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> 

On powerpc this will allow us to remove commit https://github.com/linuxppc/linux/commit/592bbe9c505d

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Christophe
