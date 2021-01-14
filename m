Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEA12F5AFC
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 07:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbhANGwX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 01:52:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbhANGwX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 01:52:23 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A9FC061575
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 22:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=hlkS1QxZsALRMVFQTGedwrYxzDFseML3QGxsY0puuWw=; b=Pu5mrO7AmhvUsOqqqQL1ZivsOm
        fAPw1RxldwY8MnY1whXtpvwptKSBUEEOtPCsFERhXfksQ1QunUAHcIxN6aDLjhvFkMJ1OEjW0KYRL
        o/OgpDQE3wtyholF99ePgCTYZ/U/UOkOC1vJoxsK/9hn3o7HIvHZKSnWJlBTjNNbdRtsOIhUmL0Ou
        lQvYiqU2vKc1w6z+oPUs2+jM9/lcoUbFW5Nm131TP/rruCANZblJoyA6OAKkolc3GATQ3ui4kXg4z
        2YKIUuj3G/mqPXouaENmy17WxMCHwBw672bwhdOTJUJ3tMqZXT+MmpmHy7fCi9JVB8Tz466JrPiQ4
        UBDjKL3g==;
Received: from [2601:1c0:6280:3f0::9abc]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kzwTs-0008GN-Fe; Thu, 14 Jan 2021 06:51:40 +0000
Subject: Re: What CONFIG_ option enables compilation of *.o file?
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Denis Efremov <efremov@linux.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <17c5b8c7-80c4-c2b4-6eaf-704bfabb0a3c@linux.com>
 <CAK7LNAQ+cFYf8TETRYnVdMUQ=_s3XauEv3K_q6sath1NtOWhiw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4d828a83-2f7e-1dd0-8759-fce754635a6f@infradead.org>
Date:   Wed, 13 Jan 2021 22:51:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ+cFYf8TETRYnVdMUQ=_s3XauEv3K_q6sath1NtOWhiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/13/21 10:45 PM, Masahiro Yamada wrote:
> On Sun, Jan 10, 2021 at 3:21 AM Denis Efremov <efremov@linux.com> wrote:
>>
>> Hi,
>>
>> Is there a general way to get information about what CONFIG_ options
>> enable compilation of *.o (*.[ch]) file? Maybe with kconfig command or from
>> some generated files?
> 
> 
> As far as I know, there is no tool or kconfig command to know
> what CONFIG option enables which object.
> 
> I also check Makefiles as you did below.
> 
> 
> 
> 
> This is my workflow.
> 
> I have my own utility functions in ~/.bashrc
> 
> kgrep - grep only Kconfig files
> mgrep - grep only Makefiles
> 
> function kgrep()
> {
>         find . -name .repo -prune -o -name .git -prune -o -type f \
>         \( -name 'Kconfig*' -o -name 'Config.in' \) \
>         -print0 | xargs -0 grep --color -n "$@"
> }
> 
> function mgrep()
> {
>         find . -name .repo -prune -o -name .git -prune -o -type f \
>         \( -name 'Makefile*' -o -name 'Kbuild*' -o -name "*.mk" \) \
>         -print0 | xargs -0 grep --color -n "$@"
> }
> 
> 
> Then, I get this:
> 
> masahiro@grover:~/ref/linux-next$ mgrep floppy.o
> ./drivers/block/Makefile:14:obj-$(CONFIG_BLK_DEV_FD) += floppy.o
> ./drivers/ide/Makefile:92: ide-gd_mod-y += ide-floppy.o ide-floppy_ioctl.o
> 
> 
> 
> Maybe, there is a better way...
> 

I don't know of anything better. I have scripts (instead of functions)
findconfig and findmakefile, but they are not as nice as your functions.




-- 
~Randy
You can't do anything without having to do something else first.
-- Belefant's Law
