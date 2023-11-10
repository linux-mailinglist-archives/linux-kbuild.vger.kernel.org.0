Return-Path: <linux-kbuild+bounces-4-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D79FE7E7EF2
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 18:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A7E0281A43
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 17:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823AD3C08C;
	Fri, 10 Nov 2023 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cYTmn7Cu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ArSIIaCc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831838DC5
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 17:46:48 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33373304B;
	Fri, 10 Nov 2023 04:14:15 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 060FC219C4;
	Fri, 10 Nov 2023 12:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699618454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dq19wJSmTOrZRzEGt4AZFA5wmg4WvLvB9MbM94XFO7k=;
	b=cYTmn7Cu5Hwf6dEwJm2Dfuphy49HT1ncwzz63aOGu9p+CD8c2blI9bAm9+DM8sSHqLuv3c
	E8eSAFeVkQ0xT/E/X8bVsEGbLGYY6n+oFUTn4Yz/sWxyMB2W9ecJ7mvbmgIqdUnftk07zW
	6cqDA+0jSFKR6T9iL8HBAJzGZwHvJK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699618454;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dq19wJSmTOrZRzEGt4AZFA5wmg4WvLvB9MbM94XFO7k=;
	b=ArSIIaCcyPZ/qGHDyDqGuJmiIQaBWEq0JmsIWnWTnc+p9QQn2hoMnCmarEV2Wor6UZFv6Z
	PosazrD2S6yHsTDQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id A17E72C162;
	Fri, 10 Nov 2023 12:14:13 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linux-modules@vger.kernel.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Suchanek <msuchanek@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>,
	Jan Engelhardt <jengelh@inai.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] configure: Check that provided paths are absolute
Date: Fri, 10 Nov 2023 13:13:55 +0100
Message-ID: <8aff0c9c491d8afeec7f6b2cd96cbd0439e26fbb.1699618135.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1699618135.git.msuchanek@suse.de>
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf> <cover.1699618135.git.msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

configure checks that its built-in directory options get an absolute
path. Copy the check for custom options.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v6: new patch
---
 configure.ac | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/configure.ac b/configure.ac
index d6da5ee9ae9a..de01e08cf2e8 100644
--- a/configure.ac
+++ b/configure.ac
@@ -97,6 +97,23 @@ AC_ARG_WITH([module_directory],
         [], [with_module_directory=/lib/modules])
 AC_SUBST([module_directory], [$with_module_directory])
 
+# Check all directory arguments for consistency.
+for ac_var in	distconfdir rootlibdir module_directory
+do
+  eval ac_val=\$$ac_var
+  # Remove trailing slashes.
+  case $ac_val in
+    */ )
+      ac_val=`expr "X$ac_val" : 'X\(.*@<:@^/@:>@\)' \| "X$ac_val" : 'X\(.*\)'`
+      eval $ac_var=\$ac_val;;
+  esac
+  # Be sure to have absolute directory names.
+  case $ac_val in
+    @<:@\\/$@:>@* | ?:@<:@\\/@:>@* )  continue;;
+  esac
+  as_fn_error $? "expected an absolute directory name for --$ac_var: $ac_val"
+done
+
 AC_ARG_WITH([zstd],
 	AS_HELP_STRING([--with-zstd], [handle Zstandard-compressed modules @<:@default=disabled@:>@]),
 	[], [with_zstd=no])
-- 
2.42.0


