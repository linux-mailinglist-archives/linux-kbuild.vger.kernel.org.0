Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96E433862E
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 07:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhCLGrO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 01:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbhCLGql (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 01:46:41 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD85C061574;
        Thu, 11 Mar 2021 22:46:41 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id 130so23278324qkh.11;
        Thu, 11 Mar 2021 22:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DXa/TwpD5g1RF25czzNd+gGtn6u53gwLzzEg3FFw/vw=;
        b=vAsRQfWy2jO5XPnaqsFqXNimuNNnRLcJ48DU84RYW0CnjzREhfN/KybhVsWr+Q5Nw9
         1kjGr+MNE7+Qo18qMgbzcNzHhB5A7aaa8+shzWMUvtP9ivxXa94TPeVYhcbStnIErQvJ
         raLPc2bTj218OlzO+CMXXahjQQbXrgX7PGfl5zTo1rMyqdGD227Yw9PB3LLx0byhbU6Z
         wV0TjPoHERiOPvxFmrty6p/aDweYn06Gsx9fIcNGqkX9m7CCUuyGiuFxv/ED9iXGq9zY
         R52x+W/Eh0E8lOZEC5VyrgyKFEur+4n1ajfwqUZkaHHc8DzrulcPOAVigPYSYcrkpL7X
         JB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DXa/TwpD5g1RF25czzNd+gGtn6u53gwLzzEg3FFw/vw=;
        b=uRAmdNc83f1A+V9zWW4uzaNq95oqM0Hf30R4u/ydphxgdtYrgGqOm0zXCkwLUe6XnQ
         80Yl91B66FpW8BkYbtmTNn+oelC4qdHuNGrO7PrU3DnKn7zItEKSZ6zo62vBNQ1hYXqt
         QIF4UECsY2wsR8KYbY+0y4VYdQZt+sUNq+UUUW1WWZ2K9VPs172V0DvzUcvgxHKvZDz9
         NhIC3Sf1PpbfnxxCXFGud8EHYq+3GIM87UxQk5R27C+FD4Z43LjavUTjYyjWzi/7hpIj
         I6929Ic/aU46fT3Lwx52hyujGfX4tCGva5uyBSUDvpnKOndooWzgJV5d1bfHtZUxpySA
         ySZw==
X-Gm-Message-State: AOAM5316gp5LJhv5Wa3wH8A+/UjEdsBZ9OLv6xSr6xyynKMotNYsVlVe
        zW08KTUMBO22Sd4D/UsR8A4=
X-Google-Smtp-Source: ABdhPJwRN2GnIunUX8FoOoOJ62YJLzL/eVouPTGA75PcxzKc6HSSCQiNYnFEuWI4GUvXzjBdl5sqdQ==
X-Received: by 2002:a37:9d57:: with SMTP id g84mr10563431qke.71.1615531600296;
        Thu, 11 Mar 2021 22:46:40 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id g186sm3921843qke.0.2021.03.11.22.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 22:46:40 -0800 (PST)
Subject: Re: [PATCH V11 0/5] dt: Add fdtoverlay rule and statically build
 unittest
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <7211f09e-092b-d928-0c69-e2dcd1fc7c1e@gmail.com>
 <20210312043110.hirx52ibepfrvvij@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <c3139c14-2099-a74d-5084-877c1532343f@gmail.com>
Date:   Fri, 12 Mar 2021 00:46:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312043110.hirx52ibepfrvvij@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/11/21 10:31 PM, Viresh Kumar wrote:
> On 11-03-21, 17:27, Frank Rowand wrote:
>> On 3/9/21 11:35 PM, Viresh Kumar wrote:
>>> Viresh Kumar (4):
>>>   kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
>>>   kbuild: Allow .dtso format for overlay source files
>>>   of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
>>>   of: unittest: Statically apply overlays using fdtoverlay
>>>
>>>  drivers/of/unittest-data/Makefile             | 48 ++++++++++
>>>  drivers/of/unittest-data/overlay_base.dts     | 90 +-----------------
>>>  drivers/of/unittest-data/overlay_common.dtsi  | 91 +++++++++++++++++++
>>>  drivers/of/unittest-data/static_base_1.dts    |  4 +
>>>  drivers/of/unittest-data/static_base_2.dts    |  4 +
>>>  drivers/of/unittest-data/testcases.dts        | 23 ++---
>>>  .../of/unittest-data/testcases_common.dtsi    | 19 ++++
>>>  .../of/unittest-data/tests-interrupts.dtsi    | 11 +--
>>>  scripts/Makefile.lib                          | 40 ++++++--
>>>  9 files changed, 218 insertions(+), 112 deletions(-)
>>>  create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
>>>  create mode 100644 drivers/of/unittest-data/static_base_1.dts
>>>  create mode 100644 drivers/of/unittest-data/static_base_2.dts
>>>  create mode 100644 drivers/of/unittest-data/testcases_common.dtsi
>>>
>>>
>>> base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
>>>
>>
>> Does not apply to 5.12-rc2
> 
> I was based right over the 5.12-rc2 tag.

I don't know why I failed.  Given your report, I went back to
v5.12-rc2 and the patch series applies fine.

Either way, my tags are ok.

> 
>> because of a dependency on a patch to
>> scripts/Makefile.lib.  That patch has been merged by Linus
>> somewhere between -rc2 and -rc3.
> 
> git log --oneline v5.12-rc2..origin/master -- scripts/Makefile.lib
> 
> gives no results to me.
> 
>> I had a working version
>> between -rc2 and -rc3 at commit e6f197677b2e
> 
> I have tried both Linus' tree and linux-next, and I don't see this
> commit.

Sorry about that, the commit id I gave was after applying the patch
series.  The commit id I should have reported is 144c79ef3353.

-Frank

> 
>> that does have
>> the required patch, so that is the version I used to test
>> this series.
>>
>> There is still confusion caused by the contortions that unittest
>> goes through to mis-use base DTBs vs overlay DTBs, so _after_
>> this series is merged by Rob, I will poke around and see if
>> I can change unittest so that it does not look like it is
>> mis-using DTBs and overlay DTBs.
>>
>>
>> Reviewed-by: Frank Rowand <frank.rowand@sony.com>
>> Tested-by: Frank Rowand <frank.rowand@sony.com>
> 
> Thanks.
> 

