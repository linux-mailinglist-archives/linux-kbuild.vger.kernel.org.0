Return-Path: <linux-kbuild+bounces-6877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A75EBAA74DC
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04303A0060E
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238AC2566D2;
	Fri,  2 May 2025 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jOCdhI43"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84338255F4E;
	Fri,  2 May 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195909; cv=none; b=gzARrMOccH/gxpyT7m+IulQ1oNuC7CvhWTc1Lz0F9wgRRWbhdrZpncidNckCkQ+LgLsCowXDTJVJHI8o58Wawoo07CglX9PrmZLuANGQzEsO7OOqCmsytBuGInRgX7DmGHMBp8cS5nxIJHlIyL8u2WUK5Urlp/DBKQXeXHyQJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195909; c=relaxed/simple;
	bh=jRjBKw4YOqZTbdVmrR6qZ/i4ZyoyCPf7+SVKGt83R/k=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=pE5jEPYxuuzgtzMy+vcRhuwUKh7KYbuDUOpi4NB0FtdrvasayWnjLmbQsZR5twQaFdleafCWXYaa0TeI3+ElsUMDdSART2VAXUSwDaUAZRg1RvJFkPIwUJpea+L83CoeWR2iwgZNdymMLPR9egraOvQm2cG5G4BMPa16qwrPVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jOCdhI43; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=wSEofVt37+OE35DFLYfF1av+a4A68i6wp+MZRME4os4=; b=jOCdhI43EtUJ6ce96sPwbhJOu6
	3WfqKCd/O0nHmlLZEG3mHGuAhVQoXqeh5jdnt1DGphdBQVlOrX8sWuh5NyvtXrbiV3jQYxhgIY3We
	t9lT2q2t7ei474Cad0di45lO/K14mcywFxLJVxBsLxZUhRO+vrymre+fPOs/EDnI6tSzoTph7Eist
	Nf4fSC6IXZOnpiw19das0+Axy83BPznXCZ228I+gfhNbsPDpbKzJVBuR5sMhvc+kSnDrMR6C5TT7r
	QmYcKVr2QVT7doSgaRSmv/tblCk9szfvPLFID7zM+Hajw+XcNzpDHp2as/0Hg1ZWsCzJ+G/56hzMt
	tJI3MUiw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uArK1-0000000EzDd-16cX;
	Fri, 02 May 2025 14:25:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E4ADA300777; Fri,  2 May 2025 16:24:59 +0200 (CEST)
Message-ID: <20250502141843.937580735@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 02 May 2025 16:12:05 +0200
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
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 1/5] modpost: Use for() loop
References: <20250502141204.500293812@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Slight cleanup by using a for() loop instead of while(). This makes it
clearer what is the iteration and what is the actual work done.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 scripts/mod/modpost.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1595,12 +1595,10 @@ static void read_symbols(const char *mod
 			license = get_next_modinfo(&info, "license", license);
 		}
 
-		namespace = get_modinfo(&info, "import_ns");
-		while (namespace) {
+		for (namespace = get_modinfo(&info, "import_ns");
+		     namespace;
+		     namespace = get_next_modinfo(&info, "import_ns", namespace))
 			add_namespace(&mod->imported_namespaces, namespace);
-			namespace = get_next_modinfo(&info, "import_ns",
-						     namespace);
-		}
 
 		if (!get_modinfo(&info, "description"))
 			warn("missing MODULE_DESCRIPTION() in %s\n", modname);



