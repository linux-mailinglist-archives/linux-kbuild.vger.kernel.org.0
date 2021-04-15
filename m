Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CB83602E7
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 09:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhDOHCj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 03:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhDOHCj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 03:02:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291B3C061756;
        Thu, 15 Apr 2021 00:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=ETsYPx0s93tU+yLXtPIeTjN/J9a5+YKX+yXBAFm3pew=; b=WNPaRv9zb6QF/wmV3SNXugP5Ce
        l3npxzN6FiBcSTymeJiguEGY54kzhIYnZ3e2IAoirj6GsVb/D5CICH7oFyn47heSoqVSJtJmZA/T2
        O0Pe2GM2tgPDBU0cEPZ7gEMuJG1ms0FN0E68zQB2Ox9OyAfb9jnViZDfCHII+vl7vbnJNIs+g+fRp
        5b03HM+5XA1E0UBdLqCztQaNvibvSC8Wr00Kygcy2qoipzVKK+x1jrYzoJu6RZDxhYvNcHftJSED4
        Ary6nQ2Od20qjT3po3VdUQauer6F/hu1sMbVrZ8R1qAdfkf0QhbTpZ9kI0OMBzMJL8hHa61SNo6Qe
        xGAxGl3A==;
Received: from [2601:1c0:6280:3f0::df68]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lWw04-008AXo-Dn; Thu, 15 Apr 2021 07:01:25 +0000
Subject: Re: [PATCH] uml: fix W=1 missing-include-dirs warnings
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
References: <20210414192657.17764-1-rdunlap@infradead.org>
 <CAK7LNARSK2YspYvKkUKTp-aG2nqKnvdMr7B_6Am-u1-mt2XBNg@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c3d41808-111c-c4dd-43fb-459ae56fc9ab@infradead.org>
Date:   Thu, 15 Apr 2021 00:01:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARSK2YspYvKkUKTp-aG2nqKnvdMr7B_6Am-u1-mt2XBNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/14/21 11:52 PM, Masahiro Yamada wrote:
> On Thu, Apr 15, 2021 at 4:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Currently when using "W=1" with UML builds, there are over 700 warnings
>> like so:
>>
>>   CC      arch/um/drivers/stderr_console.o
>> cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
>>
>> but arch/um/ does not have include/uapi/ at all, so don't
>> include arch/um/include/uapi/ in USERINCLUDE for UML.


>> Option 4: simply mkdir arch/um/include/uapi
>>         That's what I did first, just as a test, and it works.
> 
> 
> I like Option 4.
> 
> But, you cannot do "mkdir -p arch/um/include/uapi" at build-time
> because the build system should not touch the source tree(, which
> might be read-only)
> for O= building.
> 
> How about adding
> 
>   arch/um/include/uapi/asm/Kbuild,
> 
> which is just having a SPDX one-liner?

Wow!  :)
That's what Al Viro suggested also.
I'll submit that patch later today (Thursday my time).

thanks.
-- 
~Randy

