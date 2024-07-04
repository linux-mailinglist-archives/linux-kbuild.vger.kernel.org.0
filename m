Return-Path: <linux-kbuild+bounces-2372-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA59279F7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 17:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D36828B03B
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704D51AE861;
	Thu,  4 Jul 2024 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLXdo3cp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E2182D8;
	Thu,  4 Jul 2024 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106681; cv=none; b=VUl4rf/KUNym0S6WMxmxd9wI7BZpOvrBmyuKMxQamEBneifECWzJe00FWzvxMD2cz4XiHPl5q2Bv0h9ec8vVGR+YA+VSYM1f5M+qGGzxUGweWGzdPME4puutGQrAEYa8hTMMdVe8+Ns/3Y2yZeAhXJkRoW+x7/TQy5S2rZFWUuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106681; c=relaxed/simple;
	bh=WHYGuOqdGVCRppQhu6+DVQnNoHe/r6TKCd2h94xPz/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkPKut/O65KOsmxUmCtFxtpsooE6n06f62lThaOF4Zw9VeZZtmjT6NviqkSWzIhtlYK7CIEGgB72Pyo+uti/2ew44eDqKkQ4By0yhDR+Mh5qaydUObrObIbRk1uZ5LVOUIV2CGwYUztuJLvxasDSSNLQxwFr8oCB9Nk7UqMS3Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLXdo3cp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFF6C3277B;
	Thu,  4 Jul 2024 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720106680;
	bh=WHYGuOqdGVCRppQhu6+DVQnNoHe/r6TKCd2h94xPz/s=;
	h=From:To:Cc:Subject:Date:From;
	b=XLXdo3cpgVM9aXIZZjxnWAK56VtbC45CowVpS36UKYOq2bupL2lsKaVIcBoFEJMqG
	 AD7TGYpU/YwNBvREg0bkaqK2fH2hilIn/7cdc2frgQB2OZPqvbHODk3wOGZSklLhei
	 K88qo5kl6QkrYAFfscp9S9tTYwkkV7hDGn83drfCgeeL5IhgV1zrqRyjd7fyHfXkAh
	 LDzo0gG9QB2c1X9R7oiAMJoR0uxmilqwNm1Ind04j5vgo3hJxYVdc6Htepa57pHDln
	 OeC0w5yG9BW5jXIhEkX97vZQyANYiGvFzAr1fsHXfEHxz1Nw28+SR9kew6fpHfzEHI
	 /Af/gciykg+XA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: deb-pkg: use default string when variable is unset or null
Date: Fri,  5 Jul 2024 00:23:32 +0900
Message-ID: <20240704152400.1527619-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

${DEBFULLNAME-${user}} falls back to ${user} when DEBFULLNAME is unset.
It is more reasonable to do so when DEBFULLNAME is unset or null.

Otherwise, the command:

  $ DEBFULLNAME= make deb-pkg

will leave the name field blank.

The same applies to KBUILD_BUILD_USER and KBUILD_BUILD_HOST.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 0cc1913aad30..196b14e8ad47 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -125,12 +125,12 @@ gen_source ()
 rm -rf debian
 mkdir debian
 
-user=${KBUILD_BUILD_USER-$(id -nu)}
-name=${DEBFULLNAME-${user}}
+user=${KBUILD_BUILD_USER:-$(id -nu)}
+name=${DEBFULLNAME:-${user}}
 if [ "${DEBEMAIL:+set}" ]; then
 	email=${DEBEMAIL}
 else
-	buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
+	buildhost=${KBUILD_BUILD_HOST:-$(hostname -f 2>/dev/null || hostname)}
 	email="${user}@${buildhost}"
 fi
 maintainer="${name} <${email}>"
-- 
2.43.0


