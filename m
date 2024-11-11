Return-Path: <linux-kbuild+bounces-4634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A89C3CEA
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4A281C21626
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F6C1946CF;
	Mon, 11 Nov 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A2kZgLmU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CA156F44;
	Mon, 11 Nov 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323938; cv=none; b=Sar9A281GVeDqii5z5E2Pk5+ipXVia1MbPR6edkHHevH1QL/oao8MhDZoFDJWUdEty9K/VJCS01kdMdk49lNluwxThH+02EvlmOSdy7NKRcTTGwQ7910JI3MSXRI406p5X7WmzDZO5qH1ZtcPtiBfUdDUWfochcf1xut97q30Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323938; c=relaxed/simple;
	bh=ICOg1urReFlrbqKpNdpCrFXGtC8QcWkJbyQIfD2HIMs=;
	h=Message-Id:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=MgMdw/Yta/F4GSQWTMRdek0Pm3CfdwNcHt26WRuAQiczanXzdkesABF53irF2iriwSyZoT76nH4LdRDeLFlBes6i9kdR4Uard4W2dEYbpp7LVYxLc5XycWPjl9XokhouXjsAld4AsPK9wOeqYrKX2Rs/47jstKm2L4d4A/MDqkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A2kZgLmU; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=GKPMvBRLR7vZ9BJ6H1VKy/+n8A02WSymmS041p20eEQ=; b=A2kZgLmUDe0momfuDz3nJkXmGO
	mv73I836/RYc9jtfXJMN5qEuZXVg0dOuH5+l9/DBrAqA50CS0XAca/xMPUBhtvPDLxmW8QdqjJYnO
	WcawviSnSyZwZ7zlqYVLADLt0gWU/OP3j9DtyOLy5//X4Y6PxxGOJbHrCgichHmTbnw/2C0kn4abu
	WJNKtz65OEz8FttRWx5i9jTDTOagI3Z3p6xBIYB9ujfF35n/8Ryv/GAFAMP0sIXrS6QRaaDzZqmRV
	ADWFHwB52ea8AKwwWNLZ9CnhfHcw8xuAewGLSRJyvEUC1wGOBIBpd7FoP0ykktUf40zoOhPQbI1Ak
	/4Sr3XGw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tASRT-0000000Cpw9-20Zh;
	Mon, 11 Nov 2024 11:18:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 04C73300F1A; Mon, 11 Nov 2024 12:18:47 +0100 (CET)
Message-Id: <20241111111817.244594188@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 11 Nov 2024 11:54:34 +0100
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
Subject: [RFC][PATCH 4/8] module/modpost: Use for() loop
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
 scripts/mod/modpost.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1586,12 +1586,9 @@ static void read_symbols(const char *mod
 			license = get_next_modinfo(&info, "license", license);
 		}
 
-		namespace = get_modinfo(&info, "import_ns");
-		while (namespace) {
+		for (namespace = get_modinfo(&info, "import_ns"); namespace;
+		     namespace = get_next_modinfo(&info, "import_ns", namespace))
 			add_namespace(&mod->imported_namespaces, namespace);
-			namespace = get_next_modinfo(&info, "import_ns",
-						     namespace);
-		}
 
 		if (extra_warn && !get_modinfo(&info, "description"))
 			warn("missing MODULE_DESCRIPTION() in %s\n", modname);



