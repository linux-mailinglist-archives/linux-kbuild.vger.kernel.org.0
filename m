Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8047440EA20
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Sep 2021 20:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350330AbhIPSnz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Sep 2021 14:43:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349179AbhIPSnn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Sep 2021 14:43:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E065610A6;
        Thu, 16 Sep 2021 18:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631817742;
        bh=W8lmbPG+Y7dzqY16kJIWhu7Hte7q4CpDtoM8X9UOKiM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=naUyEq4E5gf3apJKSzndPpK7/aIAe+JSS11lI1ZBRDlVSeotuOczaxJ43zzK02LCa
         rD3zGSc2Lt9KEmwk6RQu+UkOMlTQV3sRshuH5PhUWy/lrT2A2CpGegUCx7um3fzi38
         RF9IbCMzODaL9mRzNiW3jG90gQL3l4SZqKVnvSR0weYqu50gEIHWshudMnbxMbpm8y
         hiwGHnyfCFhuudQvDt5AxlfqDL4syXomLcCqritQb7WuhdDR/9rTsJwMC9D5jPaXsY
         MmJOhQdSp3koJVBFRx6b4cgp3fbUnfXHUsvqtRXwk2HYpWwpMNt+8B9lW1qzbdXT2I
         WDdzk2HDk0KVw==
Subject: Re: [PATCH 1/2] x86: Do not add -falign flags unconditionally for
 clang
To:     Borislav Petkov <bp@alien8.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
References: <20210824022640.2170859-1-nathan@kernel.org>
 <20210824022640.2170859-2-nathan@kernel.org> <YUN8coiEx3JZQytc@zn.tnic>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <4d88e0ed-422d-447a-ea8f-36e54b38fac1@kernel.org>
Date:   Thu, 16 Sep 2021 11:42:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUN8coiEx3JZQytc@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/16/2021 10:18 AM, Borislav Petkov wrote:
> On Mon, Aug 23, 2021 at 07:26:39PM -0700, Nathan Chancellor wrote:
> 
> A couple of nitpicks:
> 
>> Subject: [PATCH 1/2] x86: Do not add -falign flags unconditionally for clang
> 
> Make that prefix into "x86/build: "

Done, I'll be sure to keep that prefix in mind for future flag-based 
changes.

>> clang does not support -falign-jumps and only recently gained support
>> for -falign-loops. When one of the configuration options that adds these
>> flags is enabled, clang warns and all cc-{disable-warning,option} that
>> follow fail because -Werror gets added to test for the presence of this
>> warning:
>>
>> clang-14: warning: optimization flag '-falign-jumps=0' is not supported
>> [-Wignored-optimization-argument]
>>
>> To resolve this, add a couple of cc-option calls when building with
>> clang; gcc has supported these options since 3.2 so there is no point in
>> testing for their support. -falign-functions was implemented in clang-7,
>> -falign-loops was implemented in clang-14, and -falign-jumps has not
>> been implemented yet.
>>
>> Link: https://lore.kernel.org/r/YSQE2f5teuvKLkON@Ryzen-9-3900X.localdomain/
> 
> Also, there should be a second Link: tag which points to this mail
> thread so that we can find it later, when we dig for the "why we did
> that" question :)
> 
> I.e.,
> 
> Link: 20210824022640.2170859-2-nathan@kernel.org

Sure thing, kind of hard to do that on the initial submission but I will 
do it for the v2 shortly :)

>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>   arch/x86/Makefile_32.cpu | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> with that:
> 
> Acked-by: Borislav Petkov <bp@suse.de>

Thank you for the ack. The conflicting changes that I mentioned in the 
cover letter have been merged in 5.15-rc1 so if you guys want to take 
these changes via -tip, just holler for an ack from Masahiro on the 
second patch on v2 (but I am going with the assumption this will be 
merged via the kbuild tree).

Cheers,
Nathan
