Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D7E496F47
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Jan 2022 01:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiAWAux (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Jan 2022 19:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbiAWAuw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jan 2022 19:50:52 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA2BC06173B
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Jan 2022 16:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=6KE9u0XlQjWwkNX3RMAgCuywJ7c9klJivpGecUK1/sU=; b=j3JBsJ+kfcpGVnbmzoXbrpLfII
        q/ECvxY7IXfY3NnmWNl/akHoq0aTcKUGYaN4mizndMu70t4T/miFfu1W1Kp0GVxcKzZ5X+YiHvYE3
        /wojkuXvWZvi8tCuEXpDRLIICobsGOWFhIwzQKgdT2UTnkyyxmnHNC/PVcwYJsmfFJ5fJOgX33SOM
        nj6eUkITaocNSK2LtJHzbtOxtzlTrx9VLr19Y8FfrC5wdXd6qljjUiPtPctR+ymoSix8JoJP5KFu1
        7pe9XiD1gmWNRC2vmnw4NHBiG84kkOSIVogza5ubrZDK6/Gl6E3ecwsua74fXYJI47TOYHWOOn6h7
        uV9dZ1FQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nBR5i-00Gizb-Sb; Sun, 23 Jan 2022 00:50:47 +0000
Message-ID: <1681956b-27ef-ca64-5295-c82e512dd235@infradead.org>
Date:   Sat, 22 Jan 2022 16:50:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Makefile: uses rsync(1), could this be optional?
Content-Language: en-US
To:     Steffen Nurpmeso <steffen@sdaoden.eu>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <20220120192151.k46VF%steffen@sdaoden.eu>
 <CAK7LNAQOm8NYiTDQnd0P-UsGa7GurffQiWQgGh0Cze4wLmDmgA@mail.gmail.com>
 <20220121163604.QqCVq%steffen@sdaoden.eu>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220121163604.QqCVq%steffen@sdaoden.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 1/21/22 08:36, Steffen Nurpmeso wrote:
> Guten Tag.
> 
> Masahiro Yamada wrote in
>  <CAK7LNAQOm8NYiTDQnd0P-UsGa7GurffQiWQgGh0Cze4wLmDmgA@mail.gmail.com>:
>  |On Fri, Jan 21, 2022 at 4:31 AM Steffen Nurpmeso <steffen@sdaoden.eu> \
>  |wrote:
>  |> I sent this to linux-kernel@vger.kernel.org on the 15th, which
>  |> seems to be legacy.  Just in case someone is wondering about the
>  |> resend.
>  |
>  |I did not see your previous post.
>  |What is bad about using rsync?
> 
> Oh really nothing, but this Linux distribution (CRUX) recreates
> Linux headers before the GNU LibC is build, and this is the only
> dependency of rsync around.  And, unless i am mistaken, the other
> code path is more expensive but otherwise functionally equivalent?

Do we need to add it to Documentation/Changes?

>  |> As a not-yet-tested low-quality Makefile suggestion, with modern
>  |> GNU tools and find(1)'s -printf, wouldn't the following code work
>  |> out gracefully in practice?  (Not subscribed.)


-- 
~Randy
