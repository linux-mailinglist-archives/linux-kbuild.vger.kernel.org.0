Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35FB9C92F8
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Oct 2019 22:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfJBUne (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 16:43:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53585 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfJBUne (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 16:43:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id i16so306455wmd.3
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L5vlv/4PVMuZFTAVdMzkm/pNR4YsqLi5rbXALgcvCec=;
        b=BErLan2F89eY2za6Apl8JLGWsak7jnYHZQ0Dqq9RoEt6rzO86blUjFfhVSYUvD0vNf
         MGadSonQtSoQxMXBaTWxa2SR+BVdCH68JvFTQyZcVU4Xxyk6Fs1nJpypsklCa0dianf3
         5HrSmU9DHlm0MJhJZEYJMCGbNMi7tD3mfYUTtYUEUEEfSwy1Xb7UYqImyCR5FnprHEmN
         TEDzBsGrRUs1Uh9Dx4B0XQveA4oFWYaWyL0gwTndzrGpMbsTHhDIAT0UYYbi1NsYsnC6
         jfRUiszqxO6WNqxfxfIxOhbWgmnbwTu4jG+6AXDRYnxBoKCw8GYnMgkA7fVjhAiuYTh9
         stZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L5vlv/4PVMuZFTAVdMzkm/pNR4YsqLi5rbXALgcvCec=;
        b=LX7a8Tyhl789n6B2Z5nN4D8L/ZwDYWm3KuPfnnvhQNNXugvBZlcefOweJk1CM1yWJ4
         ACyHTPNCZKloo+RstexBt4dDD+8JFSodrkp4IIt+fWbxZMPwBS4sPKcZtFCB8mq9nNnT
         Sufe91Sj3+gllTcg6UlCosRl3T7OxHLUClViVMT0hm889nnC8yX7UKqJe+67w1sfo+zj
         qOSsJ2dEE8kjD1LIcsZCMEuSvXsGvVLbd5EECb8RXqTaSOeavX+g1xbOn6o+n9rbd7Q5
         1Wsoygf0cazR/Utp7P8qy0Yuyc7X1sqBq0j4Ala8mpuZk3ZjhCtDVRGunAkF6BwVgo/g
         0hfA==
X-Gm-Message-State: APjAAAXbxFMcpFFvG9GEMhD2bjR+QlGDOm2XC2dmrhGsmN5ezV7fsUg1
        g+9w1Pf3sKh6riqj0IO0/KwNDw==
X-Google-Smtp-Source: APXvYqx2K6ZmJVhOIH/nmomKLUjhvND/v/dGOKTnUcHEw2QZSjuzOTZ8jWjPgwSn74VjzHsxhj1Vng==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr4671234wma.153.1570049010064;
        Wed, 02 Oct 2019 13:43:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id u83sm8504559wme.0.2019.10.02.13.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 13:43:29 -0700 (PDT)
Date:   Wed, 2 Oct 2019 21:43:26 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module
 namespace
Message-ID: <20191002204326.GA178871@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927134108.GC187147@google.com>
 <20191002185701.GA29041@linux-8ccs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191002185701.GA29041@linux-8ccs>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 02, 2019 at 08:57:02PM +0200, Jessica Yu wrote:
>+++ Matthias Maennich [27/09/19 14:41 +0100]:
>>On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
>>>
>>>I was hit by some problems caused by the module namespace feature
>>>that was merged recently. At least, the breakage of
>>>external module builds is a fatal one. I just took a look at the code
>>>closer, and I noticed some more issues and improvements.
>>>
>>>I hope these patches are mostly OK.
>>>The 4th patch might have room for argument since it is a trade-off
>>>of "cleaner implermentation" vs "code size".
>>>
>>Thanks Masahiro for taking the time to improve the implementation of the
>>symbol namespaces. These are all good points that you addressed!
>
>Agreed, thanks Masahiro for fixing up all the rough edges! Your series
>of fixes look good to me, I will queue this up on modules-next this
>week with the exception of patch 4 - Matthias, you are planning to
>submit a patch that would supercede patch 04/07, right?

I will most likely create a patch on top of 04/07 and will submit
everything as a separate series.

Cheers,
Matthias

