Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD7437534B
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 May 2021 13:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhEFL5Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 May 2021 07:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbhEFL5P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 May 2021 07:57:15 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B8DC06138A
        for <linux-kbuild@vger.kernel.org>; Thu,  6 May 2021 04:56:17 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so4591094otf.12
        for <linux-kbuild@vger.kernel.org>; Thu, 06 May 2021 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6QseWDJD7yxOU5rG3+na4aQGSjg/EdTCgN17vCsxG6Y=;
        b=mlbBVVOHOhncgw4lopPiGHy6NNG+4vZNsw5TbuB+kL97hTTKGxe5M48hp1hvmqSvnF
         TSbCiiwh7InDzzaKZVtA3pjlysz37bVZGSCyJ5xA5NXZELSzieFVupzlCzENCfXyLVJ8
         lQ9ClTaR8Gyxc8SmKu694ilUnDrjFcHKBD5EfnDMKjtMldRlGlU6ijU33bbZRQ7i5eML
         dvNfjxZc8a2KIIzUY8fEf70ryxOfYQn5p1meuFhSQI+sR7voUjNDnM0cjo9fXGauaAkY
         tdgwC8B68IfrCM00egmCeciw+m5i3CcQKpiCdhAAe24DXvHylSzVuunNLT65gIvMce3o
         mJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6QseWDJD7yxOU5rG3+na4aQGSjg/EdTCgN17vCsxG6Y=;
        b=lhpLhF2EBpo3AcBX79RPdiY2vx9gRmdMq8WXmJu6hlXNsIOlaTWm2IEACcNDpEgiZ4
         WVb/QkZWTMXFhZ2VqVdFUO9IZ2BJ/+1EKXQZnS2rpfd/XAGl1T409gGR9r1JDO3mh4pI
         +oa+TagBbVNnZgMuo5VLMeMtRKORrB2YLoIcP3bCav85xTfWYwYiyTuEyPIiCUdkHm/G
         Y4Tmv84jvJLEliCDduPC69EsWM96Isog4aeXyAv+BBxFKItL5UvthbqiyIVZQbasY6lr
         89biloxJV5RsBjC17uUajnKvrvSEP5ExZWkP8R4BIBqfTQemXacRom2wy7yJrm0K7DzL
         v1vw==
X-Gm-Message-State: AOAM531KxbvLe2U6oT42ORYQd6BO/G/vosuvAAZrGI9UW59YL+FFc9UM
        AAfdpS1jR3mfkEI/JSJQ0GPPMw==
X-Google-Smtp-Source: ABdhPJw9TnD7fJ5mwyTc0krHc+cYRAlG0zHj8GY6A4eINag7hGLuvphIDB2gNYjb4J55cRecfnyT/g==
X-Received: by 2002:a9d:6242:: with SMTP id i2mr3187364otk.273.1620302176492;
        Thu, 06 May 2021 04:56:16 -0700 (PDT)
Received: from [192.168.101.238] ([172.58.96.242])
        by smtp.gmail.com with ESMTPSA id q2sm14055ool.3.2021.05.06.04.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 04:56:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] arch: use cross_compiling to check whether it is a
 cross build or not
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org
References: <20210501172437.156926-1-masahiroy@kernel.org>
 <20210501172437.156926-2-masahiroy@kernel.org>
From:   Rob Landley <rob@landley.net>
Message-ID: <664383ae-8ab2-da1d-601d-365d507f47db@landley.net>
Date:   Thu, 6 May 2021 07:11:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210501172437.156926-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/1/21 12:24 PM, Masahiro Yamada wrote:
> 'cross_compiling' is defined by the top Makefile and available for
> arch Makefiles to check whether it is a cross build or not. A good
> thing is the variable name 'cross_compiling' is self-documenting.
> 
> This is a simple replacement for m68k, mips, sh, for which $(ARCH)
> and $(SRCARCH) always match.
> 
> No functional change is intended for xtensa, either.
> 
> This is rather a fix for parisc because arch/parisc/Makefile defines
> UTS_MATCHINE depending on CONFIG_64BIT, therefore cc-cross-prefix
> is not working in Kconfig time.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tried the patch in my sh build, the result built and booted.

Tested-by: Rob Landley <rob@landley.net>

Rob
