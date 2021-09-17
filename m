Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0706940FD49
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Sep 2021 17:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242923AbhIQP4Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Sep 2021 11:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241196AbhIQP4Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Sep 2021 11:56:24 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CF5C061574
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Sep 2021 08:55:02 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id w8so10020233pgf.5
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Sep 2021 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7pWvqKzdntB6FDdZ0hZ4GT80npsWFPbvESQwerjuH7c=;
        b=B3Ko3FNcR8yQrEwob+w7bt573zp1X4ohJ08HUXI4vOccN13vmeEZRJy7u1W7Q54xr8
         HhI8RkjNH2d+Cz2e5TWpFu3Bb3LwAr2c7nuuH+V7bfBMcjWeeqH+7+fQp2UTRCrCdjRC
         5IQKckA+007Alwmvjn9C0LLsaM9NmcumDf4e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7pWvqKzdntB6FDdZ0hZ4GT80npsWFPbvESQwerjuH7c=;
        b=KSOTAWyRXa1igze99tz7jPjPi0YIu1vZwlKKIpnE3d/qS5zhBKvXTRKaczWQ2QF20a
         m1QtXIOzxNT++zy8OcHMquKz8W2MWDvmCT8UGeWJqH0aGGOHqF5mivww/kPX1hhHErnH
         7Tj6gGxutLgQxP8ougiD0rUdGluxrHmhnF/GGAuuf6cKerGJBSzAxK52WXUha2jbwv6A
         OXXpPnW8mUm8oxYciuGY8l6T/RzY2gZTYTSRi+uttWxyMUK2TTAKhRFhFBFprM33DMdO
         Ih1MnNrnNXjHTCbnIki/F1B9ARM+XKPofpFm8ucq6C4AsXz7o2oBOU19KcxFQFLKtcjn
         558A==
X-Gm-Message-State: AOAM530M26l520PmTh2itgnf1v/sresahKgYx3Yd5uvNyhw9UaJvMqGy
        tnkMMNCSGfTkeKfR6qlAOr83hg==
X-Google-Smtp-Source: ABdhPJyijox7cLdCfudrGttWdWXm5KL45WjcPcwDiO9owHX94eR86zSJh15NIUpL854odfpVFX5EAg==
X-Received: by 2002:a05:6a00:1596:b0:40d:bda5:372c with SMTP id u22-20020a056a00159600b0040dbda5372cmr11307531pfk.37.1631894102272;
        Fri, 17 Sep 2021 08:55:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c15sm6607931pfl.181.2021.09.17.08.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 08:55:01 -0700 (PDT)
Date:   Fri, 17 Sep 2021 08:55:00 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     shuah@kernel.org, davidgow@google.com, arnd@arndb.de,
        rafael@kernel.org, jic23@kernel.org, lars@metafoo.de,
        ulf.hansson@linaro.org, andreas.noever@gmail.com,
        michael.jamet@intel.com, mika.westerberg@linux.intel.com,
        YehezkelShB@gmail.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, ndesaulniers@google.com,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1 4/6] thunderbolt: build kunit tests without structleak
 plugin
Message-ID: <202109170854.A99408F1@keescook>
References: <20210917061104.2680133-1-brendanhiggins@google.com>
 <20210917061104.2680133-5-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917061104.2680133-5-brendanhiggins@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 16, 2021 at 11:11:02PM -0700, Brendan Higgins wrote:
> The structleak plugin causes the stack frame size to grow immensely when
> used with KUnit:
> 
> drivers/thunderbolt/test.c:1529:1: error: the frame size of 1176 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> 
> Turn it off in this file.
> 
> Linus already split up tests in this file, so this change *should* be
> redundant now.
> 
> Co-developed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
