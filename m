Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F00179D54D
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Sep 2023 17:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236368AbjILPvd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Sep 2023 11:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236351AbjILPvc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2023 11:51:32 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB1F10F1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2023 08:51:28 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso65972375e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2023 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1694533887; x=1695138687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wsNP+CUalvUAjJvta1otwWAcFQV71qxca94iMKEqF/A=;
        b=CgSvOc8BAjFMAzPzese9A4RKTk1RU/gGmxNAZ+z/6nItCCvPxRtIfSEHR0NRfrh2+T
         URYZUrhYbQoSbspD+NdKkRVgMcVP/2A/+JCtwwYZmp2DyGn/URz0kYO6hs6eC2V4riMJ
         g1AgnPsuCwqbihOcd0aErcQBEVF562lKwTWChCe1aQabrZXNasNJQm7h4+3QjooO/Q1u
         op6ZF0i0Lzuj22xOtsyqieur1ayk/6VE9H8oB0Cxsm7/bJJhiFEr59j7Uf9LAM3WIi46
         7irnJbrslFJe61IDADS6EAdWagIBHybxe4Zuil5le00afrTnAPdsB7sy3LyY6e96CRsw
         auPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694533887; x=1695138687;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsNP+CUalvUAjJvta1otwWAcFQV71qxca94iMKEqF/A=;
        b=moI7HgXrrOaYlOjZkE3sJLOaNyAzMUKoYPcJ4EqOywREVywJEG4QqSrpVHiQydmpYr
         WcEVBjxlzq/9Wkmfu08i6cvs/fAQcBYIv/WbFQz3UpNitq3BZc3ObFM790q3qHQL+RNf
         Iri5degDuLVAd5XvDmNXnzGpevaEl3YCYIO9V09O9fTaDLnjYCQGm8ZGKPvmh7WpUPjX
         lxHne4gwpPWsb7pAahwSOpe3Be7nk7k+DbBe7dDpvHxqibNosYmlnEffQI3kBVTS+iTz
         uUu9u+QUXQ8Pomdl02p/q3jdWQ+VXSbu7hU3xYRe92XocVj5kExUtvOlh8pf8j558+8n
         C32A==
X-Gm-Message-State: AOJu0YyLpBuj6Fume6xlfy8wEujNgLW6sATLY5VdPSPKeJW1egyccQyj
        jVWjZ3BMIbOYqxgAlkThQsFcvw==
X-Google-Smtp-Source: AGHT+IHZEv95kl3jDktmY1NkUQ24OYCapSA49iSxBijyUf7UeDeqokqnFPczb3o4+M+GuFcdA9m2qA==
X-Received: by 2002:a05:600c:3b1e:b0:402:f536:41c5 with SMTP id m30-20020a05600c3b1e00b00402f53641c5mr11074708wms.3.1694533887008;
        Tue, 12 Sep 2023 08:51:27 -0700 (PDT)
Received: from [192.168.0.32] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id y23-20020a7bcd97000000b003fee6f027c7sm16498569wmj.19.2023.09.12.08.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 08:51:26 -0700 (PDT)
Message-ID: <6ee69f33-f8e3-e0ec-99a1-6be69aa37ea4@smile.fr>
Date:   Tue, 12 Sep 2023 17:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] kconfig: avoid an infinite loop in
 oldconfig/syncconfig
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230805095709.6717-1-yoann.congal@smile.fr>
 <CAK7LNAS8a=8n9r7kQrLTPpKwqXG1d1sd0WjJ8PQhOXHXxnSyNQ@mail.gmail.com>
 <a3990928-b239-9939-5b40-8937d9301674@infradead.org>
From:   Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <a3990928-b239-9939-5b40-8937d9301674@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 8/7/23 22:25, Randy Dunlap wrote:
> On 8/7/23 12:25, Masahiro Yamada wrote:
>> It is strange (and consistent) to bail out
>> only for particular types.
> 
> It's still very helpful to know the symbol name that is causing
> the issue.
> 
>>
>> I would change the code simply as follows:
>> *snip*>>
>> yes "" | make config
>>
>> will succeed.
>>
>> make config < /dev/null
>>
>> will fail.
>>
>> People expecting the closed stdin to succeed
>> may start complaining, but I believe
>> they must fix their wrong scripts.

I've sent a v3 trying to fuse both of your suggestions.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert
