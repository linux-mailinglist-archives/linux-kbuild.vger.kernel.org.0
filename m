Return-Path: <linux-kbuild+bounces-6698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40748A94067
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Apr 2025 01:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 682A3464A43
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Apr 2025 23:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72683255249;
	Fri, 18 Apr 2025 23:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YI2Noohm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA92528EA;
	Fri, 18 Apr 2025 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020227; cv=none; b=Dty6OveeCDGRAgy1Mx8GqPaMHQnzOhRKwezjI2FExetFYYLIwGwA7jj/J+KZyHeGGTILUS7YuOEZyMnIfcfdhOhJVKm5QXKGVtgUImTcTP/VNs2Ob4dvoAMIozH5SUNU7XQ1AmRdtal5j8oDbD2S5MdZAVkiHvuJI0kNj+OTpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020227; c=relaxed/simple;
	bh=Ofscr60/Y5Fglh+wII5NC+EB3e5EfN/93gqkctEjTUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSJGFA5hjyeXlcdQqtk+hDQzNB5A6rN202PrRMgmYmRSObOT5cmBsCCbDmUZvSuxK9Wi8qcGY3ftpYJocOCMiCS17VryCryJW+lHqbKQMPZwIeH6+nin4vcuVTqG9lsNnuO9MTEOC3EmqLd81w8VaHLAhy7LDWM3n7u9SVEE3F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YI2Noohm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE319C4CEED;
	Fri, 18 Apr 2025 23:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745020226;
	bh=Ofscr60/Y5Fglh+wII5NC+EB3e5EfN/93gqkctEjTUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YI2NoohmphZn+eyg9XNFY9xVnBZezOQFdBbylo3sJVkIFC548170HVsDs2NBBZcd5
	 DOPMZLIYKq+a3AAiyhRAhsfp9IzoPdBU1P1oqMEg+trXHzjBMqblR6mJNOX4jMnWQY
	 wQPVL3OqTsB8hLg547BVMjsGaA0DMTfK5JGC31KChbPpzhsckNMQpWAvMZPwCyafHL
	 Wtka1QJ+wpJqfm9718DTpBLNdUj1DrypUF+gsQaesn43ibH7tZoFVVAXAJ4Y3eSyzN
	 PvgsmwEmDvG1Sp0UdF4BKuIN15sdHGqmmlq1JZlI22X4MqEgluufYO+Pi2nHLx+RAi
	 kUesBVeRDIvww==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u5vTL-00000003KFB-3HQK;
	Sat, 19 Apr 2025 07:50:15 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] Makefile: move KERNELDOC macro to the main Makefile
Date: Sat, 19 Apr 2025 07:50:03 +0800
Message-ID: <ba2fcdbc21e7d83586f9d010da222308abb910ce.1745019660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745019660.git.mchehab+huawei@kernel.org>
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

As kernel-doc script is used not only on Documentation, but
also on scripts and drivers/drm Makefiles, move it to the
main makefile, as otherwise sub-makefiles may not have it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile | 1 -
 Makefile               | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index a006c7681412..8c1f6a3dfc44 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -60,7 +60,6 @@ endif #HAVE_LATEXMK
 # Internal variables.
 PAPEROPT_a4     = -D latex_paper_size=a4
 PAPEROPT_letter = -D latex_paper_size=letter
-KERNELDOC       = $(srctree)/scripts/kernel-doc.py
 ALLSPHINXOPTS   = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
 ALLSPHINXOPTS   += $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
 ifneq ($(wildcard $(srctree)/.config),)
diff --git a/Makefile b/Makefile
index 38689a0c3605..2a05988740a9 100644
--- a/Makefile
+++ b/Makefile
@@ -458,6 +458,11 @@ endif
 HOSTRUSTC = rustc
 HOSTPKG_CONFIG	= pkg-config
 
+# the KERNELDOC macro needs to be exported, as scripts/Makefile.build
+# has a logic to call it
+KERNELDOC       = $(srctree)/scripts/kernel-doc.py
+export KERNELDOC
+
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
 			 -O2 -fomit-frame-pointer -std=gnu11
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
-- 
2.49.0


