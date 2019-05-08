Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41F617872
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 May 2019 13:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfEHLh5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 May 2019 07:37:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44069 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfEHLh4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 07:37:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id c5so1520905wrs.11
        for <linux-kbuild@vger.kernel.org>; Wed, 08 May 2019 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=eeVbE/nScJBLag5J/5uF3rhFiymQVd2Zd14j7hKs2Go=;
        b=KECUZFNIH3rYUOtX1dlvmyFlTibofR3dC0G3z4LgOfu7EL81dRHDuGbinISBewHici
         WTfqWBaOrepKmaPbAJab2EMLu2RaWGJ3wa3iyM7/eXcAHCDp5t34zDdlfgGdq0D77Q2m
         19eRcJDyjmG6ZEfwbWO1ftM7r8fq7DFqfF87Xum9x1AHnDmhoEGCPc2qdIJTf0RaHSXT
         7X1Xhk/AAoKKgjvae0fAl3bsa/jHjgZjWZIY8xlwyONYNTtN5rfYlsNhST6bqwbRRVyt
         PgB1Vf9FG6amQy47sGdXd/Bv9PGr92BaUTNcWL+kwxvOM0Elm9FVE9p9IMpDMO+bFXs8
         5Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=eeVbE/nScJBLag5J/5uF3rhFiymQVd2Zd14j7hKs2Go=;
        b=X+Y/DwtJfvc0rEuoWtUdPH6FoGGL2egx6Dexg3bx6cZB+6bsqavmgacWTsq4mbxYnx
         1ANDmkmltF8m1+aE2B43BYoGfzCIvM/D9tyx85WN3tSP6IYzkOrtzxLam7S+afYNBUaT
         gn7Z9oird2BrUrfZ3PX3T6vYqF/EWz7RKiCtLrCfotbRv55Jijz6c9ulAw9aEJsTzV2m
         NafrNRT65J6vPtQFyot0S+u0IlNUb1xYqcEttWpAfAlVZ+47LJPWYtJ6ie2ikhcJqrWM
         oQmAckQb8ex0Ze0lJaGsQo/1vreKQp7+fHNYRjmDm7gpubliVUJbsA+efieaGy8CsPoJ
         +Ndw==
X-Gm-Message-State: APjAAAXfy5SjxUM9bHlWXw4jqAFzHKC385QuJ1qhK8nwUfyJMQAEW09J
        y1o609ONNpBBdumYpAb5zv/JKg==
X-Google-Smtp-Source: APXvYqylJd9JgQDs4no8oS1ib+tuQIB3A9RO89mbhrVWeCUcsCxdG1V6qUglLUHQmf1jJlbVfEJ7/g==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr5248477wrn.113.1557315475173;
        Wed, 08 May 2019 04:37:55 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id l21sm1379871wmh.35.2019.05.08.04.37.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:37:54 -0700 (PDT)
Date:   Wed, 8 May 2019 12:37:52 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] Remove MODULE_ALIAS() calls that take undefined macro
Message-ID: <20190508113752.GE31645@dell>
References: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 07 May 2019, Masahiro Yamada wrote:

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
> 
> I will insert this commit before
> "moduleparam: Save information about built-in modules in separate file"
> 
> 
>  arch/arm/plat-omap/dma.c          | 1 -
>  drivers/clocksource/timer-ti-dm.c | 1 -
>  drivers/mfd/omap-usb-tll.c        | 1 -

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
