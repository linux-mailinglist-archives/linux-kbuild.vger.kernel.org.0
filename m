Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB772B0D07
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Nov 2020 19:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgKLSxU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Nov 2020 13:53:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgKLSxU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Nov 2020 13:53:20 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF1AC0613D1
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2020 10:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=XISaupirEI08StQQKOcij8cSGuZuG54zJNZhQrnz3Bc=; b=MnJjwdHSLm6mZZ51skL+yzAAAw
        7ojI0MCefLlh+N3rglfriQiJHgwyX5qGE8ibOokrCbCID6utapwbt1Mvmcxv8tHBoj2sg54PZONmC
        ROMhTSnWrbWLAUyXSLFquSo+8EHIS8jdAzuNBhUw63F05jSrcBOsTuxi/n4kL2ryzU0zcit9WIONA
        OsL+0wmpZdZLCmZ7k2sja1rhTEg1GY9Hi9xfW7XuIiqC2KWGQd0LqUwHkvl424pFvTzJBtcwwRIdL
        TaH7sGMx9oujf85BrA4/yy0CWodQvRJFYcYcgBJX/fP2QpoUrSztJJuGo4fIV/grsQEHLojMBobgq
        a3I8ro+g==;
Received: from [2601:1c0:6280:3f0::662d]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kdHid-0005wm-Ms; Thu, 12 Nov 2020 18:53:18 +0000
Subject: Re: unwanted built-ins
To:     jrun <darwinskernel@gmail.com>, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <20201111163135.f6rjjgldlouspfat@savoirfairelinux.com>
 <b852dcf4-c8d6-c7b3-3833-5c6083883b9e@infradead.org>
 <20201111190045.j37ixzeosd7qxzkm@savoirfairelinux.com>
 <b5452d0b-fc9e-8811-ba3d-c1692a550b39@infradead.org>
 <20201112184632.udoxoi6pdru6nnsn@savoirfairelinux.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <88a3a164-6174-a956-c052-a8599dc774d7@infradead.org>
Date:   Thu, 12 Nov 2020 10:53:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201112184632.udoxoi6pdru6nnsn@savoirfairelinux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/12/20 10:46 AM, jrun wrote:
> On Wed, Nov 11, 2020 at 07:14:52PM -0800, Randy Dunlap wrote:
>> Yeah, that may be the right thing to do, but it would take
>> a lot of build testing. My laptops don't have enough horsepower
>> for all of that (multiple configs * multiple arch-es).
>>
>> --
>> ~Randy
>>
> 
> me no horsepower too but who does? i mean i could slam together couple of low
> hanging candidates like those in a patch and submit (where? e.g. linux-drm?)
> but, do you think it's worth the effort?


It wouldn't take much effort to create such patches.
The effort would probably be more in justifying them and then
getting maintainers to merge them. Then they would go into the
linux-next tree(s) and hundreds (or more) people could test them,
along with several bots.

Unless the kernel build maintainer would put them into the
linux-kbuild tree for linux-next testing.  :)



BTW, reply-to-all is appropriate/common for Linux development,
not just reply-to-list.

thanks.
-- 
~Randy

