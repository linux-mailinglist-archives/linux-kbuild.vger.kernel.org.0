Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F7B271881
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 00:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgITWs3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 18:48:29 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36170 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgITWs3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:From:Reply-To:Subject:Content-Type:
        Content-ID:Content-Description:X-Debbugs-Cc;
        bh=SZWE1kiinGwQdARrE4mBAtoiwoi5O1q3arbNxNYE6Uo=; b=CQz5d9OQJ2Cd30pr+HbUDvaDbY
        OKV7ATmDsJfNyux/IEw1XC8HNfvZA5WplGAxi+Kkvj1gVYcwAqdRvhFIavls9sgn0EWoObBXL9e5M
        G7GoTUzscjynP+qh7zXp6ZK00hJzqERJB7JYzpJaIUgLZxUpzqRVeD/HFKGXghCLp3pmai4wMPg2W
        F7dMq3PPN5EatjeyHW+j8Q2YgBZTiCTCL2qodoNJcae1TJRUQ+G17uZyqVYUgZnYjIzFLz/QBkMi4
        s2O/Au/XNYksv5J5MNH7osBP46O01LjgVVabD+IYiQlY8273ORzJNwEz7MqiH1kBL2JnOv++FUdvB
        vkUnYWlg==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7nB-0002cc-66; Mon, 21 Sep 2020 00:26:45 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] builddeb: Add support for all required debian/rules targets
Date:   Mon, 21 Sep 2020 00:25:53 +0200
Message-Id: <20200920222556.10002-5-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
References: <20200920222556.10002-1-guillem@hadrons.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These have been required by the Debian policy for a while, even though
the tooling can detect and workaround their omission, but are a hard
requirement when using rootless builds.

Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/mkdebian | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 69f2a6d7f009..dae6c0ec0bd6 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -231,11 +231,15 @@ cat <<EOF > debian/rules
 
 srctree ?= .
 
-build:
+build-indep:
+build-arch:
 	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
 	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile
 
-binary-arch:
+build: build-arch
+
+binary-indep:
+binary-arch: build-arch
 	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
 	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg
 
-- 
2.28.0.297.g1956fa8f8d

