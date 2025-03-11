Return-Path: <linux-kbuild+bounces-6065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B7A5CEA5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B41FD7A1E6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656732641E9;
	Tue, 11 Mar 2025 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpN+QqzA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7E2641E3;
	Tue, 11 Mar 2025 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719738; cv=none; b=bH0/JL5hiYKSnNBRlI7FWvBvr324L6EX3hsBjEQ54z4cd+cIJQXvJAzhAUHBhlHmxKdPt1ZFI7ElLHmckR91WbuP2ZQjvswIofNvuzJgxSi79R06gsX3ZnqYFipAUr/wwGFugAsUCJBuUmW7nltQzAGpQjXubXpJg/jzadLtWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719738; c=relaxed/simple;
	bh=s+zyL0W+ZVLDk60GQXXqVimEk+8o11ddCaQA5gPslWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGgbcTxLg94lEcH51xfF/MRyJ8Md6bSbw6Ngr3eVEIbNHfkPMkAJzfTe3nw8IEH+1GWSiH/3Po+5mKz73loZcVWzEucVIpRR5f/tbcTcy3RxhgfoX9gnRas4pShKoaVrl/QkIRb2U6XWJa2FeaiFOEBrARWnU/EOZ4KchHA828o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpN+QqzA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69F5C4CEE9;
	Tue, 11 Mar 2025 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719738;
	bh=s+zyL0W+ZVLDk60GQXXqVimEk+8o11ddCaQA5gPslWU=;
	h=From:To:Cc:Subject:Date:From;
	b=hpN+QqzActWSMKGdXh2GDOZEviPxHshzk95Dn3HHslkOB0qc5A4Fhtox4A+Tx3qN8
	 CiATauxKQJj4ethtQaa36TNhDWiD63xFyFmYUb4Obg1AM54sM0jpyXSc7GAZ/EZpGj
	 ArfpNaRb2PNbJwnAWPbLPJ5Scu7RLgSU9mVDMfNqoRSNzY6jh7ZJaKjdYAy2426JPx
	 3eIkIk+wB6oq1bFlOZC9aT4g/NYtRdGjIdneNQ20bzunWQKg3/UVgCDdtYDNZrgV++
	 hOnW7CNVac91fJBe/bWWhfKxstlu+TicJjoui6ll7Bn3eU3fxopL2SWVs5t/GEpg73
	 YlIT+21tK+93g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: deb-pkg: fix versioning for -rc releases
Date: Wed, 12 Mar 2025 04:01:33 +0900
Message-ID: <20250311190212.634123-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The version number with -rc should be considered older than the final
release.

For example, 6.14-rc1 should be older than 6.14, but to handle this
correctly (just like Debian kernel), "-rc" must be replace with "~rc".

  $ dpkg --compare-versions 6.14-rc1 lt 6.14
  $ echo $?
  1
  $ dpkg --compare-versions 6.14~rc1 lt 6.14
  $ echo $?
  0

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 193e33bcb989..80ed96561993 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -167,7 +167,9 @@ version=$KERNELRELEASE
 if [ "${KDEB_PKGVERSION:+set}" ]; then
 	packageversion=$KDEB_PKGVERSION
 else
-	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/scripts/build-version)
+	upstream_version=$("${srctree}/scripts/setlocalversion" --no-local "${srctree}" | sed 's/-\(rc[1-9]\)/~\1/')
+	debian_revision=$("${srctree}/scripts/build-version")
+	packageversion=${upstream_version}-${debian_revision}
 fi
 sourcename=${KDEB_SOURCENAME:-linux-upstream}
 
-- 
2.43.0


