Return-Path: <linux-kbuild+bounces-1800-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 744738BDFE0
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 12:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 307732891BD
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 10:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A4E1514FA;
	Tue,  7 May 2024 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7l0Ynxs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6701514F5;
	Tue,  7 May 2024 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715078314; cv=none; b=bbu8O2Q5ZVmWcdv3gVsG2dN7PF0o4GEV70CBdoTRKMnqWl8mPbxfoLNM4g0pahqu5xYA1NiT+Et9LAc+ZwiM7Gr+BHDjp+V+4HPKg/trv2iBVTfgl0SU3haC18quAL570aArdj6CSzPF6nTuPFucvPJM5BR947zXfbMtEcc4X34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715078314; c=relaxed/simple;
	bh=/8Wqr+SuY8M/oz8mz047pX05dfShxUAsQlubT6STB+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WZBlPEwVsI29+tog4LHyshWsC9IzbHev5/O2SkRUQkBWbsX45VLZuabDCHjoIvNa6n9PPUF6bRatxN+obfP2xrslqr88YbOzo3t9ez54lIRoGjaVBKMSQL4KVT6Y+sIN654yCFWgWsHVo2FYue2HWrbajmrrB4bIkm09Nu8qDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7l0Ynxs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7FBC4AF63;
	Tue,  7 May 2024 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715078314;
	bh=/8Wqr+SuY8M/oz8mz047pX05dfShxUAsQlubT6STB+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p7l0YnxsvHNSJX6ml4H2vrHc/gu/GnALPSD8r0zP7IpBKm/cp8QoBZ/NsBu97Rf/C
	 czhlDOBXZl8f66hsgovD/h5AaTfHYKbcfHkEV1QBPiUtzMFUG/edJrHgLzRVPU/sNz
	 VogjpG7JRrPSO+paB64oGSDu42ZXALqWf8pqJz9ngXziZmqrW98Z9bo4aKSh7grS+O
	 lZAzUDJ+I4k5pA+9XRNXgCHEGPE9Av8cY7JGMC+6+tPxDtPj0/B0aa46euqAaOH/9e
	 pMrXPj+sk3HqXsIXW1xg6NQ4eWBOZuOLJtxq9IStd+jl4/jgOYdh35Hzg4+IVTDM64
	 dz1Kw9I66YR4g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kconfig: m/nconf: remove dead code to display value of bool choice
Date: Tue,  7 May 2024 19:37:55 +0900
Message-Id: <20240507103756.1401996-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507103756.1401996-1-masahiroy@kernel.org>
References: <20240507103756.1401996-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, optional bool choices met the following conditions
simultaneously:

 - sym_is_choice(sym)
 - sym_is_changeable(sym)
 - type == S_BOOLEAN

It no longer occurs since 6a1215888e23 ("kconfig: remove 'optional'
property support"). Remove the dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/mconf.c | 17 +++++------------
 scripts/kconfig/nconf.c | 26 +++++++++-----------------
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index b33335eba460..64bf373f7921 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -525,19 +525,12 @@ static void build_conf(struct menu *menu)
 
 		val = sym_get_tristate_value(sym);
 		if (sym_is_changeable(sym)) {
-			switch (type) {
-			case S_BOOLEAN:
-				item_make("[%c]", val == no ? ' ' : '*');
-				break;
-			case S_TRISTATE:
-				switch (val) {
-				case yes: ch = '*'; break;
-				case mod: ch = 'M'; break;
-				default:  ch = ' '; break;
-				}
-				item_make("<%c>", ch);
-				break;
+			switch (val) {
+			case yes: ch = '*'; break;
+			case mod: ch = 'M'; break;
+			default:  ch = ' '; break;
 			}
+			item_make("<%c>", ch);
 			item_set_tag('t');
 			item_set_data(menu);
 		} else {
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index b5b3232f592a..715e156fdbb1 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -826,26 +826,18 @@ static void build_conf(struct menu *menu)
 
 		val = sym_get_tristate_value(sym);
 		if (sym_is_changeable(sym)) {
-			switch (type) {
-			case S_BOOLEAN:
-				item_make(menu, 't', "[%c]",
-						val == no ? ' ' : '*');
+			switch (val) {
+			case yes:
+				ch = '*';
 				break;
-			case S_TRISTATE:
-				switch (val) {
-				case yes:
-					ch = '*';
-					break;
-				case mod:
-					ch = 'M';
-					break;
-				default:
-					ch = ' ';
-					break;
-				}
-				item_make(menu, 't', "<%c>", ch);
+			case mod:
+				ch = 'M';
+				break;
+			default:
+				ch = ' ';
 				break;
 			}
+			item_make(menu, 't', "<%c>", ch);
 		} else {
 			item_make(menu, def_menu ? 't' : ':', "   ");
 		}
-- 
2.40.1


