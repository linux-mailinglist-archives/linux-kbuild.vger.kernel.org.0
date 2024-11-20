Return-Path: <linux-kbuild+bounces-4757-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2C9D4307
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 21:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 250171F23310
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 20:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACBF1714A3;
	Wed, 20 Nov 2024 20:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bxBLmA71";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="z+Git06c";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bxBLmA71";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="z+Git06c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD6172BD5;
	Wed, 20 Nov 2024 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732134413; cv=none; b=AkA3KgWMKQpVP3v2upeZAV0yifXdhXrxhu5BulXHad3E3TP92limGaHuIAuXHBB+Z4vZ4uQjikWh1CgA0T0a4k7EaPEVH4wkkNC63+P0lovNH7obq0qmdg3T2BAWoCxF7LuAWME28hnh4LSt/9rCo8HCf/iFBcrkOtopx4UTwsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732134413; c=relaxed/simple;
	bh=Qo9tSxCQ9AKQOnxWH4IGmkrhJtG3FTEWxUo/GQ+k7x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbYNvgcOokuNQYQJE2VTZ2ZaludiNeB+mJfW3qZteh81/LH2nWpxagGwfwCHZctuD3jER81E3hFAD8KiFTDFzXXMeJuAjzYepHhHcB/ppACf4tzxYYK11ER6hUhIi9jO9J31YTrrL2QiFrSj5yuwhy7eQipaJhQre57mltC0Ntw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bxBLmA71; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=z+Git06c; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bxBLmA71; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=z+Git06c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3FAF1F79B;
	Wed, 20 Nov 2024 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732134409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ1dB2PZEeelbar24okNqV4fa6YeYLqMSm7CaK16+pA=;
	b=bxBLmA71bJSZuSXSkRgnv9E0Vm44tfRG+gCHJhQ61Dm1DFsksSJ6QvE3bbSb7v2aXUFK23
	KfFRBxoieNAuxvZXQc9QkQzaiL2SMDKoGq7tLUq+ZVeiCEwahmtNMabFWA0yjT0gVSSyD2
	w9t5QxJvtk7FRYmL2wlsyhC4UBOWYMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732134409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ1dB2PZEeelbar24okNqV4fa6YeYLqMSm7CaK16+pA=;
	b=z+Git06ccelzLOdqQj8FDc+nmFpUI8Aux0OvVDpB4T2gTzvVbk7wTfl6cJaeCrCe0U1daQ
	oP2I12OehUKZbaAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=bxBLmA71;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=z+Git06c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732134409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ1dB2PZEeelbar24okNqV4fa6YeYLqMSm7CaK16+pA=;
	b=bxBLmA71bJSZuSXSkRgnv9E0Vm44tfRG+gCHJhQ61Dm1DFsksSJ6QvE3bbSb7v2aXUFK23
	KfFRBxoieNAuxvZXQc9QkQzaiL2SMDKoGq7tLUq+ZVeiCEwahmtNMabFWA0yjT0gVSSyD2
	w9t5QxJvtk7FRYmL2wlsyhC4UBOWYMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732134409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ1dB2PZEeelbar24okNqV4fa6YeYLqMSm7CaK16+pA=;
	b=z+Git06ccelzLOdqQj8FDc+nmFpUI8Aux0OvVDpB4T2gTzvVbk7wTfl6cJaeCrCe0U1daQ
	oP2I12OehUKZbaAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98CE913942;
	Wed, 20 Nov 2024 20:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDbIIAhGPmfIFwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:26:48 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/msm: require python3
Date: Wed, 20 Nov 2024 21:26:40 +0100
Message-ID: <20241120202640.49703-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120202640.49703-1-pvorel@suse.cz>
References: <20241120202640.49703-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F3FAF1F79B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

0fddd045f88e introduced python3 dependency, use HAVE_PYTHON3 to make it
obvious.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
* Update commit message (I'm sorry for the noise).

 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 90c68106b63b..03ea0c83f11e 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -11,6 +11,7 @@ config DRM_MSM
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
+	depends on HAVE_PYTHON3
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-- 
2.45.2


