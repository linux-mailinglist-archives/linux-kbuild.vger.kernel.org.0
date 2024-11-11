Return-Path: <linux-kbuild+bounces-4633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207A9C3CE8
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0871F220F5
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD1F193402;
	Mon, 11 Nov 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JQWTLkn6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370E187844;
	Mon, 11 Nov 2024 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323938; cv=none; b=Pkv3okJa2i5dNCHZFhUh1XG8zALf7aWfmHnC1OtywAMZKIIzL1N1SnBJJbpt8yzsKGBiDpBPsomhzXz8HivWue5PBsVKvHVEEHJQ55TSdZb+tS+Q0LM5fTtPqMkPnR/wMYNhKK/kNZ43E3mVj9EGiqzG1pDG+WgRsCgqkYp8vXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323938; c=relaxed/simple;
	bh=LlZyfn7s6X5ZnMgdIhtpHnD2PaPvqkbq7NHeKVuGWRs=;
	h=Message-Id:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=mnAsV71BqeCva3WYImpo1BSRKFsZDgW5b/5YO6msdfnAD19k+y4EoK0FasQI5h6lroI/jABDVk4mm3lbkpE/GvdjaZVfkIQMUkvJqEMKQx4+bX3kkjPqPLwFUVxSSypBKI6C2xivFW3HXh6YmCO62I02qBrBnnbOnMSAo6QxYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JQWTLkn6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=PPoVrorGxnDtycLjsN//BVA/+ToqmOKYjcENc61e4vk=; b=JQWTLkn6bxmk/SwLRYA8YQGbqI
	Adgnu5Txb8si/+s9PAvvusk2eGZorH5LV3xHvgSfmBnJf11GX7ksmjjJCgnkUDDs22fdsmNEmvG2l
	yejcamDKU8Ig2Tki6hXVMU8Sf6zEkyw1zn2kRSxVFI6VPwSzkyijSygcjrdM8nByUEMvIrda0FnEM
	Knf6EDEFDURhnDyTwJq2T79aKOz/nzYyHHPOC5lh2z+VvS/ANB7qBz3E5jzt1xzNXROy8OIicMPBu
	pl8bHZyog6Sdra+MA3FqEpSiJHFHzVb917MSj7LVQs1yHFOUXKoXHmXrFRXThegZKfY3qD7irEkal
	uDT7DD/Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tASRT-0000000Cpw6-21qh;
	Mon, 11 Nov 2024 11:18:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id EBA8E300DDC; Mon, 11 Nov 2024 12:18:46 +0100 (CET)
Message-Id: <20241111111816.912388412@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 11 Nov 2024 11:54:31 +0100
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
Subject: [RFC][PATCH 1/8] module: Prepare for script
References: <20241111105430.575636482@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Since sed doesn't like multi-line make sure all EXPORT_SYMBOL_NS
things are a single line.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/crypto/marvell/octeontx2/otx2_cptlf.c |   12 ++++--------
 include/kunit/visibility.h                    |    3 +--
 sound/soc/codecs/tas2781-fmwlib.c             |    6 ++----
 3 files changed, 7 insertions(+), 14 deletions(-)

--- a/drivers/crypto/marvell/octeontx2/otx2_cptlf.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptlf.c
@@ -288,8 +288,7 @@ void otx2_cptlf_unregister_misc_interrup
 
 	cptlf_set_misc_intrs(lfs, false);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_misc_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_misc_interrupts, CRYPTO_DEV_OCTEONTX2_CPT);
 
 void otx2_cptlf_unregister_done_interrupts(struct otx2_cptlfs_info *lfs)
 {
@@ -308,8 +307,7 @@ void otx2_cptlf_unregister_done_interrup
 
 	cptlf_set_done_intrs(lfs, false);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_done_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_done_interrupts, CRYPTO_DEV_OCTEONTX2_CPT);
 
 static int cptlf_do_register_interrrupts(struct otx2_cptlfs_info *lfs,
 					 int lf_num, int irq_offset,
@@ -351,8 +349,7 @@ int otx2_cptlf_register_misc_interrupts(
 	otx2_cptlf_unregister_misc_interrupts(lfs);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_misc_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_misc_interrupts, CRYPTO_DEV_OCTEONTX2_CPT);
 
 int otx2_cptlf_register_done_interrupts(struct otx2_cptlfs_info *lfs)
 {
@@ -375,8 +372,7 @@ int otx2_cptlf_register_done_interrupts(
 	otx2_cptlf_unregister_done_interrupts(lfs);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_done_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_done_interrupts, CRYPTO_DEV_OCTEONTX2_CPT);
 
 void otx2_cptlf_free_irqs_affinity(struct otx2_cptlfs_info *lfs)
 {
--- a/include/kunit/visibility.h
+++ b/include/kunit/visibility.h
@@ -24,8 +24,7 @@
      * in test file in order to use symbols.
      * @symbol: the symbol identifier to export
      */
-    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
-	    EXPORTED_FOR_KUNIT_TESTING)
+    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, EXPORTED_FOR_KUNIT_TESTING)
 #else
     #define VISIBLE_IF_KUNIT static
     #define EXPORT_SYMBOL_IF_KUNIT(symbol)
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2310,8 +2310,7 @@ int tasdevice_select_tuningprm_cfg(void
 out:
 	return prog_status;
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_select_tuningprm_cfg,
-	SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_select_tuningprm_cfg, SND_SOC_TAS2781_FMWLIB);
 
 int tasdevice_prmg_load(void *context, int prm_no)
 {
@@ -2392,8 +2391,7 @@ void tasdevice_tuning_switch(void *conte
 			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch,
-	SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch, SND_SOC_TAS2781_FMWLIB);
 
 MODULE_DESCRIPTION("Texas Firmware Support");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");



