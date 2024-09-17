Return-Path: <linux-kbuild+bounces-3593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB597B139
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B059428378C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666FF18952E;
	Tue, 17 Sep 2024 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMPLBvWH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70B189503;
	Tue, 17 Sep 2024 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582664; cv=none; b=to9qUWRDqqvHFvr5Of66CiZX1asrrNZq4SFbykINtMs3pc4G1jk+YY9bbrUzpQbgm18Lzk6EI6PzfQruBsz3xFgCPICh/4tPMqrKwatfYi4D1h7PwgTKIzvtv4oWu08DwjEIz084Drs1Gw4wYrXFauJccKh7D8eqXDKI5UYWj2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582664; c=relaxed/simple;
	bh=BrRTM809vvzXSKo1ggTymNEipDQUHfKnrRRZ0fYJjww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4jYgtNLDzdUDaHioAHIaNJRPgIM+44QvleiPd9ma7u2xLUoeLgsa3etCVsnheskmkp/AB4uQWCTAtXX8wkRQ56YhMfZLw8Qf5ZQ4kWaqPQJQOn9do8pmSc0LM5eAzt0zK4vjbxUL7AN6dYc0S+wyzAKOPm4J8Q4fHN/C+cN7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMPLBvWH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349B6C4CECE;
	Tue, 17 Sep 2024 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582663;
	bh=BrRTM809vvzXSKo1ggTymNEipDQUHfKnrRRZ0fYJjww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMPLBvWH6B6t01Pd2ofS+HINpciwcG7dp1EW/GNH5X96HxWtY9mkj8hjjQ71N3t8S
	 f7ABnyosJfuVdxgOEE7JtX1VkO/dF0uBtZfxwzdIvBRnO8sIzNqcNwlws33v8vxIaA
	 QKteJFRnMhmxb9CjGJydlXDDSxB5yCyd+oToaKvVY4gkgCLVOAlOGQaUiEZaw+DGi1
	 YQikz0kq9Er2JUG8n9JskP6EIia5MOxREqkMHRMm7Oet+uLFZIZIpviooFtqQRawF0
	 f33y8D9qdC9Q96+SgAl00Q4/k9ylvCDvLCT+8Rpnxyn8DyyDeQqBzpCI5Tr+svSQfT
	 KbOU8ZW/mQVkg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 06/23] kbuild: doc: replace "gcc" in external module description
Date: Tue, 17 Sep 2024 23:16:34 +0900
Message-ID: <20240917141725.466514-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid "gcc" since it is not the only compiler supported by Kbuild.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a80bff699e77..3a6e7bdc0889 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -38,7 +38,7 @@ This document describes how to build an out-of-tree kernel module.
 
 "kbuild" is the build system used by the Linux kernel. Modules must use
 kbuild to stay compatible with changes in the build infrastructure and
-to pick up the right flags to "gcc." Functionality for building modules
+to pick up the right flags to the compiler. Functionality for building modules
 both in-tree and out-of-tree is provided. The method for building
 either is similar, and all modules are initially developed and built
 out-of-tree.
@@ -284,7 +284,7 @@ according to the following rule:
 
 		#include <linux/module.h>
 
-	kbuild will add options to "gcc" so the relevant directories
+	kbuild will add options to the compiler so the relevant directories
 	are searched.
 
 4.2 Single Subdirectory
-- 
2.43.0


