Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7522F3D8541
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jul 2021 03:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbhG1BWJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 21:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbhG1BWJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 21:22:09 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC915C061757;
        Tue, 27 Jul 2021 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=j5GutQxzHEwJUpvD+PoxPI7xCYldNc9Co9wCdAd7+DY=; b=aJ5OQrFrVT0TyHsJE26cfHOC8M
        mwn70MgmW1akXnWiL6397E4oDjB7HNT01RRKDF6LA2k7hIC4kL370GfIjdQbd7+LDtM0l/0YZwc0y
        XAh4RE2kq5vJRbq8YKKNCQXu4qDUMeTtQzJx9CKGssWvxq4raEq0o7r7D+//fDfBKY/QVCIRQeRu+
        v8BUlzXDLgYBAAenvopb80y5MnBrQLAuuk24enxKnx011RtSFLB95mPZvOxWxmL8FE+noCdDQi+Lq
        gnxnu8PXnjIWk+gewSa0P4XN3HCyp2lKvCUmIh8qBQSM65HW9AOxVDi5bmxTiT2wLx1IFELXvJ8DL
        g6/+BcWw==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m8YGt-00GmwT-21; Wed, 28 Jul 2021 01:22:07 +0000
Subject: Re: [PATCH] scripts: make some scripts executable
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
References: <20210727153924.79473-1-masahiroy@kernel.org>
 <YQAsth0TA3AwtxvK@kroah.com>
 <CAK7LNAQM2WzfHdJhukiaeq=qYtJ7U8UbMZdFWSuAJG86bBVHnA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <508c6a7a-0de1-a102-4a48-d29eae188511@infradead.org>
Date:   Tue, 27 Jul 2021 18:22:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQM2WzfHdJhukiaeq=qYtJ7U8UbMZdFWSuAJG86bBVHnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/27/21 6:03 PM, Masahiro Yamada wrote:
> On Wed, Jul 28, 2021 at 12:56 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Wed, Jul 28, 2021 at 12:39:24AM +0900, Masahiro Yamada wrote:
>>> Set the x bit to some scripts to make them directly executable.
>>>
>>> Especially, scripts/checkdeclares.pl is not hooked by anyone.
>>> It should be executable since it is tedious to type
>>> 'perl scripts/checkdeclares.pl'.>>>
>>> The original patch [1] set the x bit properly, but it was lost when
>>> it was merged as commit 21917bded72c ("scripts: a new script for
>>> checking duplicate struct declaration").
>>>
>>> [1] https://lore.kernel.org/lkml/20210401110943.1010796-1-wanjiabing@vivo.com/
>>>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>> ---
>>>
>>>  scripts/checkdeclares.pl               | 0
>>>  scripts/gcc-plugins/gen-random-seed.sh | 0
>>>  scripts/syscallnr.sh                   | 0
>>>  scripts/xen-hypercalls.sh              | 0
>>>  4 files changed, 0 insertions(+), 0 deletions(-)
>>>  mode change 100644 => 100755 scripts/checkdeclares.pl
>>>  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
>>>  mode change 100644 => 100755 scripts/syscallnr.sh
>>>  mode change 100644 => 100755 scripts/xen-hypercalls.sh
>>
>> Please no, as other tools (i.e. patch), can not set mode bits, and some
>> people still rely on patch in places.
>>
>> If these need to be called by other parts of the build, we should
>> execute them properly, not rely on the mode settings.
>>
>> thanks,
>>
>> greg k-h
> 
> 
> I believe tools should be executable.
> 
> If the x bit were missing in scripts/checkpatch.pl
> for example, we would need to run 'perl scripts/checkpatch.pl'
> instead of 'scripts/checkpatch.pl'. That is annoying.
> 
> 
> Most of the scripts under the scripts/ directory
> are already executable, and we rely on that fact.
> Some of them are run directly, and I do not hear
> from anyone who complains about that.
> 
> 
...
> 
> 
> Even if it did not work on somebody's tools,
> the diff files are provided for bug-fix
> releases (for example, 5.13.x), not the entire source.
> 
> Developers (except Andrew Morton) use git
> to merge patches like this, so I see no issue
> on changing the mode.

Sure, once the changes are in a git tree, it's not an
issue, so I don't see a problem with it.
Someone may have to go a few weeks without such a change,
but that's not a big deal.


-- 
~Randy

