Return-Path: <linux-kbuild+bounces-13438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHbOD2UzG2qqAAkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13438-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 20:58:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE04612E5C
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 20:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95DBA30686EF
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 18:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4BC23D2A4;
	Sat, 30 May 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b="g6tfWKc1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender-op-o7.zohocloud.ca (sender-op-o7.zohocloud.ca [199.67.87.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E54137750;
	Sat, 30 May 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=199.67.87.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780167069; cv=pass; b=uxh0W3jBpG0SwVn57czTAp2ecH8A5Xc5bfWE6niyDOsHrfrzzZP8abjfURyNlZuqiQVfDarSZdOIwTOpRm/HcM6JP0JyLTCWUa9N8NmXI2O5acVHWWnvawm2Ybrqe9FgqqijQQvXYwM/AnDNgDvxKsYiNPaGXg8se9rVjp7oZrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780167069; c=relaxed/simple;
	bh=/cZ0+sdw88qoRb+cyGY9n7CzUrAk/9Geak3ZfDkbKFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Biq4u3ctGn0fvSkEgvu9NJzBaWt4ZNb1D7Tlzul2q4ZrN7os5q80Si5X2LGFlVaI+34G4lyeRswFoEQz9EBMMgojLPkP+dLerQFPbdkew3J7wzElESvyn7RgnY/LLxpAWj51ABKn3e7nDlGPNY50QXA6lqetNXstDesncaVOmgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev; spf=pass smtp.mailfrom=jkam.dev; dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b=g6tfWKc1; arc=pass smtp.client-ip=199.67.87.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jkam.dev
ARC-Seal: i=1; a=rsa-sha256; t=1780167047; cv=none; 
	d=zohomailcloud.ca; s=zohoarc; 
	b=NEWKuD9feRJaxL/ucoBkS507DYR3RNqWD21ZV0TjOgzPEYzT/HxCEqsbeLSogXFixdFH70zH5D1A0QEzRVQCD1y+xNTHl7GSUc88uRdjMYxXfmyjpFTa/npLOgh0HbMGkMciH7gmTICqF1QU6+OyHPbaGMbDkp0gskZoOCPOqvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomailcloud.ca; s=zohoarc; 
	t=1780167047; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L/E9yG1U5jtouAB+uazBa353gIisF7vX/LYWQcbbMko=; 
	b=loj3bmmDrah+XsukVJwq1d6Noz7SFsAwG/9YKho+xiihxLYCV+GvkNSx2M+ewaUUkQu5FpPJA44ukwAuxzyYOL/m0jqUxPPeqoxU0UOQwZYoTsMtp7CcqGHVvpzcwRlAn+9k0Y61X3pK6QHBTEXy7jibS0MU6kOr/JlQzqdQD5Q=
ARC-Authentication-Results: i=1; mx.zohomailcloud.ca;
	dkim=pass  header.i=jkam.dev;
	spf=pass  smtp.mailfrom=contact@jkam.dev;
	dmarc=pass header.from=<contact@jkam.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780167047;
	s=zoho; d=jkam.dev; i=contact@jkam.dev;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=L/E9yG1U5jtouAB+uazBa353gIisF7vX/LYWQcbbMko=;
	b=g6tfWKc1UJ3y7YLQCH8SwdExoKe/RBJp/tkQPyuNmXJOnvhGDbejUfMLH5nPTqdx
	fq3s0ghEWrvBcvsCgl+BimU7NXMF0qnd1iof8CA/3YlwLPyAECZstwMxKZ+b8S/0YoE
	xwtznJC+GkPDuh31jINt7rgUe1LW1O+gVOq0U59E=
Received: by mx.zohocloud.ca with SMTPS id 1780167045933869.1071949291838;
	Sat, 30 May 2026 14:50:45 -0400 (EDT)
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
Subject: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
Date: Sat, 30 May 2026 12:49:43 -0600
Message-ID: <20260530184944.10459-1-contact@jkam.dev>
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
	TAGGED_FROM(0.00)[bounces-13438-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@jkam.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[jkam.dev:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jkam.dev:email,jkam.dev:mid,jkam.dev:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9CE04612E5C
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


