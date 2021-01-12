Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCDE2F2C70
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 11:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404702AbhALKRh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 05:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404777AbhALKRg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 05:17:36 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D490C061575
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 02:16:56 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id y19so2858767iov.2
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 02:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sASo/ffoaZ0kOHmpFnMHBOshztWoTzd/nxUspVlN1Ho=;
        b=J5O9eXycVqOkW21iQP26x5bnM5b/Jx4lnlYvHmL/lvEsiaK9I2ylcccWGiTypfpj+m
         Z1Y96REyrMZXKF3wkry7ZGdZ1vWtgxS2m5CAa7a1txq8HORqhWjpiUMp82eLiSARVbGo
         zXIfNQLGXBnEO3QApRm5h2lOjuumLWibFQUnvckXd6FJYnkh45fA+qC0eVLpD/Z05C6f
         wkGpaZgOcDqTpCeqaIJK39LHtjLlahEcJtdOrLMr8SLagTiHg3LXG2XbExHvjxQQ68fB
         cHWZ1buEz+XHU/88qbiKdYV3EGkN63pTaFoENUIVCBE4Dy0RhGzOt3ZXWVU4MLK6qGs8
         Uz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sASo/ffoaZ0kOHmpFnMHBOshztWoTzd/nxUspVlN1Ho=;
        b=V1AlBqcqERS7UF/by93Al4nuxh2VeTLdfKL8qkA7vYldppakR1n8UGU+UMJci/xygv
         L5CEtt+MJU9oyZsCgH36uTbO/IeqljhKivG3K+Op3DmOYkZud1m9j4F6pIwiLZf6lgQe
         fxieeeKQw4zhTyzhzQL6EvxBGZvWuU6Bd3HxXPl3Y2peYpb3SkKsuig9RaaFGE6Mh/nd
         AqW7zn4/9QvDTzOpOUTNwycJu3jABX/1i4G5QTnXuoV2SxmvpgUGkOEN0G8cQ1Ra8Rc7
         P6/qfxzZm3m5zHPyoTfBkcKd8g7Y7TTFfrTJvklMG0wE/Q3MBooJ6FZZh2EbDJ+dY4mM
         ECLg==
X-Gm-Message-State: AOAM531X287Es55POIBE/n/oEuWpx/q/ExZ8QDhV/jM9syCLn7LBSmxi
        aToLGY6SuPRgbpGhaDWU0jwH3A==
X-Google-Smtp-Source: ABdhPJwTS6la1rbtRSYyPovgz6/lWfNIQaxSpoIF+TkxUbt7ykp51XG0rRAUGh6RiWMGSYrVEVsCVA==
X-Received: by 2002:a92:6f07:: with SMTP id k7mr3280631ilc.18.1610446615781;
        Tue, 12 Jan 2021 02:16:55 -0800 (PST)
Received: from ?IPv6:2601:144:4100:fd1:12bf:48ff:fed7:9537? ([2601:144:4100:fd1:12bf:48ff:fed7:9537])
        by smtp.gmail.com with ESMTPSA id l16sm1630961ioj.52.2021.01.12.02.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 02:16:55 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        anmar.oueja@linaro.org, Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
 <31611390-eded-d290-36a7-0b1e8465f71e@linaro.org>
 <20210112083703.yfpicoi4zrddeykd@vireshk-i7>
From:   Bill Mills <bill.mills@linaro.org>
Message-ID: <4a8bbbaa-9303-8a8c-1de4-38499b8151dd@linaro.org>
Date:   Tue, 12 Jan 2021 05:16:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112083703.yfpicoi4zrddeykd@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 1/12/21 3:37 AM, Viresh Kumar wrote:
> On 11-01-21, 20:22, Bill Mills wrote:
>> On 1/11/21 5:06 PM, Frank Rowand wrote:
>>> NACK to this specific patch, in its current form.
>>>
>>> There are restrictions on applying an overlay at runtime that do not apply
>>> to applying an overlay to an FDT that will be loaded by the kernel during
>>> early boot.  Thus the unittest overlays _must_ be applied using the kernel
>>> overlay loading methods to test the kernel runtime overlay loading feature.
>>>
>>> I agree that testing fdtoverlay is a good idea.  I have not looked at the
>>> parent project to see how much testing of fdtoverlay occurs there, but I
>>> would prefer that fdtoverlay tests reside in the parent project if practical
>>> and reasonable.  If there is some reason that some fdtoverlay tests are
>>> more practical in the Linux kernel repository then I am open to adding
>>> them to the Linux kernel tree.
> 
> I wasn't looking to add any testing for fdtoverlay in the kernel, but
> then I stumbled upon unit-tests here and thought it would be a good
> idea to get this built using static tools as well, as we aren't
> required to add any new source files for this and the existing tests
> already cover a lot of nodes.
> 
> And so I am fine if we don't want to do this stuff in kernel.
> 
>> I thought we were aligned that any new overlays into the kernel today would
>> only be for boot loader applied case.  Applying overlays at kernel runtime
>> was out of scope at your request.
>>
>> Rob had requested that the overlays be test applied at build time.  I don't
>> think there is any way to test the kernel runtime method at build time
>> correct?
>>
>> Please clarify your concern and your suggested way forward.
> 
> The kernel does some overlay testing currently (at kernel boot only,
> not later), to see if the overlays get applied correctly or not, these
> are the unit tests.
> 
> What Frank is probably saying is that the unit-tests dtbs shouldn't
> get used for testing fdtoverlay stuff. He isn't asking to support
> runtime application of overlays, but to not do fdtoverlay testing in
> the kernel.
> 

Thanks Viresh, that makes sense.  Sorry for the confusion Frank.

-- 
Bill Mills

