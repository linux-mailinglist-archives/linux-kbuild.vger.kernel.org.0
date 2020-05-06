Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F281C7D07
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2020 00:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbgEFWKW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 18:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729477AbgEFWKV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 18:10:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0622CC061A0F;
        Wed,  6 May 2020 15:10:19 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l12so1495714pgr.10;
        Wed, 06 May 2020 15:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9kSEpEwj9xdJy9cHGYGf5SlUCSGVabzofb4/ZPAMmcY=;
        b=ZkW5hEkXoPYMkECGP0f0cdaPWAv8ngm2RFBzH7zJrrvd0dAxRHniU+IW06eobUxQ6i
         Ud3cUxmY5zzZXF6JjiDXkEJMgERdLTRYKCakLDhfXdN7/RnkMUCisIyChO3PVtFQ6rKg
         Yi+gLiF02nOUAXnB/4NJAmqc3ykR9a7sJ1ZdzlLcVUcdi/JUknmNKVTbiJaHf7evsZiN
         I31u9gIMk9KuVB9iXqm2TSM2+1H+uLiD8vQTiK4RWYxegLdi+rOWq0OWFZ9OHX6ClCHl
         LxlcTrBUc78ap07erwJL7nErVQ0HAmrBMiYhC8Tfs99+N7aW+aesRZGvJHv9eG7d7bkK
         coOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9kSEpEwj9xdJy9cHGYGf5SlUCSGVabzofb4/ZPAMmcY=;
        b=JRlk35Hxh13d31sqgfnVL+ueAvKtLkOAvqN24/USje9PF5uhoPqyIimha6t1ufQh6a
         zGtvBpN/j/e8LpT7Kcrj9xjuxsLmNoU/zoxojeAUo+u3nfZt7+V1/VzzQmaYhiN8Mltd
         QE+YvqXW2YNFB2NkiFiouMAKWsfOE+QgT5U4WwhxZKI/6kYfkh6V+wtyZsQgaBVlTsZ6
         KkjlrBc9A6Q0DegJNYjsRIYjHrPpzzgWCktLVWvOcpag1U3ugCRlph+htzv6TDQZ3fGX
         48cjmqwV2ero2Y5OveKNB4gONPgE26qu2ug5TuiDNLkDHqnXyFa6yvaAmhYgnBhC8cBZ
         PsxA==
X-Gm-Message-State: AGi0PuZe36gAsT8lbMzEK/6ix+iaRmU/pXuzTpVUUowsDQVZy9O8VqGW
        mHrtSbImX6T2+gfd8ALigRHZgW0e
X-Google-Smtp-Source: APiQypJCz91iT/kUPbjQqBIII60IctU/y9h1UFdN+kI74L8syClp2HcDuUm2ftCC296Syuo+YGduUw==
X-Received: by 2002:a62:888a:: with SMTP id l132mr6288087pfd.125.1588803019017;
        Wed, 06 May 2020 15:10:19 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id x132sm2799396pfc.57.2020.05.06.15.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 15:10:18 -0700 (PDT)
Subject: Re: Proper use for linking foo.o_shipped after 69ea912fda74 ("kbuild:
 remove unneeded link_multi_deps")?
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
References: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
 <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com>
 <01279bfe-95a3-dbdb-3785-bd2d92dc4f95@gmail.com>
 <CAK7LNASKHb5QzD-5d7Vam9t4C1U64_2tTk7eVAmK2oDVquy0MA@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <365fcf52-8132-24eb-80d0-bb212a3534f1@gmail.com>
Date:   Wed, 6 May 2020 15:10:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASKHb5QzD-5d7Vam9t4C1U64_2tTk7eVAmK2oDVquy0MA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 5/6/2020 9:24 AM, Masahiro Yamada wrote:
>> To me this is a regression, as it used to work and now it does not, thus
>> we should be fixing it, any idea about how we go about it without doing
>> a plain revert?
> 
> 
> In fact, a patch exists.
> 
> https://patchwork.kernel.org/patch/11318691/
> 
> It allows you to link whatever file name to a module,
> but please read the comments from Christoph and Greg.
> 
> 
> In this case, your Makefile is doing strange.
> 
> I'd recommend to fix your Makefile.

Yes, I ended up finding a way to fix it, thank you for your time.
-- 
Florian
