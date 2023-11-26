Return-Path: <linux-kbuild+bounces-167-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBED7F917C
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Nov 2023 06:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5DB51C20A95
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Nov 2023 05:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DB63C35;
	Sun, 26 Nov 2023 05:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nzv4qbsT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866AF23CE;
	Sun, 26 Nov 2023 05:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB308C433C8;
	Sun, 26 Nov 2023 05:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700977794;
	bh=4C/rZswEC+KNZtxPpel7E8H6NyrVNRA1dZZz67OEKKc=;
	h=From:To:Cc:Subject:Date:From;
	b=Nzv4qbsT8IWJ1LE2WTeLRQMxnAhTInR4SVQjPUCIguaiGxh0gtlsSy+AMk3FZNjRs
	 M+BI6OkkEdCBcHExl/F0kT8lZ9fs++NxBA8zcz2NuvDomcyeMhAfJqA6A17wVzk1/s
	 SnjilwSYrgRtK6txmCVW5sjUCcIXo9xtPq4RyfaVAFoH5PLny6riP2+xPXBHWOGXrJ
	 AWi338pllchscT9MOFbD4l7tZghMvdvmpMZFJjvztdJ75eGYCoxQVb7/EEdiKiu3RW
	 0KNcxNEAQTMSuDR4GSWQA9nop63rqUIzXLJQ9SbwY7DfkYPSs2lxX+C94Mu0wggyfT
	 4DlAiqebrJOLQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] export.h: remove include/asm-generic/export.h
Date: Sun, 26 Nov 2023 14:49:17 +0900
Message-Id: <20231126054917.930324-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the removal of all <asm/export.h> inclusion except tools/,
include/asm-generic/export.h is no longer needed and can be removed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/asm-generic/export.h | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 include/asm-generic/export.h

diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
deleted file mode 100644
index 570cd4da7210..000000000000
--- a/include/asm-generic/export.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_GENERIC_EXPORT_H
-#define __ASM_GENERIC_EXPORT_H
-
-/*
- * <asm/export.h> and <asm-generic/export.h> are deprecated.
- * Please include <linux/export.h> directly.
- */
-#include <linux/export.h>
-
-#endif
-- 
2.40.1


