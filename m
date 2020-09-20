Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEAD271872
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 00:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgITWsG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 18:48:06 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36128 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgITWsG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:06 -0400
X-Greylist: delayed 1872 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 18:48:05 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:From:Reply-To:Subject:Content-Type:
        Content-ID:Content-Description:X-Debbugs-Cc;
        bh=qR0aA1ILo219UxZA4I+9nPDxNAWvQo/xQuUk7hDl8A8=; b=gbiT4Lzz3LzFHjcOeMLAj5rNFn
        o+kSCLL2K54m4VKDksaBRw81+rRKyuSkaE7SCSjTlUdYpkqs4lm6QMbItw/uyR1szzrbJeZd++IGt
        VwAUhLAK5sWCV3j432gqlosxZkXAmqmm1OZFzfWpa71iksz9Xm2K+az0Yr/IyEt4D/y43zP0Mop3z
        R06LfUUe0wr2nOqdCCVsTaEM2QTQFbx0xpowWkWE2Yl4YUelmgPdRvGRhZP8R7Hr02vUtI2Lptl7O
        Zdvsj4+RSd0ZWTvfvdjW2FdTGqQtps6BLjB/HBSNEJp5fPRp2lycdnKzPw/HEAx9NS/c1YxI5YeNr
        cnKqmNQg==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7n2-0002cE-1m; Mon, 21 Sep 2020 00:26:36 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] builddeb: Pass -n to gzip for reproducible packages
Date:   Mon, 21 Sep 2020 00:25:50 +0200
Message-Id: <20200920222556.10002-2-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
References: <20200920222556.10002-1-guillem@hadrons.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We should not be encoding the timestamp, otherwise we end up generating
unreproducible files that cascade into unreproducible packages.

Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6df3c9f8b2da..b14abbe5afbb 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -31,7 +31,7 @@ create_package() {
 	mkdir -p "$pdir/usr/share/doc/$pname"
 	cp debian/copyright "$pdir/usr/share/doc/$pname/"
 	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
-	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
+	gzip -n -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
 	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
 		| xargs -r0 md5sum > DEBIAN/md5sums"
 
-- 
2.28.0.297.g1956fa8f8d

