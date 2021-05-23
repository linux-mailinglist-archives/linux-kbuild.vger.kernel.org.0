Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E3938D876
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 May 2021 05:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhEWDR2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 May 2021 23:17:28 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:31542 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhEWDR1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 May 2021 23:17:27 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14N3EZeq018750;
        Sun, 23 May 2021 12:14:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14N3EZeq018750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621739679;
        bh=yQ9w4TSAy8UVu05BtUBECTlQLJZ8sT3s93YT5liH1yA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OqYRWjHWJk6jOr+vOGqyiBpZ0mqejkTKbrJwE7PdJ9a3M24oDUPffLj2ak9qjNhOr
         nf3GicHIWbCakbZMHlZiakNmrZACtqaauA9SupfyvlvPbQ8jgMnDrnL7BT95BL8SKK
         P67hYU3oDiCt1RRmutQUKF2MbnbUax272MbsAePfWOmmHTcRqUC7gSBjjfWAom7MK2
         fh7VhyR2VkUsuHJJcsORK5nOxnu6fo7MCWQjPo8iE7XsZUm2MtJm0xgIBscW9mA7nd
         YNjmXjkHn3zrqB8MgXTXeK0tFMh32ix20/qd2z2LU0VB0BL3p7zbAqo/13Slv1JSbz
         s84jSBNDbslsw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Maennich <maennich@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] scripts/setlocalversion: factor out 12-chars hash construction
Date:   Sun, 23 May 2021 12:14:27 +0900
Message-Id: <20210523031428.164186-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210523031428.164186-1-masahiroy@kernel.org>
References: <20210523031428.164186-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Both of if and else parts append exactly 12 hex chars, but in
different ways.

Factor out the else part because we need to support it without relying
on git-describe. Remove the --abbrev=12 option since we do not use the
hash from git-describe anyway.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/setlocalversion | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 6865df6699c8..62c0bcce1575 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -59,24 +59,12 @@ scm_version()
 			fi
 			# If we are past a tagged commit (like
 			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
-			#
-			# Ensure the abbreviated sha1 has exactly 12
-			# hex characters, to make the output
-			# independent of git version, local
-			# core.abbrev settings and/or total number of
-			# objects in the current repository - passing
-			# --abbrev=12 ensures a minimum of 12, and the
-			# awk substr() then picks the 'g' and first 12
-			# hex chars.
-			if atag="$(git describe --abbrev=12 2>/dev/null)"; then
-				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),substr($(NF),0,13))}'
-
-			# If we don't have a tag at all we print -g{commitish},
-			# again using exactly 12 hex chars.
-			else
-				head="$(echo $head | cut -c1-12)"
-				printf '%s%s' -g $head
+			if atag="$(git describe 2>/dev/null)"; then
+				echo "$atag" | awk -F- '{printf("-%05d", $(NF-1))}'
 			fi
+
+			# Add -g and exactly 12 hex chars.
+			printf '%s%s' -g "$(echo $head | cut -c1-12)"
 		fi
 
 		# Check for uncommitted changes.
-- 
2.27.0

