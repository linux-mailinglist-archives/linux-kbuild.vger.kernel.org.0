Return-Path: <linux-kbuild+bounces-5110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CA9F0B1F
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10699188C087
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AA61DEFE1;
	Fri, 13 Dec 2024 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e8V4rozR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB01DF723
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089512; cv=none; b=ZzBFPyBKFWl7egWLRULrzug4jISToOLiY+fpee2p5dm57kIKGgNAlBWZ4ldxbTKY2IOujOZJNt247c8yNboTLr8o5jyM+h71ZqWEwe2LS7neJEVR47ubnWY8vP7AG4y83AN+xgJfqRxAFnclxaFGuGtm3vLOLM/ftIOj1LKDYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089512; c=relaxed/simple;
	bh=8Z+fkcLpCW50dgG3XgGbc9Y+J6ZITUqaOeKIYboitQ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FI4emZ+Rt9gWg6BSjNCM3kESZYK4eJhKlnCd4ppJtwLcauLUVARQHhbs0gEWbPfHYM2s9sGsXr9q8YiXtj5O6Ef0k7G9iAWjl02r0v3fPehVJs0kvQkOTaAU9BQ8sC8W3Jil2vhv09eDbauHpOjCUPeNYGpZuN+i8LlN8Y9lD60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e8V4rozR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43627bb20b5so10416395e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 03:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734089509; x=1734694309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=12jc0w/fivkkryMIJsg9WOh7az7NrRYvkDaKh8q38vk=;
        b=e8V4rozRZDQGgq2bdNP9Nlyfwa9Xh7OHavGBO4y1dBS7KWB5hmAmheJzIpiE8Va8Hy
         tThS8pUJk+855bCGr1xkxdKgL+hKir2WTVNg7Sc2SyCYixDonXpuRd6r5FlibvVngQcN
         mwy3BUdGVR30Y4FuGy/8eHAkKHR/oaiv3Zu4Zn3S5cU6OVkiFAUwpKXHM4rEfSaXRXTU
         86GA5bMq24zb1IKPkw36n/JZVcyaac3/a4mjNGebq//WyJDnr91JCxT2IheOBCBy4hkW
         ZhukrohU3vzuLVu+yHxu1pRPoUeggUG3fdP0eCFvVhA4oL/RSlYrjmhnfQpw/WhsAKda
         Ofvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089509; x=1734694309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12jc0w/fivkkryMIJsg9WOh7az7NrRYvkDaKh8q38vk=;
        b=XHAsoVSDzR4i4TrtA0WBt5Yb//zZv1Se8rI9nfc2RYjLukmU/s+6CjP9HVkOekrEgN
         itGxJ6dm8zYX9kyzNRZtik39BYUN8kRhYlgvsCOkCe32NWo/pEKwl7UE91ZFxq/OP1DM
         GCPrLyUcdMAvnO6gsHf2S6IRiRcXjCT90Qg48X+x40H8x1YtwstKGUwMm06CNz99iLcS
         SkCB0BrhvVpSTl+mv1GKN1hVXTSTnJa4EcDWrM1/c6IGaujbfA/sKY0xT2QTiOWhfCqg
         2RmuGt4s0oCUBRG7iDtVQPXv+pfnjJe8KH001sOHIowyUvA+KeDNdrT0lA0dcz6haqwm
         nPQg==
X-Forwarded-Encrypted: i=1; AJvYcCXCpKOx2DmO1XD6PRDUh02cI3ieqY1yujFdeAtO3S1ADvLMwOeHNG3Q014h/9CCb2vAbvWMudY31DToZds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiA9Qf3teA2cd6WpHS/dhnaoeYI7o09BOCtIGwARA6whyfnmMf
	XJNYEBJ6e+hMyZNXAnwUrzfFzN00v4QoQ2zS4lOZUFoLJ2qrgiDUhlPqtA7F8rbiJb19mKopdEf
	KVhm15USXRA==
X-Google-Smtp-Source: AGHT+IEZ4eA8bhHHA8R9uWIaOs6w9kxA+a6SSCc9PyYcjPq9AgHQF76/B6v8e4W1chnsdD7KewFoDA8hfeL33Q==
X-Received: from wmbdx22.prod.google.com ([2002:a05:600c:63d6:b0:436:3ea:c491])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a14:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-4362aa3bcdcmr19895245e9.14.1734089508870;
 Fri, 13 Dec 2024 03:31:48 -0800 (PST)
Date: Fri, 13 Dec 2024 11:31:31 +0000
In-Reply-To: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241213-objtool-strict-v1-2-fd388f9d971f@google.com>
Subject: [PATCH 2/2] kbuild: Add option to fail build on vmlinux objtool issues
From: Brendan Jackman <jackmanb@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

NOINSTR_VALIDATION is pretty helpful for detecting bugs, I would like
my build to fail when those bugs arise.

If we wanted to we could enable this for individual warnings, it seems
unlikely there's a use-case for that though. So for now I've just added
a global setting for vmlinux.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 lib/Kconfig.debug          | 11 +++++++++++
 scripts/Makefile.vmlinux_o |  1 +
 2 files changed, 12 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f3d72370587936fa373129cc9b246f15dac907be..b1f0f8c83b050d4112428e0d8dece059ebf8dcd2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -563,6 +563,17 @@ config NOINSTR_VALIDATION
 	select OBJTOOL
 	default y
 
+config VMLINUX_OBJTOOL_STRICT
+	bool "Strict objtool on vmlinux"
+	default n
+	# Conditions when we run objtool on vmlinux
+	depends on NOINSTR_VALIDATION || LTO_CLANG || X86_KERNEL_IBT
+	help
+	  Fail the build when objtool produces warnings on vmlinux.
+
+	  By default, objtool just prints warnings to the terminal without
+	  causing a build failure. This config changes that for vmlinux.
+
 config VMLINUX_MAP
 	bool "Generate vmlinux.map file when linking"
 	depends on EXPERT
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 0b6e2ebf60dc1bb69d9651d5b7858ccd296e92dd..97b6b262d482e0bac1a4d74f9a2e7b1867b6ee00 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -39,6 +39,7 @@ vmlinux-objtool-args-$(delay-objtool)			+= $(objtool-args-y)
 vmlinux-objtool-args-$(CONFIG_GCOV_KERNEL)		+= --no-unreachable
 vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
 							   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)
+vmlinux-objtool-args-$(CONFIG_VMLINUX_OBJTOOL_STRICT)	+= --fail-on-warn
 
 objtool-args = $(vmlinux-objtool-args-y) --link
 

-- 
2.47.1.613.gc27f4b7a9f-goog


