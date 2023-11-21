Return-Path: <linux-kbuild+bounces-95-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3947F2C70
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 12:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F38CB20F7E
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD9348CE3;
	Tue, 21 Nov 2023 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="om0plaBM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="EsrcFPaA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78291BF7
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 03:59:03 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3FD021F8B4;
	Tue, 21 Nov 2023 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1700567942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z3V5GkOCHsdxvzcozrlNWqOM1FfiWC7Sm8/cbUlYFa4=;
	b=om0plaBMg2Y1qnkvGsTkW7HSm85MScy05gh+fMIqsl697ntF0561ElHl+hlAVkbnWcqf7d
	E26adoZEWkeJ/IkHNVwB6fcDBtKEL8Q4D09TA7FGnqfOP8So1DzCZIECQUOilm3KPWzq8y
	T338pCsux+ghS9+jLZb3LcjqLdx1lWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1700567942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z3V5GkOCHsdxvzcozrlNWqOM1FfiWC7Sm8/cbUlYFa4=;
	b=EsrcFPaAHMGNxF3V+t/1xkCQbg9LJmm149471XNigBF5aJX0T9xO9rWB2k58u5FGRWDVJs
	bNQMFi9hmL13Q1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31520138E3;
	Tue, 21 Nov 2023 11:59:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Nqm3CIWbXGUdfgAAMHmgww
	(envelope-from <pvorel@suse.cz>); Tue, 21 Nov 2023 11:59:01 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/2] kbuild: builddeb: Remove unused $dirs
Date: Tue, 21 Nov 2023 12:58:54 +0100
Message-ID: <20231121115855.111358-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 4.72
X-Spamd-Result: default: False [4.72 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SUBJECT_HAS_CURRENCY(1.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-0.88)[-0.878];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.10)[65.44%]

Fixes: 1fc9095846cc ("kbuild: tar-pkg: use tar rules in scripts/Makefile.package")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/package/buildtar | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 65b4ea502962..8ac075dd0e9c 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -23,7 +23,6 @@ tmpdir=$1
 #
 rm -rf -- "${tmpdir}"
 mkdir -p -- "${tmpdir}/boot"
-dirs=boot
 
 
 #
@@ -42,7 +41,6 @@ fi
 #
 if grep -q '^CONFIG_MODULES=y' include/config/auto.conf; then
 	make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
-	dirs="$dirs lib"
 fi
 
 
-- 
2.42.0


