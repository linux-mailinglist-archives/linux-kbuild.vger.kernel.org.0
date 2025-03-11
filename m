Return-Path: <linux-kbuild+bounces-6064-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC1A5CE6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19D757A32B7
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF751EBFE1;
	Tue, 11 Mar 2025 19:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7s3CDEC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079568F6E;
	Tue, 11 Mar 2025 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719691; cv=none; b=QyaxXPHH85XQmlglm3vfSYMwyPCKyMIyEbTK6cJnimhQqT++89LjKfOkScXZ+iMAuKnWrHZkczikMI0nInRR2sbs6ZGm2VS1eyb2+pWVoF0zblXS5wuakglDekERc4fX459jM+D8dTON+Jxv4kTzSjakG5h+jwhYDyZdJpOGJD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719691; c=relaxed/simple;
	bh=BUF4xSypC2t8o3tulFgEX6iA/FCqAgmrCSl1j5OVhu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PnxJusVEkIyFdxbEAU4NxWc6vpRh3kjpZsWtALfLfIt9PyNqKrqGFN5aQt3FZbQY6iaP4PA6JFJodAgllu5grRzRlEX43rs/rWVpUfHFM4IlzUMW29lbO44D0Vn3Tp3eT6DkYCqLVTMwyfBo1zusjCQjUDuOvJ+baLqf41F62bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7s3CDEC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B26C4CEE9;
	Tue, 11 Mar 2025 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719690;
	bh=BUF4xSypC2t8o3tulFgEX6iA/FCqAgmrCSl1j5OVhu0=;
	h=From:To:Cc:Subject:Date:From;
	b=G7s3CDECZhb1W/qBk+70tp8uu2JUl+ABxWpU1qIMOxGwI+NTJUtVh3zpTBUIfMgDY
	 /QpcYVSkn5AntC+9xERFHgMG5bixLRkry4cJr/p0k15DLZZajGlj8l56DSG3X9YBB8
	 DFKNPEQQRO5BmVAy7CkoLSB044jlv1Q+UoczfPNjoVUUWXJqeXFdp0IYgOCSQUw/SX
	 eThyGfJLHz1jbdRSNcehTd0GhISWTjjibdTRYdmEfR80dELe8NBJVMGCdemHGG+Bh2
	 FcvO9qrekVyMA25gxIMcVIr0o1ReOXAVYXqFZJExesmpHZuMRIjcqSKrXePm6AKT9Z
	 mSOybVc8gSGBg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: deb-pkg: require debian_revision when creating source package
Date: Wed, 12 Mar 2025 04:00:26 +0900
Message-ID: <20250311190124.634007-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Debian Policy [1] specifies the version format as follows:

    [epoch:]upstream_version[-debian_revision]

Here, the presence of the debian_revision part indicates a non-native
package, while its absence indicates a native package.

Kbuild adopts the source format 3.0 (quilt), meaning the kernel is a
non-native package and therefore requires the revision portion.

This commit prevents the creation of an invalid source package when
KDEB_PKGVERSION contains no hyphen.

[1]: https://www.debian.org/doc/debian-policy/ch-controlfields.html#version

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index b6dd98ca860b..193e33bcb989 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -94,6 +94,14 @@ set_debarch() {
 # Create debian/source/ if it is a source package build
 gen_source ()
 {
+	# The Debian Policy requires -debian_revision portion in the version.
+	# Since the source format 3.0 (quilt) is used here, a hyphen is
+	# required in the version.
+	if [ "${KDEB_PKGVERSION:+set}" ] && ! echo "${KDEB_PKGVERSION}" | grep -- '-..*'; then
+		echo "error: KDEB_PKGVERSION must include a hyphen to create a source package" >&2
+		exit 1
+	fi
+
 	mkdir -p debian/source
 
 	echo "3.0 (quilt)" > debian/source/format
-- 
2.43.0


