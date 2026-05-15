Return-Path: <linux-kbuild+bounces-13165-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFUwIjIYB2qQrgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13165-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 14:57:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C855004D
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 14:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F4273014838
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 12:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA742701B8;
	Fri, 15 May 2026 12:53:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2AD283FCF;
	Fri, 15 May 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778849625; cv=none; b=UZKYgtGfYq1LoYbaxLGwExilgaelEhKh5xxjUmzpBXMGM7lsZ1PDh+zzDd4ks25rdqqcLbMHA2t2EbwiEFlxvpbEVA8LQrxep0yWaATU9Fn9X6eBBvo7SsyJbN4TJF+QDoVVncoXyI+80jmpYQ8okMctGOgiv+AEJZW7Wx3GCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778849625; c=relaxed/simple;
	bh=sepuRqLs7yxt1WnFKlsRRFcbuoutB+1T/ZgQ0APU/1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NkGIGO7PBJ9oDC5WbBBVkJaUK9oxFzSJ2s0VXOGhEfm/Eu4idWc7AYvIUiOfVZtnpQgufXDKmdjPElYAlgkNYNNAM9r7nNAH3A2Sw63KLewh3UZcswjtUQ8lWIpNEhnJjfu4rHQq/waGso/OXpdPOiZIWTi7uyEI+2m2EZDQ7Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <p.hahn@avm.de>)
	id 6a071602-cede-7f0000032729-7f000001e9dc-1
	for <multiple-recipients>; Fri, 15 May 2026 14:48:02 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 15 May 2026 14:48:02 +0200 (CEST)
From: Philipp Hahn <p.hahn@avm.de>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Philipp Hahn <phahn-oss@avm.de>,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] run-clang-tools: run multiprocessing.Pool as context manager
Date: Fri, 15 May 2026 14:47:50 +0200
Message-ID: <40180613bef84946c45d6fbeb4bb274573cd0beb.1778849135.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: FRITZ! Technology GmbH, Berlin, Germany
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1778849282-75DC539B-08058C73/0/0
X-purgate-type: clean
X-purgate-size: 1634
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Queue-Id: 259C855004D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13165-lists,linux-kbuild=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[p.hahn@avm.de,linux-kbuild@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Philipp Hahn <phahn-oss@avm.de>

`multiprocessing.pool.Pool()` should be used as a context manager so
Python can free its internal resources and do a proper cleanup.[1]

While at it move the code to read the `compiler_commands.json` so the
opened file can be closed before the sub-processes are fork()ed.

Link: https://docs.python.org/3/library/multiprocessing.html#multiprocessing.pool.Pool [1]
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 scripts/clang-tools/run-clang-tools.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index f31ffd09e1ea..e78be82aa693 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -79,14 +79,15 @@ def run_analysis(entry):
 
 
 def main():
-    try:
-        args = parse_arguments()
+    args = parse_arguments()
+
+    # Read JSON data into the datastore variable
+    with open(args.path) as f:
+        datastore = json.load(f)
 
-        lock = multiprocessing.Lock()
-        pool = multiprocessing.Pool(initializer=init, initargs=(lock, args))
-        # Read JSON data into the datastore variable
-        with open(args.path, "r") as f:
-            datastore = json.load(f)
+    lock = multiprocessing.Lock()
+    try:
+        with multiprocessing.Pool(initializer=init, initargs=(lock, args)) as pool:
             pool.map(run_analysis, datastore)
     except BrokenPipeError:
         # Python flushes standard streams on exit; redirect remaining output
-- 
2.43.0


