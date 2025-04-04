Return-Path: <linux-kbuild+bounces-6427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C4A7BEA9
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6945F189B698
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 14:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56B31F3D52;
	Fri,  4 Apr 2025 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OpYP4YRT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7C1F3B94;
	Fri,  4 Apr 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775437; cv=none; b=Xae6fobLSy8QK28SzvVx6uEDkqh/EnWyVbir/WSW/yU+1nuU3rWkHwOvMJccn8TuQagdFaxqs8FdNgXcL0yMj4mSJywOloNXS+9xRqRkeUb9i/hmJD9632COSzOsj7f7gWHGvi4KqGM6bix4WFbX12wOC2JZ3gOxNYsA6ai89as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775437; c=relaxed/simple;
	bh=fsDCjIqE/uH5EfB13lToVBy9ZGTsmykBW2Tc3WXBROI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aU8Gc7G7u3pnixrnvtukHJKDKq92+OrS9atPmHJprnrzIrwPVOfc2Nd8zVmgNZpm/NfDfIWlk5Q2v85t2UoOPE3jcb/KkGRH9ZVpUXXnJbrb0Tgbi1exlATUiZDvM9wQtcfcD0tDRn8aesC0LUZNvGQHxky84SuNJO8Ux47XP98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OpYP4YRT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743775434;
	bh=fsDCjIqE/uH5EfB13lToVBy9ZGTsmykBW2Tc3WXBROI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OpYP4YRTHlzPRKwvb1eifKvVm+3uDVB8L0YZrHJGtJrKYfyDfn03xin3haj8xsTLb
	 whxWDbp/Ha1GR99vh00JtkFsAAyd8KuAgxf1zz5TQst0USWmsCXcJnLN9P+2Oe3+gN
	 ZBpNSVWUCNsUNCBerhRs04L5ye7GkBp56/OXyD0I40se8ZtCwBv5gL8olfhkyl/+JO
	 xeLWmIF3p6JH+WBz49tTEiHQ8ZwSppK3HCsmVvcPFiqfMyACOJ5FQzVkmexKZSTPTn
	 LiybGaf3eKMkgN7rIXw96/DIqO6Jh9pu3awlX2zbAJn5B3p30Kj59/y+pGbfEsvZa7
	 gneLRDr2hoe1w==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C53117E0FC3;
	Fri,  4 Apr 2025 16:03:52 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 04 Apr 2025 10:02:53 -0400
Subject: [PATCH RFC 2/2] docs: automarkup: Cross-reference CONFIG_ symbols
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250404-kconfig-docs-v1-2-4c3155d4ba44@collabora.com>
References: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
In-Reply-To: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Now that Kconfig symbols are part of the Documentation and have sections
that can be referenced, extend automarkup to automatically
cross-reference CONFIG_ strings to those sections.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/sphinx/automarkup.py | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index ecf54d22e9dc6ab459a91fde580c1cf161f054ed..dd940baca480634180a58c209aaed0cd1a16319a 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -47,6 +47,8 @@ RE_abi_symbol = re.compile(r'(\b/(sys|config|proc)/[\w\-/]+)')
 
 RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
 
+RE_kconfig = re.compile(r'CONFIG_[A-Za-z0-9_]+')
+
 #
 # Reserved C words that we should skip when cross-referencing
 #
@@ -88,7 +90,8 @@ def markup_refs(docname, app, node):
                            RE_union: markup_c_ref,
                            RE_enum: markup_c_ref,
                            RE_typedef: markup_c_ref,
-                           RE_git: markup_git}
+                           RE_git: markup_git,
+                           RE_kconfig: markup_kconfig_ref}
 
     match_iterators = [regex.finditer(t) for regex in markup_func]
     #
@@ -260,6 +263,37 @@ def markup_doc_ref(docname, app, match):
     else:
         return nodes.Text(match.group(0))
 
+#
+# Try to replace a kernel config reference of the form CONFIG_... with a
+# cross reference to that kconfig's section
+#
+def markup_kconfig_ref(docname, app, match):
+    stddom = app.env.domains['std']
+    #
+    # Go through the dance of getting an xref out of the std domain
+    #
+    target = match.group(0).lower()
+    xref = None
+    pxref = addnodes.pending_xref('', refdomain = 'std', reftype = 'ref',
+                                  reftarget = target, modname = None,
+                                  classname = None, refexplicit = False)
+    #
+    # XXX The Latex builder will throw NoUri exceptions here,
+    # work around that by ignoring them.
+    #
+    try:
+        xref = stddom.resolve_xref(app.env, docname, app.builder, 'ref',
+                                   target, pxref, None)
+    except NoUri:
+        xref = None
+    #
+    # Return the xref if we got it; otherwise just return the plain text.
+    #
+    if xref:
+        return xref
+    else:
+        return nodes.Text(match.group(0))
+
 #
 # Try to replace a documentation reference for ABI symbols and files
 # with a cross reference to that page

-- 
2.49.0


