Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1FB24A77C
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 22:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgHSUIb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 16:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgHSUIa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 16:08:30 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82786C061757;
        Wed, 19 Aug 2020 13:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=X+09KI1YucsQhdxPEDcEePA0fns3WS7kCrRB8Bbj1+k=; b=cTr3k0dDrKdG7cEF1LYBFlAeJJ
        sBzd7b/G9VuxbL9+zUe58zGKZVwoo7fJeGqxDYr/iJfIqCksUNBsA2AtKvHHkWxhsDXPkKTzis4dZ
        nesFNS2SOHMP02y7ytpWXKYX4glQFJ2kjoQb6OU00gck/wMP5LEII8gskTabfbQif6QVCZU2zworI
        zxGTK4MDdWftZGyjhMolZzCk77X4SrA/VdhIGxGMk8Ggp0j/mo6XeP2s4+ZpxRwXyt91Gjw0lVs2y
        IkhmJ0iqyEsnvhFC/5qz40zZf7bCu3W9Kh6Zl8Qh4nYWCUsGE4gamuzn29rAUzJwtKaxCNwwzbxmD
        CkHQjwEw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k8UNm-0004ut-MO; Wed, 19 Aug 2020 20:08:26 +0000
Subject: Re: BUG with 5.8.x and make xconfig
To:     Ronald Warsow <rwarsow@gmx.de>, linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <ab0cfaed-50bb-5b29-cb93-a2987c384af1@gmx.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <34a33843-a65f-6412-342e-c4369bb36356@infradead.org>
Date:   Wed, 19 Aug 2020 13:08:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ab0cfaed-50bb-5b29-cb93-a2987c384af1@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/19/20 12:19 PM, Ronald Warsow wrote:
> Hallo
> 
> configuring kernel 5.8.x on Fedora 32 via "make xconfig" gives me this:
> 
> 
>  HOSTCXX scripts/kconfig/qconf.o
> scripts/kconfig/qconf.cc: In member function ‘void
> ConfigInfoView::clicked(const QUrl&)’:
> scripts/kconfig/qconf.cc:1231:3: error: ‘qInfo’ was not declared in this
> scope; did you mean ‘setInfo’?
>  1231 |   qInfo() << "Clicked link is empty";
>       |   ^~~~~
>       |   setInfo
> scripts/kconfig/qconf.cc:1244:3: error: ‘qInfo’ was not declared in this
> scope; did you mean ‘setInfo’?
>  1244 |   qInfo() << "Clicked symbol is invalid:" << data;
>       |   ^~~~~
>       |   setInfo
> make[1]: *** [scripts/Makefile.host:137: scripts/kconfig/qconf.o] Error 1
> make: *** [Makefile:606: xconfig] Error 2
> 
> 
> 
> I have never seen this with kernel 5.7.x.
> 
> I haven't found a solution to the above, yet.
> - apart from the workaround: "make menuconfig", etc.-
> 
> 
> pointers/hints/ideas ?

5.8.x probably is missing a patch or a few kconfig patches,
but I don't know which one(s).


Adding more people...

-- 
~Randy

