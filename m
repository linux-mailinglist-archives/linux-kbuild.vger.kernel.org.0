Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431C6256BCA
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Aug 2020 06:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgH3Eye (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Aug 2020 00:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgH3Eyb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Aug 2020 00:54:31 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77835C061573;
        Sat, 29 Aug 2020 21:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=SEyi2hjOLQTA3nOywa2alQdlx/kxn/+UPBbehz2Dc0A=; b=O4jL3LNr0gpZwHWrNepmhf8nCN
        /o0Z2bnjMzGcwz2jAGZs3JR95N26e9tw8Z+R2YqLwt4YGHCX1k60WZ+6orpZaz59vgZmCpJ4D545A
        4hgHkvJ14G1U8osv74r3aRi/y4+hC1tkcwpH93kdybXRU7EUuI7tBpj1GXNU51AeEgSSduzMtvuHY
        azfpIQP0PNGY5F+Uwa/X7TJAcc0q7pLvF9VTh/o9hs1XvZJ4PTe19YkaElhc/LsxkvKvA3Hiv2DSC
        aockrRP0wS3KPFL+i4cO0V8A9D2Vho7TTqUAxPb468vo9v8uQPtkvnNStC5hQA8YVygyf0rP4coy6
        BBxLNlAw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCFML-0006Yk-Jp; Sun, 30 Aug 2020 04:54:30 +0000
Subject: Re: [PATCH 05/11] kconfig: qconf: show data column all the time
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200829081417.725978-1-masahiroy@kernel.org>
 <20200829081417.725978-5-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <25add4c8-fc8d-9874-2e34-b45cc7ae675e@infradead.org>
Date:   Sat, 29 Aug 2020 21:54:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829081417.725978-5-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/29/20 1:14 AM, Masahiro Yamada wrote:
> The next commit will allow users to edit "int", "hex", "string"
> menus in-place from the data column.
> 
> The data column should be always displayed.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/kconfig/qconf.cc | 29 +----------------------------
>  scripts/kconfig/qconf.h  |  5 +----
>  2 files changed, 2 insertions(+), 32 deletions(-)
> 

I am trying to edit LOG_BUF_SHIFT, which has a value of 17
(this is x86_64).

I want to change the 7 to 9, making it 19, so I double-click on the "17"
(single-click won't give me an edit cursor). The edit cursor is
immediately after the "17", so it's like
						17|
with the | cursor blinking. What I expect to be able to do is
Backspace, enter 9, press Enter, and the new value is 19.
But Backspace does nothing. I just have to enter the complete new
value: 19. So IMO it does not act like an edit box so much as a
replacement box.
Also, the new value that I enter is displayed/written over the old value,
so I see 17 in white-on-blue and over that I see 19 in black until I
press Enter, then I see only 19 in white-on-blue.

BTW, if I edit DEFAULT_HOSTNAME, which begins as "(none)" and I change it
to "xyz" and then change it to <empty string>, it becomes
CONFIG_DEFAULT_HOSTNAME=""
Should I have to enter "(none)" to get it back to (none)?  I guess so.



-- 
~Randy

