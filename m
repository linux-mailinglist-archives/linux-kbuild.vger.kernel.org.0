Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591A4767070
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jul 2023 17:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236449AbjG1PXb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Jul 2023 11:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236522AbjG1PX3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jul 2023 11:23:29 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80D735A6
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jul 2023 08:23:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbfa811667so23870795e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jul 2023 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690557805; x=1691162605;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwVPaqqk2JRul54BzeAHw/LOC+TyX+TEc2VdFsQtI6w=;
        b=0M5cZ37cYppZf5ReweyBSkgpyRdmzJJUg6Rk13e9WdxDjqh6iehv45/v7MpYZT5Skg
         m0rGWp4Fdgf6N5rkb0NxaDTshaYLr3ZbQ4ieNoZO65+WEJ/BJrhcS/3lCWDzNbxu23Jj
         94IramNN5EG8Aj73BdWcXRIkhEYSXU8LtFNPOWs2T0YUtoMQVuzPMe9jFM0Zc5pyL5R9
         PdeyGOYupkJCgkUczVXp+gw390u1E83DdJACegSptlSE5/FgVxWveCu3ua8gpqlKMN75
         Y/GJIJO3EEoBJEKy6gqB4tudjLMlhsHkktYocZUkk57mVrfeXsWHM1S27ayDK8do3spy
         s+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690557805; x=1691162605;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwVPaqqk2JRul54BzeAHw/LOC+TyX+TEc2VdFsQtI6w=;
        b=X5XnNDIkpVcQoFX1TBIyx12X/pIR0ibtrGVD4/cse6uMT9zyXm44Hrabfi+MahnLd3
         /3ebimw2I6lFsooyC2mY6UXSCA1tcmYFz7NIUE1x7LUmgWzQBvAIyRm+8Rg9M4KkNR5q
         ZZspifQf3gGqXji7zGmTuQPx4iMQkK6LGOHOaz+dvhcHRdIZM2EcgwmhAkkfx7KVBNpE
         MPwkBxHfxRTKR7Z+w4TtOoMjDXfFLGPt0x+61B7I/lo9lzGSQQiujaYK+I1e0EvaZcFl
         BzkKDCRmKpv3x0ICouPCBuiqVeccnsGn8mcI3TcqL/Zcc1O/sN6CgASDW6qUhsD8Jz2i
         Fl5g==
X-Gm-Message-State: ABy/qLZBySFBUu38dwDZhlMexKHlAuzfbzS6WjMwcic81uKaLOprj5N9
        m0t3BXv4tBapCa+XTowaxYo2vSzRimGrPJ4G+7U=
X-Google-Smtp-Source: APBJJlGGJcUPqqL+yXMpZnpLGaeXzHpTjHE9mU5184vBYQ8hGnQcsbEO6KWHWmcNl47AUszeD7CUyw==
X-Received: by 2002:a05:600c:3d13:b0:3fb:e1d0:6417 with SMTP id bh19-20020a05600c3d1300b003fbe1d06417mr4836930wmb.19.1690557804699;
        Fri, 28 Jul 2023 08:23:24 -0700 (PDT)
Received: from [192.168.0.27] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c211600b003fbcdba1a63sm4453467wml.12.2023.07.28.08.23.24
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 08:23:24 -0700 (PDT)
Message-ID: <387d7f82-aa8e-759f-7e12-08dfc329c47f@smile.fr>
Date:   Fri, 28 Jul 2023 17:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     linux-kbuild@vger.kernel.org
From:   Yoann Congal <yoann.congal@smile.fr>
Subject: oldconfig loop infinitely with a hex/int config without valid default
 and a closed stdin
Organization: Smile ECS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Hi,

While analyzing a Yocto bug[0] I think I've identified a problem in kconfig.
The problem happens if you have a hex or int type config without a default value.
Like this :
  config TEST_KCONFIG
  	hex "Test kconfig"
  	# No default value
... and try to start oldconfig with a closed stdin (like we have in Yocto):
  echo -n "" | make oldconfig

When this happens, oldconfig prompts for the value of TEST_KCONFIG but stdin is closed it get the global default value : an empty string. This is not a valid hex/int value so it prompts again, hence the infinite loop.

I'm having trouble pointing where the bug is exactly :
* Should the global default value for hex/int be valid in their context? (like the minimal value of the range or 0/0x0)
* Must all int/hex config provide a valid default value? (This is the case for hex config in the kernel). This would have to be documented somewhere (Some other KConfig implementation did [1])
* Should all oldconfig/syncconfig/... exit with an error when trying to prompt on a closed stdin? (I might be able to send a patch for this one)

NB: I know of olddefconfig but in the case of U-boot, syncconfig is used at a later stage and the problem appears again.

What do you think?

Regards,

[0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14136
[1]: https://docs.zephyrproject.org/1.14.0/guides/kconfig/index.html#redundant-defaults
-- 
Yoann Congal
Smile ECS - Tech Expert
