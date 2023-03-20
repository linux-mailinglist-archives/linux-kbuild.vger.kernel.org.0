Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FC26C2187
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Mar 2023 20:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbjCTTcX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Mar 2023 15:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjCTTcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2023 15:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8D9EFA5
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Mar 2023 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679340243;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I7Kpwgu4Yf7cURDUTXwMVWYDCxG6tP+A5kuxmrN7os8=;
        b=CKzJmfGT/1VuAau5x+hQsQC5w/NBPSK/tsA4/4I4FiJxMiVSiP7x991J7Cl6tV/4GDdRWm
        P/ABlsWDlenNsQFGMx8jILBFp4woj1gt8yk9lDZpSx2a0ZTDIbUGppiBjFygaZQ/1AzxnL
        /onKeXLHqQIa+B/6wFoo42SHuWbPVDs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-mXwdYrPLMgSj2RGUwtT0xg-1; Mon, 20 Mar 2023 15:24:01 -0400
X-MC-Unique: mXwdYrPLMgSj2RGUwtT0xg-1
Received: by mail-qt1-f199.google.com with SMTP id w13-20020ac857cd000000b003e37d3e6de2so908460qta.16
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Mar 2023 12:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679340240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7Kpwgu4Yf7cURDUTXwMVWYDCxG6tP+A5kuxmrN7os8=;
        b=J6k4ZdGG1S0ylcgCOCExgVvyg9NL6ViDCC5J1UR1jV2IthJGL4w1Y9cQs8vX4df7bp
         /jBC+fjJMv1XTXVhTFui2yCvrlc0lhxqXA8lgyCvLH3A4u4t8Pi8HNrgV+YDXrj/8zxV
         6mDP3uZEUHn4Qm4IE9hzZTqyZ+p6Rb0SC2FMgBNa6L9huxovPUtFczpJXuO/Lud2bov/
         poWssiWZehltlkEIhNgRq1zcpD3q3HI/18OgUXIwlerJDwOjUXjsaLMvqXPisX82vYlT
         8cZDMM2F5rH5AL4ttYqhMHp+XFFf3Q7bKy2QoFWzJy9KmMNGtqd4G2B+tzTGFtBibDmM
         anRA==
X-Gm-Message-State: AO0yUKUNXLGNSh+scJc3TUKc9jNoJzY2RB+tSytsP/7BuNw3OS3i5AnR
        h90YrbaNu6YCM8OjT8emoWuHOJSU1pQupVOAokaagWzykEaqIJjjTiQ4f/ke9iN4hT8b6inCc5f
        lgDvSspR5OMcA0OfSUcj7tb8V
X-Received: by 2002:a05:622a:1a9f:b0:3e1:59e8:7451 with SMTP id s31-20020a05622a1a9f00b003e159e87451mr694341qtc.14.1679340240554;
        Mon, 20 Mar 2023 12:24:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set83KO4cEKnDwKlUlt9dZ8kwvPD5iKQCdo214mre68GtCKfC8+mx9R4t/hpl8WKMrNumolyMlA==
X-Received: by 2002:a05:622a:1a9f:b0:3e1:59e8:7451 with SMTP id s31-20020a05622a1a9f00b003e159e87451mr694275qtc.14.1679340239914;
        Mon, 20 Mar 2023 12:23:59 -0700 (PDT)
Received: from [192.168.1.9] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id f30-20020ac86ede000000b003e2901e5f7dsm1636411qtv.55.2023.03.20.12.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 12:23:59 -0700 (PDT)
Message-ID: <5ee478c9-efa2-60e5-fee5-ed9d5cbceb01@redhat.com>
Date:   Mon, 20 Mar 2023 15:23:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 00/10] livepatch: klp-convert tool
Content-Language: en-US
To:     Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     Marcos Paulo de Souza <mpdesouza@suse.de>,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Marcos Paulo de Souza <mpdesouza@suse.com>
References: <20230306140824.3858543-1-joe.lawrence@redhat.com>
 <20230314202356.kal22jracaw5442y@daedalus> <ZBTNvEPrCcRj3F1C@redhat.com>
 <20230317232010.7uq6tt4ty35eo5hm@treble>
From:   Joe Lawrence <joe.lawrence@redhat.com>
In-Reply-To: <20230317232010.7uq6tt4ty35eo5hm@treble>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/17/23 19:20, Josh Poimboeuf wrote:
> On Fri, Mar 17, 2023 at 04:29:48PM -0400, Joe Lawrence wrote:
>> Have you tried retrofitting klp-convert into any real-world livepatch?
>> I'm curious as to your observations on the overall experience, or
>> thoughts on the sympos annotation style noted above.
> 
> On a related note, the patch creation process (of which klp-convert
> would be part of) needs to be documented.
> 
> If I remember correctly, the proper safe usage of klp-convert requires a
> kernel built with -flive-patching, plus some scripting and/or manual
> processes.
> 
> If nobody knows how to safely use it then there wouldn't be much value
> in merging it.
> 

I took a trip though my inbox and dug up a 2020 discussion on
documenting livepatch and compiler considerations [1].  This led to the
suggestion of a greater, end-to-end livepatch author guide, for which
everyone agreed, but has since remained unwritten :/

If we have a miniconf @ LPC this year, maybe we can volunteer to write
sections, decide on an outline, or even better, have a rough draft to
review and discuss?


Aside: technically klp-convert doesn't require -flive-patching, but it's
probably strongly recommended in order to use it safely.  And fwiw,
kpatch-build could leverage the tool should it desire one day.  In the
meantime, if kpatch-build doesn't need/want to use it, perhaps
klp-convert should have its own CONFIG option?  (Or something in modinfo
to key on.)


[1]
https://lore.kernel.org/live-patching/20200721161407.26806-1-joe.lawrence@redhat.com/

-- 
Joe

