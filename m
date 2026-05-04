Return-Path: <linux-kbuild+bounces-12980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OINvIHto+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12980-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:35:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092F4BB059
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D87C3038AFA
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7ADA37F725;
	Mon,  4 May 2026 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3gmgsHw5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9lPszCZn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9752137D11C;
	Mon,  4 May 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887219; cv=none; b=gyjqv9mo/Pw64DkmjIVkL5BXlrTh5LsKDsuiB+Xe2YymdOEfnMFocfh2HnXX6lDCEg2AjMi5+TL4gA9qwnQhaqEJG320fa8i7R4B09rvK6eIzcEe3fLT7T99JyQpJX7gERSIRL4yIMawgsxxUQA9xt88mI+kCW9lKw+kPvUkPUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887219; c=relaxed/simple;
	bh=C3+WFuqmWwAWuvuhG3a2V6T0cnnllWx1wESAQzOgWr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkc8apZXbGaLzS4s5O+JA64OQRLhEdz0tLpNdXlXNz5FUshPwvucZwHTeIejUfu+gZLuV06JXWRbAysQdU8eSs23x8CZ3/+d1Yye8imtC1pM6JanJ2qyZq1okPlC/bblF9HRo/fF2ZEQOS6WJB/0oxbe//vhDvZa1Hp9W1pNB9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3gmgsHw5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9lPszCZn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phMjACbbvuhJ46Y+Cb858pBZjegCvm4hvrrYxP3IpmE=;
	b=3gmgsHw5te80Dz/TZDbLGM3dFTERMqapPBJi/OXq2MSNASi9YNll/M+B5OTWWK62YV0UEu
	Eeaogq+Rxbz/jGTEZsfFPD3NIglGsy2FrE1flRqFlxTxaJgXCNKedyI0aegneiUvs+DURI
	o4gv590DTa2TNYCMso6RVAdXPCxhqKpPrJiTBEG/RpFF4sJAfTlHhEQNZDEWYZDW2/UG6i
	RRp+aey7vW1keVEQinPXv412qNAkCWtjC2mIn2P+7rOcV0Ho8shLQW1MqaDHjZPz9axJUu
	6q3wvVB8KW+sk5bnp0zn355b7G1Kxb9Oi0lP/A6ZjlXM4y1F4k3t9q0i2FWRQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phMjACbbvuhJ46Y+Cb858pBZjegCvm4hvrrYxP3IpmE=;
	b=9lPszCZn2QHEJUrwgxhj/VQdGyetnCTvE5dKW+y5m4uWQ9xMZJKk3F7DwsT388WsCS9kXv
	qKzeAJvoL9CdX+BQ==
Date: Mon, 04 May 2026 11:33:20 +0200
Subject: [PATCH v6 04/11] mount: add support for __free(kern_unmount)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-4-712d3d526d97@linutronix.de>
References: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
In-Reply-To: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Kees Cook <kees@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, workflows@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>, Nicolas Schier <nsc@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=942;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C3+WFuqmWwAWuvuhG3a2V6T0cnnllWx1wESAQzOgWr8=;
 b=v8qWN3CNL84w0W8dTXihmLZsAsWIE+x2wKIstna01FUjr0T/jkeNaar/aA60a1U9P56ywJEI4
 K6s10u66qsVD63S4sOtrFF++I7GIlzk8hZpWpMo88J4Is5p59tKF6VI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 1092F4BB059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,1wt.eu,weissschuh.net,linux.dev,lwn.net,zeniv.linux.org.uk,suse.cz,lst.de,davidgow.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12980-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Allow usage of kern_unmount from the automatic __free cleanup logic.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/mount.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mount.h b/include/linux/mount.h
index acfe7ef86a1b..d8689ce61a42 100644
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@ -10,6 +10,7 @@
 #ifndef _LINUX_MOUNT_H
 #define _LINUX_MOUNT_H
 
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <asm/barrier.h>
 
@@ -99,6 +100,7 @@ extern bool our_mnt(struct vfsmount *mnt);
 
 extern struct vfsmount *kern_mount(struct file_system_type *);
 extern void kern_unmount(struct vfsmount *mnt);
+DEFINE_FREE(kern_unmount, struct vfsmount *, if (_T) kern_unmount(_T));
 extern int may_umount_tree(struct vfsmount *);
 extern int may_umount(struct vfsmount *);
 int do_mount(const char *, const char __user *,

-- 
2.53.0


