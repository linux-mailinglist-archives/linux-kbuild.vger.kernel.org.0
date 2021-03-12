Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D6533847F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 04:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhCLDwo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 22:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbhCLDwh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 22:52:37 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4513FC061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 19:52:37 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id t18so4501822pjs.3
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 19:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7Hu8Rm8g/2u5BW/la8A67BoRDfxpXnrJBoL9Yigted0=;
        b=l4b422yzrQT4+UVX8Q9zkdQgJ5UHUwbfNnpRYtFpYuAMsTvRcT8EMPczWhyIzo55NS
         knbXIZg6O6m/9BRTuvxBlC5EByxmXGBe8HhPW+rpEu7kPBm6NhAdeyy3or2YL6PB4cDD
         +r5Lj3lelL2rsTvhOXR8IbXLo3APjN5XyUign8diH78zhLdnNg2NANCgZvp26hfZ4QZb
         sOm/VSYn57dvpTN7T4+KP3BA/QWDNDA9iqBgkXqxbc5OvZyHEAPH0EFI5ixxZRQxgXio
         76sTSrJEQXImh/lSJh1bNsdbjOLeqg1NhkbcMlhb00qwGP74CTqAhryE5Wt/xX08UB8k
         GFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7Hu8Rm8g/2u5BW/la8A67BoRDfxpXnrJBoL9Yigted0=;
        b=rs3k6BWYki+zH+9/nH7415IeNqMMwhh6YeHn8cBk1JDllHVZ1cJnxQdla+fxlN5faY
         lj+5c+oYO+km6v8raf1fy+1UgZcMlebTyfddtWVCAD1gPtm02hWafQ2XiQDDxi6mAl8h
         BmPNwwK4rszZN7ceddj5C/1ZjndTKWplKGlAZqiavFdTom55nHHGMc+XBInNxUfe0k8p
         FSTIrQA+Vm73k3PG1ETjkTopWmgV5sVD9hlPpA93pGF7rWw3JDiUC5F83/dOVpk2Kjtc
         8XRAhYjwBPcgoLiFLwtEohRpAeOhNk2ShtBUq5xgTgSkCnY00T6cBBit1j3+rz4HlrVM
         hJBQ==
X-Gm-Message-State: AOAM531O4LOad99y2XRIMnw6lRVtQ0eU3UjpR3WgCNQ1QyT3ZX7zGEN4
        KJAZHj5hGPL45+DObJxRHTIh7hfZwQjxVw==
X-Google-Smtp-Source: ABdhPJzQXhpcP5ClA/9+2MXeB8PzaI7agCa00klDGnOfPQqfn0EE5FQZ6xNqn9gZkgOcyb2p76IUAA==
X-Received: by 2002:a17:902:8507:b029:e6:5d07:9ce3 with SMTP id bj7-20020a1709028507b02900e65d079ce3mr11194193plb.47.1615521156523;
        Thu, 11 Mar 2021 19:52:36 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id c22sm3446712pfl.169.2021.03.11.19.52.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 19:52:35 -0800 (PST)
Date:   Fri, 12 Mar 2021 09:22:28 +0530
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
Message-ID: <20210312035228.2szgoqtbhrkbqvt3@vireshk-i7>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <CAK7LNAST04XTt7Y0DnSADHgAw-zy61HUcRJSyYRvy2rGHMdn4A@mail.gmail.com>
 <20210310144837.hxz3nbwonvwi3j5c@vireshk-i7>
 <CAK7LNAQBtrG3nF7YtuRhog+ZZpCRGg22b88VkCga7-em57NyDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQBtrG3nF7YtuRhog+ZZpCRGg22b88VkCga7-em57NyDg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11-03-21, 00:18, Masahiro Yamada wrote:
> On Wed, Mar 10, 2021 at 11:48 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 10-03-21, 20:29, Masahiro Yamada wrote:
> > > BTW, is the attached patch good for DTC?
> > >
> > > I do not know when '-O dtbo' is useful,
> > > unless I am missing something.
> >
> > It is useful if we are sending the -O option all the time (I have
> > already given more details to your patch) as outform will not be NULL.
> 
> 
> "-O dtbo" was useful to make your buggy patch work.
> 
> That is not justification.

I wasn't giving justification, but rather saying why it was required
earlier. And I agree that it isn't required once we drop the -O
parameter here.

-- 
viresh
