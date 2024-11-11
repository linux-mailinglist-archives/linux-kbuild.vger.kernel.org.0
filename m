Return-Path: <linux-kbuild+bounces-4632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A610F9C3CE5
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F0991F21F22
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FAA18DF6B;
	Mon, 11 Nov 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j2OLYZwp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DE9189B8C;
	Mon, 11 Nov 2024 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323938; cv=none; b=OQy00DCrPQPcp360UllVTn6ihK/zkU2x9kjz9jEhbGDOq9G5v2hazI32bxk6+PdMsSCd1tkBzkMNH+39N5G5uf879C5lAENe9DKnAU7mcbU0FCO3Xa/LLy+FZjD8b0KCyz+zYlpGxhFVwhEgFiZNyL/EseOZhM0mdYeo3XXzBCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323938; c=relaxed/simple;
	bh=jQc3iETDBc6tRQ9h0BRxDqfkc220WkwrPq9IuxaperY=;
	h=Message-Id:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rcb1LFZS+NdFqhR2uZeDYbFsp6WLIh9IwuvKd+VqjQSxQ/kpKhfwYt6HLNoQioWBKaX9mGXyqUj2AOzoITU50O7EVroutQjtXN+kIhtWPSAoIxeNi2YbRMdmQVEmttQ0yYcGN3nJiP6Z0N2sZ2g5lvWTZfsMyIVYwEfalLnz47E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j2OLYZwp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=EuW8AIEfA7ZEbhSbDFIsFL71b7M2MQAgzyGLo9WNeIs=; b=j2OLYZwpQIEMw0H/6EuV+UURf5
	505jntmBLe9FaNTX79ZsAZeJ9zk5LpVnXLLRy/WuqiSDo0gkha+uDPpuDhHQXuZWLjc1V0e+yjXuZ
	4A3jUXRx3E5cW+BwrTaCwpX41eLpo3/P5fFD0f1n1A933mzHz98E9lkV1ws+b2RNoIMYFc/0WPr8a
	tAr6NdBQCMiO2t8/7fLlP2FZwwzNREkSW1BqXWcWuZc9FPFueCgqn11jdu7q9cHOpe3HtKUuk96cu
	SHOwmAjXVMu8bpRrwQ7xniSFXTaoZu8lFOFueAwQ8JNtix9IISnT6eHgtuFjK5dAYgJgI/VV/X0d7
	P+rjUcUw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tASRU-0000000CpwL-1p1l;
	Mon, 11 Nov 2024 11:18:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 1514E3021DA; Mon, 11 Nov 2024 12:18:47 +0100 (CET)
Message-Id: <20241111111817.826286643@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 11 Nov 2024 11:54:38 +0100
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
Subject: [RFC][PATCH 8/8] module: Provide EXPORT_SYMBOL*_FOR() helpers
References: <20241111105430.575636482@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Because Christoph and Masahiro-san asked for it :-)

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/export.h |    3 +++
 1 file changed, 3 insertions(+)

--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -70,4 +70,7 @@
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
 
+#define EXPORT_SYMBOL_FOR(sym, mods)	EXPORT_SYMBOL_NS(sym, "MODULE_" mods)
+#define EXPORT_SYMBOL_GPL_FOR(sym, mods) EXPORT_SYMBOL_NS_GPL(sym, "MODULE_" mods)
+
 #endif /* _LINUX_EXPORT_H */



