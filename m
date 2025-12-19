Return-Path: <linux-kbuild+bounces-10233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8CCD13A3
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 18:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B927303E488
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 17:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2765534E24D;
	Fri, 19 Dec 2025 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="raNw5WnL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3633D517
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159238; cv=none; b=jfBru2ECaYY245awCxiOLcmX5YiZadw9I5vHKy2n6UNVJGLvrezn9+BFebOWMgCA7oRq/UhJoF26DW3L2DeN8cHxKM9fDeKS2hwR2hgnt0Ju7rAosZ7/pTF3AKflD2kqW6Me6Wu1pFwOGGTITavopcluxdgMqMMx9fJkHGsMUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159238; c=relaxed/simple;
	bh=CnQRybaMloUAntIxAZhPHUkaIjFKvuXDqT9A4epNaZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ES9CKGgGo30sOmC8khJmvfe8hXVRZ98FlzKP7J/r2Ie7kYE2MLYNqKZctvEciaqNcU5ybpM4RG2Gq2ctA+B9Q8BAXr6dUCKoOU3qocwxzTsmfEWN7AU/X7sF92vR+MK2rP77iP/NyCcgz1qtwrhgaoHTc0bAmY43Zr7W7w32wWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=raNw5WnL; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779b3749a8so13975065e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766159234; x=1766764034; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz8u5mnRRtKrmwrW53CCOIRd71oba2M2eRROatW6JBk=;
        b=raNw5WnLqCozI+dMaTW0n3NUEcOaer7DIHJj7+pKkNMqzuW1f43eIr6KabLyiaGN97
         Vmccpl5CDrBV6QRDbfTIZsGDykNrqduBEthB3BRahYRWHJSCmSXAu0PHXQugFg1QtwX1
         w00Nrr91R1rdfPMzdtdUzpgaq+/h7CIWqN5z3TH42t6ZfUIGxh+Wy/U/gBBuqenlfo48
         9QtCPF7BcyDInj5y2CsoW2MTjOFNUTw3uQ8tqS3Fd7ueCJs8w1VUB7WNcaQXnhqD6Hry
         2s1qkCgH5JiYa9jhEDAhH4OilSafu1UensWS8n0H25WaaD8FfENA7HXfS8m8b+H5Ym4K
         cQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159234; x=1766764034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz8u5mnRRtKrmwrW53CCOIRd71oba2M2eRROatW6JBk=;
        b=Rh2akL4APi3Quy++KImovjf5n+K164xWuFR0Gy4KWUdHIq7UVigbSXoBmmhRURJyAK
         Y7FCApbQRrCHOd2W9MoQLpoTV7XWLxK9MuG7lS/VQEleZfKBmvrDy5Qfxs8BPsD0Slji
         8VLhmBDp3Yz5r+gl5GU9N1bRSg4GA7/TT/lOB8XCsYqXl3mzqo1imfpZDs5+wV0dCHPt
         mqXsQqYNDZvHKVe39uhQ+TrW59yPNkoAqey4QCdLwnUiZx/lDwol+7PX/zi5twIQSiTG
         jD2vHClgGNvIhxO1f+Hi8Cfpc9PxFLYeQVk24sd2jyBXSrFIEvMWdWfSEoUFG1uXDXHq
         v+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCV8nY3rwS4kBnS7D0McYcIEiBfz9js9T4u/CrmamlNN3xqAs59gNONWxcYvXq2+ioWeQ//xNhjPV6LMmcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu9ziR8dlQl4AY7nhEvsUWagF2+qPCHNXDxjEtGBksdy4AeTsx
	AP2YZ7MnEtuJvHxx8isI/7Q8T4x7Rz+T9FnC5JruJPXE/+9iQgovsuvSyVr9wX159hDiIP8zqcu
	9vw==
X-Google-Smtp-Source: AGHT+IEwqTwwND1oOGnUGB6Esw6SWTC15eB9YSENtXjOOBgQW9BC3hhYUlWG2oQBl8kMDLj0dbJpcjcvdQ==
X-Received: from wmdd3.prod.google.com ([2002:a05:600c:a203:b0:477:54e1:e29e])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c16f:b0:47a:810f:1d06
 with SMTP id 5b1f17b1804b1-47d1953bb06mr26654055e9.4.1766159234094; Fri, 19
 Dec 2025 07:47:14 -0800 (PST)
Date: Fri, 19 Dec 2025 16:40:16 +0100
In-Reply-To: <20251219154418.3592607-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251219154418.3592607-28-elver@google.com>
Subject: [PATCH v5 27/36] MAINTAINERS: Add entry for Context Analysis
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add entry for all new files added for Clang's context analysis.

Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
v4:
* Rename capability -> context analysis.
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..2953b466107e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6132,6 +6132,17 @@ M:	Nelson Escobar <neescoba@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CLANG CONTEXT ANALYSIS
+M:	Marco Elver <elver@google.com>
+R:	Bart Van Assche <bvanassche@acm.org>
+L:	llvm@lists.linux.dev
+S:	Maintained
+F:	Documentation/dev-tools/context-analysis.rst
+F:	include/linux/compiler-context-analysis.h
+F:	lib/test_context-analysis.c
+F:	scripts/Makefile.context-analysis
+F:	scripts/context-analysis-suppression.txt
+
 CLANG CONTROL FLOW INTEGRITY SUPPORT
 M:	Sami Tolvanen <samitolvanen@google.com>
 M:	Kees Cook <kees@kernel.org>
-- 
2.52.0.322.g1dd061c0dc-goog


