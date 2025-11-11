Return-Path: <linux-kbuild+bounces-9567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C8C4E179
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A15623A9B92
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27037331233;
	Tue, 11 Nov 2025 13:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="onk1ckgC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7G7TVJeQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dQPDImZP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SpJPMvar"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056A328240
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867312; cv=none; b=GsbOhlVIuarJurHLVDzFDtsESfdn9ECM82U7ICL0w5LY8cA5ihEMmbIpIDvJr9bKQeLgpU/JammscCe8bmlhHUhemEoS0pVvBkYoelJUJxQnxSdQKQklOaPUtgpO9F9I/5ki2r1jtzJcwcA3Efvpstu7Mgj6cFejGuWCVO1De2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867312; c=relaxed/simple;
	bh=KkcjO/Ib7hWnLoPFiiIYyW4Pl1DsNwcrwrN7Fo8Hm5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5zgQdEjTX4dwg/525ELC7D6yFwZue72kDfCxWCVr36BRF8IiPf318JN254p1OePZ4rdCVpZWrSd2nWyNvLNx2Eb3oCCvKnPbEAnzjfZacmhgLSapm4C0lAV8RXHBIIOD30YGSbV4y8EPfd8p2UEOem8e3d8Mv/Q38oZHh653Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=onk1ckgC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7G7TVJeQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dQPDImZP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SpJPMvar; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D8BB421BBF;
	Tue, 11 Nov 2025 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TL58F392m7uKtzMZMVX8vTraKpV+dIFXXAX3kvUtM4g=;
	b=onk1ckgCZ1PV1XR5pYl3QV/67OBdnFc8ldkMq+SHGjEZeD6cBKA15w4+tbxQt3gHmYrdoN
	yTXZUcBVODNXxr+KiRO86DLlLBlXkt4ZdPsKjyDu1Dt6hD0VE/cTjx5UVDKtVdO+bz9+8R
	fxZn0E/2/AN6HxJa4RV6pSDAmZ/xBLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867308;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TL58F392m7uKtzMZMVX8vTraKpV+dIFXXAX3kvUtM4g=;
	b=7G7TVJeQ3gkuR2G/lR9ZrM04L2413HFBy6zu3eHhd0lCDOG98J62aFuUJfy+j9e5W8ovDB
	dMepBlUEp6XAejAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dQPDImZP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SpJPMvar
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762867307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TL58F392m7uKtzMZMVX8vTraKpV+dIFXXAX3kvUtM4g=;
	b=dQPDImZP9nXFY35ZFV4BQLCgQ5myWVz2fc1UbSYeVEPmHwFo/Z+VcLwkO+CujpVdLFNiqM
	WVb/yZX9QNTIpFfff3/34/ZU6dhhGWE5NONvUXl+UuRfl9W69xi9YaT+eepOeSZ5xQ4qXi
	mUE7mJEfMP3vdUilAld3nefx9/6Bs/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762867307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TL58F392m7uKtzMZMVX8vTraKpV+dIFXXAX3kvUtM4g=;
	b=SpJPMvar4WIfFEuc+aPb5OLrIU6s/2kDgw2XmQTHgLsvsrqnvtsvuCdA3RI14ezRhubpSp
	kMF/gTz3GZtsK2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB88514995;
	Tue, 11 Nov 2025 13:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4AEtGWo4E2lpWAAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 11 Nov 2025 13:21:46 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: David Disseldorp <ddiss@suse.de>
Subject: [RFC PATCH 3/3] scripts: headers_install: avoid license check fork
Date: Wed, 12 Nov 2025 00:16:22 +1100
Message-ID: <20251111132021.22809-4-ddiss@suse.de>
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
X-Rspamd-Queue-Id: D8BB421BBF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

headers_install runs a sed script to check that any GPL variant
SPDX-License-Identifier line carries a "WITH Linux-syscall-note".
A subsequent sed invocation then handles removal of a few things that
aren't desired in installed headers (e.g. __attribute_const__).

Combine these two sed scripts to avoid re-processing the same file.
License check errors, as opposed to write errors, are indicated via a
special sed exit status of 9.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 scripts/headers_install.sh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index f46e91aa416cf..7dbb8eb6f0a0b 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -23,20 +23,25 @@ TMPFILE=$OUTFILE.tmp
 
 trap 'rm -f $OUTFILE $TMPFILE' EXIT
 
-# SPDX-License-Identifier with GPL variants must have "WITH Linux-syscall-note"
-if [ -n "$(sed -n -e "/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/!p}" $INFILE)" ]; then
-	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
-	exit 1
-fi
-
+# returns 9 if GPL SPDX-License-Identifier omits "WITH Linux-syscall-note"
 sed -E -e '
+	/SPDX-License-Identifier:.*GPL-/{/WITH Linux-syscall-note/! Q9}
 	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
 	s/__attribute_const__([[:space:]]|$)/\1/g
 	s@^#include <linux/compiler.h>@@
 	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
 	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
-' $INFILE > $TMPFILE || exit 1
+' $INFILE > $TMPFILE
+case $? in
+9)
+	echo "error: $INFILE: missing \"WITH Linux-syscall-note\" for SPDX-License-Identifier" >&2
+	exit 1
+	;;
+1)
+	exit 1
+	;;
+esac
 
 # The entries in the following list do not result in an error.
 # Please do not add a new entry. This list is only for existing ones.
-- 
2.51.0


