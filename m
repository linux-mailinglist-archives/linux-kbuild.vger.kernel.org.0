Return-Path: <linux-kbuild+bounces-8848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A9B83727
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 10:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDDA72A67FA
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 08:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CF92F4A00;
	Thu, 18 Sep 2025 08:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6OYvoxL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7482F3C3D;
	Thu, 18 Sep 2025 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182820; cv=none; b=G5JHmFaZFLDZRPw+eyXeg0EUy87eXUUBKU9zPLR+t+IQ3Lua1Xpx+PxfEHsVI2BgzFuPLzc0dQGO3fOrENnS/6Z8wnZmvdkQ+on0iYuT18shy99r3/GJgQWSMvqtSadju7TefEdgUUHw5alRYtTy3sEC1G4b8+Pw9rzr+IGLaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182820; c=relaxed/simple;
	bh=d4f0cPYdTF+9RjWHiMGJtE229ZsE/AIhHwl1ldYrtbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7rKRoxgWRgpI4loPy5fxw/0IB1+klIBn3G5s24GUM8NV08488YOKPR1a/tLa1jafE/NyNE9u5IEbM/2Bd9f4zXOvNfVMI8JxVep8tAAMsXlrIKQIonFBD8VAHTGp3oEFGGwljx6WAdwKv2LWNvH3jhFc39+lcOGtDI7gt576tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6OYvoxL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C7AC4CEF7;
	Thu, 18 Sep 2025 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758182819;
	bh=d4f0cPYdTF+9RjWHiMGJtE229ZsE/AIhHwl1ldYrtbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f6OYvoxLO7Um33DAN3cK3Lg6PPqS6u035GYnbXK+QX6032X+G2+3DpKC+cWNSiE7T
	 fNbl4ZBV+enhynfuxxMVCGcO4O4Nt4NPiQwzA0MnXrNTfETc4i+8cbba0eZwxvR58e
	 ZHOJtOSGJbASyyPgpOK3MwEGaU6B0i2nPOoqjD8BVAYVnn3Bk2Xm9qgnaYOGFKxV5b
	 qcaVoAA+VOyjugwcAOmgE8EyCq8p24Be2f2qNAbalixwzv57XHM0BRW4qMcJyeQewp
	 tES4jY/ztS2uStk96Ys8YmMUfzP0yba2KFjpk8sDIxqhLAfYW1TQdwHUFklp0VzrjS
	 EQdQ8hXVBRo7A==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
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
Subject: [PATCH v8 1/8] s390: vmlinux.lds.S: Reorder sections
Date: Thu, 18 Sep 2025 10:05:45 +0200
Message-ID: <20d40a7a3a053ba06a54155e777dcde7fdada1db.1758182101.git.legion@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758182101.git.legion@kernel.org>
References: <cover.1758182101.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the upcoming changes, the ELF_DETAILS macro will be extended with
the ".modinfo" section, which will cause an error:

>> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' not in segment
>> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' not in segment
>> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modinfo' not in segment

This happens because the .vmlinux.info use :NONE to override the default
segment and tell the linker to not put the section in any segment at all.

To avoid this, we need to change the sections order that will be placed
in the default segment.

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
index 1c606dfa595d8..feecf1a6ddb44 100644
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
2.51.0


