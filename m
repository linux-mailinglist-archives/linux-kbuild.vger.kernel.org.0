Return-Path: <linux-kbuild+bounces-3634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0997CD31
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 19:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97635285598
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 17:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701821A3ABA;
	Thu, 19 Sep 2024 17:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWZUJCW6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449141A3AA3;
	Thu, 19 Sep 2024 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726767475; cv=none; b=jkIB3yvYlH3gfhkCulooJPV003Z380ghhme9Bi+d3Nq5bGmAMYtAtSeKLKtM3m2H52o7xPs7b3xMSsQ4NBAPnUdQWi9wDB/DvLrXlfdW4f0vJyvzlHo2SML4bBL5woaTRf6QyYSCXyTthOhxFUsDNDpEg0x+OFRO8aPI52ucvrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726767475; c=relaxed/simple;
	bh=aNCBzgHOJ/KRb04CY4zo8gpoJ0YQtB/gZx6KyEZ19SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI23Tm65SiAHEEF8I4wrDs3RphPiEldpgCrTx0EyFwRfP2V8Ju76cB24OfcwpMr5DUXyRfJL9qHtUUCJraXTPG1pt5ipR4TOnCri4mHrxTqc2ZZAzz/tK8Qg9CiZuRbWzezG3KvLTyHDUz3SuWiauvIxpuea41Out9HH+H+SpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWZUJCW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEB2C4CED1;
	Thu, 19 Sep 2024 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726767474;
	bh=aNCBzgHOJ/KRb04CY4zo8gpoJ0YQtB/gZx6KyEZ19SY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XWZUJCW6AVPRqXm3V8mVHTe4BY/tmbZx8Mggpu7paaqgSULxCgTYKEMtBx4cvJbao
	 x8bSIyieqUQgB5AdnI5OKTzoKEi1Mhwl5Og5dmGDp54wWHOj6GC+W5CxzdFHSgH2zd
	 od3Sgfjkd0/YGCW8a1D3U34W8Fi7NFaeY0amEahPKhyD2F4kz8ixOWCCR99OYAyjpT
	 LBEmEsh9oL48KrXX00hJPRxDIRqszE/Nh/EHySqZ1l/eU3hEO59R+JrYArKfEtMIWQ
	 JA25cm55zRNzy/jbNMvRwrPyNlm8Dk2az67IjRFeMwzmOnqXOT6zfkclMPA/drXw8v
	 iqHlFoi0FSOJw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <n.schier@avm.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 5/5] kbuild: doc: replace "gcc" in external module description
Date: Fri, 20 Sep 2024 02:37:18 +0900
Message-ID: <20240919173740.1080501-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919173740.1080501-1-masahiroy@kernel.org>
References: <20240919173740.1080501-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid "gcc" since it is not the only compiler supported by Kbuild.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
---

Changes in v2:
  - Rebase

 Documentation/kbuild/modules.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index b24448f789b3..cd5a54d91e6d 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -9,7 +9,7 @@ Introduction
 
 "kbuild" is the build system used by the Linux kernel. Modules must use
 kbuild to stay compatible with changes in the build infrastructure and
-to pick up the right flags to "gcc." Functionality for building modules
+to pick up the right flags to the compiler. Functionality for building modules
 both in-tree and out-of-tree is provided. The method for building
 either is similar, and all modules are initially developed and built
 out-of-tree.
@@ -256,7 +256,7 @@ Kernel Includes
 
 		#include <linux/module.h>
 
-	kbuild will add options to "gcc" so the relevant directories
+	kbuild will add options to the compiler so the relevant directories
 	are searched.
 
 Single Subdirectory
-- 
2.43.0


