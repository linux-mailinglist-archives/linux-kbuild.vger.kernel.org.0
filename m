Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8697372A0A
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 14:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhEDM1U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 08:27:20 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:37189 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230110AbhEDM1U (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 08:27:20 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4FZJwv0lN3z9sVw;
        Tue,  4 May 2021 14:26:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id W02um0mNf2a2; Tue,  4 May 2021 14:26:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4FZJwt6jHxz9sVv;
        Tue,  4 May 2021 14:26:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BCB318B78D;
        Tue,  4 May 2021 14:26:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id oT_wBGJrwVnn; Tue,  4 May 2021 14:26:22 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B7628B7A8;
        Tue,  4 May 2021 14:26:21 +0200 (CEST)
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
 <20210504092225.GS6564@kitsune.suse.cz>
 <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
 <20210504121713.GT6564@kitsune.suse.cz>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <529aef7c-30b1-f6c5-4610-34bd869e4ad4@csgroup.eu>
Date:   Tue, 4 May 2021 14:26:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504121713.GT6564@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Le 04/05/2021 à 14:17, Michal Suchánek a écrit :
> On Tue, May 04, 2021 at 02:09:24PM +0200, Miguel Ojeda wrote:
>> On Tue, May 4, 2021 at 11:22 AM Michal Suchánek <msuchanek@suse.de> wrote:
>>>
>>> Except it makes answering the question "Is this bug we see on this
>>> ancient system still present in upstream?" needlessly more difficult to
>>> answer.
>>
>> Can you please provide some details? If you are talking about testing
>> a new kernel image in the ancient system "as-is", why wouldn't you
>> build it in a newer system? If you are talking about  particular
>> problems about bisecting (kernel, compiler) pairs etc., details would
>> also be welcome.
> 
> Yes, bisecting comes to mind. If you need to switch the userspace as
> well the bisection results are not that solid. You may not be even able
> to bisect because the workload does not exist on a new system at all.
> Crafting a minimal test case that can be forward-ported to a new system
> is not always trivial - if you understood the problem to that extent you
> might not even need to bisect it in the first place.
> 

But you don't need to switch the userspace or the complete build tools to build a kernel with a 
newer toolchain.

All you have to do is take one from https://mirrors.edge.kernel.org/pub/tools/crosstool/

I'm doing everything under CentOS 6, and using one of those tools allows me to build latest kernel 
without breaking anything else.
