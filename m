Return-Path: <linux-kbuild+bounces-4630-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA79C3CE1
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFF8E1F20100
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AE0189F2B;
	Mon, 11 Nov 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cEqNPzd6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B282318660C;
	Mon, 11 Nov 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323937; cv=none; b=rjo3TCaM1hrDxLPmMOVbLAlueJQJn1w4FGk2xpGi7fMzJwRWqi5DPr1qTcjpu7dvFIrci1AlXeYr0rmG4NJK+G4FnngLc4LV63WADHYlV2h7G/QI+YFIGR/VXXoQuXdYdVHWUQTq45J5r361JyGwp7ncmKWDchy4FNzJ0c7163o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323937; c=relaxed/simple;
	bh=wAXGrCis2erKKnFBJ8avbS/b2YZc5XjQdw18YRo39tE=;
	h=Message-Id:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=tb9btXUiSMKJEjlnxn1oc2F/ovlrHZr1YYFJ4vY34+ve7Fnt7YFatMRUUuSw13oTrLuhkRyOMHri/eTjXqYbdtmIkHv1eBK5Xz7AJOLQVNwqLNzFSPR5t44ykqZm6hKpwHdC9B8Rjw7vpVqGajRnOejcuz+8T/dxgVC/hoGDYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cEqNPzd6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=/pFudQu1OVkP6rdTvBnjU8AKlbsmkvlwxkmlg5TAne0=; b=cEqNPzd6SnzU+t4/RmLbYzZdMb
	8aR7IbDyof4l/Mi/2qPdgKAZnhu64rviBvsu9chCymn+LzyjPHthGCIX7tiCxQgJwn3rukuSse7l7
	4grRE7VbXC8rALjQymartMxp6cNjbt+0UEmHzVrtfchQ/ZQwigLFXMzmZZxlxBhv4WjaH+jL0laOr
	wUqXvXSWz/3KQFJpGaNnBbkamDsqODMPelfyDRBzcMQH7gKzmgvqmXpVtLkN9vVCoY8f6JFVOfwfJ
	qZvYLwHaN+FCX8U3dg9fVlMQ7PXzClPCKliAj/rsygf+XURJF6TNH8UAWANQpMYiJhVmfnSs5Tw1o
	kY8X3s8A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tASRT-0000000Cpw8-2420;
	Mon, 11 Nov 2024 11:18:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 003AC30083E; Mon, 11 Nov 2024 12:18:46 +0100 (CET)
Message-Id: <20241111111817.136750440@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 11 Nov 2024 11:54:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org,
 hpa@zytor.com,
 petr.pavlu@suse.com,
 samitolvanen@google.com,
 da.gomez@samsung.com,
 masahiroy@kernel.org,
 nathan@kernel.org,
 nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 hch@infradead.org,
 gregkh@linuxfoundation.org,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [RFC][PATCH 3/8] module: Fix up after script
References: <20241111105430.575636482@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8


Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/export.h |    4 ++--
 include/linux/module.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -67,7 +67,7 @@
 
 #define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym)		_EXPORT_SYMBOL(sym, "GPL")
-#define EXPORT_SYMBOL_NS(sym, "ns")	__EXPORT_SYMBOL(sym, "", __stringify(ns))
-#define EXPORT_SYMBOL_NS_GPL(sym, "ns")	__EXPORT_SYMBOL(sym, "GPL", __stringify(ns))
+#define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
+#define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
 
 #endif /* _LINUX_EXPORT_H */
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -296,7 +296,7 @@ extern typeof(name) __mod_##type##__##na
  * files require multiple MODULE_FIRMWARE() specifiers */
 #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
 
-#define MODULE_IMPORT_NS("ns")	MODULE_INFO(import_ns, __stringify(ns))
+#define MODULE_IMPORT_NS(ns)	MODULE_INFO(import_ns, ns)
 
 struct notifier_block;
 



