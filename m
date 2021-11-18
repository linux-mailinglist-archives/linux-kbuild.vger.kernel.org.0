Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628FB45569B
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Nov 2021 09:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244510AbhKRIPS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Nov 2021 03:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244324AbhKRIO2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Nov 2021 03:14:28 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503B2C061766
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:28 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id d3-20020adfa343000000b0018ed6dd4629so876103wrb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=e4DEXl9ENL8f6grIX8Smd5WFfYq3AcFIjaS7u+NEo6I=;
        b=PYqstpHDFD3F+og/25SfE3vpGtXvb0XJSqAhT2Wwpjyt4GgvMikJKq0odlc1BdkoTi
         QYyT1h89SOEAvChBjvL1jkxx/5LA/bGemxT9wmbTDX9f/fWWYbnIOH3iyn2ue5dnHQG+
         Gi7IAi6FbA3rtzIfS2Dvvhd58L0goK4JIHZXjkSNB2s2BthxG19dERbW6urswBT8aboE
         diYgLDu+IoECuVtj308gmQoOexrF0JlC95bXtMDClQNPofzEV3jC03s4dNCgBJrI8OnW
         CCept4CY2gKCpvM0X0YHpi0tM5n+Qczi0T9bc/CXDlTc/1e2oblCluOjJ1p7GpxSh6/U
         uVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=e4DEXl9ENL8f6grIX8Smd5WFfYq3AcFIjaS7u+NEo6I=;
        b=ACXV1FT0wDd+ZK+BlhtaU8y7zd9i312C0r/gjzJJjfYiVyRprdQvbGtoqAMxdsOC3O
         IyDvDnwCfdcx2yp4DYmU9VXfmju5EEn6ZNTdOb3frSuM5x9FMS76apu3u+Z1oPEUBugC
         CCseBoDOCl2zxlzDOVMxz0qoCO4c9qek9oruTqZJ0jnnio1vdguXKfue4XJJAmNcnLcO
         C65hBk36xvlUiFSxDOBXQE+G8cz2GrnhG2nAtQ8R1FJWpkXjmoTtLc8PaA43lMzLs4Ey
         yK5laU347JoqlOq6FUwrGbY4GSZxsdgwy0qmmPz/Pd9r2WQzYPPHdHEgd10j7kIzi8l5
         h99g==
X-Gm-Message-State: AOAM5301mEU+k2dSsdVgvK0X0ds68FIwV7OIq4sNHLzxX3YDwsjvOSJC
        mqvXidYVleh0PQkRn8yTzf6+6LGHyA==
X-Google-Smtp-Source: ABdhPJxtjpW5i8VAdffd8DI396zQBim0I3VEhx1ADPk4WiIrictbXnYRLffw8614fldyJ3LKORmRrNb8Jg==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a5d:6902:: with SMTP id t2mr29764583wru.317.1637223086895;
 Thu, 18 Nov 2021 00:11:26 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:16 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-13-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 12/23] kcsan: Ignore GCC 11+ warnings about TSan runtime support
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC 11 has introduced a new warning option, -Wtsan [1], to warn about
unsupported operations in the TSan runtime. But KCSAN !=3D TSan runtime,
so none of the warnings apply.

[1] https://gcc.gnu.org/onlinedocs/gcc-11.1.0/gcc/Warning-Options.html

Ignore the warnings.

Currently the warning only fires in the test for __atomic_thread_fence():

kernel/kcsan/kcsan_test.c: In function =E2=80=98test_atomic_builtins=E2=80=
=99:
kernel/kcsan/kcsan_test.c:1234:17: warning: =E2=80=98atomic_thread_fence=E2=
=80=99 is not supported with =E2=80=98-fsanitize=3Dthread=E2=80=99 [-Wtsan]
 1234 |                 __atomic_thread_fence(__ATOMIC_SEQ_CST);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

which exists to ensure the KCSAN runtime keeps supporting the builtin
instrumentation.

Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/Makefile.kcsan | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
index 4c7f0d282e42..19f693b68a96 100644
--- a/scripts/Makefile.kcsan
+++ b/scripts/Makefile.kcsan
@@ -13,6 +13,12 @@ kcsan-cflags :=3D -fsanitize=3Dthread -fno-optimize-sibl=
ing-calls \
 	$(call cc-option,$(call cc-param,tsan-compound-read-before-write=3D1),$(c=
all cc-option,$(call cc-param,tsan-instrument-read-before-write=3D1))) \
 	$(call cc-param,tsan-distinguish-volatile=3D1)
=20
+ifdef CONFIG_CC_IS_GCC
+# GCC started warning about operations unsupported by the TSan runtime. Bu=
t
+# KCSAN !=3D TSan, so just ignore these warnings.
+kcsan-cflags +=3D -Wno-tsan
+endif
+
 ifndef CONFIG_KCSAN_WEAK_MEMORY
 kcsan-cflags +=3D $(call cc-option,$(call cc-param,tsan-instrument-func-en=
try-exit=3D0))
 endif
--=20
2.34.0.rc2.393.gf8c9666880-goog

