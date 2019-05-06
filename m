Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A59152E3
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2019 19:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfEFRjs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 13:39:48 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34316 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbfEFRjr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 13:39:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id m20so5933601wmg.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2019 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zyUOqcowBEJ2l4EmKaOqaodsfJOAPAaE+gwxfie0pw4=;
        b=La7fGjQN+Tpg654Ybjsk8nXf7jdW84uWIoMQaXu8pTlYA0Myq4YdTiSHebksnInCDo
         /V7cI5O49WZLtPVV6FYMvA9wON4PdzXSt7fxkc+ZDJ6yiuOeoyc4TN2bogyL02Q8mzDq
         Yci7sXQxTCv+FuegY4C05KNNZk64+CIykfDMLSC6/0Nh1oMETGYUbHeXV5+V8xxKk3Yl
         8NgSQ15TJqWs31GO1Sb2lajRQltIrAo806AjwfL393auq7UBb1qpKen0JMQlySzM+xqD
         RET9nrIzoW2oitxET50ZstzHqDWJY3iN7sLe4RYRBwzy/nlY36KyNMqR20pKaxB5g7C0
         0Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zyUOqcowBEJ2l4EmKaOqaodsfJOAPAaE+gwxfie0pw4=;
        b=j4/qAIp05ordYb4MFvrsG4ycmivTtuOLImH4txJAQ8hiNjTZYTXAQQHXriFqH6wZme
         8a4Lu/rvfUO6IWDlDRJFrqoJO7wjG88yueKoOA6Nhoj2cohDnlOIELms6VSW72TgZJ+P
         IclEOTtHgDN1UXVFj+hUotvIqbd5RjKfNcf5l1tsuA+7RrivqJNEKP2ZpVh7BsuClI0N
         yXPKGES1Qh6yHzReRvp7d07s8KRgua4xiwrAPhjr7+DzdwvIxJwUgBgZiBGO4+NiB/Hu
         VnGY0/pXfJKCC8i0YGp8t5VVlEVDMAqBIiH9c9/dwNOlNbVTlW4322DZZYjPGUJSFA/C
         u18w==
X-Gm-Message-State: APjAAAUrpIo+CA06M8DeNyvOqJ8GhUzRju9xigWwXrA8AqXuF97+DfTM
        pNSRdiI49uLIAHOdqsSZ9Ggm8A==
X-Google-Smtp-Source: APXvYqyf2cb8qXuGQGElB8nD4bTSPaG//hqg3L0nOyHcl3aEnxN38pPpVbUEQDPY9YPGpLFejjha4A==
X-Received: by 2002:a1c:f30e:: with SMTP id q14mr18837542wmq.31.1557164385868;
        Mon, 06 May 2019 10:39:45 -0700 (PDT)
Received: from [192.168.0.41] (64.93.129.77.rev.sfr.net. [77.129.93.64])
        by smtp.googlemail.com with ESMTPSA id j10sm32918866wrb.0.2019.05.06.10.39.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 10:39:45 -0700 (PDT)
Subject: Re: [PATCH] Remove MODULE_ALIAS() calls that take undefined macro
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Lee Jones <lee.jones@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
References: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6d8e2880-0cc0-a7d8-1d42-4401e15e3ac9@linaro.org>
Date:   Mon, 6 May 2019 19:39:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 06/05/2019 19:28, Masahiro Yamada wrote:
> These files do not define (USBHS_)DRIVER_NAME. Yet, they can be
> successfully compiled because they are never built as a module by
> anyone, i.e, the MODULE_ALIAS() calls are always no-op.
> 
> A problem showed up when a patch "moduleparam: Save information about
> built-in modules in separate file" is applied. With this new feature,
> MODULE_*() are populated even if the callers are built-in.
> 
> To avoid the build errors, the lines referencing to the undefined
> macro must be removed.
> 
> The complete fix is to remove all MODULE_* and #include <linux/module.h>
> like many "make ... explicitly non-modular" commits did.
> 
> For now, I am touching the offending lines.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

