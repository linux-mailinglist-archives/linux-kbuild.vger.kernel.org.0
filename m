Return-Path: <linux-kbuild+bounces-6747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624BA9D759
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 05:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3B274E02A6
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 03:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F0B1FFC7B;
	Sat, 26 Apr 2025 03:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mDVsKtt8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44515A864;
	Sat, 26 Apr 2025 03:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745636901; cv=none; b=PV750KJHGCLpvCCBLDI3EK+2BDiEleoayvgPGILQVnOBFnhaXzyCn5Jg1807sLt1YOgWllgnxZPYnJw1fSbV+nq1f5lOpF1nJoKSAVZfzxlfehhEKl66yo72Bo8kY0PZR5f/2n50vFGYrTaUyEYJIhm9noIa77xSjm9UPyBeKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745636901; c=relaxed/simple;
	bh=CGjzNzdzKFH4Gj78+YzgzHjCFj1v8rlnNrxy08JXJnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rk1rTjyP6/MlNac3QtpFyGQiSTbLyUWun2xN446dk4wafN5feeR8r7HmeIaF8tL9OJSgUWzpiXHNcfjX4dIZ4uRHX0HJIKQ8nWo0otbzq6A8McbWEk+ZWryOqaa44qsuXOZfTQnEubLMmn5pVDU7PcFoETvckUWpIxxoqZsYNWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mDVsKtt8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZGMWlj6kL1jQK9ZM4giUmGu7K0/eNr6oYtoajS8KpC4=; b=mDVsKtt8f9/bOaEWDwJznrphwP
	rPDvbShA1Gojf9Zs0hs2pjIez+fY4n3zlezFHXcoTz8xw0fYkg0UntTRFaNu1H1ahgJ/dNLNVGpYg
	M+BmpD7r74EEc57wWo/7VEIkMdrqXd6h7SgvtjUBwhscBYdPoq21ho0qbQ47cOMz2w4/vjjeUn6wh
	jhzff9lnWpj4tpz61qc36unRNHhr56UWq00Rlb8pArWp2KNup0ZDfRGTGSvmp3wDclnL0lXTi5WoP
	m9w42UfcQjta7uUUFmczFmQiBYWu+RA0t0ytFOAraFBI6eN3bgy35dZYizyEYnJU04sHO/ZQ4Y8kI
	IDFdtwrA==;
Received: from [50.39.124.201] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Vto-00000001LYF-0EYl;
	Sat, 26 Apr 2025 03:08:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-openrisc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
Date: Fri, 25 Apr 2025 20:08:15 -0700
Message-ID: <20250426030815.1310875-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
bpf_perf_event.h for arch/openrisc/.

Fixes a build error:
usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: linux-openrisc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
---
 usr/include/Makefile |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20250424.orig/usr/include/Makefile
+++ linux-next-20250424/usr/include/Makefile
@@ -59,6 +59,10 @@ ifeq ($(SRCARCH),arc)
 no-header-test += linux/bpf_perf_event.h
 endif
 
+ifeq ($(SRCARCH),openrisc)
+no-header-test += linux/bpf_perf_event.h
+endif
+
 ifeq ($(SRCARCH),powerpc)
 no-header-test += linux/bpf_perf_event.h
 endif

