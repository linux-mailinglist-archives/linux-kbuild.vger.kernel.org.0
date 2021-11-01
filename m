Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15278441E04
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Nov 2021 17:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbhKAQXa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 12:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbhKAQX3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 12:23:29 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DFAC061767
        for <linux-kbuild@vger.kernel.org>; Mon,  1 Nov 2021 09:20:54 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so355777pjb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Nov 2021 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nOeoZHECPKNnAQytROjQG/8KfDcG2slvfmEJKCwImrQ=;
        b=OHjfuxxdfClfMEvZDiRQncM/tj04Oc4zKUcJsre2fgbrUibg0OrOYtxJvVFbiYWF/V
         QV1/1BkSOuYAiHB/7n6GnABT8PtXMjdF0q/3kN7tXSbbW0ibOXOrXBZIBg62Du0E12fR
         r2TOG2W15LOqdfoteLKwfqdg6gxPX1atPhYAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nOeoZHECPKNnAQytROjQG/8KfDcG2slvfmEJKCwImrQ=;
        b=mg9jvsLhmzNCIaO1CA4fsdKtvBdWXmagYld2JovrWycz4aO0xdUPqYstvXK8wYJWGp
         DQdP4p1NScQk4J46E2hoLWMtEGCE4aNm2AnwQBYFhHhbpw8l2nzgG1GrJj3SIr0L0QHH
         gHTTxFnX/HmGGM+Ce3K5UoV1hJ0Joi2Cb7J6UmoJKlW5QR+Wec66wC9dQKXCsA+Qqa++
         x6AK8Y1kYof4k1OK5KNLqZcv/CbQ91iEWWRFiWztWMm+J8cWeGjtyDax0ZJc/E3pP8dJ
         pSgBpqSsh9p65MHchly3GDJ79y1WaN0sAMT/2X4gkYpms12HZNbMnNZOBKvIcCbkq5ex
         rOTQ==
X-Gm-Message-State: AOAM531BMsPV1BuKGKzfrfswVDjxRdanUGvjHoPthrUlUbTx86bN3MdL
        JWiHdQkb436Pmgosmvv5zkxAPWyPZdniPw==
X-Google-Smtp-Source: ABdhPJx8302mlq2+2oG33p1FJwabY8ZQ+cEyzVsGqRt9mxOuWC/f5cg60TkG3G0h376S22Pc08/BlA==
X-Received: by 2002:a17:902:70c5:b0:13f:f941:9ad6 with SMTP id l5-20020a17090270c500b0013ff9419ad6mr26059732plt.28.1635783653857;
        Mon, 01 Nov 2021 09:20:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p23sm18296772pjg.55.2021.11.01.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:20:53 -0700 (PDT)
Date:   Mon, 1 Nov 2021 09:20:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        James Morris <jmorris@namei.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, "KE.LI" <like1@oppo.com>,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Will Deacon <will@kernel.org>,
        Ye Guojin <ye.guojin@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [GIT PULL] hardening updates for v5.16-rc1
Message-ID: <202111010917.75B96F4E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull these hardening updates for v5.16-rc1. These are various
compiler-related hardening feature updates. Notable is the addition of an
explicit limited rationale for, and deprecation schedule of, gcc-plugins.
More details in the tag below.

Thanks!

-Kees

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v5.16-rc1

for you to fetch changes up to 6425392acf24b6d469932dd1b217dc7b20d6447f:

  gcc-plugins: remove duplicate include in gcc-common.h (2021-10-21 08:41:51 -0700)

----------------------------------------------------------------
compiler hardening updates for v5.16-rc1

This collects various compiler hardening feature related updates:

- gcc-plugins:
  - remove support for GCC 4.9 and older (Ard Biesheuvel)
  - remove duplicate include in gcc-common.h (Ye Guojin)
  - Explicitly document purpose and deprecation schedule (Kees Cook)
  - Remove cyc_complexity (Kees Cook)

- instrumentation:
  - Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO (Kees Cook)

- Clang LTO:
  - kallsyms: strip LTO suffixes from static functions (Nick Desaulniers)

----------------------------------------------------------------
Ard Biesheuvel (1):
      gcc-plugins: remove support for GCC 4.9 and older

Kees Cook (3):
      hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO
      gcc-plugins: Explicitly document purpose and deprecation schedule
      gcc-plugins: Remove cyc_complexity

Nick Desaulniers (1):
      kallsyms: strip LTO suffixes from static functions

Ye Guojin (1):
      gcc-plugins: remove duplicate include in gcc-common.h

 Documentation/kbuild/gcc-plugins.rst               |  28 ++++-
 Makefile                                           |   6 +-
 kernel/kallsyms.c                                  |  46 +++++--
 scripts/Makefile.gcc-plugins                       |   2 -
 scripts/gcc-plugins/Kconfig                        |  20 +---
 scripts/gcc-plugins/cyc_complexity_plugin.c        |  69 -----------
 scripts/gcc-plugins/gcc-common.h                   | 132 +--------------------
 scripts/gcc-plugins/gcc-generate-gimple-pass.h     |  19 ---
 scripts/gcc-plugins/gcc-generate-ipa-pass.h        |  19 ---
 scripts/gcc-plugins/gcc-generate-rtl-pass.h        |  19 ---
 scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h |  19 ---
 scripts/gcc-plugins/structleak_plugin.c            |   2 -
 security/Kconfig.hardening                         |  14 ++-
 13 files changed, 75 insertions(+), 320 deletions(-)
 delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c

-- 
Kees Cook
