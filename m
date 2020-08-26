Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4254253813
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 21:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgHZTQK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 15:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgHZTQF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 15:16:05 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64F5C0613ED
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 12:16:04 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v11so4040630ybm.22
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=3og4sPvUBqJnD45PO3Vq/dRv1z3az91w/Q8diJgM8sM=;
        b=M1a/RIwXL7bj2Y+K20d4sW/uOPEuGLSuSsSlU2rnKyJBPXiBXoFQBxF/O2wsCTdC0N
         eptqC7ZXv7z3yB+FZN3vDguFKVifBg+gTGqkK6jSIAlxo9TMwq1xd3EZPFxDGFmrvvBC
         eIX2MaAzIVCVIq44+06q00hccDWrYljofeTEz5PhZlgLzZccTDX7zOQj2eSwmHbSs/EL
         qLQiMocdIhSWn6797HHV9JI/yOKt6em/P/OsPXvnUQD26r3F5Z4o3rMNqau+ztSC4R84
         UvUKk20bFOy1irvIs/f7seNf4vZ6iV+/jzl3nBe+hFYh1iQT4HSSPGkaLSl3JFJoVT3M
         d+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=3og4sPvUBqJnD45PO3Vq/dRv1z3az91w/Q8diJgM8sM=;
        b=HrApyPj73EUlwDpd7AGDzHlk/sTrBRbJqaAZtV19+jcCgHx2kz9UouToIGRzBPIQRC
         QOAnnqpadAJWZHK9S0z8CC1jxwTQwHxzlePIfaWTEOGE8CrxondtDYQ4eYYIQxzIDRsl
         hJiZGqRGraWiX7VLO2RhGaboRd1fUZyDqLkfid6EyjZeWHtQ2JDJdVIdM+7iWpx/kWos
         wHk7E3FrlfT43Eej7U3hOCRKogXFaW2QBqJ4ntDKcbh26/hmxavXjWvh1eZ37f93usPh
         40x9JzhjnyD2FIrCAgMTUSnLRQcO8+sL4HXdz/LJuqGowj4R8jWmCxA2dmqaiWxolza9
         H3Dw==
X-Gm-Message-State: AOAM530DyQvm6mW4HWkaX9/0So+XzvVacyKm02VGwtxS9v//8t45N/jO
        hWyP/P4D56xCuo+2T5bwUapAQZaw50TpC8PHPzM=
X-Google-Smtp-Source: ABdhPJx1yjL0jUTygg6//UE5+ePSp1etFCt1jIUHsLJunE/m7r3AFZUcn0UUBOdqF645n04mmXloDm+9mvyeu/xiSl8=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a25:d914:: with SMTP id
 q20mr23382849ybg.320.1598469363847; Wed, 26 Aug 2020 12:16:03 -0700 (PDT)
Date:   Wed, 26 Aug 2020 12:15:55 -0700
Message-Id: <20200826191555.3350406-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v2] Documentation: add minimum clang/llvm version
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Based on a vote at the LLVM BoF at Plumbers 2020, we decided to start
small, supporting just one formal upstream release of LLVM for now.

We can probably widen the support window of supported versions over
time.  Also, note that LLVM's release process is different than GCC's.
GCC tends to have 1 major release per year while releasing minor updates
to the past 3 major versions.  LLVM tends to support one major release
and one minor release every six months.

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* fix typo, as per Will.
* add link to getting LLVM, as per Nathan.
* collect tags.

 Documentation/kbuild/llvm.rst     |  4 ++++
 Documentation/process/changes.rst | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 2aac50b97921..3f10a9c47551 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -1,3 +1,5 @@
+.. _kbuild_llvm:
+
 ==============================
 Building Linux with Clang/LLVM
 ==============================
@@ -73,6 +75,8 @@ Getting Help
 - `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
 - `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
 
+.. _getting_llvm:
+
 Getting LLVM
 -------------
 
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index ee741763a3fc..dac17711dc11 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -30,6 +30,7 @@ you probably needn't concern yourself with pcmciautils.
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
 GNU C                  4.9              gcc --version
+Clang/LLVM (optional)  10.0.1           clang --version
 GNU make               3.81             make --version
 binutils               2.23             ld -v
 flex                   2.5.35           flex --version
@@ -68,6 +69,15 @@ GCC
 The gcc version requirements may vary depending on the type of CPU in your
 computer.
 
+Clang/LLVM (optional)
+---------------------
+
+The latest formal release of clang and LLVM utils (according to
+`releases.llvm.org <https://releases.llvm.org>`_) are supported for building
+kernels. Older releases aren't guaranteed to work, and we may drop workarounds
+from the kernel that were used to support older versions. Please see additional
+docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
+
 Make
 ----
 
@@ -331,6 +341,11 @@ gcc
 
 - <ftp://ftp.gnu.org/gnu/gcc/>
 
+Clang/LLVM
+----------
+
+- :ref:`Getting LLVM <getting_llvm>`.
+
 Make
 ----
 
-- 
2.28.0.297.g1956fa8f8d-goog

