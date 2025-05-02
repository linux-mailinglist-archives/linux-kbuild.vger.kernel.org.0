Return-Path: <linux-kbuild+bounces-6878-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC289AA74E5
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C00EE4C4CF0
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B652566C4;
	Fri,  2 May 2025 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QpXStV5Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976E2561C7;
	Fri,  2 May 2025 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195961; cv=none; b=LofyoGBIBCp53XjHPnqWkbfhBBFiN2spLvTlC4+zsENgK4FYmRPP2mJV7LLENXjCJ/ugE9V/VPEg6k/aeiZ81/NvKWFrTlCJQ50n+IfVOmIoTFS9c2gL0/fWAfyzsMnclY1usf9Zq1m0iWun0n4B2U2xZOXbj1mDhyP6+X3lWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195961; c=relaxed/simple;
	bh=REB2eBCK+R9hPD7UeAqPnHnHhVOyXX6Q/mLp4WgtHlA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=LZUbpChxspsH733MbNuvVjV8BJF1CiCjH5LVeB0OyEITOTs9G6AWpDzgzWwUb+RkmJIfvo7xFWXKfdad9NapkKurG7NUtTx2cMNl4Cil6zmAGA6wtTmyJqh76ktTQ4bQJ8VlT7U8Ouqm2JxUNwV0OQK7PpLbM/6p1JqdWh8nsjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QpXStV5Y; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=/UvIJyPu4PFnUbnZPb6KkO/nGn6jmjyInuZMnh8rDj0=; b=QpXStV5YToMC6plCNaJSXQHB4K
	YeJQE2XoMrdquYIoXPUBk+07E3YFIRiR03BC6Sl3g/96xyck/qYGSG7l8DfopcijtmaXCUQtphmQu
	EqLGsV38TUMPW3xfkKjbPFtRmJ9yBxHSVlg0csvlcx0rEPzv4mPiVHaq4pQL0qxWD86DNaIRXYX8v
	5Ei5pBUEkorSP81YRVxhNB81C4BbTs3K1+pcqn4d6CPuNuC9a/Gt6hWH6uikwTzoKaY/U/T3OFXqu
	Oheu+VX0aL4eHbqTcbRle78lAfD5kPneD/1doeEmlUDhYLXjtIKXLGcjv6JO1HMRm8HRlbj04WsUS
	ON6yzVxg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArKD-00000002iJj-3aSK;
	Fri, 02 May 2025 14:25:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id F16A830081F; Fri,  2 May 2025 16:24:59 +0200 (CEST)
Message-ID: <20250502141844.263611823@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 02 May 2025 16:12:08 +0200
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
 roypat@amazon.co.uk,
 Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 4/5] module: Account for the build time module name mangling
References: <20250502141204.500293812@infradead.org>
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
Tested-by: Sean Christopherson <seanjc@google.com>
---
 kernel/module/main.c |   26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -170,6 +170,30 @@ static inline void add_taint_module(stru
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
  * A thread that wants to hold a reference to a module only while it
  * is running can call this to safely exit.
  */
@@ -1116,7 +1140,7 @@ static bool verify_module_namespace(cons
 		if (*sep)
 			sep++;
 
-		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
+		if (mod_strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
 			return true;
 	}
 



