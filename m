Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D723EBEFB
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Aug 2021 02:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235776AbhHNA3g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 20:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235746AbhHNA3g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 20:29:36 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7F2C061756;
        Fri, 13 Aug 2021 17:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=3ytcuNKrUYyEpzQAg5Vbs9xRcoKj59oPLdwRg+fuDi4=; b=E0m7L18VxLNdUox/pvclOZthc5
        XGy0reRyYCopsPI/QKNIR4hUlZzx9JYo0PgMFNGywBvcXdHH2LHblDot87fYyP9+fr9QFEjFF4426
        0Q7S1v9NTAfQQ4GEHLRISnZkGN6Dv2AAFFeCndIeZSMZBSvyNavpFtCDXYYYcR016grO4VMG1H8lY
        NRDtjXp+lNw8hzZkY6nMDzzlWWFWngcoZJcASDcmmyL5oA7msQaToKYH0diL160YmxjwceVhAN1Yl
        LUHaeKndk1uG19QgqWnO936LO7GnGNTYCBP8s1jToLMZV7eSmOrAPnQVtDRoHvd2pZT6yW86brl6U
        k5ZC/Luw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mEhXu-00DiKV-9s; Sat, 14 Aug 2021 00:29:06 +0000
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <20210813224131.25803-1-rdunlap@infradead.org>
 <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <71efee23-92fd-2d19-47cb-ece2e50f0bc8@infradead.org>
Date:   Fri, 13 Aug 2021 17:29:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/13/21 5:01 PM, Linus Torvalds wrote:
> On Fri, Aug 13, 2021 at 12:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Build-tested on most ARCHes.
> 
> How about old versions of gcc? Or clang?
> 
>  From a quick google, it seems like '-Wmain' means something else for
> clang. But it is probably ok.

Dunno. Let's just let it ride in linux-next for a bit to see what it hits.


