Return-Path: <linux-kbuild+bounces-4636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE939C3CF3
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C66FB21BE1
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFC61991A3;
	Mon, 11 Nov 2024 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dPd0QQQ4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B8189B88;
	Mon, 11 Nov 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323939; cv=none; b=GFltwyf4gs6WKSz0AV2N5unRp7KTH+YuS/vOo5t2ApZK5boVuAzPkhX/1lYKWMwZO1mnTQ91+T7U/iUmJFfa2cJc7O46UToUfilLRnIiujap70vvtsCiHub3W44Q/XYJh14eHMQcEKWzaMak5BOMV1DEjs7rQX0HCAi9ckYBjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323939; c=relaxed/simple;
	bh=epoKNUw20KjRIxmQqCsJhCOrh6ujz3BwXBFxQJARgCM=;
	h=Message-Id:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=i1M4BHUE5u2p3rqBJtP0ZpkhKvyzNHy46k3AJ7Lck9TJTmQxIp+LKfa7/82pSYLP3YTL3H1yy8bxGTV7sOOEOnNGKw3gvWwE9N4R8uAWHkhV8PkMQRn5wnIH6z9ibHejYmd2qydf6cIw9Zx/wojCDH1i2ToiI/jS8p4LEY57eOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dPd0QQQ4; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=pv+FVEk471RGcZ+dK0zuN25EA0xObldSGsurRFVCsFs=; b=dPd0QQQ4xxwsnXTz8BnI2WWdVt
	Dx0+uXv+33NncKT+XYluCNZFg6RKp2m4PdpF95I17VU3/b071r1/jQt88bjtikPKOVaCNGYh8HDwT
	UAHZYCF7qGo6oB48Q2TBXJSX+43+b66POWG0FY02agwza6VYFsMMMRKzGhWtP9j7q7YnYmztgsbHy
	yWdTnmlICquvoKcofL1azNECQHVusi2NNidsxuTSaIUHYvxzUBl9MfwYRkVrgZeMMQa/mu1eAowoX
	CJZWTHGBNNQb4tswvmFGZ7ZrN1A8w1cXtnT2hgV+gGPVWqjWy8deFfvYLrZV6kxlYWcNvoGwx1Scm
	ZfXfVuBg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tASRU-0000000CpwK-1kBF;
	Mon, 11 Nov 2024 11:18:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 098A630114C; Mon, 11 Nov 2024 12:18:47 +0100 (CET)
Message-Id: <20241111111817.387887920@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 11 Nov 2024 11:54:35 +0100
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
Subject: [RFC][PATCH 5/8] module/modpost: Add basename helper
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
 scripts/mod/modpost.c |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1553,6 +1553,16 @@ static void mod_set_crcs(struct module *
 	free(buf);
 }
 
+static const char *mod_basename(const char *modname)
+{
+	const char *basename = strrchr(modname, '/');
+	if (basename)
+		basename++;
+	else
+		basename = modname;
+	return basename;
+}
+
 static void read_symbols(const char *modname)
 {
 	const char *symname;
@@ -1697,11 +1707,7 @@ static void check_exports(struct module
 		s->crc_valid = exp->crc_valid;
 		s->crc = exp->crc;
 
-		basename = strrchr(mod->name, '/');
-		if (basename)
-			basename++;
-		else
-			basename = mod->name;
+		basename = mod_basename(mod->name);
 
 		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
 			modpost_log(!allow_missing_ns_imports,



