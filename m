Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B93429749
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Oct 2021 21:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhJKTJl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Oct 2021 15:09:41 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:50668 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233481AbhJKTJk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Oct 2021 15:09:40 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0UrVMcls_1633979251;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0UrVMcls_1633979251)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 12 Oct 2021 03:07:35 +0800
Subject: Re: [PATCH] [PATCH V2]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sami Tolvanen <samitolvanen@google.com>, frederic@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, yifeifz2@illinois.edu,
        Steven Rostedt <rostedt@goodmis.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, andreyknvl@gmail.com,
        Colin King <colin.king@canonical.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-hardening@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <1633878992-32884-1-git-send-email-ashimida@linux.alibaba.com>
 <CANiq72nBqiyrcaW47ZW-6i7zJ6HrmjZWSOr==HkEuBR5rXmpdQ@mail.gmail.com>
 <a25b9286-fc1f-d398-150c-ce073eadc6c1@linux.alibaba.com>
 <CAKwvOd=D=UvGfHjEyeYPk3c=ksg9mF8nUX-9jyJhkX8QbugMSQ@mail.gmail.com>
From:   Dan Li <ashimida@linux.alibaba.com>
Message-ID: <fefdacd0-787b-d03e-2ead-ac10641b4eb2@linux.alibaba.com>
Date:   Tue, 12 Oct 2021 03:07:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=D=UvGfHjEyeYPk3c=ksg9mF8nUX-9jyJhkX8QbugMSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/12/21 1:23 AM, Nick Desaulniers wrote:
> On Mon, Oct 11, 2021 at 8:42 AM Dan Li <ashimida@linux.alibaba.com> wrote:
>>
>>
>>
>> On 10/10/21 11:43 PM, Miguel Ojeda wrote:
>>> On Sun, Oct 10, 2021 at 5:16 PM Dan Li <ashimida@linux.alibaba.com> wrote:
>>>>
>>>> -         This option enables Clang's Shadow Call Stack, which uses a
>>>> -         shadow stack to protect function return addresses from being
>>>> -         overwritten by an attacker. More information can be found in
>>>> -         Clang's documentation:
>>>> +         This option enables Clang/GCC plugin's Shadow Call Stack, which
>>>> +         uses a shadow stack to protect function return addresses from
>>>> +         being overwritten by an attacker. More information can be found
>>>> +         in Clang's documentation:
>>>
>>> Perhaps it could be worded in a better way? It sounds like it is a
>>> custom plugin for Clang as well, e.g.:
>>>
>>>       This option enables Shadow Call Stack (in the case of GCC, as a plugin),
>>>
>>> Cheers,
>>> Miguel
>>>
>>
>> Thanks Miguel.
>>
>> How about writing like this:
>> This option enables Shadow Call Stack (supported as a compiler option in
>> the case of clang, supported as a plugin in the case of gcc), which uses
>> a shadow stack to ...
> 
> That sounds reasonable.
> 
> One question I have Dan, what is your sense for getting this feature
> landed upstream in GCC proper?  It's neat to be able to use plugins to
> support older versions of a compiler than when the feature initially
> lands; I was curious if you're working to submit this into GCC as
> well?  I didn't see anything in GCC's bug tracker for "shadow call
> stack," but maybe there's a different feature bug tracking this?
>

Thanks Nick.

The original intention of this plugin is to provide the customer's (bsp)
kernel with the ability to enable SCS protection under gcc. It's not
always feasible to recompile gcc or convince customers to switch to a
higher version, so I implemented this feature through a plugin. For bsp,
this method could reduce its use cost.

Because my main area of concern is kernel security, I first submitted
this plugin to the community.

I think [PATCH V2] can also be submitted to the gcc mainline. This is
my next plan, and I still need some time to reorganize it into the gcc
source code.

