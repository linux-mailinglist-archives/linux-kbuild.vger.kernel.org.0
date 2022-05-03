Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24994518F81
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 May 2022 22:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237415AbiECU6n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 May 2022 16:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiECU6m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 May 2022 16:58:42 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB70333E02
        for <linux-kbuild@vger.kernel.org>; Tue,  3 May 2022 13:55:08 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id w17-20020a17090a529100b001db302efed6so3006747pjh.4
        for <linux-kbuild@vger.kernel.org>; Tue, 03 May 2022 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jw8bm6qCSYy6P6VWUeZnWl92t/l9H4EI5gAHlpwVuZA=;
        b=kt6TKIb3spJG6f46eBQBOofeRVyb/ToPb9O6thHh0PamzgM1zvWRbVz5kiNssVNFBZ
         Ve6UEn/QrqYtA3goKXOZjwlYELzP7vNMxkNOI3gmDQDOLN7ZzrhXgX5O2r/TFkh+7xxP
         G36udorrUQIVhMwU9srG5RrlZ1tUaiM6B/Xd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jw8bm6qCSYy6P6VWUeZnWl92t/l9H4EI5gAHlpwVuZA=;
        b=M/PK/vjeb5I+W/+yo98cFnBPqKEwBCtxEnF/lHAf5h/ax1N5Sb0BTZ3LschkEzOljV
         uD1uL2aBsxxww83NqXx6lGPosD0DbZS0eQZeEeN8yA1QGBYrSsimMXjUUqJ5RHdt3uUS
         IlJO5exwkB2ndyzy+ZjkTUJjDh6GDzN7XvieC42aXCOtbtQPdYESaHKy+dkhhrYKH1OB
         9JIII0L+/GWFQX4Y//TuN4S2XklRU+Vqg09nvLca9R5xU+7Rm2/BLC9CtH/5q9sifjaZ
         oXwgJ6RSNhUmLQMCS50XFBGUvgoUUmTvxe31C4Ek/hgEA9vaJ4u4ugkSbc4cmxTWQU8f
         2fKQ==
X-Gm-Message-State: AOAM533yk28a035KjvRu9PNa8aloCSTA4WRFbgkZXPjItsgHVEhjXJ1f
        c6q3JkHrrxT8Za+eAW2lIGcVLw==
X-Google-Smtp-Source: ABdhPJzRSol0jBLTzDF96PQvrfj8KiGYUArjUPSdiPRTUGAqUoEG4/WpJCH57Jb+kl4mAgl4y1qGLA==
X-Received: by 2002:a17:902:bf06:b0:14d:8c72:96c6 with SMTP id bi6-20020a170902bf0600b0014d8c7296c6mr18218018plb.156.1651611308496;
        Tue, 03 May 2022 13:55:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709027e8900b0015e8d4eb2d1sm6806192pla.283.2022.05.03.13.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 13:55:08 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Bill Wendling <morbo@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Howells <dhowells@redhat.com>,
        Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 0/6] randstruct: Enable Clang support
Date:   Tue,  3 May 2022 13:54:57 -0700
Message-Id: <20220503205503.3054173-1-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2263; h=from:subject; bh=X6EU4DNXnTBgSHB25uvB/YQy33D9lwDWmQXpLxpRzXs=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicZalCEa9KZwdrR1ffYy76FhePPL8ViJcDNFJlqIM 9nd88byJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnGWpQAKCRCJcvTf3G3AJrpDD/ 4+NYBcLmsDxx+YqOPNtZQwIIUoAslvLe7/qL+HjN1AqimNDYdEtWnARl/cEtEtcuunXDDHpAlbDcfC y3KI7dGI78viVuwe1glQ8FbUqDElLxBdQ/OUt2WgQQ9QhGDfKa4vOki1GcsKv5j2rbZ7k5a5vTBdx/ wkRgyLrxCGZWEC3UygQhTrnab2RmOZaBMw57mxjmMqRb/AvYGqgqMnWahl2yubL3tqQMiMxjluDeQI 91ZKeTYtj75MsB5GezmxZAcPHow+o9sP56AjpL7y+uEk1zYZmk3mw0DS4TYPJe52wHPLlsTDwLyToF MXELE+YyqVQs6MoZN68VJmh6tahuhP4/SzgkfdRFrjIQSBFXon7Am04S2kRrXSHQFdGfnJyTnydrRp jW2IrDXX3BINAqjxObarMqzgDaaoSQAxhApaann26UVr8SU3bTzvzcYyfn/mnKG9iFep54gLQDgWfP gTwewKETf/GlCllJIEucaQmzcbbcjbsj2YI3IBbnf+TX46CuToYZRQi91fs6BVPb58VZLIPyOPwf/n 4LEDEtlJdnwDHXganksJt8QU8vqvk2f1Ord4lwn6ZLRsE/92OK5Tn7UdvY9VhEF5yqk5j7edplw6O+ q3aTuiKQm1VwEiIqSS7kQcAqYUq2CiuerfufKKYbN8YFZKfIGAyGwIRd5OhA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This enables Clang's recently added structure layout randomization
support, similar to the existing kernel-specific GCC plugin. The general
Makefile and Kconfig changes are mainly mechanical (moving options
around), but the random seed generation changes are a bit fiddly because
it needs to be created very early. I think I did this reasonably, but
I'd love some more eyes on it.

Thanks!

-Kees

Kees Cook (6):
  netfs: Eliminate Clang randstruct warning
  sancov: Split plugin build from plugin CFLAGS
  randstruct: Reorganize Kconfigs and attribute macros
  randstruct: Split randstruct Makefile and CFLAGS
  randstruct: Move seed generation into scripts/basic/
  randstruct: Enable Clang support

 Documentation/dontdiff                       |  1 +
 Documentation/kbuild/reproducible-builds.rst |  8 +--
 Makefile                                     |  1 +
 arch/arm/vdso/Makefile                       |  2 +-
 arch/arm64/kernel/vdso/Makefile              |  3 +-
 arch/riscv/Kconfig                           |  2 +-
 arch/sparc/vdso/Makefile                     |  3 +-
 arch/x86/entry/vdso/Makefile                 |  3 +-
 arch/x86/mm/pti.c                            |  2 +-
 include/linux/compiler-gcc.h                 |  8 ---
 include/linux/compiler_types.h               | 14 ++--
 include/linux/netfs.h                        |  4 +-
 include/linux/vermagic.h                     | 10 +--
 kernel/panic.c                               |  2 +-
 scripts/Makefile.gcc-plugins                 | 22 +++---
 scripts/Makefile.randstruct                  | 17 +++++
 scripts/basic/.gitignore                     |  1 +
 scripts/basic/Makefile                       | 11 +++
 scripts/gcc-plugins/Kconfig                  | 38 ----------
 scripts/gcc-plugins/Makefile                 | 15 ++--
 scripts/gcc-plugins/gen-random-seed.sh       |  9 ---
 scripts/gen-randstruct-seed.sh               |  7 ++
 security/Kconfig.hardening                   | 73 ++++++++++++++++++++
 23 files changed, 159 insertions(+), 97 deletions(-)
 create mode 100644 scripts/Makefile.randstruct
 delete mode 100755 scripts/gcc-plugins/gen-random-seed.sh
 create mode 100755 scripts/gen-randstruct-seed.sh

-- 
2.32.0

