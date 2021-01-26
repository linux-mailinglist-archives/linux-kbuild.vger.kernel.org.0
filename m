Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E169D304CFD
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 00:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731349AbhAZXAg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731380AbhAZSEi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:04:38 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8101DC061574;
        Tue, 26 Jan 2021 10:03:58 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id t14so9267884qto.8;
        Tue, 26 Jan 2021 10:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nXCZHlDeOu1W7tWclqY0N0hv7zg7bY3yXMrnGLStIvU=;
        b=BRypEvXZJOSvc/4OoNIoKvVKY7lcy0RcPA1Uxj+sYjR/icWTpCxaPgtJLRJLBFI51h
         XW9R/DsDI+cavfet8ggWAxY8E+DmLFcXEKN2/NqmyueWwZSu6yPInhsdvya9sFvpVuV6
         j8y/6IX2LY989AkHwptxbHPpr5FaAbPiER/gPeN6gS65LyPpw6yO6pzU/uTerfNJyawu
         Q19FmdtIAvIhFJDEs1J1CumQYmb7g2wGve2pSgBUpRF3omE3sHtGFaviwjntlDAYOcks
         uQ0JtxkoGK9A5hA4mjRnfb7zr0ANMTQq3KU9EwszhN0SoZn+1xwxqbu7NNplZDqJsHrn
         RrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nXCZHlDeOu1W7tWclqY0N0hv7zg7bY3yXMrnGLStIvU=;
        b=kqvdBNjlTvRhYeKYrtKtvU/etNyFTLsKxWt2SUHq39uXI0AYKTnSw4gaZD58IYMMOC
         mPqjOiHnZ/PvFjT+0xiOTU5K2RjBO179yC1dbKYQe8y8p4ceh3v9AUznzz5K4ZwUIbLO
         XtFUJ9+cF2lk21hWOlaxMgsEUaZPGV7Y3ql0fHfXbq0dmGr3LFQxbekVjZBlmxf54mmX
         wYcRqdVtVhffS0SeYebJQUCLrE2vyqc0kNJGqxVA7gW7nnxoq/i/QMclUCClHwSikSvu
         H+l+P6hWjDGCuT3mpIGrXpO8tiRx+nn0a6qpaBP8v16l8uRDBHYBmrpGjMuR936YEAOD
         YvKw==
X-Gm-Message-State: AOAM533ZbMjznvkofTPOZDQkhcbIvGnFv0LltF/CdceX3h3h7MubNbiy
        O+DHdZx2bSe1+mNTARVHKvg=
X-Google-Smtp-Source: ABdhPJwqnhIgbfRIEpY87vK45ovcVlNAgTl1yo1q7eoeQGm9MdIW7+1ziE7jWa+gK6R3QPyRcbdtuA==
X-Received: by 2002:ac8:5d45:: with SMTP id g5mr6236171qtx.247.1611684237696;
        Tue, 26 Jan 2021 10:03:57 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id d26sm13496164qtw.58.2021.01.26.10.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 10:03:57 -0800 (PST)
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     DTML <devicetree@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>, cyril@debamax.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
 <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
 <CAMuHMdUmtMxucQ9DWvROVPVv2uGEzpRmtv1=jrjm09xU=gHHyw@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <1e713129-db54-64c3-59e3-fc0dba0e0f19@gmail.com>
Date:   Tue, 26 Jan 2021 12:03:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUmtMxucQ9DWvROVPVv2uGEzpRmtv1=jrjm09xU=gHHyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+frank

On 1/26/21 2:43 AM, Geert Uytterhoeven wrote:
> Hi Uwe,
> 
> On Tue, Jan 26, 2021 at 8:21 AM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
>> And then I learned with hints from Rob and Geert that symbols are not
>> really necessary for overlays, you just cannot use named labels. But
>> using
>>
>>         target-path = "/soc/i2c@23473245";
>>
>> or
>>
>>         target = <&{/soc/i2c@23473245}>;
>>
>> instead of
>>
>>         target = <&i2c1>;
>>
>> works fine. (And if you need to add a phandle the &{/path/to/node}
>> construct should work, too (but I didn't test).) Using labels is a tad
>> nicer, but the problem I wanted to address with my patch now has a known
>> different solution.
> 
> Please don't use "target" and "target-path".  Since the introduction of
> sugar syntax support in v4.15[1], you can just use "&label", like in a normal
> DTS file.  Paths do need the special "&{/path/to/node}" syntax instead
> of "/path/to/node", though.
> 
> As usual, you can find lots of examples of DT overlays in my repo[2].
> 
> [1] commit 4201d057ea91c3d6 ("scripts/dtc: Update to upstream version
> v1.4.5-3-gb1a60033c110")
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

