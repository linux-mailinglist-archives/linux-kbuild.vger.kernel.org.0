Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053DD33866D
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 08:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhCLHN7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 02:13:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhCLHN2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 02:13:28 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC52C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 23:13:28 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so10638391pjb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 23:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8nQj9pi8kjO+3bW20OImEAoMcuUJaaLHne2pfVwUQ6Q=;
        b=dwwxuqGcb7m1V2mOAW6wNrN/Rn2cO4xUkD86mev0DNFe6xFtk2F6LhQf7L8Kl4Jk7z
         9Co4IFbc12R9j/Tex6UeUXaZ87AcNer7/qvtL32tvbCrIBo7cBJNlAfkf9M2LStPxbte
         5Ok++zsxD915TOa62W8ig4rmoKaRp0oqF6muZRXRDh9vX2Dcndwhe8qkqvQXXHpnEPtZ
         m42XwMqTxj2fc29+WsMcxuOF7VtIT3L338O+9NGTQ7NxiUqfgl2+rYFqi9rEGCvRJ+aK
         c49thxKwfNRz7VNCN1Lv777XrRtAphBPL/2LTa5Gbo3d/dLeN8FXYsYONP7fWpkAkoQ3
         DQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8nQj9pi8kjO+3bW20OImEAoMcuUJaaLHne2pfVwUQ6Q=;
        b=sO0/+/nHP6SWBILrHF+BwXrxLXH5meU6VvglB6zy3vM1Rpnmdku0Y7cUGscHOTjGFb
         +1pvxoWOLISyXO+UIslXlh5YroO82AmrmqB0iOu8HuUlu0xBNzvvWO8n7jW7kctimth0
         xKc5ajCC+t/6CWxYaclyMjPJcgJBqjWBhjsRleWzDznRnLl0S43AeUrhgPPnqrTV6p4U
         P/CMipr73CmUiW+dyGdSbDmE7OXHtWARyCe5wY8NV+BTqkd3hMMysKVmBmY4hg1ZfGST
         LCW74O/k9SoJy28ZGADO1SkrnpgFcgl9BCgt68Mmzn6Mlz61T0F7+FmxlsGIjT+BeRka
         Kwig==
X-Gm-Message-State: AOAM531RO8iLMk0pFCgLH1v6kJkcMz6qou4n4Ota51Go9tcwTamccgG1
        papashAIZjzJI0dfX6doC/Mbew==
X-Google-Smtp-Source: ABdhPJyqTbGj1r2y6pAX7x+QniRp6iMckEBevx7znL3cwTDnyfN5TnDEXb7MWU6A5zTm+M6PQ/XJxw==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id q10mr3181343pjv.113.1615533208160;
        Thu, 11 Mar 2021 23:13:28 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id k63sm4451560pfd.48.2021.03.11.23.13.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 23:13:27 -0800 (PST)
Date:   Fri, 12 Mar 2021 12:43:25 +0530
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
Message-ID: <20210312071325.zosmlttse4ym7sit@vireshk-i7>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12-03-21, 01:09, Frank Rowand wrote:
> I suggested having the .dtso files include the .dts file because that is a relatively
> small and easy change to test.  What would probably make more sense is the rename
> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
> file create a new .dts file that #includes the corresponding .dtso file.  This is
> more work and churn, but easier to document that the .dts files are a hack that is
> needed so that the corresponding .dtb.S files will be generated.

What about creating links instead then ?

-- 
viresh
