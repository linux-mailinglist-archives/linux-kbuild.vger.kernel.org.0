Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A74A443893
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Nov 2021 23:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbhKBWlK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Nov 2021 18:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbhKBWlJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Nov 2021 18:41:09 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300C5C061203;
        Tue,  2 Nov 2021 15:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=HtYCPW7emSKIQO/wcR8gaEJjILxPAOty5YVSR6ISMlg=; b=eXguMIE4zsqJRn3ikfbvL6D2eM
        SqGSTtTurbAqNiyYCYCM+eN5dDb4DCBXvvuCGJqtFhAUB7LpWrSPANbsm55Ho/EJ0nkHCojBAuVJ6
        zlfdhSnlxhqnL/LcOmVJ4/v3olWfTXR5DUNLkinvFpKPOuI3ZmxrJJ/Hed7PPzsw7347ZnZogxEal
        uBmsMY8Uk88X6bVG8lVXW8lVYjsyI9267HZ6ZfK+nfM5KZHzzKPRi8LMa/cYhwqXhumsXaEqj0jFk
        l/gyzW4D3CFilP3/f0HQ7mjTczP66Uo2avs165kD/zY7zLbSYgBNQoYCWsB203wUAbhWJ60FvGYIu
        gOYeVvXg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mi2QI-003BH1-5t; Tue, 02 Nov 2021 22:38:30 +0000
Subject: Re: [PATCH] scripts/config: allow "O=config-dir" option
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
References: <20211031063322.20486-1-rdunlap@infradead.org>
 <YYFbYac/iU21vYiu@fjasle.eu>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d547ccdd-6d87-504f-ebc3-0802341fe55c@infradead.org>
Date:   Tue, 2 Nov 2021 15:38:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYFbYac/iU21vYiu@fjasle.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/2/21 8:38 AM, Nicolas Schier wrote:
> On Sat, Oct 30, 2021 at 11:33:22PM -0700, Randy Dunlap wrote:
>> Support "O=config-dir" as the location of the .config file
>> like (some) other kernel build (make) tools do.
>>
>> Someone asked for this "feature" a few months ago but I don't
>> recall who it was.
>>
>> Also check for the existence of the config-dir/config-file
>> and report if there is no such file instead of letting grep
>> report that there is no such file.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Cc: linux-kbuild@vger.kernel.org
>> Cc: Andi Kleen <ak@linux.intel.com>
>> ---
>>   scripts/config |   44 +++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 39 insertions(+), 5 deletions(-)
>>

> I do like that feature!
> 
> With quotes round $FN:
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks, I'll do those changes and resend it.

-- 
~Randy
