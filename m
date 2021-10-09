Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB3142778D
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Oct 2021 07:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244214AbhJIFip (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Oct 2021 01:38:45 -0400
Received: from ivanoab7.miniserver.com ([37.128.132.42]:36170 "EHLO
        www.kot-begemot.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIFip (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Oct 2021 01:38:45 -0400
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6] helo=jain.kot-begemot.co.uk)
        by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1mZ52F-0001Sp-3B; Sat, 09 Oct 2021 05:36:39 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
        by jain.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1mZ52C-0001cy-Ei; Sat, 09 Oct 2021 06:36:38 +0100
Subject: Re: [PATCH] um: Add missing "FORCE" target when using if_changed
To:     Randy Dunlap <rdunlap@infradead.org>,
        David Gow <davidgow@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        linux-um <linux-um@lists.infradead.org>, x86@kernel.org
References: <20211008215133.9371-1-rdunlap@infradead.org>
 <CABVgOS=QVysVtN5seB5hp7hHAw5P0yuOaA3rgkRtEyiJu-1H6Q@mail.gmail.com>
 <05939461-793d-2266-8752-1b593bab8eec@infradead.org>
From:   Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <f0ead035-f05b-73fb-1fd4-48c1eff8bc92@cambridgegreys.com>
Date:   Sat, 9 Oct 2021 06:36:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <05939461-793d-2266-8752-1b593bab8eec@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 09/10/2021 01:01, Randy Dunlap wrote:
> On 10/8/21 4:23 PM, David Gow wrote:
>> On Sat, Oct 9, 2021 at 5:51 AM Randy Dunlap <rdunlap@infradead.org> 
>> wrote:
>>>
>>> 'make ARCH=um' says:
>>>
>>> ../arch/x86/um/Makefile:44: FORCE prerequisite is missing
>>>
>>> and adding "FORCE" there makes it be quiet, so do it.  :)
>>>
>>> Fixes: e1f86d7b4b2a ("kbuild: warn if FORCE is missing for 
>>> if_changed(_dep,_rule) and filechk")
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: Michal Marek <michal.lkml@markovi.net>
>>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>>> Cc: linux-kbuild@vger.kernel.org
>>> Cc: Jeff Dike <jdike@addtoit.com>
>>> Cc: Richard Weinberger <richard@nod.at>
>>> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>>> Cc: linux-um@lists.infradead.org
>>> Cc: x86@kernel.org
>>> ---
>>
>> FYI, this looks identical to "uml: x86: add FORCE to user_constants.h":
>> http://lists.infradead.org/pipermail/linux-um/2021-September/001791.html
>
> Oh, thanks for that.
>
> Maintainers?...
>
The patch by Johannes is not in the pending list in patchwork, so it 
looks like Richard has processed it and it will be in the next pull request.

Brgds,

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

