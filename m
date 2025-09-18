Return-Path: <linux-kbuild+bounces-8883-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD66B85215
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48435585168
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 14:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09BF319606;
	Thu, 18 Sep 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e6mf/cKh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23920318132
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204402; cv=none; b=XT5Shqmfb/dvFL2AWSIOQKBhFap3kWz42Ge8lb+HLgyd8C0DwgEcI06qh8FVARiD+jDzbgbb68OSBen6HmQ6KpDOr8g7fT4l+i4YBXywNiPAaIWfhRIk648VYZFQ8T2KZ/LBpXY/XJ5OSeCYiG8K6s1aWhYhlzccM/Ix8opi7c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204402; c=relaxed/simple;
	bh=dlga7YnphSnOGIQrIQaBJBfVrzl27d5Bc0V7ZNGYDq0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rmcIneSPO54lYkH+F4iTyPJXpNRptpdxdSLgKEjsukn1NSdzYoo06rkkkLqb/DL3yHS2A0tJlUu59ZJQATPOfOQAj4lcb4D68gvBc/guT1XThvWcxl9r//vCnmECEvJ2j6y5OBDOzcMifJIuBEd+4nRqX7gRX5BvrYeUt7s0RwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e6mf/cKh; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45de18e7eccso5840165e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Sep 2025 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204397; x=1758809197; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhic53vYgugE24TxlxF+xx8w5glItenUyktwwUAacwI=;
        b=e6mf/cKh23OtOLaa85mS/JtKU2kqvrYVFiAanqZ/8YAS6U1D6Xt0XqD5ThnU8uMT9t
         AcWsQ8KiUXmovzqPiSL+AHPyL56ckk7WgWCOAdAi3gNkDHTUd0W9cinYfjkqwH8pc2p/
         a1owrBxFfeTl4M9tJT8bWhopr2SoFw9WRXLfSl6QZjG2ErdXiE5ksrs7g3OrI8wANrf2
         RLh1m3JDnSn6EVsebG8TGvDRdWUR44DmPK1THCP8KDwmR1RTph+3O7xib67D6xlIaTL4
         sSn0Xkqe+OzxUNxLqxvIV86VJtM/eWxPLnxyz/2LTV2dUm5vXNwKqvWWy71yiWE2RwKS
         CDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204397; x=1758809197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhic53vYgugE24TxlxF+xx8w5glItenUyktwwUAacwI=;
        b=UIApu4Lfjfajp3yhORAfOn6Ba8jVEwfxkAiLtqyVlsOGtCHazsQ7W4fpYQySZNT+Zn
         hUkPpU5ScXBm3ofJsooRjrZHzbw/MR9EySV7Fl8KEP33cay9Q1OJYRYJEkMKcxbCsDri
         YwlS+cnOYUSd7c/Zqz0OxkwnUYZL6VqnQoAk2vr1fzeX3bQEvE6sSOW1dUnrel5Ruet/
         9dU4NI/V0QmXeMX1h3FYWbGriAPNHzJ6s4KzIF43+8Gq7ag8SZbgrJ7+yGPhgkPslLCq
         sw7hCvoM5m6jjrcL4VBLJYRSYceqLKlIHWB5ML/ecPGTAB2Fbafo6bhsGHYeDAbaMUj8
         1T2g==
X-Forwarded-Encrypted: i=1; AJvYcCV0DSgeSPTVfQByvJwOLno7GJWVaLvFRth3og05gsgDrUjCSQKnIC2GFTPGu/ECqa1NAje0TrIREG/RPOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBYswutXfs397EPZvyjwUOeIiVU9PQS8peYXmiK1fG6WCZWYkk
	N1EAbKDWALt3KyJ6mrtOvGIwOHwemrxstXAXIK29irFrhvSWXW/mrDaZwUKDCAdOwT1gphvi7mT
	7ow==
X-Google-Smtp-Source: AGHT+IHZwXc50wF1UKzRkCSl9Zlzv0YXfIKjEUT7w3tckKijx1tkK0IOXg5OQwciPpS047ZOEU7YpUJVKQ==
X-Received: from wmqb11.prod.google.com ([2002:a05:600c:4e0b:b0:45f:2306:167])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1c9b:b0:45d:d9ab:b85a
 with SMTP id 5b1f17b1804b1-46201f8b09fmr54309365e9.7.1758204397465; Thu, 18
 Sep 2025 07:06:37 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:59:37 +0200
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918140451.1289454-27-elver@google.com>
Subject: [PATCH v3 26/35] MAINTAINERS: Add entry for Capability Analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add entry for all new files added for Clang's capability analysis.

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..da4c8196c1b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5951,6 +5951,17 @@ M:	Nelson Escobar <neescoba@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CLANG CAPABILITY ANALYSIS
+M:	Marco Elver <elver@google.com>
+R:	Bart Van Assche <bvanassche@acm.org>
+L:	llvm@lists.linux.dev
+S:	Maintained
+F:	Documentation/dev-tools/capability-analysis.rst
+F:	include/linux/compiler-capability-analysis.h
+F:	lib/test_capability-analysis.c
+F:	scripts/Makefile.capability-analysis
+F:	scripts/capability-analysis-suppression.txt
+
 CLANG CONTROL FLOW INTEGRITY SUPPORT
 M:	Sami Tolvanen <samitolvanen@google.com>
 M:	Kees Cook <kees@kernel.org>
-- 
2.51.0.384.g4c02a37b29-goog


