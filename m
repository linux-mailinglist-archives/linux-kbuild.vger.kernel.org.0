Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915582FD0A7
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 13:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730509AbhATMrs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 07:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389479AbhATL2m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 06:28:42 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4ADC0617A2
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 03:28:01 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id m6so14331422pfk.1
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5C36+KK+ZwCozfA+Xk85YVuDANWbjdMSTMpiHoCogIk=;
        b=j0DePEWGVCVzKBL4UrRlIOqRfAi3e9/BYBY2rp+YfO71dbsU++ZV8kzv92wNdxhy8N
         LGHCDsCdCgiJ78KW3uHIY0sRNaawouN/5w9LPooZzR47PIVvmDpi2/raI+DSgko1hkn9
         vSLU4OoDkrWGqew17OUS3C+H/0Sj5dt6jnatPrdBf5KsZ3yz9oDWEW0g+pEJ0qNUHQx+
         0QEdEtLQVz6ObugsK1wyivKf0rorW1erdFg+O1ihtwhF+JQ0BlijErVfjghuhSa94k8v
         4+4pWtgLXaFwdtZld6HG/1/bHM4JB6/8EYgMUyryTBC3sI1UoROZDpbnF4s8EG39CkT8
         pmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5C36+KK+ZwCozfA+Xk85YVuDANWbjdMSTMpiHoCogIk=;
        b=nvWBkqpp1PeeaSvyGt3wQbCXLEqK6WNc3oILYvYKtAWoFTOkB0Cg3bL/0rOxwsh+RZ
         n1pyvirTpNbUyqGIe6Q46TqAR1mlV6O6Q4dytxnAJa1YsuLfbu0SZ9ZXiKHpSHRtNVhs
         zQDoRyqf0KHxoWRSu+mJvqVMl8q6LH6yPF4Ox/jPZK3R8o6v68L/fBE8Qp0fsTtdHnwN
         0OzL14FwbRC8/gU68UNCVrCrN7erC2EjVlmc91nTYiyRhidWdi3lH7RgBFOTPjgR1dUa
         0ahHw6b495yt+jID9YA37NHK5Et7Cd8NjHKWx/BF0YZmImfshzYQlv9T3D0WT4mEpZHa
         CzHg==
X-Gm-Message-State: AOAM530HGr4vXOJxA9FLx0H4gprOjyMg/MxUO2cthLx1q3uY2kLUut9b
        FEuauCWjE86boZX+VkwPh/snsA==
X-Google-Smtp-Source: ABdhPJxGtnsepugPmla4bIMZB+HVrt5zcDr9LletZEnWsvOok/MuMx9loQRr79dWZoW3iBHUsmyghQ==
X-Received: by 2002:a62:61c2:0:b029:1b9:19f5:dcfc with SMTP id v185-20020a6261c20000b02901b919f5dcfcmr8637320pfb.27.1611142081056;
        Wed, 20 Jan 2021 03:28:01 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id b185sm1995541pfa.112.2021.01.20.03.27.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2021 03:28:00 -0800 (PST)
Date:   Wed, 20 Jan 2021 16:57:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH V5 4/5] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210120112758.xpcgqsuo5j2d3bbo@vireshk-i7>
References: <cover.1611124778.git.viresh.kumar@linaro.org>
 <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
 <CAK7LNATPSBrmSC_if+6sK0pwi1ksBZ7RXK1mndj1AGCX3gkj+g@mail.gmail.com>
 <20210120095541.f354ml4h36rfc4gx@vireshk-i7>
 <CAK7LNATL=O4p_LAhzJguUK=jo9BaU+Jisaw7ey4wNgKw08zH1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATL=O4p_LAhzJguUK=jo9BaU+Jisaw7ey4wNgKw08zH1A@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 20-01-21, 20:04, Masahiro Yamada wrote:
> The DTC rule takes one source input, and one output file.
> 
> It cannot generate .dtb and .dtbo at the same time.
> 
> That is why a grouped target does not fit here.

Okay, thanks for taking time to explain this. Will fix this in the
next version.

-- 
viresh
