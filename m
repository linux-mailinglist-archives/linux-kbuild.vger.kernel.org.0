Return-Path: <linux-kbuild+bounces-2636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048393AE06
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 10:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED30D1F23EF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 08:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384A973471;
	Wed, 24 Jul 2024 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0gzZXmFv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/s6Xlx2B";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="0gzZXmFv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/s6Xlx2B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5051C2AD
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jul 2024 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721810829; cv=none; b=FTfS9GA8XWfsKgV0buvrp01zvo54b1tH4NtC2LlGKHXzpkrTNnthJyA1XXW09jaSjmc742XHr3cx3RAmgSpiSsHIQm2lIbIpnTyDlPVlw+q6PMFDVGJYssmPKM2R55boOCZlRHM0d4iY8nGlrl2zOxBJiVfIMpMFdfLlwIw0DfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721810829; c=relaxed/simple;
	bh=KLWKsNRpbkd9ErqNttPQWHZbIolpFwOe9rA5uEbNTBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rp6usBrsGmpXuDfdQLZWc3Jytm3ltz5pm6QCd8I4oLFX6uwxZKfKm9NEMhd41GwpfLaj3olrHSH6bLA1UABgAW9zUZF1VHaILpflMIeH3L5Ydln7BeaGoeUKncjblZJy7idiFb0MQMdO1JkWQP2ZuE9A3FoYhqH26L2NycPRjMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0gzZXmFv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/s6Xlx2B; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=0gzZXmFv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/s6Xlx2B; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A9DA1F788;
	Wed, 24 Jul 2024 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721810825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SyEDGvf0mlFr/AfWtc1nmENVda4SMmlHet45VLaHkrM=;
	b=0gzZXmFvlAVaJERBhxw6VJtthauTj2NhPpC0bTBdb+0H2WYdR8O9YjEP2AMEfesNVXbSv/
	qTMEZw+zVGF1bEe6B8uLi170MTd0AfOwBOQiGPZ7TQ8lrExzDkU+Pg22NUvAOBXrPOwRi/
	J0CrO2Dpqcsa7shj1xYO/Kg6z8WHuiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721810825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SyEDGvf0mlFr/AfWtc1nmENVda4SMmlHet45VLaHkrM=;
	b=/s6Xlx2BRkw0KPlRyaYHBdUfG+Q9GVgxbY68FH7zNICNwVUGrh54Eq9ARe8KH+8qJTJSRX
	n+g49uAdU98MYLAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721810825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SyEDGvf0mlFr/AfWtc1nmENVda4SMmlHet45VLaHkrM=;
	b=0gzZXmFvlAVaJERBhxw6VJtthauTj2NhPpC0bTBdb+0H2WYdR8O9YjEP2AMEfesNVXbSv/
	qTMEZw+zVGF1bEe6B8uLi170MTd0AfOwBOQiGPZ7TQ8lrExzDkU+Pg22NUvAOBXrPOwRi/
	J0CrO2Dpqcsa7shj1xYO/Kg6z8WHuiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721810825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SyEDGvf0mlFr/AfWtc1nmENVda4SMmlHet45VLaHkrM=;
	b=/s6Xlx2BRkw0KPlRyaYHBdUfG+Q9GVgxbY68FH7zNICNwVUGrh54Eq9ARe8KH+8qJTJSRX
	n+g49uAdU98MYLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 223B51324F;
	Wed, 24 Jul 2024 08:47:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZtpyB4m/oGZATQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 24 Jul 2024 08:47:05 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Rafael Aquini <aquini@redhat.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: rpm-pkg: Fix C locale setup
Date: Wed, 24 Jul 2024 10:46:55 +0200
Message-ID: <20240724084655.930706-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.10 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4]
X-Spam-Flag: NO
X-Spam-Score: -0.10

semicolon separation in LC_ALL is wrong. Either variable needs to be
exported before as a separate commit or set as part of the commit in the
beginning. Used second variant.

This fixes broken build on user's locale setup which makes 'date' binary
to produce invalid characters in rpm changelog (e.g. cs_CZ.UTF-8 'čec'):

$ make binrpm-pkg
  GEN     rpmbuild/SPECS/kernel.spec
rpmbuild -bb rpmbuild/SPECS/kernel.spec --define='_topdirlinux/rpmbuild' \
    --target x86_64-linux --build-in-place --noprep --define='_smp_mflags \
    %{nil}' $(rpm -q rpm >/dev/null 2>&1 || echo --nodeps)
Building target platforms: x86_64-linux
Building for target x86_64-linux
error: bad date in %changelog: St čec 24 2024 user <user@somehost>
make[2]: *** [scripts/Makefile.package:71: binrpm-pkg] Error 1
make[1]: *** [linux/Makefile:1546: binrpm-pkg] Error 2
make: *** [Makefile:224: __sub-make] Error 2

Fixes: 301c10908e42 ("kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/package/mkspec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ead54d67a024..4dc1466dfc81 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -50,6 +50,6 @@ fi
 cat << EOF
 
 %changelog
-* $(LC_ALL=C; date +'%a %b %d %Y') ${name} <${email}>
+* $(LC_ALL=C date +'%a %b %d %Y') ${name} <${email}>
 - Custom built Linux kernel.
 EOF
-- 
2.43.0


