Return-Path: <linux-kbuild+bounces-9442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E68C41477
	for <lists+linux-kbuild@lfdr.de>; Fri, 07 Nov 2025 19:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 519C334ECB9
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Nov 2025 18:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA414339701;
	Fri,  7 Nov 2025 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LVjdLEc1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXDboKf7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LVjdLEc1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXDboKf7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0051732D7E0
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Nov 2025 18:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762540178; cv=none; b=hlL0gzKjnoTgxv+OvapVguf2qFJIs6Lv/26uH78vSmk6Ig+38d450xlRtEENoLNaxoH/TTAs3V7tTTHoFmy03Vk4IWt1dB5fvzRsB3zt7yrmM6cdYmBhSPfBPr6YjVOKEQl4l/3J+fxTSanZQuG2VGWKxrPKzLSZGgG4wGMCHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762540178; c=relaxed/simple;
	bh=qB6xyUP2wdiwHKhQ2MHGKd4NBaCwP55CwH78gbNOjpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QWxvN/I6vqH9WtaDq0YfzamWyHayiySjca/+/yqpCF4+yqFtiDBkEiFpTWXLNeHFu3iyTASMWB3gSGjMpcvv6cjNOV731eMcvugRs/anoJrQUQ3kATaLJmJG+7nxIbCdZcngSakJQbIHrp+AXU5jg49/H9a9J3ubzsXiuRFeCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LVjdLEc1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXDboKf7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LVjdLEc1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXDboKf7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 09BBB200CC;
	Fri,  7 Nov 2025 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762540175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ozDTAvOvcTHNvqKS2YCPtDCBrNu0c6u+t88YIYzfkHg=;
	b=LVjdLEc1PBTLye62KT3CKoa8ZPxRUqTBP/N99YkOe9fyH0ti3qUNY2VB/cx0v49PPsfJdf
	6wVQIPmeaJalnGdQiaIgKVhPNfrgbzCuT/oJbKc4lCCnr0qTzw+Va3cp9avsJxPOlPk5l1
	KCYhv/1rO5cd6yR5ClsDxwoRDZ/2DQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762540175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ozDTAvOvcTHNvqKS2YCPtDCBrNu0c6u+t88YIYzfkHg=;
	b=nXDboKf75i79kQAEpDCCUUMaLvZUqIX3NLDmm8hlo2ntCiVrEWKCuiU1SEdBs+MtqE5p+H
	aAT0y/KPVAwUNJCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762540175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ozDTAvOvcTHNvqKS2YCPtDCBrNu0c6u+t88YIYzfkHg=;
	b=LVjdLEc1PBTLye62KT3CKoa8ZPxRUqTBP/N99YkOe9fyH0ti3qUNY2VB/cx0v49PPsfJdf
	6wVQIPmeaJalnGdQiaIgKVhPNfrgbzCuT/oJbKc4lCCnr0qTzw+Va3cp9avsJxPOlPk5l1
	KCYhv/1rO5cd6yR5ClsDxwoRDZ/2DQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762540175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ozDTAvOvcTHNvqKS2YCPtDCBrNu0c6u+t88YIYzfkHg=;
	b=nXDboKf75i79kQAEpDCCUUMaLvZUqIX3NLDmm8hlo2ntCiVrEWKCuiU1SEdBs+MtqE5p+H
	aAT0y/KPVAwUNJCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C75AA13A60;
	Fri,  7 Nov 2025 18:29:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Uh+lLo46DmkBHAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 07 Nov 2025 18:29:34 +0000
Date: Fri, 7 Nov 2025 19:29:33 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: [PATCH v2] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251107192933.2bfe9e57@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[huawei];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 

It is possible to force a specific version of python to be used when
building the kernel by passing PYTHON3= on the make command line.
However kernel-doc.py is currently called with python3 hard-coded and
thus ignores this setting.

Use $(PYTHON3) to run $(KERNELDOC) so that the desired version of
python is used.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Changes in v2:
 * Leave KERNELDOC alone and patch the calling sites instead.

 drivers/gpu/drm/Makefile      |    2 +-
 drivers/gpu/drm/i915/Makefile |    2 +-
 include/drm/Makefile          |    2 +-
 scripts/Makefile.build        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

--- linux-6.17.orig/drivers/gpu/drm/Makefile
+++ linux-6.17/drivers/gpu/drm/Makefile
@@ -244,7 +244,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		 PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
--- linux-6.17.orig/drivers/gpu/drm/i915/Makefile
+++ linux-6.17/drivers/gpu/drm/i915/Makefile
@@ -411,7 +411,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmg
 #
 # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
 ifdef CONFIG_DRM_I915_WERROR
-    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none -Werror $<
+    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none -Werror $<
 endif
 
 # header test
--- linux-6.17.orig/include/drm/Makefile
+++ linux-6.17/include/drm/Makefile
@@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
+		PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
--- linux-6.17.orig/scripts/Makefile.build
+++ linux-6.17/scripts/Makefile.build
@@ -167,7 +167,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
 endif
 
 ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(KDOCFLAGS) \
+  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
         $<
 endif


-- 
Jean Delvare
SUSE L3 Support

