Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03CB4556C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Nov 2021 09:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244303AbhKRISc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Nov 2021 03:18:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244372AbhKRIRo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Nov 2021 03:17:44 -0500
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513E0C07978F
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:48 -0800 (PST)
Received: by mail-wm1-x349.google.com with SMTP id v10-20020a1cf70a000000b00318203a6bd1so2719613wmh.6
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Nov 2021 00:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rzdCErYR7QVJMqQ7C8iOEn+pKBOJL+BpLP2uqDT2sRI=;
        b=lywc3NBHZZG/l/NByd9QMLrak/0JWSxz9fkaHSvQpFiu6THhd/Nji8+4etKEu/FWb1
         DUr7dTzctJFdTqeiReLlmlOSBqRVuxOd5rYx5nJHm3aM+ZmXYgZ3vl4Ce8tFrt0Av3T1
         bf9NeFQD3uLC7xCUpZwxhl9alcSmSnW523ahX1+J5WE1eN8IqUpB8WLaFMwKtqyVR2H5
         VBmh+uW9lUYfpnV9Dv/+zhxWz2y1F+L14D0bQuciTgOc/C7axKYJxr+/2pkCLLBSQ4sB
         E1t7FIYUwhm4GLpE9UPOpx8Eww9R6mgkFTE33GQnZrk37IxG6T6TO6OsAK9RCGF/iBpM
         yZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rzdCErYR7QVJMqQ7C8iOEn+pKBOJL+BpLP2uqDT2sRI=;
        b=LXNmHyoz0b/ohvF++ELGjaPkMVkSEBo5IdBkabV3fiUm9Tzuf8FLmso7IDBNyRAbKO
         DUB4zF/c9RALX0Y1o5hJQgz3DYszz88PzVxlvgbR+uPg9tpn2YpAHu1kU/aINLanrcYO
         aA8IU/U3FZSyVUwcCtusge82VYPobIcFVi8EcRpxscs6Ng0GL6M+JywVdXh8AcKMsV1J
         TZ632v//7NanWPe2MNqV57COqJuumvimyFBRjKyalA+TzuhToXiDFmCiCCXv4xrK/li8
         xLf1daI8JyEQsZjWHV9AD76GvukZwE3/BsfqKlcQGpDW07UlVf7uWiXZymzM4IfVmOOj
         foXg==
X-Gm-Message-State: AOAM533IzfUnAvQFV7IsS9c3qE8hFFICDEhVilZbVrxKluG0Rs7z0N5u
        hqr+OnfcAiLj2MaNnytpr6zbQc9mow==
X-Google-Smtp-Source: ABdhPJxAWh/BZwpokjufV74uSy9dmYvaQlEFQf441y59AQVEiD0veafOsEsU+5qgKzAWHYtjU5201SdIww==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a5d:6043:: with SMTP id j3mr28104905wrt.375.1637223106899;
 Thu, 18 Nov 2021 00:11:46 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:24 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-21-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 20/23] mm, kcsan: Enable barrier instrumentation
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
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some memory management calls imply memory barriers that are required to
avoid false positives. For example, without the correct instrumentation,
we could observe data races of the following variant:

                   T0           |           T1
        ------------------------+------------------------
                                |
         *a = 42;    ---+       |
         kfree(a);      |       |
                        |       | b = kmalloc(..); // b == a
          <reordered> <-+       | *b = 42;         // not a data race!
                                |

Therefore, instrument memory barriers in all allocator code currently
not being instrumented in a default build.

Signed-off-by: Marco Elver <elver@google.com>
---
 mm/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/Makefile b/mm/Makefile
index d6c0042e3aa0..7919cd7f13f2 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -15,6 +15,8 @@ KCSAN_SANITIZE_slab_common.o := n
 KCSAN_SANITIZE_slab.o := n
 KCSAN_SANITIZE_slub.o := n
 KCSAN_SANITIZE_page_alloc.o := n
+# But enable explicit instrumentation for memory barriers.
+KCSAN_INSTRUMENT_BARRIERS := y
 
 # These files are disabled because they produce non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. E.g. slab is out of
-- 
2.34.0.rc2.393.gf8c9666880-goog

