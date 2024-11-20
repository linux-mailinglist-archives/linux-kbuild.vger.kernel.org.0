Return-Path: <linux-kbuild+bounces-4751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA759D3F5A
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 16:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B4D12846EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 15:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DED13B5B3;
	Wed, 20 Nov 2024 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="E8rYxIAM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DigfWKYZ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="E8rYxIAM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="DigfWKYZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BA513BAEE;
	Wed, 20 Nov 2024 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732117771; cv=none; b=q9jlsea2uGBjLpglm9J3xkpNe9DUZ4vYjb6m2gy6eZvtAApWMpzCvSrQKhNkkjVXq5OTHQtJwVxBmjztU0Fi/an8ZjA0UjJTuPykrNWgSFopl/OUrYz7O9jWsAnV9NeXlKyzL8H4THeJDRe6N7L3TTIRdP1CzCfoNr/nRWxMu3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732117771; c=relaxed/simple;
	bh=oLCRB1JtkiQ0+qmqdsV09QYydHkWi30cvgPRLrUHVT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIgxHr7ow4P4P1WJihLcRG4jYH5RmWUJXhMg7Z8pL5G2A5/gfJp67PWSVynsicZF4j8KuHTSKnDNLIrDnqShwP3MIeidCwYCS0oNxaSButFZDbewoySiMkuxOq7VTF0CcTwxtDY5ZSUEt2yIZ0Aa7X1w9oxZZYufActnjGQKeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=E8rYxIAM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=DigfWKYZ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=E8rYxIAM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=DigfWKYZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC4D7211D7;
	Wed, 20 Nov 2024 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732117767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
	b=E8rYxIAMrCCxvfVPy7qYYwHg37yNshTpZWzKYkIYiCJiMHDtuOgciGF30kylmRGl4FPgha
	37d45Z0M1QyAZ+Bg+iOVbdM1iPBnYT1qW6PW00FoInpjC8bRc3kFcGrLM8ya1cljnBKhpF
	vKYEQq5DhwNY4StGTqVWCYsOZ/4hOqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732117767;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
	b=DigfWKYZNJUi43jog02pGeKbgezxBHqHYbmhJdp8OCK5HaKbl69dyUT3c+nqYVWE+YSDgQ
	7+W1BLgRbe3nTbCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=E8rYxIAM;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=DigfWKYZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732117767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
	b=E8rYxIAMrCCxvfVPy7qYYwHg37yNshTpZWzKYkIYiCJiMHDtuOgciGF30kylmRGl4FPgha
	37d45Z0M1QyAZ+Bg+iOVbdM1iPBnYT1qW6PW00FoInpjC8bRc3kFcGrLM8ya1cljnBKhpF
	vKYEQq5DhwNY4StGTqVWCYsOZ/4hOqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732117767;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R/vAdDCZ7AeI7ZWvAk/xK249zyMaEemAZqVttREVMeI=;
	b=DigfWKYZNJUi43jog02pGeKbgezxBHqHYbmhJdp8OCK5HaKbl69dyUT3c+nqYVWE+YSDgQ
	7+W1BLgRbe3nTbCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 098B713297;
	Wed, 20 Nov 2024 15:49:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dEf7AAcFPmc4SgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 15:49:27 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [RFC][PATCH 1/1] drm/msm: require python3 and xml.parsers.expat module
Date: Wed, 20 Nov 2024 16:49:19 +0100
Message-ID: <20241120154919.814593-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AC4D7211D7
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

0fddd045f88e introduced python3 dependency, require it to quick early.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

RFC because I'm not sure if previous failed build wasn't better:

	GENHDR  drivers/gpu/drm/msm/generated/a2xx.xml.h
	/bin/sh: python3: not found

This way it's documented, but CONFIG_DRM_MSM just silently disappears
from .config. Also because depends on $(success ..) is not evaluated
(understand, some expressions can be really long) one see only:
Depends on: n [=n].

I was thinking about testing via $(PYTHON3) -m "xml.parsers.expat",
but because expat parser (and other modules) should be part the official
python3 and are installed even on minimal python3 installations (e.g.
python3-minimal on Debian). Therefore depending on "$(PYTHON3) -V"
should be enough.

Kind regards,
Petr

 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 90c68106b63b..2cf4573a2ff1 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -11,6 +11,7 @@ config DRM_MSM
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
+	depends on $(success,$(PYTHON3) -V)
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
@@ -36,7 +37,7 @@ config DRM_MSM
 	select PM_GENERIC_DOMAINS
 	select TRACE_GPU_MEM
 	help
-	  DRM/KMS driver for MSM/snapdragon.
+	  DRM/KMS driver for MSM/snapdragon.  Requires python3.
 
 config DRM_MSM_GPU_STATE
 	bool
-- 
2.47.0


