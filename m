Return-Path: <linux-kbuild+bounces-4614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB3F9C3060
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBBA21C209B1
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E13155A4E;
	Sun, 10 Nov 2024 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rh5R+UeY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37822155A30;
	Sun, 10 Nov 2024 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202635; cv=none; b=tHTIDd+idufV+NSpv7lwPG6B3MbgaG82TuAsPIH3uCyaR0LaWd2xdumqth79t1yiNODXULR6SPbgCPnbElvsl8le9oDk26fPXRUMvMyfmAcU3v4TfWl0a28Jv8g7g02ewMIZEfYxei9IBrem09g9jE7ID+6d9+Y1YoB3BcZsvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202635; c=relaxed/simple;
	bh=0zuP6CP79N07MZokL7X/3TUXckWFEXEyNFcF1B4viqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSD3a14KNEh08yjnMOXFNpZwPn+72wYvpW0BakdvWD7silDFG3KMiCkgNu4v291nnRrQW8+nQohrLyvsdMx6tWQDquiOiGTImDSpWL6lmDjRsGstlIVOeL3G7A14y8XRK794eukXTaAkD9FK5Z2yjOAUyc5R3j6x2q4u7qKb2zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rh5R+UeY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D9BC4CED5;
	Sun, 10 Nov 2024 01:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202635;
	bh=0zuP6CP79N07MZokL7X/3TUXckWFEXEyNFcF1B4viqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rh5R+UeYAqhDksHA37rS7cnbCjErm90Vq0kIK+C07uxDHBWJv+/AUidbid8iZ/yWJ
	 ISIiZzgjZKfQO88nG6mL69Ns+mUF9dbV4uutOVbmLF1rtK9oc5HQ0o/AgTHFj7PRqc
	 P1sDAazQJF+7K2Gi3TMaigW+JRyOKyKdOQp16aZpjCTfjJxSPMfuFNiNecd8mG70lb
	 bCe9/pENPgONCF2E9LFI1CmGs6Vr0xoFWHqT/zGf/gjw2n1Y2+Zbrr9BsCKHXzzjni
	 8PDbNRwEWosRBNlEoe3RLy65EgeX7o3E++Pfvp3SNvj/Z1TUKzJ5OiY3yL6nszXv2S
	 mp3dbi8zFefDA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 10/11] kbuild: make wrapper Makefile more convenient for external modules
Date: Sun, 10 Nov 2024 10:34:38 +0900
Message-ID: <20241110013649.34903-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Kbuild starts building in a separate output directory, it generates
a wrapper Makefile, allowing you to invoke 'make' from the output
directory.

This commit makes it more convenient, so you can invoke 'make' without
M= or MO=.

First, you need to build external modules in a separate directory:

  $ make M=/path/to/module/source/dir MO=/path/to/module/build/dir

Once the wrapper Makefile is generated in /path/to/module/build/dir,
you can proceed as follows:

  $ cd /path/to/module/build/dir
  $ make

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v2:
 - use $(srcroot) instead of $(_vpath)

 Makefile | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 35e34cce4942..df002595341a 100644
--- a/Makefile
+++ b/Makefile
@@ -642,10 +642,20 @@ ifdef building_out_of_srctree
 # At the same time when output Makefile generated, generate .gitignore to
 # ignore whole output directory
 
+ifdef KBUILD_EXTMOD
+print_env_for_makefile = \
+	echo "export KBUILD_OUTPUT = $(objtree)"; \
+	echo "export KBUILD_EXTMOD = $(realpath $(srcroot))" ; \
+	echo "export KBUILD_EXTMOD_OUTPUT = $(CURDIR)"
+else
+print_env_for_makefile = \
+	echo "export KBUILD_OUTPUT = $(CURDIR)"
+endif
+
 quiet_cmd_makefile = GEN     Makefile
       cmd_makefile = { \
 	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
-	echo "export KBUILD_OUTPUT = $(CURDIR)"; \
+	$(print_env_for_makefile); \
 	echo "include $(abs_srctree)/Makefile"; \
 	} > Makefile
 
-- 
2.43.0


