Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D63E3EE1E8
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 03:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbhHQBCO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 21:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbhHQBCN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 21:02:13 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4D2C061764;
        Mon, 16 Aug 2021 18:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=7KIG9BZVs2qMGhQa9ZnbyoK8lo4X0onCIPio15oFkQc=; b=rEp1jv3hDyDVXeOfsrvLFdRs0c
        HIlTofKtGKuUo1iV0hV0ibE6/yN3MSwpXdeV7hqnHY8OnkH5VLJRhFfUvmTcZsRTJXTtKVzxXL4uz
        FnQJZpxffus4UcXzWIp4w0fZiOZWRLuxovNn3wqvp/zStAAdc8BjWyJ689u07RVYdgMeatGEtJeI7
        n0q4EBoFbTr37AzTD5C4+aVmh/+RxJx3dNsgF9JsyKY6dTtePjPZsSF8/3L6fobdoW2oJdfKdGEZn
        SN6B1rHrmLV2vCuDwK44aGsIWUza8bjOE8Dx15Btu2DAt7mcE7ipVg/6lTkwwLevFKOASZfmZrz6q
        FBCly80w==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mFnU4-000f5w-Fq; Tue, 17 Aug 2021 01:01:40 +0000
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
 <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
 <CAHk-=whP8o-K2=WWQm=cqx5YTpZcb+KCVvomZ+NeV19CsBMp3w@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4eafc072-1837-737f-973a-a4e0c815cebd@infradead.org>
Date:   Mon, 16 Aug 2021 18:01:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=whP8o-K2=WWQm=cqx5YTpZcb+KCVvomZ+NeV19CsBMp3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/16/21 5:38 PM, Linus Torvalds wrote:
> On Mon, Aug 16, 2021 at 2:33 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> So the warnings that clang gives with -Wmain seem to be much more reasonable.
> 
> In fact, I can't recreate the warning even with gcc and -Wmain.
> 
> I get the feeling that this was a temporary misake in gcc, and perhaps
> only warns in a few very specific versions, and the gcc people already
> fixed this long ago.
> 
> Oh well.

That sounds likely. We can just ignore this if you had rather go that way.

-- 
~Randy

