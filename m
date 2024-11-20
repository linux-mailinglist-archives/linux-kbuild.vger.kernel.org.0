Return-Path: <linux-kbuild+bounces-4759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D5C9D433A
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 21:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69EC91F221C2
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 20:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AE81BD513;
	Wed, 20 Nov 2024 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pofRjcK3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7Kp71/5v";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="pofRjcK3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7Kp71/5v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E64613BAF1;
	Wed, 20 Nov 2024 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732135298; cv=none; b=dJmqpLOhAITabuC9sMaceXdK/WWNNc6czeWnXg3cZfZYcFRN8cWNUUR50okC2UnCbLhknMnCuQvGynuT2+VmXeRyZMe2QYHeLAidhpO8v7+phYL7epUvmD6MooC255dOP9y6xvCPQghwzBVDSZLiOL+Oxy60vR28rbRtzZQeVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732135298; c=relaxed/simple;
	bh=10M9ps46N22cqgEmTZVn/Q/QIm1ehHaGIUgH5GkmPMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abmJO2cSTRoyoAmTMtH2TTmpbkcw1DrDXkuxsMX9edc/OAFx/w6YjfZk51EASiTvDesYpqRAbluO/OQ6nZDFpM8tKWiX13iEilswO5USI4WDVYlpL74ZbDBC5RFGDc9I+ilcGQDWtJaLwNGzZmACX/Z0PFpX8WH16aIAF8Zf2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pofRjcK3; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7Kp71/5v; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=pofRjcK3; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7Kp71/5v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4F226219C3;
	Wed, 20 Nov 2024 20:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732135295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGkwNipyn0toHixMbN8JudME9qeL25ztEAtZhhf3gpI=;
	b=pofRjcK3Jc8MuPaatFHBlC/Iyb0/YIrb+0BjloVTXUnBABk3M4eO0hA1UyYxrCwdOzQaL4
	pKXs3cRYX5AV5P690yNRelv+UABOTF/bNCAKH61do6ko76+T9eNwItZLK1BsvlxNqH6gay
	E/xhyiB8rC67tqEagLkeXWRExNFv8Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732135295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGkwNipyn0toHixMbN8JudME9qeL25ztEAtZhhf3gpI=;
	b=7Kp71/5v7NM85jjSXij6Jbym5/rqpZfpgeIKbAxa0N8i42iI+XV3q3BZcGPkDrb+VEFNzU
	sXd085v7eLw1ZODA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=pofRjcK3;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="7Kp71/5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1732135295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGkwNipyn0toHixMbN8JudME9qeL25ztEAtZhhf3gpI=;
	b=pofRjcK3Jc8MuPaatFHBlC/Iyb0/YIrb+0BjloVTXUnBABk3M4eO0hA1UyYxrCwdOzQaL4
	pKXs3cRYX5AV5P690yNRelv+UABOTF/bNCAKH61do6ko76+T9eNwItZLK1BsvlxNqH6gay
	E/xhyiB8rC67tqEagLkeXWRExNFv8Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1732135295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGkwNipyn0toHixMbN8JudME9qeL25ztEAtZhhf3gpI=;
	b=7Kp71/5v7NM85jjSXij6Jbym5/rqpZfpgeIKbAxa0N8i42iI+XV3q3BZcGPkDrb+VEFNzU
	sXd085v7eLw1ZODA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C426213942;
	Wed, 20 Nov 2024 20:41:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YK/bLX5JPmdiGwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:41:34 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/msm: depend on python3
Date: Wed, 20 Nov 2024 21:41:25 +0100
Message-ID: <20241120204125.52644-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120204125.52644-1-pvorel@suse.cz>
References: <20241120204125.52644-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4F226219C3
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

0fddd045f88e introduced python3 dependency, use HAVE_PYTHON3 to make it
obvious.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v3->v4:
* The same as in v3.

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


