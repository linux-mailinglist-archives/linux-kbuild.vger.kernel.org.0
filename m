Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A3376CBC6
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Aug 2023 13:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbjHBL3X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Aug 2023 07:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjHBL3X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Aug 2023 07:29:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18AAE211B
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Aug 2023 04:29:21 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso72949285e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Aug 2023 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690975759; x=1691580559;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TPoTZ0AnEw7CjsD9elrDwBW8XI74dER/7QSknN4eufA=;
        b=nZbKdMiyIN7mkxzb1Bxh/FuyxijHi5GZ9Mb5CDwki5kVcl3oyKWyA1t4I5sXfHdfq1
         FrBGuwBgqC6lPPI4soa0OvOmkjheEx/S6JTfcg3sx56D9/ViiJxkicVVzLOHhv+AAjb8
         +kXc5Gu+qtUNNxjkgMlGxjPNLLQRFgULXWrdA6OESgAT01SfrJOPfn18u8jCnflurJpO
         TrO1M4nJaWqxmfhtm1P48qeAGKZ4nSt55VS7xHh16Aujzo3IocOrJ6RyZrzZaMeLw3IS
         8xc6HPSufnnu1zfdMtjsglNI0z48ZQ+CYHDcSwyRou+/EJhBw3FqY8xDmizVR4U0UnM2
         3D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690975759; x=1691580559;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPoTZ0AnEw7CjsD9elrDwBW8XI74dER/7QSknN4eufA=;
        b=UFnU0auxC7H9jp3L7LfjMKY+CdcgVqbWuTH/REamdU7SH2XyVRK5egptXLZEIQQc+g
         XgiX812MgvejYiSQpslB4plC+ff89nwcGsvLl08KYB2tXkpsmze+8oD4myR/gvXSfWcD
         W5NYrumT2+D5++ykaijgKpIN97neSsTOxRj0byLE+Xq+S3pSFeS+xwOrHUC6ddn4GiDX
         GHLLICRPnR3sdRBg04tCkwNuYGTXNzyJquLeIdJJk6Rar/1Xk4C7TPEjVCSXtqPwybu4
         lDY9UToSs8RtlXuQBUTLYWM0y65N5MydLZ2yWfpS2suubz+D9cOIkowBgYaP4c2eCOlh
         VeIg==
X-Gm-Message-State: ABy/qLbCgL4PpZhGt6hZ9MLIUZ3QF9jsmWnaEcWRQS5oBTV2vTjOZ0Xz
        bHHier/bINc7Cml46+TyhtBuf9ztgQdzU9cQJa4=
X-Google-Smtp-Source: APBJJlEChp3ZHvzNH+wmgQIDXlJTbbCz6dq8ybnmdMwkuOUOKBrbx5ydqPSfWaib7fWgbld+tS0CFQ==
X-Received: by 2002:a7b:c392:0:b0:3fb:feb0:6f40 with SMTP id s18-20020a7bc392000000b003fbfeb06f40mr5008992wmj.11.1690975759503;
        Wed, 02 Aug 2023 04:29:19 -0700 (PDT)
Received: from [10.1.11.159] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b003fe2b6d64c8sm1446989wmi.21.2023.08.02.04.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 04:29:18 -0700 (PDT)
Message-ID: <e14f2645-f8a4-fb48-9e29-d6886b22711b@smile.fr>
Date:   Wed, 2 Aug 2023 13:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: oldconfig loop infinitely with a hex/int config without valid
 default and a closed stdin
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
References: <387d7f82-aa8e-759f-7e12-08dfc329c47f@smile.fr>
 <CAK7LNAQHP5B0bSaqdgjD+q5nET-hA=RD+b0t=zZBmnpOV9NvRg@mail.gmail.com>
From:   Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAK7LNAQHP5B0bSaqdgjD+q5nET-hA=RD+b0t=zZBmnpOV9NvRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/30/23 10:59, Masahiro Yamada wrote:
> On Sat, Jul 29, 2023 at 12:23 AM Yoann Congal <yoann.congal@smile.fr> wrote:
>> Hi,

Hi,

>> While analyzing a Yocto bug[0] I think I've identified a problem in kconfig.
>> The problem happens if you have a hex or int type config without a default value.
>> Like this :
>>   config TEST_KCONFIG
>>         hex "Test kconfig"
>>         # No default value
>> ... and try to start oldconfig with a closed stdin (like we have in Yocto):
>>   echo -n "" | make oldconfig
>>
>> When this happens, oldconfig prompts for the value of TEST_KCONFIG but stdin is closed it get the global default value : an empty string. This is not a valid hex/int value so it prompts again, hence the infinite loop.
>>
>> I'm having trouble pointing where the bug is exactly :
>> * Should the global default value for hex/int be valid in their context? (like the minimal value of the range or 0/0x0)
>> * Must all int/hex config provide a valid default value? (This is the case for hex config in the kernel). This would have to be documented somewhere (Some other KConfig implementation did [1])
> 
> Presumably, it is reasonable to require explicit 'default' for int/hex.
> 
> Most of the int/hex entries in Linux are already doing it.

Shouldn't this be documented somewhere? (Sorry if it already is, I could not find it)

>> * Should all oldconfig/syncconfig/... exit with an error when trying to prompt on a closed stdin? (I might be able to send a patch for this one)
> 
> No.
> I have seen multiple scripts piping the 'yes' command to Kconfig.
> There is no reason to prohibit pipe or redirection.

I agree, I would not want to prohibit pipe or redirection.

I'm specifically talking about a *closed* stdin. A closed stdin is a case were we're 100% sure that we'll never get a valid value. This is why I propose the following check :
- closed stdin
- default value is not valid (eg "" for a hex or int)
If these two conditions are true when prompting, then exit with an error instead of what happens currently : starting an infinite loop.

Would you accept something like this?


> I think the fastest fix is to send a patch to U-Boot
> to add a default for CONFIG_DEBUG_UART_BASE
> (and more patches if there are other similar cases).

Ok, I will try to do that.

>> [0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14136
>> [1]: https://docs.zephyrproject.org/1.14.0/guides/kconfig/index.html#redundant-defaults

Thanks!
-- 
Yoann Congal
Smile ECS - Tech Expert
