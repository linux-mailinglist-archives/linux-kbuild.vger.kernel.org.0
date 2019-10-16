Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D5DD8B55
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 10:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391784AbfJPIl0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 04:41:26 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:47493 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391783AbfJPIl0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 04:41:26 -0400
Received: by mail-qt1-f201.google.com with SMTP id p56so24225927qtj.14
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 01:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6B6hVR43CAiybn1r8unXu0YGQ/l4GfBcUZa3qNay/Lg=;
        b=pmKyjAi9Xr5PlfEX3WN4RXfR5rOUMeCVeHFLxeZBnJX60pdmUJcgmq7H9/mtFPlJFa
         moYsn1hDbJspCdD6Vib5sxCF1XQS2zorrJaslTcgAECl0Igp90eao9ExRzxoghK0ZyKa
         /YWUX8wsqgNhUXxIKWeHu6EHevPZBqeqVPpwiuyJgZFcEq2EuNxKt0GInMFNLlo6Yxif
         PrXK74Aw6W9IKNzvlptjE5I+HNUQvjt7bLAKckauSr7e8Ox9+LMH1ifl8ytlPVg92RDl
         Uels+l0S9OCX6mNGK/TPsotu300tngqOS6U+WCI50TixqqRrW/HI3/xID0mukxXkp8m4
         mUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6B6hVR43CAiybn1r8unXu0YGQ/l4GfBcUZa3qNay/Lg=;
        b=MXugmNOGMYHwIC129pWTW6+QJTUx85AQwCAKfS3ahcbf+CiL6erUHmm5HgPeeEE4b8
         zsvTheaURgR2LJwbl7kUaDdtuRT4nOXolGI3Sjx+o5lfX2MIoWaSB2DXxQWdI6wKM0E1
         r/YD0R7OAsWZ+52qAoZK0rPcvlh35pow6DU4TSui5I2te9SUMzSNszohfswSWtNi6HzN
         VstVuRMYcLqFaQCBjBagdzdNLnL3Wid4Wk/YsNElAZMXsmelZwHehWxAHQowyWagaMDR
         DTC/iGMu3kKyL91s0UFAYutYm3hf0g62/0+lgBrNEPJzQqM8Awxth/zPg7G8X44S3Swc
         sGgQ==
X-Gm-Message-State: APjAAAXr/lF1/kuw1c/7/TmgbZl28MdHlqqmENAICUf+kZC90vQfMz1Y
        CJlBENE5pPcFXe1NEhCie0/s2QxDaw==
X-Google-Smtp-Source: APXvYqyKyeT2RR7s/B/qIqHhRbJpXB+EYhRbk3Rsw+lqlmOIIkoJ+/xVG889AVzjkW0GfsDaRf2mA9694w==
X-Received: by 2002:ac8:3724:: with SMTP id o33mr42240619qtb.87.1571215284755;
 Wed, 16 Oct 2019 01:41:24 -0700 (PDT)
Date:   Wed, 16 Oct 2019 10:39:56 +0200
In-Reply-To: <20191016083959.186860-1-elver@google.com>
Message-Id: <20191016083959.186860-6-elver@google.com>
Mime-Version: 1.0
References: <20191016083959.186860-1-elver@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH 5/8] seqlock: Require WRITE_ONCE surrounding raw_seqcount_barrier
From:   Marco Elver <elver@google.com>
To:     elver@google.com
Cc:     akiyks@gmail.com, stern@rowland.harvard.edu, glider@google.com,
        parri.andrea@gmail.com, andreyknvl@google.com, luto@kernel.org,
        ard.biesheuvel@linaro.org, arnd@arndb.de, boqun.feng@gmail.com,
        bp@alien8.de, dja@axtens.net, dlustig@nvidia.com,
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        dvyukov@google.com, hpa@zytor.com, mingo@redhat.com,
        j.alglave@ucl.ac.uk, joel@joelfernandes.org, corbet@lwn.net,
        jpoimboe@redhat.com, luc.maranget@inria.fr, mark.rutland@arm.com,
        npiggin@gmail.com, paulmck@linux.ibm.com, peterz@infradead.org,
        tglx@linutronix.de, will@kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch proposes to require marked atomic accesses surrounding
raw_write_seqcount_barrier. We reason that otherwise there is no way to
guarantee propagation nor atomicity of writes before/after the barrier
[1]. For example, consider the compiler tears stores either before or
after the barrier; in this case, readers may observe a partial value,
and because readers are unaware that writes are going on (writes are not
in a seq-writer critical section), will complete the seq-reader critical
section while having observed some partial state.
[1] https://lwn.net/Articles/793253/

This came up when designing and implementing KCSAN, because KCSAN would
flag these accesses as data-races. After careful analysis, our reasoning
as above led us to conclude that the best thing to do is to propose an
amendment to the raw_seqcount_barrier usage.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/seqlock.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 1e425831a7ed..5d50aad53b47 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -265,6 +265,13 @@ static inline void raw_write_seqcount_end(seqcount_t *s)
  * usual consistency guarantee. It is one wmb cheaper, because we can
  * collapse the two back-to-back wmb()s.
  *
+ * Note that, writes surrounding the barrier should be declared atomic (e.g.
+ * via WRITE_ONCE): a) to ensure the writes become visible to other threads
+ * atomically, avoiding compiler optimizations; b) to document which writes are
+ * meant to propagate to the reader critical section. This is necessary because
+ * neither writes before and after the barrier are enclosed in a seq-writer
+ * critical section that would ensure readers are aware of ongoing writes.
+ *
  *      seqcount_t seq;
  *      bool X = true, Y = false;
  *
-- 
2.23.0.700.g56cf767bdb-goog

