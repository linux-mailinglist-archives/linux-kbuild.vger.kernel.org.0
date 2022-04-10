Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C29A4FAB2E
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Apr 2022 02:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbiDJAJR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Apr 2022 20:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbiDJAJQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Apr 2022 20:09:16 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB85176D03;
        Sat,  9 Apr 2022 17:07:05 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9B0AA834BC;
        Sun, 10 Apr 2022 02:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1649549222;
        bh=dpdIuchMh/sX1+3R2GnL2NcCcVnkZt0eIvZvcUYSsO4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZIfP49ovY7/62RcRdZ3lWbl+8ceT5jZKcDmDFzZL0AmKIZqeQZ0vNvpztTmKJV88a
         XNnlNjQDX+ez/hYDov39dLEZJtBpE8t0gFhFsZKDmveg7q7mljsFYuZYtPPackDgF+
         LQlUQj8wE67vJOJAWggCas4ggZklaEtN86ArrVtoiyxW5ApRrhw3zxiEK2/rCRsg8m
         /Ux243dUlerMxrKcq3f8lo9tyUEMbUeoNElMNVouqjpdhgZuX883wX8gRL8VNWeQE5
         ULM3uyElNwpFP7XXSrAL2q3jG1g6fD/3XkxxNJeYR8IUoFpv4w6GR9I9xdsGVmD96z
         TKkIDM6C66ATA==
Message-ID: <88e8194a-1657-c35d-7794-dd377289a77c@denx.de>
Date:   Sun, 10 Apr 2022 02:07:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC][PATCH] kbuild: Generate symbols for DTO application in DTBs
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20220407110522.122393-1-marex@denx.de>
 <CAK7LNATp4_Hjte3tj_tqVLzJu30fidAowkrBgXkjC-68FwFzkQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAK7LNATp4_Hjte3tj_tqVLzJu30fidAowkrBgXkjC-68FwFzkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/7/22 14:30, Masahiro Yamada wrote:
> Hi Marek.
> (+CC Rob, DT ML)

Hi,

> On Thu, Apr 7, 2022 at 8:05 PM Marek Vasut <marex@denx.de> wrote:
>>
>> Emit symbols section in DTBs to permit symbol resolution when applying DTOs.
> 
> I CCed DT folks, but if I remember correctly, adding -@ globally
> was NACKed because it would increase blob size for platforms that
> do not need overlay.
> 
> 
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>> NOTE: I am sending this as RFC, because I suspect there is a better way how
>>        to pass extra flags to DTC during kernel build ?
>>        Maybe from shell environment somehow ?
> 
> 
> For local use, yes, you can add -@ from the command line.
> 
> Try this:
> 
>      DTC_FLAGS=-@  make ARCH=arm64 dtbs
> 
> 
> This is undocumented tip, but it seems to work
> for the current code.

This is real nice (and very much what I need), thank you.

>>        Or maybe b7e70391a5451 ("arm64: tegra: Enable device-tree overlay support")
>>        is the way to go about this ?
> 
> 
> Since commit 15d16d6dadf6947ac7f9a686c615995c5a426ce2,
> adding -@ is automatic for platforms that support overlay.
> 
> 
> If  <platform>-dtbs exists, -@ is automatically added.
> 
> See arch/arm64/boot/dts/xilinx/Makefile
> as an example code.

Is it now allowed to start upstreaming DT overlays then ?
That would be nice too.
