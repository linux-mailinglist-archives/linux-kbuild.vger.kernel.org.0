Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D50304CFA
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 00:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731312AbhAZXAc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393973AbhAZSDW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:03:22 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4DCC061788;
        Tue, 26 Jan 2021 10:02:42 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id d15so12852901qtw.12;
        Tue, 26 Jan 2021 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZEGvWes5BeNFv5Euqr9zkfyZS8N1+C3fS0DneAmJqio=;
        b=RiDWJ8GIU4ZcgUdJF1IzXJt0o77jbZPt6i2dn2s6KkTM3Zlyre3cILy0SjGrwDIqAy
         ezv32O9sxBhtR+ffag7FNoTcTYGdxPuLR6xMkHpAxxQ+snqy3OnoM5P6+lkv2t3fkVse
         D86Pa1i3+7Ng3ry5HwNdraefVhbTUK1S4YtvrR4D3COIWtOooKDt7EOwG8RpL7t8h71T
         l3VWg9lLKe3IgJe61n8GybWQifvQJtI5DXmjQHrL6x72ckFuynDldrmsnsSdtTYB6hml
         m7y+uQqTYPRQ7/Okn0zou/bVZP0NiFEk+TYVBSmE8trN6N7qaQ7f2owX4QKA7TXf4YhV
         Y4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZEGvWes5BeNFv5Euqr9zkfyZS8N1+C3fS0DneAmJqio=;
        b=iA0GwniOgPidSmMZrzncqAQ5A/ekY2PLGWOvZo+lCeb54c/2tDeJTVZggpyKqmREcZ
         qJ5wXNZjhWKBEiQrD/b48HHzwFsNtCWOSu9MBV5hnEuSrrkpoEO9OJocRKIKyHnBZXd2
         O3zNHQlWb/PZFnl8kEPuoaMiJPyy2NxzUdTId1BPiEZ/fMHi3nE15Qk5gjRfEdbML6h2
         y6AIOz7oKQ3/+gAovckaTAbm5z/HjCc+7+DU0t03u9g4zhgG92kn/Ck5fRg3hmaprMDf
         HhQ+BE7tkkF3L7PvaC2qd2E8g08tUnKWOKxDwVsKPJWSkdz6Is/N3HU/AqvK8hSbPFhc
         L7iQ==
X-Gm-Message-State: AOAM5321lOAhkHSvayK8epMr0qHKywcbvm+4WOFG7qKz+vYWpNa9+ehY
        RKNROhcZCX50cXLzIpFWal+EodunJ7Vjfw==
X-Google-Smtp-Source: ABdhPJytYy2VW0QiTxMDDs7Xt9QDC+hrYDz5Xd6eC9vCZwZI8SpaBGnj0TBlQlf1kV7xGpJaXcNo6A==
X-Received: by 2002:ac8:5c0f:: with SMTP id i15mr6227543qti.152.1611684161925;
        Tue, 26 Jan 2021 10:02:41 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id 75sm9115607qta.68.2021.01.26.10.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 10:02:41 -0800 (PST)
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     Masahiro Yamada <masahiroy@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        cyril@debamax.com, Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        DTML <devicetree@vger.kernel.org>
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <75be8210-ff70-51cb-11f1-bd012ac7fb94@gmail.com>
Date:   Tue, 26 Jan 2021 12:02:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+frank

On 1/25/21 3:53 PM, Masahiro Yamada wrote:
> On Mon, Jan 25, 2021 at 8:07 PM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
>>
>> Adding the -@ switch to dtc results in the binary devicetrees containing
>> a list of symbolic references and their paths. This is necessary to
>> apply device tree overlays e.g. on Raspberry Pi as described on
>> https://www.raspberrypi.org/documentation/configuration/device-tree.md.
>>
>> Obviously the downside of this change is an increas of the size of the
>> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
>>
>>         $ du -s arch/arm/boot/dts*
>>         101380  arch/arm/boot/dts-pre
>>         114308  arch/arm/boot/dts-post
>>
>> so this is in average an increase of 12.8% in size.
>>
>> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> 
> (CCing DT ML.)
> 
> 
> https://www.spinics.net/lists/linux-kbuild/msg27904.html
> 
> See Rob's comment:
> 
> "We've already rejected doing that. Turning on '-@' can grow the dtb
> size by a significant amount which could be problematic for some
> boards."
> 
> 
> 
> 
> 
> 
> 
> 
>> ---
>>  scripts/Makefile.lib | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 213677a5ed33..0683a5808f7f 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -319,7 +319,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>
>>  quiet_cmd_dtc = DTC     $@
>>  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>> -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>> +       $(DTC) -@ -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>> --
>> 2.29.2
>>
> 
> 
> --
> Best Regards
> 
> Masahiro Yamada
> 

