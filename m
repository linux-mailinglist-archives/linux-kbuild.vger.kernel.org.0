Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7057D2FE1EB
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 06:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbhAUFm1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 00:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbhAUFlj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 00:41:39 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132A1C061575;
        Wed, 20 Jan 2021 21:40:57 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id z9so786004qtv.6;
        Wed, 20 Jan 2021 21:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wc4BdW8DfiuiCxiD8pUU/hmHmIuYrd2v3NyDbHD7XFE=;
        b=vF0pRSSd1MrruFpO5/ZNN9Te3xVAxmqYQG+BEa2o4Pn6hCDbkt8CT7v2a01G+6Vdb7
         811HKrFHMB4NKlKusxwOo786bDC1USVA6KRJ3SKbJtLGfzCA3s6N6Pvyv/9B8Vh8ucMS
         OPgUIypBE1pOSkBYdIAPixnqexehLNS24q5tciiSijGUIrBKszE+hdqKOs3gYBwxTZUI
         /nKM0wCqTGdbCPogxueZw17oTPjZ/kwgvd7Tqzr8kNH1C0y1Tr4Prfd9C4qwWBGZbwIZ
         OnOM1OSirkdX11DqJGeYeaVFM46+HYJzAA8+Ngp+6cLXiP2UlJU9kzwDjsTeLNvzTYKh
         4cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wc4BdW8DfiuiCxiD8pUU/hmHmIuYrd2v3NyDbHD7XFE=;
        b=ijCqCuI3yZzQipIxRS/UfjwrLB2ZtJ05VdN4X4tZ/Kc+XPoTpTzDGlC0sKMJP981oL
         l8CmXrBoUwq3cUhl17/J7jkHugc4/eu3zAh2uoqQ3SwKJhkAAmfca6pu8uJUQwkfCepS
         vhDrE/F0QCswedjfM1vfjpaEe2qjAPEBSdB6ZnTW3MqmEUqQ4N2KV/rVWVSGRw0xujgi
         DCtlEZQe+RlwemX+22VaF6aJ7gAQnasm8hz5gpgVwOD/hZT5MdNu4NldesStjN8AcftY
         Qzt0xkHOasERQNkovbFfAsdAebhemxvBqhirl9YKKiDwTxgX2Wsgd02uumzpGk1jEq0w
         Debw==
X-Gm-Message-State: AOAM533uWeCjDqNK9/7yU6uSo2HAHWJok8pQvmpKgfhYOCdbS3UH1mem
        TXVG2iUWvrF//yL5gFAon+I=
X-Google-Smtp-Source: ABdhPJzXse0K6Rcv9KIoDD5E8H/hDibE2NCTH+S9FlEBa/EVR5q216Nbi5ehVdT011WGAVK/z3qTGA==
X-Received: by 2002:a05:622a:4d1:: with SMTP id q17mr12358188qtx.272.1611207656402;
        Wed, 20 Jan 2021 21:40:56 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id 2sm2728926qtt.24.2021.01.20.21.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 21:40:56 -0800 (PST)
Subject: Re: [PATCH V5 4/5] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        linux-kbuild@vger.kernel.org
References: <cover.1611124778.git.viresh.kumar@linaro.org>
 <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
 <20210121004955.GE5174@yekko.fritz.box>
 <20210121041300.ocerhqaieytj6gds@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <84f85320-b9cd-6ebc-671a-d21b5266d264@gmail.com>
Date:   Wed, 20 Jan 2021 23:40:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121041300.ocerhqaieytj6gds@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/20/21 10:13 PM, Viresh Kumar wrote:
> On 21-01-21, 11:49, David Gibson wrote:
>> If you're using overlays, you probably need the -@ flag, for both the
>> base file and the overlays, which AFAICT is not already the case.
> 
> I think the idea was to do that in the platform specific Makefiles,
> unless I have misunderstood that from earlier discussions. So a
> platform may want to do that per-file or just enable it for the entire
> platform.
> 

Yes, that is correct.  For drivers/of/unitest-data/Makefile, we have
entries like:

DTC_FLAGS_overlay += -@
DTC_FLAGS_overlay_bad_phandle += -@
DTC_FLAGS_overlay_bad_symbol += -@
DTC_FLAGS_overlay_base += -@
DTC_FLAGS_testcases += -@

-Frank
