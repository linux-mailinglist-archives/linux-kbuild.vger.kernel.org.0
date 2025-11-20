Return-Path: <linux-kbuild+bounces-9725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E44C7C74F0D
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 16:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6CFC4E5066
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 15:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456B736B07E;
	Thu, 20 Nov 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iCLMPfCc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA1C3659FE
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651656; cv=none; b=ulbUGTCoa0OUWkDFaxA6eoO7r4OOD8DhOfL7GFQBIYn27k3KzC1aRp/yEbitpdyh7EKv3NtErpF8pJCx4OttB+0mnjfmTDMsjdGlD2OMS7SbtQdmrlTRLwY8H3S4O1cMZ3lh+XloCrbbqGEAaU+scVnnNLxrEc9wRJXn5KI1zN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651656; c=relaxed/simple;
	bh=JSFE6OXplsVQRasUjLyJp87wPLoBhJo5boc6e5TlRPY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AN59Offs6IpJcKZWmGO/+dwQ6nFX8Nc1N6RenN6sfO6c0xjqN+ijFfSZpCY6+BWs5/kGw8OVgAbqA8fln+i8GX5hlzUmWF/f8xW3icTLF0WMRngBaRME70IQqXfuYZa9M7S+LYA/LJcxuvSBd01dgenDCfAcd6wv0DGjRqTvIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iCLMPfCc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779d8fd4ecso4054625e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Nov 2025 07:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763651613; x=1764256413; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNvl5AadBnBbkNqIZ5ePr/ep+DGb1qTLi02EcnmaTpQ=;
        b=iCLMPfCc7jWhEpnYhobvI2CKA2SElpM9LR0+higIlNVPix1drSCs++UbXykawgetXH
         UiK2Mlropxx9wOJeRRbYAassEHRQmIuimGssASlfFCMIHugwhSwj3b/fCzNmiq9VN+nt
         nfzqFiywxCAnOPudXpRx+zUking//m8pTDAm28RHuO9pbcxIIYZA7l9QX4pAUeSVZbPP
         eh6Nz4aythN+TVoBhg44bsA9fQEmI3pG42o6MSQ0gaXXDnwhtpTIkNZOQZ7qHP+DY1pe
         pc31FewAdejDaVASt7E7NmYup1vOHoofrZHC3welUeiAxyB3/Q+FX0BPWg8UOt8wyTVB
         +5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651613; x=1764256413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNvl5AadBnBbkNqIZ5ePr/ep+DGb1qTLi02EcnmaTpQ=;
        b=NcQIbsvBsdB5dVfEOTgEX1XaDG0yf/NwQ/NzUU2tJ9X46J3xwyRP4Qro0lCvwyuMvC
         pt+b8Hf8S5U2pRCPKO9J/w3GO2W5WFEIHRkAttQqdYAqmdOIny0ys9SvrCiUayPFazfr
         Cmhxb7zk5vic4QPlUdxg+1SCeQh1R/+LkXj6lruy6KM3m8Xr7LBtUJ/6K15P+kVM1G7M
         6ayPyt3CAkTc4cfDE31es0IZdf1/1mtjQcKsz3gzanwVnXc8Bf6mXUU70uX9ON6qD79W
         WQgEYlCeHYEMr4B/0jBv/khhFFli/f03Rb3gWiFU3wGHI4TdxqOGiWJ+TRfb5/tr8baK
         P4dA==
X-Forwarded-Encrypted: i=1; AJvYcCVVP24ZEtYefubYOUe2OewNusk5TPngY8UzukScrGG5T+HQCINNA88tHmt9g8mJTvbOtlY4jQjKNL6Wbd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4fmyPAzxzVJC2Xw3zBIDa5p+9m2Tx9acQZO+JFfxu1DS0D6cI
	v3DSkPMXHOXRAtqHvosT1/OF3nEEZSPIVHWCPDMPBocDDzU8jEAC2HB/IeEJ1t94njE5Hnuz8pN
	MeQ==
X-Google-Smtp-Source: AGHT+IF9W56E3BCf4ycfyNzV0Jbt7zmYcg646z2GlS6yDnrRg6LpKFxf4hnN1dp2GqjQ6ITkpBqUZJJJqw==
X-Received: from wmbbd8.prod.google.com ([2002:a05:600c:1f08:b0:470:fd92:351d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1516:b0:477:14ba:28da
 with SMTP id 5b1f17b1804b1-477b9ea8f78mr18741385e9.5.1763651612613; Thu, 20
 Nov 2025 07:13:32 -0800 (PST)
Date: Thu, 20 Nov 2025 16:09:51 +0100
In-Reply-To: <20251120151033.3840508-7-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251120151033.3840508-27-elver@google.com>
Subject: [PATCH v4 26/35] MAINTAINERS: Add entry for Context Analysis
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
index e64b94e6b5a9..0445478f74c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6029,6 +6029,17 @@ M:	Nelson Escobar <neescoba@cisco.com>
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
2.52.0.rc1.455.g30608eb744-goog


