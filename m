Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2AE138D870
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 May 2021 05:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhEWDRO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 May 2021 23:17:14 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:31290 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhEWDRO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 May 2021 23:17:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14N3EZep018750;
        Sun, 23 May 2021 12:14:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14N3EZep018750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621739678;
        bh=EozTG0s/RtaXpm/aA8ObyMpK/kGXwNVN+pnqwf4BJcg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F69IR33kSgatparCS970+P2mk7OPcyIXS15FBwd36Z6MEE7TG+vdgBjLMhx518ZZZ
         10aNNKbXUJzeBXrqV6sQinp/uQWA4u0C3xxXn9z5EXHNTTvsywnX5/2NQ7lQq4vKqx
         GY1EWo4tkc+zSB2A4m2SMv0k6Zqh9KDWCUU1Yu8GBQXRMi5QEi43IEGupEkvvqOiX3
         MEX9JHxCl/9wx00agbA08n15crTDXiy6ouwgwRjJy31iukZDu5HtzHC39LloU/yOzV
         A7a4QzhqOU8B7OK780BMt7NH0u2KTOiqQzdHYKiz2HEO3NV1jeJfhI4qlnK7R+GS/u
         dVHL+gq8h82dg==
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
Subject: [PATCH 3/5] scripts/setlocalversion: add more comments to -dirty flag detection
Date:   Sun, 23 May 2021 12:14:26 +0900
Message-Id: <20210523031428.164186-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210523031428.164186-1-masahiroy@kernel.org>
References: <20210523031428.164186-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script stumbled on the read-only source tree over again:

 - a2bb90a08cb3 ("kbuild: fix delay in setlocalversion on readonly
   source")

 - cdf2bc632ebc ("scripts/setlocalversion on write-protected source
   tree")

 - 8ef14c2c41d9 ("Revert "scripts/setlocalversion: git: Make -dirty
   check more robust"")

 - ff64dd485730 ("scripts/setlocalversion: Improve -dirty check with
   git-status --no-optional-locks")

Add comments to clarify that this script should never ever try to write
to the source tree.

'git describe --dirty' might look as a simple solution for appending
the -dirty string, but we cannot use it because it creates the
.git/index.lock file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/setlocalversion | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index f3084d6bbb22..6865df6699c8 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -80,6 +80,10 @@ scm_version()
 		fi
 
 		# Check for uncommitted changes.
+		# This script must avoid any write attempt to the source tree,
+		# which might be read-only.
+		# You cannot use 'git describe --dirty' because it tries to
+		# create .git/index.lock .
 		# First, with git-status, but --no-optional-locks is only
 		# supported in git >= 2.14, so fall back to git-diff-index if
 		# it fails. Note that git-diff-index does not refresh the
-- 
2.27.0

