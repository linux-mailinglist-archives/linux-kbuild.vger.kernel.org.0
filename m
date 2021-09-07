Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF39403129
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 00:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240071AbhIGWnL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 18:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhIGWnL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 18:43:11 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92436C061575;
        Tue,  7 Sep 2021 15:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=cgU+bSRWkgQbjbTYWVtop6TutVa0+8sECDPga2WxPJ0=; b=hH0ey3gKs99jalCd/bE9dKnWeh
        YGUpKDVsO1lLUb62Te01hx69O9aNKm8+HPelyfZuDY0fjiU/mMPtc1yPcDM3KfL1+/QYfyW4TepmM
        o/WvDDCgfZetkbvHH9teuf3LmqKHAjih3By6CbsronjSiZd+Os/JNfnY63C4LNzKy3TFELNQXNraU
        2LDBOmWtTCAwCMVaRdLLFSBDR/e0FAaXg5Y0C35GwQpBHrMPJeDbEEULYkvmrq3Hcwh3XSi1WBBIS
        6Oe3w6I07Hvof4bbCQU1iOEbQ7dbqFoB8KHwdg8geZzHTFOEPkxMmKmgXpRdYgBSFu9kqCKvi44fW
        MyOkscUQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mNjn1-004y8l-6W; Tue, 07 Sep 2021 22:42:03 +0000
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
References: <20210813224131.25803-1-rdunlap@infradead.org>
 <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
 <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <73ee98a4-c4a5-04f3-6280-dcd67507d889@infradead.org>
Date:   Tue, 7 Sep 2021 15:42:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/16/21 5:33 PM, Linus Torvalds wrote:
> On Fri, Aug 13, 2021 at 2:01 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>>  From a quick google, it seems like '-Wmain' means something else for
>> clang. But it is probably ok.
> 
> So the warnings that clang gives with -Wmain seem to be much more reasonable.
> 
> Which makes me think that the '-Wno-main' thing would likely be better
> as a gcc-only thing.
> 
> Maybe something like this instead?
> 
>                Linus
> 

Linus,

Can we get your version of this patch merged?


Tested-by: Randy Dunlap <rdunlap@infradead.org>

Should I resend the full patch?

---
  Makefile | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index c19d1638da25..a33fba083df7 100644
--- a/Makefile
+++ b/Makefile
@@ -803,6 +803,8 @@ else
  # Disabled for clang while comment to attribute conversion happens and
  # https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
  KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
+# gcc inanely warns about local variables called 'main'
+KBUILD_CFLAGS += -Wno-main
  endif
  
  # These warnings generated too much noise in a regular build.

