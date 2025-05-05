Return-Path: <linux-kbuild+bounces-6957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36794AAB4E9
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 07:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9F83B6FA8
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 05:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35433446FC;
	Tue,  6 May 2025 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rz5lCF3+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7419C283FC2;
	Mon,  5 May 2025 23:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486806; cv=none; b=a4O1C6GZvXAailG2RgmjdCh3FXej23e1GuI65GbtkyHmUZwIN1SFFjOeiGJxL4F11sAPqhnBhoZnBERnzFDUfGvww2N3x1WypeVQIvNZxWX9XrgH+shRH//SvqirysEx+N2FJe2JoppGoqy6QSkuoPv5/BPGV0792hJTm5iltzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486806; c=relaxed/simple;
	bh=50o+LJ1eACnewrVR5dFUb4W6VBBY1lGHoNCIrnReK/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uYwob08nbV+LmBnHni5YBcrOYNq4ijK2TpDvFaYj5MAHOMsiqa/Iw3WAswOyPoX+r1kUQk99sL5OeyES7vlRknpPEFHQwGH+9XWNtKg5B8DFD/vq/riWSgIUeG/ZvgTwPRRsbYrmpo3Qrhkt2kIxxjc7VtAUAeUQtKK8c4Tf1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rz5lCF3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F1FC4CEE4;
	Mon,  5 May 2025 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486805;
	bh=50o+LJ1eACnewrVR5dFUb4W6VBBY1lGHoNCIrnReK/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=rz5lCF3+JoviKZKE6R5GghkIhPWf08DKqDbaby5o3IZnrJKuwhsc5pc8Z8Oe1xBCh
	 i3DlVhhELnt/IsHbmDm3PwOwn7kMDzlAyVGF8BxWooirhTzcUWwkGy9H5+K9BUH2zA
	 pmpWMZvoRso5mchUyraGYexgZZzrvKpbG57wm8gSNB7SCRhRQYv1LBnLoWDZUJ6Xnk
	 dEpTVyWXfz0XzE2NqbQtYG2LnV7hgjJjXcUjXTILVr7d3XtyzsrAOhL+UUUm7XHbCr
	 tb6UuMifY6ovOKnb95Je6dmX43g48c+UuCUWXF6IsloaMGPKLOHirDKTCGVz6fEIBc
	 AgnlYOagsrjXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 001/153] kconfig: merge_config: use an empty file as initfile
Date: Mon,  5 May 2025 19:10:48 -0400
Message-Id: <20250505231320.2695319-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
Content-Transfer-Encoding: 8bit

From: Daniel Gomez <da.gomez@samsung.com>

[ Upstream commit a26fe287eed112b4e21e854f173c8918a6a8596d ]

The scripts/kconfig/merge_config.sh script requires an existing
$INITFILE (or the $1 argument) as a base file for merging Kconfig
fragments. However, an empty $INITFILE can serve as an initial starting
point, later referenced by the KCONFIG_ALLCONFIG Makefile variable
if -m is not used. This variable can point to any configuration file
containing preset config symbols (the merged output) as stated in
Documentation/kbuild/kconfig.rst. When -m is used $INITFILE will
contain just the merge output requiring the user to run make (i.e.
KCONFIG_ALLCONFIG=<$INITFILE> make <allnoconfig/alldefconfig> or make
olddefconfig).

Instead of failing when `$INITFILE` is missing, create an empty file and
use it as the starting point for merges.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/merge_config.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 72da3b8d6f307..151f9938abaa7 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -105,8 +105,8 @@ INITFILE=$1
 shift;
 
 if [ ! -r "$INITFILE" ]; then
-	echo "The base file '$INITFILE' does not exist.  Exit." >&2
-	exit 1
+	echo "The base file '$INITFILE' does not exist. Creating one..." >&2
+	touch "$INITFILE"
 fi
 
 MERGE_LIST=$*
-- 
2.39.5


