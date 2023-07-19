Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527FC759049
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jul 2023 10:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjGSIao (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Jul 2023 04:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjGSIan (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Jul 2023 04:30:43 -0400
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0BF1723
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jul 2023 01:30:41 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso10932434e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jul 2023 01:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689755440; x=1690360240;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caQlTg4az06JYBekgEfWh3DUl4GUhfjGVvWUW1G5+34=;
        b=LPpF2lnZjNL1OKSf+iQ6B3tZRSHcaIGxizif0mSUKVKZv9zWGd+XEhRlq1CbnX7j1f
         hRGKfOxOmd0iUHbBF/1vaGSSu/FlaKp6Byf8Etd6gkeiM8m4z6whu3O7Z5mww519o/Ub
         Wmf4Z8h/y8iVDdlstzHQ3ISrS0jLsoTAJvS8X+PcNQ0iF4QmUzGmSGp57X5OfuTdr28n
         QtRA4r/u5iLCLmtko/ptlC5oIv4OqjqPo+KhVs1V2NVt5PxYFfOIVfjdFjhUX1sE3hub
         nwwszlUNX0atVqc7a8xQBNin86qS+xFUsVrVDQwKh3tRWxxncLT/El7W+e0QSy4fLgnC
         awCA==
X-Gm-Message-State: ABy/qLblsLTxvtF3+XSvTdVBvqJvbRd+y4WRK0TG7gzTV8alyg7iSXG1
        rUYg4ABH97O53CB97lKFT8VSWXilI3I=
X-Google-Smtp-Source: APBJJlGQwJqzJ6DS2GmxJHHRW1IGbki07Er/1MaksykgcLgE9mlU6NiAt2OcxPR89Npa/FAJ01ssew==
X-Received: by 2002:a05:6512:234a:b0:4fb:8b2a:5e09 with SMTP id p10-20020a056512234a00b004fb8b2a5e09mr13149373lfu.43.1689755439854;
        Wed, 19 Jul 2023 01:30:39 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id l2-20020aa7cac2000000b0051e22660835sm2360365edt.46.2023.07.19.01.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 01:30:39 -0700 (PDT)
Message-ID: <92f4dfe9-eb87-766b-271a-e57ada3a7dbd@kernel.org>
Date:   Wed, 19 Jul 2023 10:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: arch/um's ssl.o [was: con3270.o] is built twice, leading to errors
Content-Language: en-US
From:   Jiri Slaby <jirislaby@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
In-Reply-To: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 14. 07. 23, 8:33, Jiri Slaby wrote:
> Hi,
> 
> if I create an s390 defconfig:
> mkdir /tmp/s390/
> make O=/tmp/s390/ ARCH=s390 CROSS_COMPILE=s390x-suse-linux- defconfig
> 
> And then if I try for a couple times:
> make O=/tmp/s390/ -j17 ARCH=s390 CROSS_COMPILE=s390x-suse-linux- 
> drivers/s390/char/con3270.o
> 
> Most of the time, I get:
> make[1]: Entering directory '/tmp/s390'
>    GEN     Makefile
>    CALL    /home/latest/linux/scripts/checksyscalls.sh
>    CC      drivers/s390/char/con3270.o
>    CC      drivers/s390/char/con3270.o
> 
> I.e. it is built twice.

Similarly, another tty driver, another arch (um):

$ make O=../a/arch/um/ -j17 ARCH=um arch/um/drivers/ssl.o V=2
   GEN     Makefile - due to target is PHONY
   CALL    scripts/checksyscalls.sh - due to target is PHONY
   CC      arch/um/drivers/ssl.o - due to: arch/um/drivers/ssl.c
   CC      arch/um/drivers/ssl.o - due to: arch/um/drivers/ssl.c

This leads often to corrupted arch/um/arch/um/drivers/.ssl.o.cmd.

But in this case, I see:
obj-$(CONFIG_SSL) += ssl.o

So is this has this a different root cause?

> Sometimes, I also get an error:
> fixdep: error opening file: drivers/s390/char/.con3270.o.d: No such file 
> or directory
> make[4]: *** [/home/latest/linux/scripts/Makefile.build:243: 
> drivers/s390/char/con3270.o] Error 2
> make[4]: *** Deleting file 'drivers/s390/char/con3270.o'
> make[3]: *** [/home/latest/linux/scripts/Makefile.build:477: drivers]
> 
> Obviously due to some race.
> 
> Any ideas what is going on?
> 
> thanks,

-- 
js
suse labs

