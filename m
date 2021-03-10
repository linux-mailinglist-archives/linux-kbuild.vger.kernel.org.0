Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93AE3340B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 15:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbhCJOtA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 09:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhCJOsk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 09:48:40 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD032C061760
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Mar 2021 06:48:40 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so7614411pjv.1
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Mar 2021 06:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bMJ4aZ3R3rYsoukCOuzGCwYETWFAfdH+2YsRQY1iRCk=;
        b=IhD7nT7BnmKrI05K+d+SGEDdb2wAozsKYbFoNYNj/vCwmFcNa9xOydcSVeCxyvL653
         KwQ7CfNsXpZAzifY8JBGcOc5C9+tIS7IGLoLwmoPTClHC62AjHrNnI3o/G+7BHjuzmGB
         5jc3Xa2Qfgofyr+XjtLvgCRnv2ZII2jZkFFbZaNDobQTZqgUDe1oO7Zzy0kKLrjeS2OJ
         QCvHtlmwz/VDm/Jy2IpeVHdGih0XT9sV0d65+U9s+e9WsyPGgrCEv08JuyPb6b+Y/vxX
         kVzAMk5sFvEvP9LWEg5zuvlWFLRQkTOYMzg2lnJm/zNiitLxE4sIF+QeMboYXs2QVEPi
         KE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bMJ4aZ3R3rYsoukCOuzGCwYETWFAfdH+2YsRQY1iRCk=;
        b=KoR6xERAdVQJypN0/KdgyhNBgdSz6aCsOl6AV/zH1ysD14TQmqzOtMFW0LWVcHSqtp
         Cc9FvFxbk8s6rsjx5w42dbBRvtHpu/Fo66YeP6EU7AblOkZ9WZ5KTlt7jVpxjKSSYJE6
         tmDSiYkY5QV+jB4dKlxZNVH/AgZZAmnIMIepf4vZAfQ70KRr9rVe/Pbz3kMwkK25VaZQ
         ecEb5hvgYxO4pz8/5Q3SpUYbxUMNEXUSOQ0i1ZbARk7xn0vDkaD1+yGLhKeEBeFW/+ZV
         cXYLSY7Ymzz9emvZjynCCwgri7T/R7eiuX4mb0L/EkJeR7M58hDjqnGLfLHpGfHS5a/z
         XFNQ==
X-Gm-Message-State: AOAM530TR+yufxFvu4fAMnDRGEQdMn7pKzLVhZci9ZG8nLwrWnsfm+f4
        CID97qKSFzaZZPDeN9HMdDqq9Q==
X-Google-Smtp-Source: ABdhPJym40pBjSIdZY98Bg4oP9FoGu204iWlwzwNG9Zb4Mt8nzheIB2gOf7dMbQQX9Q2kss5lnvSdw==
X-Received: by 2002:a17:90a:77c8:: with SMTP id e8mr3882550pjs.48.1615387720341;
        Wed, 10 Mar 2021 06:48:40 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id z1sm8282554pfn.127.2021.03.10.06.48.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 06:48:39 -0800 (PST)
Date:   Wed, 10 Mar 2021 20:18:37 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
Message-ID: <20210310144837.hxz3nbwonvwi3j5c@vireshk-i7>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <CAK7LNAST04XTt7Y0DnSADHgAw-zy61HUcRJSyYRvy2rGHMdn4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAST04XTt7Y0DnSADHgAw-zy61HUcRJSyYRvy2rGHMdn4A@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10-03-21, 20:29, Masahiro Yamada wrote:
> BTW, is the attached patch good for DTC?
> 
> I do not know when '-O dtbo' is useful,
> unless I am missing something.

It is useful if we are sending the -O option all the time (I have
already given more details to your patch) as outform will not be NULL.

-- 
viresh
