Return-Path: <linux-kbuild+bounces-4956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD649E191D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4186616110A
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 10:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613611E1C0C;
	Tue,  3 Dec 2024 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJAulvs/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AD11E1C08;
	Tue,  3 Dec 2024 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221301; cv=none; b=jmp7f9xDR1n7sccTrnLJ7NMs9fNy3+6rLFqNqOcW/Vv90TZSwOjYqCCOPg8D+pzNuQ4sUhEdmtwh2daGttofzk5f4BQCKSVSyalAzPUnvK9DyMUVRA4pCCvZQFlag8VSAVrYh+rvy8Z79/+57/uwu0NVe8UXYjvthmqUvGxnlOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221301; c=relaxed/simple;
	bh=qxyVC7ahpy3PeavjsRQU5ngB/PXutBQlubdpgnvF3Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVneOXDah3qjyn1woATK3PACAjiXwGjw9ZS33mU1yEaM5hRTdGxE6w3yhkrYXue/pgF4WLIMfTT6yp3vMcxinqUM4cORbGIm1mHF6d8qFE4QIAMhZg29nLYe91faRMSDdBTUNzxpSFkHWaNEo77q141YZzJCsmkgxGMTfV2aCqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJAulvs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4D6C4CED6;
	Tue,  3 Dec 2024 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733221301;
	bh=qxyVC7ahpy3PeavjsRQU5ngB/PXutBQlubdpgnvF3Cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJAulvs/bS27LZz8ZCKZH4jaiEBW2ge4HXT1UI+rX0tDE7S2PVFhpMky5PRCSyhgA
	 tPAnpwTa4eFf7yTqZaPOfxxIx1PRVgBziDDlLaR3fEDglaYR9s0iE0D+fB1zGbTh9N
	 6NGWyXSQkHVsQ85bVn7DmDjc3yr0AvYfv8tK8aLrRWZlq3fP53ST8K7CMohd1nP1SJ
	 X9vdlcP4hZqx8soEhAe8nsogzln87qU+rNLplIWbiatvQo9nxiEB1h2NSf0BUtv3Wu
	 RmTLwBBxFcqa8RnjnWj6K9vLWLSmXLbSG7LX+QVIs+jjCDQsPL13Op31nPQk93zgyU
	 EY8tA3mn7MEcg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthias Maennich <maennich@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] scripts/nsdeps: get 'make nsdeps' working again
Date: Tue,  3 Dec 2024 19:21:05 +0900
Message-ID: <20241203102124.3147478-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203102124.3147478-1-masahiroy@kernel.org>
References: <20241203102124.3147478-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit cdd30ebb1b9f ("module: Convert symbol namespace to string
literal"), when MODULE_IMPORT_NS() is missing, 'make nsdeps' inserts
pointless code:

    MODULE_IMPORT_NS("ns");

Here, "ns" is not a namespace, but the variable in the semantic patch.
It must not be quoted. Instead, a string literal must be passed to
Coccinelle.

Fixes: cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/coccinelle/misc/add_namespace.cocci | 4 ++--
 scripts/nsdeps                              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/coccinelle/misc/add_namespace.cocci
index d66c4e3cd946..cbf1614163cb 100644
--- a/scripts/coccinelle/misc/add_namespace.cocci
+++ b/scripts/coccinelle/misc/add_namespace.cocci
@@ -13,7 +13,7 @@ virtual report
 declarer name MODULE_IMPORT_NS;
 identifier virtual.ns;
 @@
-MODULE_IMPORT_NS("ns");
+MODULE_IMPORT_NS(ns);
 
 // Add missing imports, but only adjacent to a MODULE_LICENSE statement.
 // That ensures we are adding it only to the main module source file.
@@ -23,7 +23,7 @@ expression license;
 identifier virtual.ns;
 @@
 MODULE_LICENSE(license);
-+ MODULE_IMPORT_NS("ns");
++ MODULE_IMPORT_NS(ns);
 
 // Dummy rule for report mode that would otherwise be empty and make spatch
 // fail ("No rules apply.")
diff --git a/scripts/nsdeps b/scripts/nsdeps
index bab4ec870e50..a3372166ac01 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -21,7 +21,7 @@ fi
 
 generate_deps_for_ns() {
 	$SPATCH --very-quiet --in-place --sp-file \
-		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D nsdeps -D ns=$1 $2
+		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D nsdeps -D ns=\"$1\" $2
 }
 
 generate_deps() {
-- 
2.43.0


