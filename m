Return-Path: <linux-kbuild+bounces-96-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0A7F2C6F
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 12:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C48281AC8
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 11:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE8848CFB;
	Tue, 21 Nov 2023 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="x+miQ0HS";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="BAda5SCn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346C1D67
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 03:59:05 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 637731F8B8;
	Tue, 21 Nov 2023 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1700567943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7eXvRPTSxD5rBEeyAamcl0wbILQkqQ+8NbLT2XN8OY=;
	b=x+miQ0HSTVCvDaLBDMypzihhsdlcmBDCN+uX7IH9E2euxtUl1yJEiTxS+Rx9eBj9/b+qzn
	7ZIPvQ07M8AVpkz5aWR2eN2MBtWaeFFTzjrAOjesQUxGTv/oAX2xYifjOtOy3XwVvanXWx
	/N5lhaDkRvpAPQjRmJBJEvPvPbKyHb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1700567943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7eXvRPTSxD5rBEeyAamcl0wbILQkqQ+8NbLT2XN8OY=;
	b=BAda5SCnJamDd2dMI1wRrJeUv9TnV48t/UIBFuyd9OAxYbaYAjgJ/rcOfB+RjqjVdXbKUO
	FetFqJzWuSIO8ZDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7305E13A08;
	Tue, 21 Nov 2023 11:59:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iLZMFYabXGUdfgAAMHmgww
	(envelope-from <pvorel@suse.cz>); Tue, 21 Nov 2023 11:59:02 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Petr Vorel <pvorel@suse.cz>
Subject: [PATCH 2/2] kbuild: buildtar: always make modules_install
Date: Tue, 21 Nov 2023 12:58:55 +0100
Message-ID: <20231121115855.111358-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115855.111358-1-pvorel@suse.cz>
References: <20231121115855.111358-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 1.20
X-Spamd-Result: default: False [1.20 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 BAYES_HAM(-0.00)[32.67%];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,joshtriplett.org,google.com,fjasle.eu,suse.cz];
	 RCVD_COUNT_TWO(0.00)[2];
	 SUSPICIOUS_RECIPS(1.50)[]

From: Petr Vorel <petr.vorel@gmail.com>

It is done for the same reasons as 4243afdb9326 does it for builddeb:
always runs make modules to install modules.builtin* files, which are
needed for e.g. initramfs-tools or LTP testing tool.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/package/buildtar | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 8ac075dd0e9c..72c91a1b832f 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -37,11 +37,9 @@ fi
 
 
 #
-# Try to install modules
+# Install modules
 #
-if grep -q '^CONFIG_MODULES=y' include/config/auto.conf; then
-	make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
-fi
+make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
 
 
 #
-- 
2.42.0


