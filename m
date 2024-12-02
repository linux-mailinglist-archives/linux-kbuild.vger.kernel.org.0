Return-Path: <linux-kbuild+bounces-4928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB739E06F8
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 378931767E4
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73457209F4C;
	Mon,  2 Dec 2024 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T78QLsDK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54426205AD0;
	Mon,  2 Dec 2024 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152298; cv=none; b=knBedDh+GbC+zOCsq9ch7tX6iMqXj17SSeY41iIuMF8fBZuFR3+xaWaFCTTfgCqmL6kuxxTFH8OWf5RHQJ62Y4V4YgCadF/j5En2ETF1GoTl43oQIGXX8zJ+Tg9c2N5N+60eQvY3mr3FKNYDopCKGdIqXAtDXxdpELrLPFBnmis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152298; c=relaxed/simple;
	bh=ICOg1urReFlrbqKpNdpCrFXGtC8QcWkJbyQIfD2HIMs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=uPFpDtul9GQF94uWFMnvJojp8vsFwGlQHdMdRczRlrRP8pUa2i/DY467RCr5MQxO707KC9S26JWe+3AWDQ97xG3xVXoxnMOxp+p129WB4wwx3Q3fR8xHn4pml+uWhR/8qM8si2gaMif4YJ9MPiFV9HJkxl4mu8SFt1Lm7nd1JKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T78QLsDK; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=GKPMvBRLR7vZ9BJ6H1VKy/+n8A02WSymmS041p20eEQ=; b=T78QLsDKTNaT6kqrSjSnU/FuAQ
	TJIXiXgOHX3AzgSl6S/dP1Eh5NI2fMG8dFbgOcypnjXai/+ZL/90CzQzvksEl3hCeXhH++4+svoMV
	DPXYE4Di4SEscn9LWEHfyA7K+m63qEFtpVSRGGBLtK0O/EjRfE/UD/d+eafidt7Ki4aOswR6vIgtB
	rt0fBxZc+ZsmILC8vSwWF634WUiCm63N8TxCXqkP9THPyqqkY/KMo02HmujrcCsdqw9VUOJmIAbAO
	lr/PZy2HIT9E7LMfn/SwJRSEyGRYt/AThRQ4bgT837QlGVpHuacJqJ22sFz7N6CuaA55xA8tg8Ngn
	RU6RIAWQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI85A-00000002Bkk-2ZJV;
	Mon, 02 Dec 2024 15:11:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id C2B6F3006F1; Mon,  2 Dec 2024 16:11:27 +0100 (CET)
Message-ID: <20241202150810.160972089@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Dec 2024 15:59:48 +0100
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
Subject: [PATCH -v2 2/7] module/modpost: Use for() loop
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



