Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D7D311DAC
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 15:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhBFOb5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 09:31:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:43442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229608AbhBFOb5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 09:31:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A35264E2C;
        Sat,  6 Feb 2021 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612621876;
        bh=t1nxghJC+uJ17Dk0GZXqp+NfezDcXVNpaGO/kJgdTHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PSpEYRP7aWh02tbsPE9rgn3LLCBOp0nBXTHAllTcymz+44qZdy6o89F6iaRsmaNdm
         JjGl5SXOd2XgJKVkzgs5M5zuhxM3ZO9R7aHlJjcCgXKhd7+A+t51V2daFfuAVBTYgd
         yM1PAwmc9iVyPZ+R66Szyph5YtJHiheWUpKJOl7LwdrGNhTKGkVArjkkNj/d9qi6Xj
         fhg3qhH9uroX8OsWJ+OhpUfvaQ0pr/kPvCSoVP+rkBoH0Su0CpNufXeEj8mtu9erVQ
         94zHmwNMHNB43KEiUYtmwL779JfB9S03ahtMPyN6UPwuhIUl/sRHb3INwtNWMKJ7ea
         AtjsOfff5OiaQ==
Date:   Sat, 6 Feb 2021 09:31:15 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@kernel.org
Subject: Re: [PATCH 3/3] kbuild: introduce KERNEL_VERSION2 and
 LINUX_VERSION_CODE2
Message-ID: <20210206143115.GX4035784@sasha-vm>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-3-sashal@kernel.org>
 <CAK7LNASoWNfEAzQYOo7_PqgU61iiZk8i=F-JS38yn5AnfQNhzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNASoWNfEAzQYOo7_PqgU61iiZk8i=F-JS38yn5AnfQNhzQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 06, 2021 at 09:45:44PM +0900, Masahiro Yamada wrote:
>On Sat, Feb 6, 2021 at 12:50 PM Sasha Levin <sashal@kernel.org> wrote:
>> -       ((c) > 255 ? 255 : (c)))'
>> +       ((c) > 255 ? 255 : (c)))';                                       \
>> +       echo \#define LINUX_VERSION_CODE2 $(shell                        \
>> +       expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
>
>
>Is this needed?
>No one in this patch uses LINUX_VERSION_CODE2.
>
>The in-kernel code can use
>LINUX_VERSION_MAJOR/PATCHLEVEL/SUBLEVEL directly.
>
>
>Userspace does not need LINUX_VERSION_CODE2 either.
>
>Your comment in 2/3 states that
>userspace only decodes MAJOR and PATCHLEVEL fields,
>so LINUX_VERSION_CODE will still do well.

Yes, that's fair. I wanted to have that to make it easy for out of tree
code to handle in-kernel ABI changes but as we don't care about such
code there's no strict need for LINUX_VERSION_CODE2. I'll drop it.

>> index ab4b98b3165db..a56bf381335e9 100644
>> --- a/tools/perf/tests/bpf-script-example.c
>> +++ b/tools/perf/tests/bpf-script-example.c
>> @@ -5,7 +5,7 @@
>>   */
>>  #ifndef LINUX_VERSION_CODE
>>  # error Need LINUX_VERSION_CODE
>> -# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
>> +# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
>
>
>Is this change needed?

Good point, no. I'll resend.

-- 
Thanks,
Sasha
