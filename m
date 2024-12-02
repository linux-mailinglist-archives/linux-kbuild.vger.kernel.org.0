Return-Path: <linux-kbuild+bounces-4925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD4B9E084A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 17:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4436AB45B73
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7B0209687;
	Mon,  2 Dec 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d11Eevcr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55789207A3D;
	Mon,  2 Dec 2024 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152297; cv=none; b=VI7sKmrqC0CgrsZ1tS4mEzpZFpmgOdyXCvQ/q7BLtHaMm8dBZ1Evy2d4Qqy73sYvjxW44mhmqG/SS0mJhdXHVTDOH3vTR9R+GG7Rspw+ee4pPXzIY/CTFGxRwFZG688li7uTAczTcDlmPNcw5wXH+5l/ZSYoUCA7bgOKsXyManA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152297; c=relaxed/simple;
	bh=epoKNUw20KjRIxmQqCsJhCOrh6ujz3BwXBFxQJARgCM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=KryoujPWfvC6vFSwTShR6Q8Mtc09W3nG4C1qaYka+KYJoEdvM2LrveN1jpheOv6PI//RYFjpafWEOv3OLN+EkBDMM55nTRb2MXTWFiu+e6ibBL+Wz9LKc1JxjTlq872c3f0r91fBZFRX4BfdDrSlWAHh/zCBj+0WGD+RTdOb1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d11Eevcr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=pv+FVEk471RGcZ+dK0zuN25EA0xObldSGsurRFVCsFs=; b=d11EevcrA7dY47rD9JgaL/AGXG
	xQNiWbD7MHd7OVoOxPZvUJtSMYbtNKFH0maK7XjAHpKhXIKRJkd7wMlaSzP6yngDLB23T+xQ5dr6I
	CFTnNZ0kTwWj7uxhB+ImlrEPIiOTUkWar8xm0kJwcpmBMT8W/ni68i0W5Ku8300NRrldF/RPCzDL5
	hwUW8pggG8vVA9ibCAarZGrBVPBopJBe6FQv1+0SOzZaB4/9IntbylCSIYJuaKibocH27FnfhEsqE
	ZBrlcIXIK3Gg+LOhX84c3W4xGU32CAIWMY98joOY+sr0ymCgMfRGMKFkytHwrIMmudm9qwtOIfiG3
	GH2wsoqA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI859-00000008CPn-18lb;
	Mon, 02 Dec 2024 15:11:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C64EC300729; Mon,  2 Dec 2024 16:11:27 +0100 (CET)
Message-ID: <20241202150810.270511329@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Dec 2024 15:59:49 +0100
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
Subject: [PATCH -v2 3/7] module/modpost: Add basename helper
References: <20241202145946.108093528@infradead.org>
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



