Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FEA28250D
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 17:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgJCPTW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Oct 2020 11:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgJCPTW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Oct 2020 11:19:22 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16840C0613D0;
        Sat,  3 Oct 2020 08:19:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d13so2903567pgl.6;
        Sat, 03 Oct 2020 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=HMfn3sVRJkjUaie6oXrhM0CzB/smuFPKw2b5ubgLlhc=;
        b=URSW9S7Yh9pgXx9kH/9tDW55XHPSaePxAJzrA1+IaFs74cDB4OcrStoabKhadIoHW7
         HqPPrs9+bYxgOAboifMNm77e5cuIG4M0wGUO+FEaMqlcLhzHmQqTeGblrD68vYnDeDD+
         VZIHxIHlLiS0Lby902IO+l4KrTZDrdXlfWq7AyVjNRJ4IWZCp2ykdwF0RnFm1BmSOcZr
         1E//Wix2emL1M7szIvNhbVpG9fuiqALn6eoNkZGnBNljE5vqjYfewpode7sXdEUqS10C
         T0Dc2T7TgnOFIJ98oRnb5KBJxjpVHdWuVG42MFYt2k0H86e1f4WhP6pnBeulSf7fX159
         9Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=HMfn3sVRJkjUaie6oXrhM0CzB/smuFPKw2b5ubgLlhc=;
        b=WqBT8aT9P5B9y2T75A0oSmithOox2xybbHSUzMlVxajkTu9zugi4owfSJeN/FS/wea
         35EfRxtAVh1hYA4NTd/GCP6tbC7LFmH0EuThm2ZgOz1yW2zFBbBpegS7bmWVCkmR+hxW
         oZ43TBODgw8G1q9ftTQJkZGWrFpUaoja78fobymMmgnoIuJfgok/yMOHuK1ovDhkcazD
         7NSBqopMVDarBy1s6kl3GIAq7nMwr8J2fgNfCeVyDcQZPi/U6DDqPWQe3ukkb+pfUOJg
         Tn4rQTA3FMIVaZ4gbqGNywEsrle2RKurffymrTkVaW2mDc3tJu+5fSAHHHfgS+0TeWl1
         Kq5g==
X-Gm-Message-State: AOAM5300wX4CMZE6fzwW6XKDbkngN/UhdCZPi0reCcjg3kOA/R+hcEek
        Y56o+HbI1cjsosWuLrZaouU=
X-Google-Smtp-Source: ABdhPJz5rON6RZFPTbpjA/dtzaoEYP2k8KrlDnLsNCZN1DXtGWEylj5EaPIDAqO1U0Snz2amTP2b2g==
X-Received: by 2002:aa7:9555:0:b029:152:4b0b:cca with SMTP id w21-20020aa795550000b02901524b0b0ccamr2917244pfq.16.1601738361449;
        Sat, 03 Oct 2020 08:19:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id fv13sm5312717pjb.50.2020.10.03.08.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 08:19:20 -0700 (PDT)
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: [PATCH RFC 0/2] use interpreters to invoke scripts
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
Date:   Sat, 3 Oct 2020 20:49:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch series aims at removing the dependency on execute 
bit of the scripts in the kbuild system.

If not working with fresh clone of linux-next, clean the srctree:
make distclean
make tools/clean

To test the dependency on execute bits, I tried building the 
kernel after removing x-bits for all files in the repository.
Removing execute bits:
for i in $(find -executable -type f); do chmod -x $i; done

Any attempts to configure (or build) the kernel fail because of 
'Permission denied' on scripts with the following error:
$ make allmodconfig
sh: ./scripts/gcc-version.sh: Permission denied
init/Kconfig:34: syntax error
init/Kconfig:33: invalid statement
init/Kconfig:34: invalid statement
sh: ./scripts/ld-version.sh: Permission denied
init/Kconfig:39: syntax error
init/Kconfig:38: invalid statement
sh: ./scripts/clang-version.sh: Permission denied
init/Kconfig:49: syntax error
init/Kconfig:48: invalid statement
make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
make: *** [Makefile:606: allmodconfig] Error 2

Changes:
1. Adds specific interpreters (in Kconfig) to invoke 
scripts.

After this patch I could successfully do a kernel build 
without any errors.

2. Again, adds specific interpreters to other parts of 
kbuild system.

I could successfully perform the following make targets after 
applying the PATCH 2/2:
make headerdep
make kselftest-merge
make rpm-pkg
make perf-tar-src-pkg
make ARCH=ia64 defconfig
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare

Following changes in PATCH 2/2 are not yet tested:
arch/arm64/kernel/vdso32/Makefile
arch/nds32/kernel/vdso/Makefile
scripts/Makefile.build

Ujjwal Kumar (2):
  kconfig: use interpreters to invoke scripts
  kbuild: use interpreters to invoke scripts

 Makefile                          |  4 ++--
 arch/arm64/kernel/vdso/Makefile   |  2 +-
 arch/arm64/kernel/vdso32/Makefile |  2 +-
 arch/ia64/Makefile                |  4 ++--
 arch/nds32/kernel/vdso/Makefile   |  2 +-
 init/Kconfig                      | 16 ++++++++--------
 scripts/Makefile.build            |  2 +-
 scripts/Makefile.package          |  4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.26.2

