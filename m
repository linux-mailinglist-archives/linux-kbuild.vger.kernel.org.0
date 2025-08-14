Return-Path: <linux-kbuild+bounces-8467-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DBB26688
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 15:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 703551CC761E
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6947D302CBA;
	Thu, 14 Aug 2025 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/8BSErw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0AB2F99BF;
	Thu, 14 Aug 2025 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176905; cv=none; b=HtMm2uxfHmwyopoaS7obVsF3ZET0tPrfcyD2yoMmGi5h8UU4nyuP70iFh5JzwJZ0H1tfiBIdNDCgf+7rBjMknnz6doRbUkA/UpAyRpb6vtCi9fuCz49HnWU5OUCnI0b8IeBt60RLfOkDKrvNUGWAEP8+mEuN9NP7cvLA4SVEyoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176905; c=relaxed/simple;
	bh=jMZ5LWSabVQ7mCxQmeFMV6u0UXjP1UdNg7+VrYxFf58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3B2OYjsVMxAPwMBIeL9seUqXxihy59ERKnXrS1Hnd8pbDm7QNlXgi+KN/hpSgafNuXbXuNjadz6eISXAVvELi85zR8vKNdJh17kEHM5d77nm9GQVdQ7rcXhx+1LtJCeF9vDk8Z701Y6o0nMwmjkgp4p8WXeTQNtVo5mAnFHrt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/8BSErw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D30C4CEF6;
	Thu, 14 Aug 2025 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176905;
	bh=jMZ5LWSabVQ7mCxQmeFMV6u0UXjP1UdNg7+VrYxFf58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F/8BSErwOlzjNvXlBbW8wsUkaOv5U5m9Z6BZzeV8784rYDrphzP/rg3FjIKsH5A9q
	 5zTltUzyyiQQXW1gFmPwbd1eQD1qSZhDUT3asNKqQPBZx5RjoKFmaxTNsP9IJU7vqJ
	 mpcgiDpxeqx9viOwNnTHTKJxgEUoPVSPCkcawFGqGH4Lrb5kBKLjqYA0xhdPD00FLO
	 v/hggaOKUmGIT9Xg1m5GLasuWhmI7MRIrYvEJ426T0+zz/kft7t6QLohMMzTNCG8hK
	 JBHqAHg/km5o/pOJ8t4O9t4/JbEGLhWFvJ4tDioBkihAxRNL2w6y7kO5esc/EjN78v
	 99IDSzPfZkmxw==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v6 9/9] s390: vmlinux.lds.S: Reorder sections
Date: Thu, 14 Aug 2025 15:07:17 +0200
Message-ID: <919570dc048786c4d07affaec4b761811c6c21c5.1755170493.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755170493.git.legion@kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the sections to be placed in the default segment. The
.vmlinux.info use :NONE to override the default segment and tell the
linker to not put the section in any segment at all.

>> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' not in segment
>> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' not in segment
>> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modinfo' not in segment

Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506062053.zbkFBEnJ-lkp@intel.com/
Signed-off-by: Alexey Gladkov <legion@kernel.org>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/kernel/vmlinux.lds.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 1c606dfa595d..feecf1a6ddb4 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -209,6 +209,11 @@ SECTIONS
 	. = ALIGN(PAGE_SIZE);
 	_end = . ;
 
+	/* Debugging sections.	*/
+	STABS_DEBUG
+	DWARF_DEBUG
+	ELF_DETAILS
+
 	/*
 	 * uncompressed image info used by the decompressor
 	 * it should match struct vmlinux_info
@@ -239,11 +244,6 @@ SECTIONS
 #endif
 	} :NONE
 
-	/* Debugging sections.	*/
-	STABS_DEBUG
-	DWARF_DEBUG
-	ELF_DETAILS
-
 	/*
 	 * Make sure that the .got.plt is either completely empty or it
 	 * contains only the three reserved double words.
-- 
2.50.1


