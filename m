Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 683CD754FD
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 19:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfGYRBJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 13:01:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36197 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfGYRBJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 13:01:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so51624371wrs.3;
        Thu, 25 Jul 2019 10:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nXagbzMpHpMrK6qPzkE9x7SDyjhg8P+uqPw06U7BiHM=;
        b=WAKFeAPVDb3PlezhG7uMMnHJoqjzAnVxXT7f1HVG8wlYluuB4nEHp/KS0cPXKPw/hE
         yGyxcFORLA11JTbaKZQLR+xl4E2Wuhl7vSB4xuurLrrfrkrg6sDCyLoJhx86EWnZ45IB
         1/lv9bvH3LV9HVplQ0E6qvijD38Dgf2edYF6JBG7l8EUQ+9kwmEWKd63SBcepS+XCwjB
         nFcrcTyxymdzHvMKZ65s9RvX0fg11iKxrE79b26pJLaFL1CPUV4yjIXFgbdhmsfzqidL
         sJGeTTfgRXjwoyRTKddBBPjaOPqwya33pjFrnd/mbZTUeHSm9volU9nrZX1e91ZGyjmq
         rRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nXagbzMpHpMrK6qPzkE9x7SDyjhg8P+uqPw06U7BiHM=;
        b=SbN5AqEjV7zfuA0kp+QwRQTkDA5FzK9rLGMTTSTMEvZ6c5OvhI8xSzLIcgNMWtWbXk
         6Qji0UKFo63rD6rSXLbsgWBaYbFF0DNK3iZS6MgouTVK0FBvPEjoQWyTxDQOQg4U+9RH
         +uWY8uGcg8WUpkNxnKY0DtDyZGghOKDxcqjMcEHC2z96yZy4BJoBcQg8fLGkclWHWQ/X
         n+prxxIsMrFasfyYBpc16WvJT7Hh8nSYIxJvAiS3NvxXN3NFxjgXhcODW/pEV/G5vv0J
         9R+uCG0fovpHZPoX3EcqVfJwV/vUL/EF7qzmnQp8j+anbx7i9lhGxvsH4nv3zSFjVOeD
         Sa8A==
X-Gm-Message-State: APjAAAWuNSFPmgRpU3wwD+fH3L2oVMCCOqyhyTCmWz/7Aqr/Jqq9thwd
        ogmMssJG0MaW7uOwydj2TMM=
X-Google-Smtp-Source: APXvYqyugU+wuL9tcYJ7BnYcE2ZJ12kDdOmhVdWDrIOenOwmOCKYBZCws8lajVXLEDonPreUgdBcjQ==
X-Received: by 2002:adf:de08:: with SMTP id b8mr70727820wrm.282.1564074066832;
        Thu, 25 Jul 2019 10:01:06 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id p6sm54433837wrq.97.2019.07.25.10.01.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 10:01:06 -0700 (PDT)
Date:   Thu, 25 Jul 2019 10:01:04 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Peter Smith <peter.smith@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] kbuild: Check for unknown options with cc-option
 usage in Kconfig and clang
Message-ID: <20190725170104.GB80773@archlinux-threadripper>
References: <20190725154730.80169-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725154730.80169-1-swboyd@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 25, 2019 at 08:47:30AM -0700, Stephen Boyd wrote:
> If the particular version of clang a user has doesn't enable
> -Werror=unknown-warning-option by default, even though it is the
> default[1], then make sure to pass the option to the Kconfig cc-option
> command so that testing options from Kconfig files works properly.
> Otherwise, depending on the default values setup in the clang toolchain
> we will silently assume options such as -Wmaybe-uninitialized are
> supported by clang, when they really aren't.
> 
> A compilation issue only started happening for me once commit
> 589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
> CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
> compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
> leads kbuild to try and test for the existence of the
> -Wmaybe-uninitialized flag with the cc-option command in
> scripts/Kconfig.include, and it doesn't see an error returned from the
> option test so it sets the config value to Y. Then the Makefile tries to
> pass the unknown option on the command line and
> -Werror=unknown-warning-option catches the invalid option and breaks the
> build. Before commit 589834b3a009 ("kbuild: Add
> -Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
> but any cc-option test of a warning option in Kconfig files silently
> evaluates to true, even if the warning option flag isn't supported on
> clang.
> 
> Note: This doesn't change cc-option usages in Makefiles because those
> use a different rule that includes KBUILD_CFLAGS by default (see the
> __cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
> variable already has the -Werror=unknown-warning-option flag set. Thanks
> to Doug for pointing out the different rule.
> 
> [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> Cc: Peter Smith <peter.smith@linaro.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Commit message wording looks better to me, thanks for the change!

I think we might also want to add:

Cc: stable@vger.kernel.org # 4.19+

in addition to Doug's suggested fixes tag because my patch has been
AUTOSEL'd by Sasha:

https://lore.kernel.org/lkml/20190719040732.17285-44-sashal@kernel.org/

https://git.kernel.org/sashal/linux-stable/c/a28859fa4fea5a834a53d86d51e502012ce09c57

Alternatively, I can just mention that this patch needs to be picked up
in addition to that one when it is formally sent out in a stable review.

Cheers,
Nathan
