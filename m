Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 699576BCDBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Mar 2023 12:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjCPLPA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Mar 2023 07:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjCPLO4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Mar 2023 07:14:56 -0400
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320FEEB;
        Thu, 16 Mar 2023 04:14:32 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id bh21-20020a05600c3d1500b003ed1ff06fb0so823167wmb.3;
        Thu, 16 Mar 2023 04:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678965270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZDBT0cMZ0W19lPDUhO8A3SC8gJRP8pNHC7vkw5YBWs=;
        b=m7h4cvpVhloSYFgu3RtK71cLUIHCV2B2Xc3/kzbe7SoK4p1wJ/5uwSXXmTQcXJBYJ1
         N3fRhoSQK/hjvI11RjN/ga8mAMftWPM7XO/zk0T2voVXktH8ugBtSB4oWxs6KjAyGMlJ
         lggGGONnPsXTEG5POp1uLgJxemPKROQN82UwtJuM0w2I0DWo9bLVtTkSI3PysRbP0WOR
         TLhIPxmGD3zBSUXl2jw2ebtn/Yr88ZfXU6KE2W4GeTKckD8todb/sdI+NirGuKRfIHBm
         5jiqR8c1Bl5CydZMajejcDYYc2HUmHA5tQIJsPHt5MyEurIYvPDMSJr/ha70oqIGRgd9
         /E2w==
X-Gm-Message-State: AO0yUKUdp/0CFqAdxsEKISaw6vbR196RFWYKCnVcBZZsi4P53GlCr+fU
        iGMpfuAEqTnvJhM6cNPo0obxay2Kto8=
X-Google-Smtp-Source: AK7set+u7sPC1b8dhu6zYooEMDkVjysjW+tBZ0xjaRmULDxxhCOU9R0dfR3BrzDHYj9d5TdjWFQXRg==
X-Received: by 2002:a05:600c:4448:b0:3dc:1687:9ba2 with SMTP id v8-20020a05600c444800b003dc16879ba2mr20542511wmn.35.1678965270508;
        Thu, 16 Mar 2023 04:14:30 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c1c8600b003e209b45f6bsm5082683wms.29.2023.03.16.04.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 04:14:29 -0700 (PDT)
Message-ID: <705ce64c-5f73-2ec8-e4bc-dd48c85f0498@kernel.org>
Date:   Thu, 16 Mar 2023 12:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] s390/nospec: remove unneeded header includes
Content-Language: en-US
To:     Vasily Gorbik <gor@linux.ibm.com>,
        Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
 <patch-2.thread-d13b6c.git-d13b6c96fb5f.your-ad-here.call-01656331067-ext-4899@work.hours>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <patch-2.thread-d13b6c.git-d13b6c96fb5f.your-ad-here.call-01656331067-ext-4899@work.hours>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 27. 06. 22, 14:50, Vasily Gorbik wrote:
> Commit 4efd417f298b ("s390: raise minimum supported machine generation
> to z10") removed the usage of alternatives and lowcore in expolines
> macros. Remove unneeded header includes as well.
> 
> With that, expoline.S doesn't require asm-offsets.h and
> expoline_prepare target dependency could be removed.
> 
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> ---
>   arch/s390/Makefile                  | 2 +-
>   arch/s390/include/asm/nospec-insn.h | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> index fc72a35a1f07..4cb5d17e7ead 100644
> --- a/arch/s390/Makefile
> +++ b/arch/s390/Makefile
> @@ -166,7 +166,7 @@ vdso_prepare: prepare0
>   
>   ifdef CONFIG_EXPOLINE_EXTERN
>   modules_prepare: expoline_prepare
> -expoline_prepare: prepare0
> +expoline_prepare:

Hi,

this likely broke s390 build as expolines still depend on 
scripts/basic/fixdep. And build of expolines can now race with fixdep build:
      make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
      /bin/sh: line 1: scripts/basic/fixdep: Permission denied
      make[1]: *** [../scripts/Makefile.build:385: 
arch/s390/lib/expoline/expoline.o] Error 126
      make: *** [../arch/s390/Makefile:166: expoline_prepare] Error 2

I returned there:
   expoline_prepare: prepare0
and it looks good so far. Maybe even:
   expoline_prepare: scripts
would be enough.

Opinions?

thanks,
-- 
js
suse labs

