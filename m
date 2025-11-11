Return-Path: <linux-kbuild+bounces-9565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B0FC4E176
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B6C24E0719
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4BB33122A;
	Tue, 11 Nov 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bCUvxqSK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A2LQbXUx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bCUvxqSK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A2LQbXUx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF6233AD84
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867257; cv=none; b=RyoQqQs9RGT000OkrRSUkK8zSyTBl7dzF1NXYrapYisc18n0xh6PCrR9jUv2YWgo083OJ0J6B/Kvy0AkhEqyUWwywE9L7iGwu3CmNvf9rsndl2L2M+vmrZqlJOYWCATm5O8pkioFaE2MZuk1xe64bc3vNLpKGWi37VhTf7r96S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867257; c=relaxed/simple;
	bh=O9wQ6kgg6T4VAkQZUm8qgHmtwqn2FJJzu5v7xvVr4f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgYOuX8H9UJpChC7v6iZXscYcCDxr8yxNPc4qyIMep8WLFluFT/ua7Wrat2FDZMWPKO5LtnSqqZmOGo5Lde/YiGqz/ns8F+NLc620pCvt2Bm0I74rZHpf5oRT/LlIV80XWIWB3FebEo+YJiRm/O6JpjHCOtha73KbfsWMLCmOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bCUvxqSK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A2LQbXUx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bCUvxqSK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A2LQbXUx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A149721FBA;
	Tue, 11 Nov 2025 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXIoOqWrEWT64xqTUDQGCMYbCFl9vsnccedtzyoHh/0=;
	b=bCUvxqSKiKTxYJ8xLsb0fpTSpnNz9lRzFL1lZ6O9yziKeX2V+LFAjHxkyG6hGSEyyDH0wB
	BK+oZAs3quzsDeoG3humT0tVz8uWE+Jj7cZ5ibabpIdB+niibw8egetjZrWDJ++5JikCdz
	5vD3dLXR5001LK1G5iJ8rwFdJQLFv8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXIoOqWrEWT64xqTUDQGCMYbCFl9vsnccedtzyoHh/0=;
	b=A2LQbXUxzl2z9tYraTb+QM/Nul/vWPBhHAJJTX+QjRY/ep2pT0LU1VisS0t76coOXIAYRD
	q8lzT0MWy4vg4dCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXIoOqWrEWT64xqTUDQGCMYbCFl9vsnccedtzyoHh/0=;
	b=bCUvxqSKiKTxYJ8xLsb0fpTSpnNz9lRzFL1lZ6O9yziKeX2V+LFAjHxkyG6hGSEyyDH0wB
	BK+oZAs3quzsDeoG3humT0tVz8uWE+Jj7cZ5ibabpIdB+niibw8egetjZrWDJ++5JikCdz
	5vD3dLXR5001LK1G5iJ8rwFdJQLFv8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXIoOqWrEWT64xqTUDQGCMYbCFl9vsnccedtzyoHh/0=;
	b=A2LQbXUxzl2z9tYraTb+QM/Nul/vWPBhHAJJTX+QjRY/ep2pT0LU1VisS0t76coOXIAYRD
	q8lzT0MWy4vg4dCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E71614994;
	Tue, 11 Nov 2025 13:20:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qEktDjM4E2lpWAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 11 Nov 2025 13:20:51 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 1/3] scripts: headers_install: move config_leak_ignores assignment
Date: Wed, 12 Nov 2025 00:16:20 +1100
Message-ID: <20251111132021.22809-2-ddiss@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111132021.22809-1-ddiss@suse.de>
References: <20251111132021.22809-1-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

In preparation for skipping ignored configs within the sed script
itself, rather than output post-processing.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 scripts/headers_install.sh | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 4c20c62c4faf5..d64b01806a05e 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -38,6 +38,22 @@ sed -E -e '
 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
 ' $INFILE > $TMPFILE || exit 1
 
+# The entries in the following list do not result in an error.
+# Please do not add a new entry. This list is only for existing ones.
+# The list will be reduced gradually, and deleted eventually. (hopefully)
+#
+# The format is <file-name>:<CONFIG-option> in each line.
+config_leak_ignores="
+arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
+arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
+arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
+arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
+arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
+arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
+arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
+arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
+"
+
 scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
 [ $? -gt 1 ] && exit 1
 
@@ -64,22 +80,6 @@ configs=$(sed -e '
 	d
 ' $OUTFILE)
 
-# The entries in the following list do not result in an error.
-# Please do not add a new entry. This list is only for existing ones.
-# The list will be reduced gradually, and deleted eventually. (hopefully)
-#
-# The format is <file-name>:<CONFIG-option> in each line.
-config_leak_ignores="
-arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
-arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
-arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
-arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
-"
-
 for c in $configs
 do
 	leak_error=1
-- 
2.51.0


