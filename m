Return-Path: <linux-kbuild+bounces-4755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDFC9D42F6
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 21:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4861F2322A
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 20:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B881AF0A1;
	Wed, 20 Nov 2024 20:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VjbPx9I4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j9WWvi26";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VjbPx9I4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j9WWvi26"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C8170A30;
	Wed, 20 Nov 2024 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732134178; cv=none; b=G3CF47hiU6JdGA3OC4/S1zp51/ygclo29tLW+bVIk9I2MprpHiHbon9ifL0zT0CmS+iZIbwh5eQqM4G35K/zcJsye7MSJkWkcH/L6l3j7OHlrzZcboDatSDWEnU1ETKITKWhScSVN+fnlQ/wv2XNvXZetDo9DInJ87q65wtYCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732134178; c=relaxed/simple;
	bh=HqjfV4h93gv53UakE7e/dxLKfcdKeAqQHSrQUOKpVxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbujtZWAZ2qCZqNY25Bf6hHZ7V7+Iln4Sr6V7eYJ68WAZ242bCLF5snOzEZlN8gHXt+7R7NnSgmeaycNekcCpNElp7LDMNR533VKtx/ovDwv0XzriGQ6M2euJrDstXORzPtt1UvKgBLX6qvWpD43+nDUEZy92b+IrKSAon7vkUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VjbPx9I4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=j9WWvi26; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=VjbPx9I4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=j9WWvi26; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1519219C8;
	Wed, 20 Nov 2024 20:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732134174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
	b=VjbPx9I4rQUrbMZ0TAh+bLsQqrxeeXdFuraltbyG/LQKi3M3QXBmaM45CU++3LC81rXhxv
	yk2LauXm4aCsX81XiksX7o3gWMwDlwEjdOnVxmxSAh/cMTPmS9CUEkY7B+HJ2Mz2xKwJr9
	pT1la16pbnJ5m+0hvQ/25HhfAobtxDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732134174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
	b=j9WWvi26JB0prFm5+ahPFjfsyOav3aDUKdex7oXNQ3i+7xvAXmjEGO0F3bkKKVPcIER9eZ
	uGymagMQNamyBLBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732134174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
	b=VjbPx9I4rQUrbMZ0TAh+bLsQqrxeeXdFuraltbyG/LQKi3M3QXBmaM45CU++3LC81rXhxv
	yk2LauXm4aCsX81XiksX7o3gWMwDlwEjdOnVxmxSAh/cMTPmS9CUEkY7B+HJ2Mz2xKwJr9
	pT1la16pbnJ5m+0hvQ/25HhfAobtxDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732134174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
	b=j9WWvi26JB0prFm5+ahPFjfsyOav3aDUKdex7oXNQ3i+7xvAXmjEGO0F3bkKKVPcIER9eZ
	uGymagMQNamyBLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3506F13942;
	Wed, 20 Nov 2024 20:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IIufCh5FPmfvFgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:22:54 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: require python3 and xml.parsers.expat module
Date: Wed, 20 Nov 2024 21:22:42 +0100
Message-ID: <20241120202242.49131-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120202242.49131-1-pvorel@suse.cz>
References: <20241120202242.49131-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

0fddd045f88e introduced python3 dependency, require it to quick early.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* use HAVE_PYTHON3

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


