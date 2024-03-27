Return-Path: <linux-kbuild+bounces-1370-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64A88EC77
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 18:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED2D029FE97
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 17:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A028B1487E9;
	Wed, 27 Mar 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q576/TIX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78512EBCB;
	Wed, 27 Mar 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711560051; cv=none; b=JMnerh7PW5kZ5bQbIO7yFyZmwAqyTr41VnGRoHdZu2Q1/90iiY0bI6ahqTnNmuc9S+BqBS3IgY0OHOPbmQU7YrW9uDSXXXAoCv6zhk8MQjBkW70OlQfJwx4k/kT2tYDPs70l+EgVZSIOqjuMmgqBTVLmixe2oj2jUeSk3Bi6w0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711560051; c=relaxed/simple;
	bh=a6Udgf42vnEB6zwutozKuZVR31bDOnmw+Hx2Bu4TQks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VYP1aNKd3oT4WDM22M2hFp7UpKsgKTpz2FyxP6WvpyFHvTTI9TIC4LY2PJm71dOYytPK/EewwnpMAFXou1AdUQjapROXmQQRGQsedWFkt1Zxe6KwLlmmE7Z2CBXoy2qFKPZc0k9UExy8ZRzPm1W050SsZk2Et3vJfMX4YF6sjt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q576/TIX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F14C433F1;
	Wed, 27 Mar 2024 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711560050;
	bh=a6Udgf42vnEB6zwutozKuZVR31bDOnmw+Hx2Bu4TQks=;
	h=From:Date:Subject:To:Cc:From;
	b=q576/TIXTO3JUdh4xlDOcDue+1lD9EMifI3kCEYsWFSkhRSOkqYKV2bNFZfkLtHee
	 5vx6E9Oze9g9FRwSGJUt7DcKcYtCIKDBCcEjgAgQmkQDir3p/o6pHrssR+YaT84FXf
	 BbQAEGLTRfiI+DPQHGIzcVruyiGGb5mCbAhl9wh73B+tADD1kKjHozpsfBaxP3GYKU
	 021UiDq/d7jQJd3SVZskaszm9zoF7fGDUfI8SUeOG9YAsk337MtwqZFH3Sahxw7OoC
	 DHbKZiKEgP5wMSrbhbp7lJJUcGq7cpLZZMYV6PCPN5+gbqfOp8CNt+AZ47dMOUUUyV
	 t44Qde8rMBAnA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 27 Mar 2024 10:20:36 -0700
Subject: [PATCH] Documentation/llvm: Note s390 LLVM=1 support with LLVM
 18.1.0 and newer
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-llvm-docs-s390-llvm-1-v1-1-56ad95d2bc27@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGNVBGYC/yXMTQqAIBBA4avErBtQC6WuEi0kpxroDwciEO+e1
 PJbvJdAKDIJ9FWCSDcLn0eBriuYVn8shByKwSjTqsY43LZ7x3BOgtJ06qdGqztvjQ6+tQ5Ke0W
 a+fm+w5jzCz/L8gJnAAAA
To: masahiroy@kernel.org
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
 nicolas@fjasle.eu, corbet@lwn.net, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412; i=nathan@kernel.org;
 h=from:subject:message-id; bh=a6Udgf42vnEB6zwutozKuZVR31bDOnmw+Hx2Bu4TQks=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGksoUV/57nNtpi9ebP9u+8Le3UvioiKNbxTYYu+4D39t
 b7AfXm2jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRXQsY/udN3+KzfSNDt1lr
 tarvGwWJ41PZmoJ6Qs/7T3zruXGfyzqG//X/hLfsmBL0ZaX8cYtNR+f4FdZ6enTryyxfqu57qO1
 wPzsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

As of the first s390 pull request during the 6.9 merge window,
commit 691632f0e869 ("Merge tag 's390-6.9-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux"), s390 can be
built with LLVM=1 when using LLVM 18.1.0, which is the first version
that has SystemZ support implemented in ld.lld and llvm-objcopy.

Update the supported architectures table in the Kbuild LLVM
documentation to note this explicitly to make it more discoverable by
users and other developers. Additionally, this brings s390 in line with
the rest of the architectures in the table, which all support LLVM=1.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Documentation/kbuild/llvm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b1d97fafddcf..bb5c44f8bd1c 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -178,7 +178,7 @@ yet. Bug reports are always welcome at the issue tracker below!
      - ``LLVM=1``
    * - s390
      - Maintained
-     - ``CC=clang``
+     - ``LLVM=1`` (LLVM >= 18.1.0), ``CC=clang`` (LLVM < 18.1.0)
    * - um (User Mode)
      - Maintained
      - ``LLVM=1``

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240327-llvm-docs-s390-llvm-1-619a621da467

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


