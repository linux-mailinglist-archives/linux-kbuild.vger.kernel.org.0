Return-Path: <linux-kbuild+bounces-8135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BCBB10C1E
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E4CB5A572B
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857BD2DEA8A;
	Thu, 24 Jul 2025 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqpCqpa8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5E2DEA89;
	Thu, 24 Jul 2025 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365039; cv=none; b=afM94P7crHD3lVZBV73J5ZEbs+sbkAhAFkBzrEtn/P1D8NPqWSDhBDfnU7EQR0r8FJzJrEW+H8DLnfAzB8SPsgcA4V1MfrfOc8mFAkPAdMGUkaMDBVJuZnG5SkgC9056oXr35Bshc9rc+koj3hxqzdlJZ/RwDSWr8OunA/rrG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365039; c=relaxed/simple;
	bh=iJjLNDfFc1+GOOk7iXnO04IQxxZdux2GznFTgHowxBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pitqFfH4EIzopM3wlDs0FW2tlGGSOg3F5rPhcpybmdcSTbTyGTXS1efaQynBEyfIRWEwZSTcAmvr6cDxv6UnQBKSkLH9u6P2JraDr61m4icMK0qvUkwqwrBHtbsMP2bCjz6JG/bohmXrcn89ICiOx1wvcQXF2Yj+dTeJA5o9jhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqpCqpa8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A40C4CEED;
	Thu, 24 Jul 2025 13:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365038;
	bh=iJjLNDfFc1+GOOk7iXnO04IQxxZdux2GznFTgHowxBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqpCqpa8IWuCzkJ3Alf+tjYsASPgZIrtdsqjDLkugG365FO7HHKm/9A1Y3rAKIf1I
	 mrELj6E07kyVhr5+roursPmMQeUhe0cb4TIqEEgZ7c/DT2htlkoshQ8dNKz1JleFtd
	 G4WYnENA2jclojwypGF2Wwyk4vvZbqRNVWcF3+mGd4+qvSGWlwemCBAmwTkjYJMpTH
	 krghYq51KSAHWhiu/HjnxfqxQtpog6JnwBKweo6q2kvnhJpfVoqKjuDyv2YH2bY0Fh
	 k8+HxjJ2sOVGL4X/2YWO6K8emN/kxlCPAygYV5awwPLs9zVuYUyttdJacAF2bj8+g0
	 3bJNbckxIlSoQ==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v5 10/10] s390: vmlinux.lds.S: Reorder sections
Date: Thu, 24 Jul 2025 15:49:47 +0200
Message-ID: <2860d5a5e7c6279b3836537e20b0fa0c40d2ba0f.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
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
---
 arch/s390/kernel/vmlinux.lds.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index ff1ddba96352..3f2f90e38808 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -202,6 +202,11 @@ SECTIONS
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
@@ -232,11 +237,6 @@ SECTIONS
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


