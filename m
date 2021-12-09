Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF3546E1BD
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Dec 2021 06:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhLIFL0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Dec 2021 00:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhLIFL0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Dec 2021 00:11:26 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304DCC061746
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Dec 2021 21:07:53 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u11so3040197plf.3
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Dec 2021 21:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oAc97uz2Cujqe9KFIgnuc9y5PwmUaHTfcJnGM0LYlTM=;
        b=hzVw2WlgWT+n2fokbrz+vPrl1Fvko1T4p4j8g82IVa6WBD30MO0Z2ZcNGf0aPqtS9e
         wIa1wpat9swFKgNduKo1OTZG+DRN3C1v3q3iOOIksw6IgiyFRvTK7wB+V7p7r0pZw82v
         dsugPtXIUWsFbVrD/keLyM3owwB5OM8sttnqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oAc97uz2Cujqe9KFIgnuc9y5PwmUaHTfcJnGM0LYlTM=;
        b=7c/EXvpRMa7BJkhQ42B8hE3uNM3zcQfjH2DLEoG+0PcPXJfzrcLKUNJnPUlHS9c4/X
         2EpE43w26Xr4zxvvwM6PF3AycoK03f6QkgOthxY4yz8Zqj4TlxoOyqyYMTFYrdeQN9gc
         ERIaGw9k21IzNqurNZnPpoXRvbTqP8Hk2qM6kzuOPkHn40BhnbvlYZNxlTKapB1G9hEF
         C6+TC9zRqoKhBNSWxzDR4EOe6nLoSTzoBInpMer/s2ngEIQRqhlI9RSJ7o+mc9a0bSyt
         zqbIYskCt0cU/JI7zvtuGtAyu3s2fqaqtcJzxz/mGPM4KgZgRNnwfeZa9Tdd6/IvmSVX
         uDHA==
X-Gm-Message-State: AOAM533nNY/rJpA8peu7j7RZXvnry6sChG5HLVMhFl6/BRfBflPyEKj5
        N2N1EyMUn+Gb6O3InaBq7n++xouH4H9+dQ==
X-Google-Smtp-Source: ABdhPJzlX3NyyqZi6qmRsJyuu1pf9MJan5+mqXSsAqrMOgSJPV6WtN88xlUoNYPYv7C0HWsHNNPRjA==
X-Received: by 2002:a17:903:300d:b0:142:744f:c74d with SMTP id o13-20020a170903300d00b00142744fc74dmr66055721pla.26.1639026472470;
        Wed, 08 Dec 2021 21:07:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 59sm4273835pjz.34.2021.12.08.21.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 21:07:52 -0800 (PST)
Date:   Wed, 8 Dec 2021 21:07:51 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: question about all*config and COMPILE_TEST
Message-ID: <202112082057.C993DC6881@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

tl;dr: is there a way to force a config default to "off" under
all*config builds, but still leave it configurable? (i.e. not "depends
on !COMPILE_TEST")

I'm trying to understand a Kconfig behavior with regard to
COMPILE_TEST. I'm able to use an "all*config" target, followed by specific
additional config changes (e.g. turning off KCOV), but I can't enable
things like DEBUG_INFO because of their "depends on !COMPILE_TEST".
Whenever I want to examine debug info from all*config build I need to
patch lib/Kconfig.debug to remove the depends. I was hoping I could,
instead do:

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0e2de4b375f3..e8533ffc92c3 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -212,7 +212,8 @@ menu "Compile-time checks and compiler options"
 
 config DEBUG_INFO
 	bool "Compile the kernel with debug info"
-	depends on DEBUG_KERNEL && !COMPILE_TEST
+	depends on DEBUG_KERNEL
+	default n if COMPILE_TEST
 	help
 	  If you say Y here the resulting kernel image will include
 	  debugging info resulting in a larger kernel image.

Which would turn this off when COMPILE_TEST was enabled, but I assume it
doesn't work because an all*config target turns everything on first, and
therefore this "default" gets ignored since DEBUG_INFO already has a
value set.

I then thought I could use:

	default !COMPILE_TEST

since this works:

config WERROR
        bool "Compile the kernel with warnings as errors"
        default COMPILE_TEST

but I think the above is a no-op: it's the same as not having
"default COMPILE_TEST" when doing an all*config build: it'll be enabled
not because of COMPILE_TEST but because of the all*config pass.

How can I make DEBUG_INFO configurable, but default off under
all*config?

Thanks!

-- 
Kees Cook
