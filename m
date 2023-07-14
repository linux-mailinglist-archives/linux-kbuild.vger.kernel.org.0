Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A882575320B
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jul 2023 08:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbjGNGel (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Jul 2023 02:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbjGNGeS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jul 2023 02:34:18 -0400
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE47C30E9
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jul 2023 23:33:49 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-52162b2f18cso197251a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jul 2023 23:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689316428; x=1691908428;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmFcJkiBwPQ/COWzvSWc7QMWXtETyPlJ3qMCELjrLyc=;
        b=k/lac4CZR5bszLyRpKWeP7ZyhSwJKRzADQ08CIiN4COajNSIp1jVJY/96svrW5H7YB
         WPa9rbvpXoo2oa7eyHnN+3Ve29OedELwEE2nRL9WZ6HEXd3PbM97HY95sH2rfnaOVQE8
         +oiuPlLGgYrOqdO3Ogb5j6uf+lcZgiHlS2d+H9uihMdV7+J+HOJGim5QpurvGqt79UzR
         fndzUI4ji2UFwat9zXNTn69oRKEoHHh6eheieyoPXRJAhO5OfqAeoLIAqz8a1NnFABt3
         IeFbOGUngXkxb/63DmowiX/1pr5hz7bub7Z9zaZG8feLFkAtAsCJpwy+8qRMsoa4/C/8
         PGnQ==
X-Gm-Message-State: ABy/qLZWdZhOJVyLVL2m5ZBQWBwLY3S1/K7VoPyG2ZwmpITfyf+Wpona
        rNvMLWmyYDbDz1q7XhYrn+JvDMZKIlw=
X-Google-Smtp-Source: APBJJlH+nzs96G7o3Kjz9zbDkXhGVy50K2oMaGzSto/uZdIVeRhq75PwxChc4V2KICK1ysJIp1DHGg==
X-Received: by 2002:aa7:d7c7:0:b0:51e:1932:db07 with SMTP id e7-20020aa7d7c7000000b0051e1932db07mr3872657eds.34.1689316427954;
        Thu, 13 Jul 2023 23:33:47 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id e3-20020a50ec83000000b0051e0ea53eaasm5290894edr.97.2023.07.13.23.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 23:33:47 -0700 (PDT)
Message-ID: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
Date:   Fri, 14 Jul 2023 08:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
From:   Jiri Slaby <jirislaby@kernel.org>
Subject: con3270.o is built twice, leading to errors
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

if I create an s390 defconfig:
mkdir /tmp/s390/
make O=/tmp/s390/ ARCH=s390 CROSS_COMPILE=s390x-suse-linux- defconfig

And then if I try for a couple times:
make O=/tmp/s390/ -j17 ARCH=s390 CROSS_COMPILE=s390x-suse-linux- 
drivers/s390/char/con3270.o

Most of the time, I get:
make[1]: Entering directory '/tmp/s390'
   GEN     Makefile
   CALL    /home/latest/linux/scripts/checksyscalls.sh
   CC      drivers/s390/char/con3270.o
   CC      drivers/s390/char/con3270.o

I.e. it is built twice.

Sometimes, I also get an error:
fixdep: error opening file: drivers/s390/char/.con3270.o.d: No such file 
or directory
make[4]: *** [/home/latest/linux/scripts/Makefile.build:243: 
drivers/s390/char/con3270.o] Error 2
make[4]: *** Deleting file 'drivers/s390/char/con3270.o'
make[3]: *** [/home/latest/linux/scripts/Makefile.build:477: drivers]

Obviously due to some race.

Any ideas what is going on?

thanks,
-- 
js
suse labs
