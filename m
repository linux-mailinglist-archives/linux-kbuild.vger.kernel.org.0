Return-Path: <linux-kbuild+bounces-1563-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A758A4EE2
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 14:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FA042811F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 12:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC576FE1A;
	Mon, 15 Apr 2024 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT1G/BPb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D016FE13;
	Mon, 15 Apr 2024 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713183657; cv=none; b=DYKuooGkW0xZC8/a/G48PuOS0mevLqBwRXrq/jmKcpisZ1RaLI0UVc4EmA5goAS97A+BtBhSnUs0YlPnfyFH3AK4zhEO8QO6qGLhsOVHPhtAdVdM8Em0mkwTvDb4Yn8DiBSq0tbn63G2dCe8B7GBbR4oTvOSG+ifR6Z2hIGtt8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713183657; c=relaxed/simple;
	bh=9eX7Dorhxn5NmgYg6HTuaELf/+jBReTSX1vzE2y0wKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sSxFzFGBFNUlkMGleD//nfahiwMVpWSqe+lLm4NbN9ApxMUFLDsG27Ry/Jib95cDPpAzgl4wXqpugEjIUdaWOu6dYmj2D00lq+EozlTQSsQ75mE5PUBK4KqYxDFfYo7N4rTsiz84v5IuuRXxDhLl4ScbM5p0KnMPmAF8Ra9yVrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT1G/BPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40002C2BD10;
	Mon, 15 Apr 2024 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713183657;
	bh=9eX7Dorhxn5NmgYg6HTuaELf/+jBReTSX1vzE2y0wKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZT1G/BPbNSMh3ZCBNEwiAXm4fbRIwJ9kPZOjYGWNY/HkyZQSY0ruRxm6AWE+cYdQt
	 KfrInn4GQEHhz0QTDxUF/nJdU2IV1zGjTozYC+/W2EhkiJhz663HgJd5BwRjLbWnMe
	 0zlk+xB6SZg2spnt41CFG8IGmrOvJL+SQHQ0szlxenVHQpxyf1RT8k1TJLi8embn45
	 gP7kSEDhccftWGh49Hc7541un1bFN5OY+u50M6j9/YXAvoPfWoiYmUUmvfLqv2AGWZ
	 zF3IkXEH26G9g4zqJJ4UaF37EvcxoLNHXib5hFQB/ZPPSSQW6zra6fSRabdmjG2laj
	 iwuWZnZpRxUSg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] [v3] kbuild: enable -Wcast-function-type-strict unconditionally
Date: Mon, 15 Apr 2024 14:20:36 +0200
Message-Id: <20240415122037.1983124-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240415122037.1983124-1-arnd@kernel.org>
References: <20240415122037.1983124-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

All known function cast warnings are now addressed, so the warning can
be enabled globally to catch new ones more quickly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 202e26e6f29f..1d13cecc7cc7 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -129,7 +129,6 @@ endif
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)
-KBUILD_CFLAGS += $(call cc-disable-warning, cast-function-type-strict)
 KBUILD_CFLAGS += -Wno-enum-compare-conditional
 KBUILD_CFLAGS += -Wno-enum-enum-conversion
 endif
-- 
2.39.2


