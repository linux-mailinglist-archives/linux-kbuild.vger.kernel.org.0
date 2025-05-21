Return-Path: <linux-kbuild+bounces-7190-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB8ABEC93
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C4D3BC201
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 06:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8DA2343B6;
	Wed, 21 May 2025 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7ejPxcZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF4233739;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810786; cv=none; b=iTBfKi53b7C/zSRuNv5XPMT2doWmcf4SGDE0le7rXUaUZmxXp1bBVrNbFAfpyn55bTjwJOrLU2nJ+GcTtJ5mJTon2XD4uDx9OvkQvOLr0TKO4X2AorX6yWARzgdleJ6BNTk3lWygVl+ft73dwa2s08rlvF+wUBiKsTgdPdU56tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810786; c=relaxed/simple;
	bh=fEgVgn8ddmuG94XtJzRW64JNMVcuU+HToQCr20S4KM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKT/b7tfTFms6jXnuQhIRMPyrZbXmwUKDVGYrmztK4t37czRkcvFKryW0J9k5rc5Frq89FiPT3BODxZYKWlDE74IYH8QOoeBpCfFo/2L4BQ4aGlcdvckq+NAQna4/QIQ15Pf2EztsiTPhBJDE7MImUjgeun+w51znFNRoqcf/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7ejPxcZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C462C4AF0C;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810785;
	bh=fEgVgn8ddmuG94XtJzRW64JNMVcuU+HToQCr20S4KM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t7ejPxcZbOpZpdKCOyr9BqqdotlnlpD11PjGDqRYksgYEOKQNFp6VFaEf09JysweT
	 3JZdMk5d7MmMXRygA36/tinpeuEBrIz953zTixh2npTEr0+FiOdt1Zb74jq6SUIUHy
	 UGmhAYw44+0qCMnMHxqCpzGaPaJvrmFsE9whgj4qyKZ7AkQvhfTpW2fV2ykEw3YJZb
	 TR6QKJubMiwkK4R7V2y27xrGPPat3woG5YORMBm1BvB+Cr1GOmbKUbeG5TR1CDeQOk
	 dGBrC3xKx55YB1JgkAAbtBWQ+5fjXJzbT98akdW6TtQNqOVsTptVEq+xYb9GvmWruJ
	 /AGRqxei7vg3Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHdQV-00000006IFy-2ywJ;
	Wed, 21 May 2025 08:59:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Masahiro Yamada" <mchehab+huawei@kernel.org>,
	"Nathan Chancellor" <mchehab+huawei@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] MAINTAINERS: update linux-doc entry to cover new Python scripts
Date: Wed, 21 May 2025 08:59:31 +0200
Message-ID: <e1199a4ae39daaf191c166332ba65bb632935024.1747810691.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747810691.git.mchehab+huawei@kernel.org>
References: <cover.1747810691.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Changes to ABI and kernel-doc need to be c/c linux-doc. Update
the maintainer's entry to cover those files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..a668808769b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7173,7 +7173,10 @@ T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
 F:	scripts/check-variable-fonts.sh
 F:	scripts/documentation-file-ref-check
-F:	scripts/kernel-doc
+F:	scripts/get_abi.py
+F:	scripts/kernel-doc*
+F	scripts/lib/abi/*
+F	scripts/lib/kdoc/*
 F:	scripts/sphinx-pre-install
 X:	Documentation/ABI/
 X:	Documentation/admin-guide/media/
-- 
2.49.0


