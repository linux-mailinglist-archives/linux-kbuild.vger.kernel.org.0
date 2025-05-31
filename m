Return-Path: <linux-kbuild+bounces-7318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3A3AC9C52
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 20:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42DDC9E425D
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 18:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF84A1A23B6;
	Sat, 31 May 2025 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0SKufoF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873031A23A1;
	Sat, 31 May 2025 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716344; cv=none; b=V3SPbrKpsYvo2P9TmL5QeFrYsnte/3huyYEhXjBvITiG+44TmP5rfHrhliFU05BPD89HuQkAYsgDHzWt8SwQtmO7e3y/5ymOEeHADYfWrlx4s8kKmdzbob6uNiYIIcou/hsD5Wf8VGNFBpqP103bOVN/+WCK6REX6N3kuNJcsE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716344; c=relaxed/simple;
	bh=rEWUoKbhQj+k/CWWKQA+dBxFt+hJeNJpix7vaTSCieQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTqaxFzVhsUBBWCvNSxS6qcx5hMnOXVxUO8vfohFZVvDa3hyejKScQ2STBESYE/vw0w7xWKYDUV4kzDoBKe8/L1kSuoAO84uP7beyxqVyCr0vRodhNzXjSlEfNlclf3fMQ7ykeO8WaC2JltHmf40nlBS3A9yB2Mj52nFcb7DY3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0SKufoF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5180C4CEEA;
	Sat, 31 May 2025 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748716344;
	bh=rEWUoKbhQj+k/CWWKQA+dBxFt+hJeNJpix7vaTSCieQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0SKufoFYmq1ffAgkLw20ftiqfe+0CJfXcWWO1lxrlZXaD3IJze8F0xprNFCH+wxL
	 EqD8oeyxIcyQ+c7tMIkBp9rutZPUWsNvYm+PhT6IB7AJ0MhKyLrSwUgRScXCQAdRuQ
	 RbcDB0TF/3DSHm/+xscqnoGaXlSGb4IGox4qi2T51XIyzw3L2eYWWb0Lhrq3z22Jxz
	 ZgE61kxMsRGqBN2iYwSp+ZMZMdpN1K1JYMeOKw00UltU76tYKXt65lmeR2iYKGEqBQ
	 sAn3GzAWGGm+r1h/bzO8nqYQ0iUMgH+KDCUt7QzxtXURFaRQ8kz4hNeokw4Xkf+4Uy
	 HkyZ4qn8dJfMQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] scripts/misc-check: check unnecessary #include <linux/export.h>
Date: Sun,  1 Jun 2025 03:28:22 +0900
Message-ID: <20250531183217.3844357-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250531183217.3844357-1-masahiroy@kernel.org>
References: <20250531183217.3844357-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another issue with <linux/export.h> is that it is sometimes included
even when EXPORT_SYMBOL() is not used at all.

Some headers (e.g. include/linux/linkage.h>) cannot be fixed for now
for the reason described in the previous commit.

This commit adds a warning for *.c files that include <linux/export.h>
but do not use EXPORT_SYMBOL().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/misc-check | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/misc-check b/scripts/misc-check
index 9e618e9f93f6..e280ccab6391 100755
--- a/scripts/misc-check
+++ b/scripts/misc-check
@@ -53,5 +53,17 @@ check_missing_include_linux_export_h () {
 	xargs printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
 }
 
+# If you do not use EXPORT_SYMBOL(), please do not include <linux/export.h>.
+# Currently, this is checked for *.c files, but not for *.h files, because some
+# *.c files rely on <linux/export.h> being included indirectly.
+check_unnecessary_include_linux_export_h () {
+
+	git -C ${srctree:-.} grep --files-with-matches '#include[[:space:]]*<linux/export\.h>' \
+	    -- '*.[c]' :^tools/ |
+	xargs grep --files-without-match -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_GPL_FOR_MODULES)\(.*\)' |
+	xargs printf "%s: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present\n" >&2
+}
+
 check_tracked_ignored_files
 check_missing_include_linux_export_h
+check_unnecessary_include_linux_export_h
-- 
2.43.0


