Return-Path: <linux-kbuild+bounces-13417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IuyJCv+GWr80QgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13417-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 22:59:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D32608BD1
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 22:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 603CB3018ADB
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 20:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C004218A3;
	Fri, 29 May 2026 20:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b="PsooinE7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender-op-o7.zohocloud.ca (sender-op-o7.zohocloud.ca [199.67.87.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD93F788A;
	Fri, 29 May 2026 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=199.67.87.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088153; cv=pass; b=qwa8kCleosuTRy4PlgwKiElM+2gFI025nIyeKesQtMdSNkjWUot38kYPARoK9Nu/CpDu8c/r1zE1EvLajMVOT5TbwLVlye6INqv7cARXBd9TqSHz7tHFChJTjCNvfbLbrGW10Jj0I2M2Y7KAI6BP1xapzPOOKSHAwf3v819Ip4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088153; c=relaxed/simple;
	bh=/cZ0+sdw88qoRb+cyGY9n7CzUrAk/9Geak3ZfDkbKFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XvWw1e+iSzdTMlZDGUFazWkg+LsxkePfMrIhxUZ5yKOG+499IL5Ab3ZlQa7gOFN53Q3q5+51UlfNBq5wN+kMZ0AP7y5etAl/5gUn++dVEFWFB4IrZgSxUbckYefAl3zsxaCChfboHME+hS3KhCJyvBvGTLMK8orcp8OmZh0ajH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev; spf=pass smtp.mailfrom=jkam.dev; dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b=PsooinE7; arc=pass smtp.client-ip=199.67.87.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jkam.dev
ARC-Seal: i=1; a=rsa-sha256; t=1780088134; cv=none; 
	d=zohomailcloud.ca; s=zohoarc; 
	b=Y3Fy9/NKzQj0SMtApjG2KXXmscRp0dhv9iAIvuYhx8hI0/S1o5M3gGfOvOloN7GGEw3RcvNSCyVQXne9wwoLcI2bkrNauyRvG+Y+5Z3yTB0cZhRQk7saXs7Pqu9+Wk5zlnBcdPMvPUwQ6r7pqJS+FexG+reu2BHJhnUd0gbHwZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomailcloud.ca; s=zohoarc; 
	t=1780088134; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L/E9yG1U5jtouAB+uazBa353gIisF7vX/LYWQcbbMko=; 
	b=iE0JvlxvsIPNMmnMl3OQJKu9f7H6jv4V2SSQHVm9H7qA6fsR0cYyznsS7g+J1SuPVYVxUUea3aNxrphvUJmFnQu9MpSZSRT7MTxxtCH3ZtqoDCfz3Xl3KTqGnA4IKC28julVZR3fLeGhSBOrXTznvX9ykoKEmhmvgHl9JK/68xs=
ARC-Authentication-Results: i=1; mx.zohomailcloud.ca;
	dkim=pass  header.i=jkam.dev;
	spf=pass  smtp.mailfrom=contact@jkam.dev;
	dmarc=pass header.from=<contact@jkam.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780088134;
	s=zoho; d=jkam.dev; i=contact@jkam.dev;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=L/E9yG1U5jtouAB+uazBa353gIisF7vX/LYWQcbbMko=;
	b=PsooinE7oxPm47iyJnIFDb7eJOhWKtDmbRemJacwUyNQV0blwW0kso0xabNIrfec
	Rraj0JD1VEEImsXJDAvhMckUsMiiR1rUftsDPqLK1JcW0B2TLlu40TlWmOugJKllZCY
	BtaN9NxcTEcSkqUepczC0ECQG+FHj/ipXxJN4vi0=
Received: by mx.zohocloud.ca with SMTPS id 1780088132160136.75078168153857;
	Fri, 29 May 2026 16:55:32 -0400 (EDT)
From: Joel Kamminga <contact@jkam.dev>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	Joel Kamminga <contact@jkam.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: clean `*.long-type-*.txt` files
Date: Fri, 29 May 2026 14:55:28 -0600
Message-ID: <20260529205529.75586-1-contact@jkam.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jkam.dev:s=zoho];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[jkam.dev];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13417-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@jkam.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[jkam.dev:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,jkam.dev:email,jkam.dev:mid,jkam.dev:dkim]
X-Rspamd-Queue-Id: 01D32608BD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This cleans up files generated by rustc compiler in the case of an
error containing an excessively long type name that doesn't fit in
a single line. Such types appear relatively frequently so the risk
of generating these files certainly exists. These files are purely
compiler artifacts and are not created intentionally by the build
system. They should be added to the `clean` target to stop from
cluttering up the source tree.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1236
Signed-off-by: Joel Kamminga <contact@jkam.dev>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9f59598d3a08..3a265e7e3347 100644
--- a/Makefile
+++ b/Makefile
@@ -2164,6 +2164,7 @@ clean: $(clean-dirs)
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
 		-o -name '*.gcno' \
+		-o -name '*.long-type-*.txt' \
 		\) -type f -print \
 		-o -name '.tmp_*' -print \
 		| xargs rm -rf
-- 
2.54.0


