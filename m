Return-Path: <linux-kbuild+bounces-2530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D2931717
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B68271C212AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 14:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F55018E767;
	Mon, 15 Jul 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcKE3Egt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A433FD;
	Mon, 15 Jul 2024 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054738; cv=none; b=MKcH/Nybi/hFRJ87LuX4UoyCUCSCEQknQJ+Izo2Vw/Y/srr/7LvIXpxwsvLS41hGPMbEkRYcjOkL+c60iTbN59/lIiEQ2v3LbbfuD25Xe6ZncEID2Y9GjUAN6VwlgGDIhNDMmvOpdQLewDKZ60cnCzx7vRnKrkZAY4hXXyh9EMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054738; c=relaxed/simple;
	bh=X04A38J1ASypU0/eMsW50ZZ5MX80zSI0G0Nm5VTCPv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrlcnwQMPtUBBiLJMaehYcaSRQLihpJtAbrQEKKO6W/6SFbisHQpxMAnfwJ6OA+/NKsrQJb23Rh58BfaIvWXtkbuF2Lpd/4uooHWPVsAVwMxGcb1tw+syik1Tz87+2TCQYPksa0qLFu0ahR7Te4F4p7+Y/qXg7DFsp++tim0vaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcKE3Egt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7BCC32782;
	Mon, 15 Jul 2024 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721054737;
	bh=X04A38J1ASypU0/eMsW50ZZ5MX80zSI0G0Nm5VTCPv4=;
	h=From:To:Cc:Subject:Date:From;
	b=rcKE3Egt2LL42KuB6UqPDrFsqy05/RHQVw8exp6XkvQThXgm3rJUaT5iu1gTbsVFU
	 Nki9f+QoPCcXHVkSzKodJjPyvT5Mr0Fkpg6ErN8N5aAhD83SWxDDqqS8mXA/wxCZc2
	 D+f/nNMANDd12G5pfrvqp3FK1FVIrKgJ7qvrCnmHQPTeBGeV1z2IdKo/OCROaRlYHp
	 IwHfkbfqs9a+Z7Lz+cdYOJ8FcgQvQCc/vv4euwYziphikJtywPtLzWxz4PqnaJB41s
	 fwHUu7zD75B02Q5WFa3wz+/abrCUHx+e/0IPe7SZH+fJkpIAI2sWGExorO1g8PaXnA
	 +ia5u5kqLaVrg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/3] fortify: fix various issues in test_fortify Makefile
Date: Mon, 15 Jul 2024 23:45:22 +0900
Message-ID: <20240715144529.101634-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Applicable to v6.10 tag.



Masahiro Yamada (3):
  fortify: use if_changed_dep to record header dependency in *.cmd files
  fortify: refactor test_fortify Makefile to fix some build problems
  fortify: move test_fortify.sh to lib/test_fortify/

 MAINTAINERS                                   |  1 -
 lib/.gitignore                                |  2 -
 lib/Makefile                                  | 38 +------------------
 lib/test_fortify/.gitignore                   |  2 +
 lib/test_fortify/Makefile                     | 25 ++++++++++++
 {scripts => lib/test_fortify}/test_fortify.sh |  0
 6 files changed, 28 insertions(+), 40 deletions(-)
 create mode 100644 lib/test_fortify/.gitignore
 create mode 100644 lib/test_fortify/Makefile
 rename {scripts => lib/test_fortify}/test_fortify.sh (100%)

-- 
2.43.0


