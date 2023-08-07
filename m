Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED81077304B
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Aug 2023 22:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjHGUXU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Aug 2023 16:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjHGUXT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Aug 2023 16:23:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE96610DE
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=WGPknOt4lz6nTkr5L6kiCqmWkw4thW8uK4nOZgJU70g=; b=uwg6WtsIo6sak9VVmQHPEPrWpS
        0K4ND8BHshTBYdwMyhCPvWK+GUvl95H8ihE0tCEEkLIrVw27qOMgJ3zgcbbYgXfnAQUY2r214MqaM
        XFXXa+Juxl8S8TFbSl5/jODJVYSKVTdqsWhHGSuEmHdpmxd9rEAzSb8Jebn1sS8O3rdOA+frjbERD
        AqGGzVP+kW3k09Mdr6lqitZgx6QSJArtL3DE57fP1G34iU6nzlVd8YfJHgfOAGg/T+wcIh+D8Xttl
        LjkGP/ZWjeTkAKZlL+DKg9T0uJiqPxrtd4T4cRhBbFsv8GoP4q+/1hry6Mpnty47iZqkctaLR375G
        hM2V9ptw==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qT6ko-000dwF-0k;
        Mon, 07 Aug 2023 20:23:02 +0000
Message-ID: <549dffa3-4899-c8db-d716-db12d613749e@infradead.org>
Date:   Mon, 7 Aug 2023 13:23:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: oldconfig loop infinitely with a hex/int config without valid
 default and a closed stdin
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Yoann Congal <yoann.congal@smile.fr>
Cc:     linux-kbuild@vger.kernel.org
References: <387d7f82-aa8e-759f-7e12-08dfc329c47f@smile.fr>
 <CAK7LNAQHP5B0bSaqdgjD+q5nET-hA=RD+b0t=zZBmnpOV9NvRg@mail.gmail.com>
 <e14f2645-f8a4-fb48-9e29-d6886b22711b@smile.fr>
 <CAK7LNAQDo+oDhf7zr5mCvaVLrBczBqkvQzcTF=nH7nUSrHUgWg@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAQDo+oDhf7zr5mCvaVLrBczBqkvQzcTF=nH7nUSrHUgWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 8/7/23 12:27, Masahiro Yamada wrote:
> On Wed, Aug 2, 2023 at 8:29 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>>
>> On 7/30/23 10:59, Masahiro Yamada wrote:
>>> On Sat, Jul 29, 2023 at 12:23 AM Yoann Congal <yoann.congal@smile.fr> wrote:
>>>> Hi,
>>
>> Hi,
>>
>>>> While analyzing a Yocto bug[0] I think I've identified a problem in kconfig.
>>>> The problem happens if you have a hex or int type config without a default value.
>>>> Like this :
>>>>   config TEST_KCONFIG
>>>>         hex "Test kconfig"
>>>>         # No default value
>>>> ... and try to start oldconfig with a closed stdin (like we have in Yocto):
>>>>   echo -n "" | make oldconfig
>>>>
>>>> When this happens, oldconfig prompts for the value of TEST_KCONFIG but stdin is closed it get the global default value : an empty string. This is not a valid hex/int value so it prompts again, hence the infinite loop.
>>>>
>>>> I'm having trouble pointing where the bug is exactly :
>>>> * Should the global default value for hex/int be valid in their context? (like the minimal value of the range or 0/0x0)
>>>> * Must all int/hex config provide a valid default value? (This is the case for hex config in the kernel). This would have to be documented somewhere (Some other KConfig implementation did [1])
>>>
>>> Presumably, it is reasonable to require explicit 'default' for int/hex.
>>>

I have made patches for a few of these in the past. A few have been accepted.
In at least one case the maintainer did not want a default value (I don't recall
the details of this one).

>>> Most of the int/hex entries in Linux are already doing it.
>>
>> Shouldn't this be documented somewhere? (Sorry if it already is, I could not find it)
> 
> 
> I am more interested in showing a warning
> as not all people read the document.

-- 
~Randy
