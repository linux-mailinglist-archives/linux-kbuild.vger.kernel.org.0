Return-Path: <linux-kbuild+bounces-4924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D79E0762
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1FC31765AB
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3826208972;
	Mon,  2 Dec 2024 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kB6lrSEm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110C205ACD;
	Mon,  2 Dec 2024 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152296; cv=none; b=BPdP+j0RlPt/ku4kgy81D8dFnZbU7V8AUV4du/Od4YY+MTn1ZjwvOSXy0ehPZOyqQpDeVp2SczCjcmuIAJgCqJy42KHg0xP0drTT7FiYS64iAA8pgZfwjEvzrxMQcpBlXjgl2witB5rhBt6Qr41Sqtl371SAbFWTRnrDPFAlFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152296; c=relaxed/simple;
	bh=a10zqHBADACqh+lSa+gIc0SQC3HXeDKZ/DGTcNuXhoA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HydttQUEOy1xBqBsKSNvQgYL+2RBjZAJfYmHoPYfVZ7omNlhCOJrO3a15lLhi2kJgDstugYsuWsquNcv6JI2Uj6QsMl0psjSksAPQ6XhCFD/9r9bsA9Gfbpfk1YS8NAV/NPOOwklvYiWHibWYigR2SWulq6Io/msBMtv0vCposs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kB6lrSEm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=xFrdyuMgRUUJGyOInxj7bUrT/h7Ni0x8G1WlCO144yg=; b=kB6lrSEm821XI+oiRPpmwx5XvQ
	pSx3wbtdR4rP3pyHRBatJF4BUIeOW6W5YcrW2OhpGwhNyHxP93sCN9snCldKcvIf+wP58c6tVQRpG
	GY+BYcVHkLpZzlQLo672VbsIvkbLCGsLicrIXsBDqqDCVwuxTUWZ41rbml82XGwknEqWNA94iuvXV
	D/RTH3nB2EcEaPtJhYdO97qHmf4RNLac2c3BlIjhS1GWqK3CW1VT74sN+NoW+/oeRzjFC5bZMoGnI
	qT4l+dgQgSx4z3KcJlb2ugt9OpXKiU26OjxED6YEzd4xPOpDJtr4s2xMlF8o7RXhK8n2uOryOLiNH
	FFCu0pWQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI859-00000008CQ4-3iat;
	Mon, 02 Dec 2024 15:11:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D109F300848; Mon,  2 Dec 2024 16:11:27 +0100 (CET)
Message-ID: <20241202150810.606849101@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Dec 2024 15:59:52 +0100
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
 Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH -v2 6/7] module: Account for the build time module name mangling
References: <20241202145946.108093528@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Sean noted that scripts/Makefile.lib:name-fix-token rule will mangle
the module name with s/-/_/g.

Since this happens late in the build, only the kernel needs to bother
with this, the modpost tool still sees the original name.

Reported-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/module/main.c |   26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1062,6 +1062,30 @@ static char *get_modinfo(const struct lo
 }
 
 /*
+ * Like strncmp(), except s/-/_/g as per scripts/Makefile.lib:name-fix-token rule.
+ */
+static int mod_strncmp(const char *str_a, const char *str_b, size_t n)
+{
+	for (int i = 0; i < n; i++) {
+		char a = str_a[i];
+		char b = str_b[i];
+		int d;
+
+		if (a == '-') a = '_';
+		if (b == '-') b = '_';
+
+		d = a - b;
+		if (d)
+			return d;
+
+		if (!a)
+			break;
+	}
+
+	return 0;
+}
+
+/*
  * @namespace ~= "MODULE_foo-*,bar", match @modname to 'foo-*' or 'bar'
  */
 static bool verify_module_namespace(const char *namespace, const char *modname)
@@ -1086,7 +1110,7 @@ static bool verify_module_namespace(cons
 		if (*sep)
 			sep++;
 
-		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+		if (mod_strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
 			return true;
 	}
 



