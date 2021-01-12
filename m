Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE0D2F2423
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 01:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbhALAdb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 19:33:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405517AbhALAZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 19:25:42 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A21BC061575;
        Mon, 11 Jan 2021 16:25:05 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id f26so552784qka.0;
        Mon, 11 Jan 2021 16:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hvGe1An1yw/BFTMsS0krviHSfzdBwIfCXLUTiKIE1V4=;
        b=M+LH5yFyuEpMDk2otKP2Q9Cc1rdPc5RM7G1Zgdwe3dIcuU7eFcAi8rugqwwec0yseV
         gCSyD/H76B2RdPcUg/JMxsuMOZx3bUapReBH3DQenIFpCuukHlRk38EtXmr1jC3ua+00
         FiRKvwhVcoNylEuiNGZCufc5OfHXGkYQvP1+fZG6rgoDxL++u4lu74X76DjOBeYtcPo3
         JTD45dAQH+WwMC3bYYjKofnrMaxEK1phT54/iw07cRxdL6gz718ib+Gq+ux2bXSbPIZc
         k6OBLqf0/u17tZtAWWc2rp5Ey6TQGt6cqIekaXbB+0vHLHt9W49hTyO/VZQAttVVVjYk
         Zu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hvGe1An1yw/BFTMsS0krviHSfzdBwIfCXLUTiKIE1V4=;
        b=WNXNiD24MEUD3LaugvqE9dEoMvgBJzQdJxsRME+VlxQVGoakNKYSidHG8RrhQimXob
         enRDoJD78v092dfIXxH+HS2ilGm3Q2mJObTnAqK8e5MEv6Fz//sTp4SHppGRrQ6y3ddy
         XJiInZ8BfgIGNHxdVDTLkuLMHuiF1BcvswE6BXd4rvr0UnZFMvlgHfDe3pv33cK8L58X
         vdb/y0OfXZmm488hgvBWh50Hh3sDZCLrlBW8h/MpvxpT9e16oa4ybotIkw7m8MO5i9+a
         sZwkUcErLoM5v5sGR+ouzmOQmYRO8BGxFCHer0hqbUnzPYK6l3sM0xJL4kNfBV/uoqDm
         QoTw==
X-Gm-Message-State: AOAM530bS7bmFYJeEoC71EIGy1MeTTU/upiqwlkrvnkqh82Qi61VHhqT
        YukLOhmmLGR9r8/HenQe/A0skmfoUrEu1g==
X-Google-Smtp-Source: ABdhPJxW2jv5ZDgwMJqnCssVvZyyojKvPcIWGh7trhlz5XVg/4E8nS6V6vzLibM6NN1hqEkU7scG0A==
X-Received: by 2002:a37:4a82:: with SMTP id x124mr1958071qka.458.1610411104783;
        Mon, 11 Jan 2021 16:25:04 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id o10sm549610qtg.37.2021.01.11.16.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 16:25:04 -0800 (PST)
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
References: <cover.1609844956.git.viresh.kumar@linaro.org>
 <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <1cbefc63-4185-def5-2afa-d929a44e4e1f@gmail.com>
Date:   Mon, 11 Jan 2021 18:25:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/5/21 9:21 AM, Rob Herring wrote:
> On Tue, Jan 5, 2021 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> Hello,
>>
>> Here is an attempt to make some changes in the kernel to allow building
>> of device tree overlays.
>>
>> While at it, I would also like to discuss about how we should mention
>> the base DT blobs in the Makefiles for the overlays, so they can be
>> build tested to make sure the overlays apply properly.
>>
>> A simple way is to mention that with -base extension, like this:
>>
>> $(overlay-file)-base := platform-base.dtb
>>
>> Any other preference ?
> 
> I think we'll want something similar to how '-objs' works for modules:
> 
> foo-board-1-dtbs := foo-board.dtb foo-overlay1.dtbo
> foo-board-2-dtbs := foo-board.dtb foo-overlay2.dtbo
> foo-board-1-2-dtbs := foo-board.dtb foo-overlay1.dtbo foo-overlay2.dtbo
> dtbs-y += foo-board-1.dtb foo-board-2.dtb foo-board-1-2.dtb

(Thinking ahead....) I'm not sure how to fit connector nodes and the
corresponding plugin overlays into this model.  A single plugin .dtbo
will need to be relocated onto one or more connector nodes.  fdtoverlay
and the run time overlay apply code do not know how to do this yet.

-Frank

> 
> (One difference here is we will want all the intermediate targets
> unlike .o files.)
> 
> You wouldn't necessarily have all the above combinations, but you have
> to allow for them. I'm not sure how we'd handle applying any common
> overlays where the base and overlay are in different directories.
> 
> Another thing here is adding all the above is not really going to
> scale on arm32 where we have a single dts directory. We need to move
> things to per vendor/soc family directories. I have the script to do
> this. We just need to agree on the vendor names and get Arnd/Olof to
> run it. I also want that so we can enable schema checks by default
> once a vendor is warning free (the whole tree is going to take
> forever).
> 
>> Also fdtoverlay is an external entity right now, and is not part of the
>> kernel. Do we need to make it part of the kernel ? Or keep using the
>> external entity ?
> 
> Part of the kernel. We just need to add it to the dtc sync script and
> makefile I think.
> 
> Rob
> 

