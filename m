Return-Path: <linux-kbuild+bounces-8503-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F4B2AE9E
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 18:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A419A1B66185
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 16:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79095343D8A;
	Mon, 18 Aug 2025 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1PS4cdM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D724887E;
	Mon, 18 Aug 2025 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536280; cv=none; b=kDtaJooXuykVG9SMv3JFogOu6CGfOAg+nV69m29yoTQwUXVfNntUnVp9BzqBMR3gAtJLtWVZJJUXN4s+LIynyVcuHExNy3MT/K+V0DKXyF/ckLdXEeF/tdwjT0uHQGABwhpnTAOlvTo51EcClw07AQsAvGTnwy6b+UMBpYJbuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536280; c=relaxed/simple;
	bh=5vGJTSUjaEvnBDTbv8TULAdXPdEWtfaRtrAxLfF7gAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbL0iIvIDOZSdqmKGTaDf3OaYhTQf5iq2N/Yq9AjgTMYwfH9u9eqVketAkrIiF8cXPqR/6XsBodZ8ip8KygDUpDDq1/MdNGQ43Vmnc3MlUhOhc7/MPpJBOawtzeOdHqGZdCKAnK+13uSU5oUzuubhDyRHkm/7Onmdr1Dml76kcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1PS4cdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE393C116C6;
	Mon, 18 Aug 2025 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536279;
	bh=5vGJTSUjaEvnBDTbv8TULAdXPdEWtfaRtrAxLfF7gAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h1PS4cdMqfjxge+rwop+1FnII9IugSR9tvlMQjPEzqAIAo+VUBAaR13nslou+RB0c
	 aWlZonrIkIqoafUWK3PIbzZ+4JmuD2B2p8i8V7Nsf1eU00SK4ovh+Lz7XLvip5idfK
	 q/hsxs5ogMq7qF/cArqaMK4PHbP21JtoaqTofCu0bxT6H4LrkjjNyrMSfENN7PPyHH
	 ynDCeDlQtaKE+Za2ieXsztl/Or6gzEb5COxlYwq1o3Pj65soOHmleLWJ0K7g3Ltl/F
	 wd65sVla43G0WBcWyrJ0a9fYRB8yUeK3nsglLLj2Ls5AP/+d8OU1yAomZ+sVgnI1mH
	 rGoJB8OOPjDng==
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
Subject: [PATCH v7 1/8] s390: vmlinux.lds.S: Reorder sections
Date: Mon, 18 Aug 2025 18:54:55 +0200
Message-ID: <5530b1cff44cb47c57462874b192e4e9fbceea91.1755535876.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755535876.git.legion@kernel.org>
References: <cover.1755535876.git.legion@kernel.org>
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
2.50.1


