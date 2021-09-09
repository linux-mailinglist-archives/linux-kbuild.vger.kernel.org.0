Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04589405D56
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 21:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237494AbhIIT34 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 15:29:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:39090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235517AbhIIT3x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 15:29:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DA3B6103E;
        Thu,  9 Sep 2021 19:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631215724;
        bh=P1QW69W98o9fYQWfC2nvqxZ7tCZTgXSiiFrDQUDOq4g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KCcBYkPN1YBlsfHI/xJgEAb+qWL9qW7neS03S58btYL5tyraju+1ILF33AqCqsh1v
         2WetDPFkGrhIxe2biqouVvyezah4rzl06ZxNLFQfhzKLY7K1jAb0zbqLt7mtHpbC4j
         fzLDa/UqdKy3IatHqdqWzp1zPSY5bqcWo91G7Gy00aUxhLH57QMmycBtm86RYToI6X
         nrzqf3L7wMO6qb3rjR0GTc2LPCmRlMEQ2RW6P/asVf9P5CHOvpiKmguhXfGHCexJmC
         SKtGAUt6NK1MPxPo8lqko1KFDvs3cFP7yIrzh+oQtIX3Pz+vj3didenCRaEu1lNrlm
         9AkulQ5RyX6MA==
Subject: Re: [PATCH v2] gen_compile_commands: fix missing 'sys' package
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Kortan <kortanzh@gmail.com>
Cc:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
References: <20210908032847.18683-1-kortanzh@gmail.com>
 <CAKwvOdnReHxf7ysorwTZtN65Hbw4dTk-z8fAQUaKCvEQ_a97eg@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <5fbef4f5-30bb-5cb7-71c5-ae6a48c1822a@kernel.org>
Date:   Thu, 9 Sep 2021 12:28:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnReHxf7ysorwTZtN65Hbw4dTk-z8fAQUaKCvEQ_a97eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/9/2021 10:22 AM, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Tue, Sep 7, 2021 at 8:30 PM Kortan <kortanzh@gmail.com> wrote:
>>
>> We need to import the 'sys' package since the script has called
>> sys.exit() method.
>>
>> Signed-off-by: Kortan <kortanzh@gmail.com>
> 
> I'm quite sure I've run this script before; how have we not noticed
> such an issue before?

Nobody hitting the error paths in this script?

$ cat test.py
import sys

if __name__ == '__main__':
     a = int(sys.argv[1])
     print("a = %d" % a)
     if a == 2:
         printf(os.uname())

$ python3 test.py 1

$ python3 test.py 2
a = 2
Traceback (most recent call last):
   File "/home/nathan/test.py", line 7, in <module>
     print(os.uname())
NameError: name 'os' is not defined

>> ---
>> Changes v1 -> v2:
>> * Fix commit title.
>> * Improve commit message.
>>
>>   scripts/clang-tools/gen_compile_commands.py | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
>> index 0033eedce003..1d1bde1fd45e 100755
>> --- a/scripts/clang-tools/gen_compile_commands.py
>> +++ b/scripts/clang-tools/gen_compile_commands.py
>> @@ -13,6 +13,7 @@ import logging
>>   import os
>>   import re
>>   import subprocess
>> +import sys
>>
>>   _DEFAULT_OUTPUT = 'compile_commands.json'
>>   _DEFAULT_LOG_LEVEL = 'WARNING'
>> --
>> 2.33.0
>>
