Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13DE917BC13
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2020 12:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgCFLso (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Mar 2020 06:48:44 -0500
Received: from foss.arm.com ([217.140.110.172]:60206 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgCFLso (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 06:48:44 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E67B131B;
        Fri,  6 Mar 2020 03:48:43 -0800 (PST)
Received: from [10.37.12.171] (unknown [10.37.12.171])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6294B3F6C4;
        Fri,  6 Mar 2020 03:48:41 -0800 (PST)
Subject: Re: [PATCH v6 16/18] kconfig: Add support for 'as-option'
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        James Morse <james.morse@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1583476525-13505-1-git-send-email-amit.kachhap@arm.com>
 <1583476525-13505-17-git-send-email-amit.kachhap@arm.com>
 <CAK7LNAS63ed8zfoKukgHHmqVNEptXPh8XJTv-Zkh0ba=fLN+XQ@mail.gmail.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <8a332026-9c28-f7d5-95d4-3c44275fcf72@arm.com>
Date:   Fri, 6 Mar 2020 11:49:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS63ed8zfoKukgHHmqVNEptXPh8XJTv-Zkh0ba=fLN+XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On 3/6/20 11:37 AM, Masahiro Yamada wrote:
> On Fri, Mar 6, 2020 at 3:36 PM Amit Daniel Kachhap <amit.kachhap@arm.com> wrote:
>>
>> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>
>> Currently kconfig does not have a feature that allows to detect if the
>> used assembler supports a specific compilation option.
>>
>> Introduce 'as-option' to serve this purpose in the context of Kconfig:
>>
>>         config X
>>                 def_bool $(as-option,...)
>>
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Cc: linux-kbuild@vger.kernel.org
>> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
>> ---
>> Changes since v5:
>>  * More descriptions for using /dev/zero.
> 
> 
> FYI:
> 
> This has been fixed:
> 
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=3c968de5c7d1719b2f9b538f2f7f5f5922e5f311
> 
> 
> So, this will not be a problem for the
> future release of binutils.
> 
> Anyway, we need to take care of the released ones,
> so I am fine with /dev/zero.
> 

Thank you for letting us know.

I did not realize it was a compiler issue otherwise I would have reported it. I
thought it was a mechanism to prevent people from trashing their code, but
thinking at it more carefully, for devices does not make sense hence it is good
that there is a fix already.

[...]

-- 
Regards,
Vincenzo
