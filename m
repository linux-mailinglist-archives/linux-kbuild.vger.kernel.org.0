Return-Path: <linux-kbuild+bounces-2320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 463669246EB
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 20:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCB82B2484E
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 18:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA79D1C9EC2;
	Tue,  2 Jul 2024 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uclj5Mqv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7101C9EA8;
	Tue,  2 Jul 2024 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943419; cv=none; b=sIs6RPCEwiokD9mHp8xa0iTLznoxK7LeCqxMDXGafDQAL/JclVma8t2JWr3lulnHKRs/aGQ2tQkWgvxjsl7aawilSB7CI5JB+gs5zGn4R095QdYjZiYP1pG/FSDjgJ6ioVR2SKvqCSzI6qRaBwG0tH+z54IjH81zhwBNNI0vxwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943419; c=relaxed/simple;
	bh=I6yGZ06EQ0HwMlVgzB8aX/mn7PxmDl5I3IEYPTsQ2ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjH6fvx1K+FzqZyEZDUONlilPALQ4IV4w7QA8NAjy4/3xtjTUnlekXv4cY0cxOV2a2jNXQM4Zg0tkZyuizp28vbh9n4ZcTnJ3NHK8nHltO4oatsRNdmjL4YRoPhHMP/8phiCllBfNkYFdxP9kVXE0yNZ3mfr8ESA+FQoC43iIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uclj5Mqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC0BC4AF0C;
	Tue,  2 Jul 2024 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943419;
	bh=I6yGZ06EQ0HwMlVgzB8aX/mn7PxmDl5I3IEYPTsQ2ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uclj5Mqvp98cAU/s/uZx3peqd7GSvcao28AYERKUBAwMFP1lauHsg4DENbWKXqic0
	 thJgOM1RrkR0I9s/+alHUvty/f6hwE9IH43/1xjSvIJ6zMHORqGALigBvJVcHmGBSn
	 b8m1rhovJvz62naxxFkvtP4nyWEBfpt243aq4zcgXkjshfZ4dnb6XXickTkRu01h/8
	 Ac4Ehs6ODLVomYT3cJc2bUi+w0JFSBeErJPumVgHJYM72GQTyZ0SeyjcX91jBoU02l
	 K1QWkJjfu3f00AI3cBl05A+ef79iJ+dzF82RAf09zdilVtr47QYUlfhks/UJa88qA3
	 FTCPMfG64/I3A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 2/3] kbuild: deb-pkg: remove support for "name <email>" form for DEBEMAIL
Date: Wed,  3 Jul 2024 03:02:41 +0900
Message-ID: <20240702180332.398978-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702180332.398978-1-masahiroy@kernel.org>
References: <20240702180332.398978-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d5940c60e057 ("kbuild: deb-pkg improve maintainer address
generation") supported the "name <email>" form for DEBEMAIL, with
behavior slightly different from devscripts.

In Kbuild, if DEBEMAIL has the form "name <email>", it will be used
as-is for debian/changelog. DEBFULLNAME will be ignored.

In contrast, debchange takes the name from DEBFULLNAME (or NAME) if set,
as described in 'man debchange':

  If this variable has the form "name <email>", then the maintainer name
  will also be taken from here if neither DEBFULLNAME nor NAME is set.

This commit removes support for the "name <email> form for DEBEMAIL,
as the current behavior is already different from debchange, and the
Debian manual suggests setting the email address and name separately in
DEBEMAIL and DEBFULLNAME. [1]

If there are any complaints about this removal, we can re-add it,
with better alignment with the debchange implementation. [2]

[1]: https://www.debian.org/doc/manuals/debmake-doc/ch03.en.html#email-setup
[2]: https://salsa.debian.org/debian/devscripts/-/blob/v2.23.7/scripts/debchange.pl#L802

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
 - New patch

 scripts/package/mkdebian | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 589f92b88c42..83c6636fadb8 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -125,21 +125,15 @@ gen_source ()
 rm -rf debian
 mkdir debian
 
-email=${DEBEMAIL}
-
-# use email string directly if it contains <email>
-if echo "${email}" | grep -q '<.*>'; then
-	maintainer=${email}
+user=${KBUILD_BUILD_USER-$(id -nu)}
+name=${DEBFULLNAME-${user}}
+if [ "${DEBEMAIL:+set}" ]; then
+	email=${DEBEMAIL}
 else
-	# or construct the maintainer string
-	user=${KBUILD_BUILD_USER-$(id -nu)}
-	name=${DEBFULLNAME-${user}}
-	if [ -z "${email}" ]; then
-		buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
-		email="${user}@${buildhost}"
-	fi
-	maintainer="${name} <${email}>"
+	buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
+	email="${user}@${buildhost}"
 fi
+maintainer="${name} <${email}>"
 
 if [ "$1" = --need-source ]; then
 	gen_source
-- 
2.43.0


