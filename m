Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D672F226F
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 23:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbhAKWKG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 17:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbhAKWKG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 17:10:06 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051DFC061786;
        Mon, 11 Jan 2021 14:09:26 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id f26so322574qka.0;
        Mon, 11 Jan 2021 14:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bkdZMl6OGK98rEoB/jBOOQZays6LlSDi9TZj1JcXftU=;
        b=jk8XAzDVg4MhTJ+szkwwLufGwtc7NaMRZQkNlf46Cp1tCFgbd57fmmry+4hUmfdTeZ
         wM7M0YLXAfH300Y48ZGzMl/ax9gi5Di0FrGg+QL+1J1zsBsTI7LPD2yTMv8N15B1a3MU
         uWpT6NLQNmxfJEC6SaHCCKP+sIvEV4bcKBJ+T3687gMoCrOhxL9n5Mb1GKEsPfkzThGO
         Zz6NKObG7dSuGDcEsMghqKWgkHRxguny6IDx6Jq5uViXHssJeqB3OY4VWoRtkbmMxhKr
         Azuuh3Rkl1zJONYiirHvil+SfNeLnYyoPTPPfUU8Bd2DTBaTDxf7Ra/tiKFaNtdcQRcm
         TOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bkdZMl6OGK98rEoB/jBOOQZays6LlSDi9TZj1JcXftU=;
        b=he4otDKNnE/soplJaTlf/9y0RbYm8FpJvfTsmlvDN8anh7NB3kxrqoCq9/niEbE+4Q
         sd04KTs2OAt/TYp4sC/dsfOOXIEnvFhPVf6OsDjcZSESkEecE4EtONpkG/U3j4s6MHTU
         gIbNX7zH2lbaoRwuiX5tu5e/kqu2y23gyAcNcS12H73bvYxkVRTVT/WmhGqfUOf2PPBI
         HItWOlD+uFInvTh0uwE8Et5jKKe4fe+4SI133uWENzb5I7THcYoRewmKj9K5YtZKvMBL
         HDX5VFEiXhrcisv2PjKpuodI5OpG0AUek2U9VJ6XsMdZEQtdiHhDEyX6WL3UHoLDpQrA
         9Ygw==
X-Gm-Message-State: AOAM530To2o8lLVcxvzyd43KbXS0doUKCnV1q61XOLcH2LUw7p1hAXu+
        gqzd+9K1I8U7DL1mV1EI9zM=
X-Google-Smtp-Source: ABdhPJwH7l+PRWhKuRNOvbkDBJJcVkuQ9+opIN9dnq3DCOhh26JosEIFvnIyL2yplOZ8RMy+Ub92zQ==
X-Received: by 2002:a37:7fc2:: with SMTP id a185mr1576175qkd.202.1610402965307;
        Mon, 11 Jan 2021 14:09:25 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id w34sm439026qtd.89.2021.01.11.14.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 14:09:25 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <0efa1ea9-1a51-af18-ad9a-b13f9c362b1c@gmail.com>
Date:   Mon, 11 Jan 2021 16:09:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/11/21 9:46 AM, Rob Herring wrote:
> On Fri, Jan 8, 2021 at 2:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> Now that fdtoverlay is part of the kernel build, start using it to test
>> the unitest overlays we have by applying them statically.
> 
> Nice idea.
> 
>> The file overlay_base.dtb have symbols of its own and we need to apply
>> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
>> us intermediate-overlay.dtb file.
> 
> Okay? If restructuring things helps we should do that. Frank?

I'm a little slow responding to this thread.  After seeing this question, I
responded to the patch email with a NACK (with further explanation in that
response).

-Frank

> 
>> The intermediate-overlay.dtb file along with all other overlays is them
> 
> s/them/then/
> 
>> applied to testcases.dtb to generate the master.dtb file.
>>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>
>> ---
>> Depends on:
>>
>> https://lore.kernel.org/lkml/be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org/
>>
>> I have kept the .dtb naming for overlays for now, lets see how we do it
>> eventually.
>>
>> Rob/Frank, this doesn't work properly right now. Maybe I missed how
>> these overlays must be applied or there is a bug in fdtoverlay.
>>
>> The master.dtb doesn't include any nodes from overlay_base.dtb or
>> overlay.dtb probably because 'testcase-data-2' node isn't present in
>> testcases.dtb and fdtoverlay doesn't allow applying new nodes to the
>> root node, i.e. allows new sub-nodes once it gets phandle to the parent
>> but nothing can be added to the root node itself. Though I get a feel
>> that it works while applying the nodes dynamically and it is expected to
>> work here as well.
> 
> Sounds like a bug in fdtoverlay to me. Though maybe you need an empty
> base tree. An overlay serving as the base is a bit odd so it's
> somewhat understandable fdtoverlay couldn't handle that. OTOH,
> combining 2 overlays together seems like a valid use.
> 
>>
>> (And yeah, this is my first serious attempt at updating Makefiles, I am
>> sure there is a scope of improvement here :))
> 
> Usually I write something and Masahiro rewrites it for me. :)
> 
> Rob
> 

