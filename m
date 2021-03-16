Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB5733CD70
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 06:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhCPFnD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 01:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhCPFmp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 01:42:45 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07689C06174A
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 22:42:45 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x7so8052745pfi.7
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 22:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uYPt/q4ocXdemgkISgBC7oy3jQkjXsaS85jxoHGc2tc=;
        b=u7dTQDrIJvTwOF3Td4cBWJAujeP74FLIby0N0fkCyjxkCTKivsSeNMx+rqAG/zdjfK
         YGqXNhawsks4S9K0/3ISoCXbUnTMLYZ2/RLAj49pQJTK6IPfy48SwwmFjScL15CRLCZy
         ZWVN4dkXJvn/b051Uua7oq6xtXx2hEKQi8rvBQdSaIBrW1CjA9qUBAlWkS1qZD1ZZJLl
         bs3F2Y0ISh49yiAs7DUikhF4vN5FBxDvxQZcb5espfVyRd2PPzia0Os8bX0arAlZWzw6
         rit8zgE1SBLG45Iu/rYPqCsgSnmJcRHdzgYsOfy6A93GFYSUMCABOu3PI6wpp/0pICKY
         WCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uYPt/q4ocXdemgkISgBC7oy3jQkjXsaS85jxoHGc2tc=;
        b=nEJleb6L07adbKTrZG0IDnaQa+ZmSzF4IA/eqfm/7jYfF15CX5/fwWo5/cy60aGFvA
         zTVozyp+BJdkGfudDd5BKMpyu3iqSZP80+0q3LzKKf+igz/ULnFnukyAARbAq54rTdzf
         E6uMMenrsAZIfBUKohKFPmTWf36XbUz3zhVYXT+qORolZlo0uql/IXpGCZ/y6Xdn+Na4
         CFXUs0haZmhOrCrvZv3bt8G4k/vJ2boliHpUzKKZtKZ2CcBb8c1UIJuduNL+i9x3gxSr
         2qSwnHAeBN7b+TJDstDcTs0hlPDJJM+BeK6j3zANsj0SGflDrfHsaguhw/skNQYx9Bya
         pPmw==
X-Gm-Message-State: AOAM532hgrWsKM8uwtsyuSpihT1jC8yOCEhaaZtPrxckqx8aan53j3qu
        6vKxIKKB49/WmafzPJmBcMeLoA==
X-Google-Smtp-Source: ABdhPJxdZgMQKXQzGVzjFJ7VjZQZYRREs64T+FYNPv4JG8TfgC+EZ9xdFMgkiZVCJ8m5/Hkun66Cqg==
X-Received: by 2002:a63:a547:: with SMTP id r7mr2516399pgu.186.1615873364403;
        Mon, 15 Mar 2021 22:42:44 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id ms21sm1483975pjb.5.2021.03.15.22.42.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Mar 2021 22:42:43 -0700 (PDT)
Date:   Tue, 16 Mar 2021 11:12:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
Message-ID: <20210316054236.2blnleucwr4eidfi@vireshk-i7>
References: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
 <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
 <98697a33-a07d-6c5f-3f21-97a92ac68d3e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98697a33-a07d-6c5f-3f21-97a92ac68d3e@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16-03-21, 00:36, Frank Rowand wrote:
> I should have looked at patch 3/5 more carefully instead of counting on
> Masahiro to check it out and simply build testing.
> 
> Patch 3/5 does not seem correct.  I'll look over all the makefile related
> changes that have been accepted (if any) and patch 3/5 later today (Tuesday).

What is already merged by Rob is what everyone reviewed and it wasn't
related to this .dtso/.dtbo discussion we are having. I will resend a
new patchset with the stuff left for merging (which will involve the
thing we are discussing here), so we can get a clear picture of it.

-- 
viresh
