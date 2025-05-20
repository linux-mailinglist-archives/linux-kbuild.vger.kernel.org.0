Return-Path: <linux-kbuild+bounces-7172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E8ABD983
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 15:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C8981788AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 13:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF5F242D79;
	Tue, 20 May 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpDW12As"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A06242D63;
	Tue, 20 May 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748003; cv=none; b=dZZgCSgBRj4USU90hBEKvmDn4KIw+sxdMNTJTbI2S1xWuS2J+M2kbT4CISOWgWjrCeK8pP5OJf7gB8Tq0oia8X1ti4m1tpr9Y2b8xqLZXe1ubgrFyEyFR3XaTt4ZXB7TCcjPYGQGl7TgNP+yT56vPkxmMX3HzaEZeb3KlHWVaY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748003; c=relaxed/simple;
	bh=rwZGlHunc9416As6oU5f4UP+1bKxmdgbimljbSoNk7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=akOx0EeOpMsCtQRhWM6oDzKiETPrmfm5TZucNFfv5yg3nyBDsWpUKyn3cMHWT7GvLjivje1e94imM3hv6ocKON88pGuzKUgIOxok9nDTTeH4h0wCHfQwcoe3JLabrQ+3LI1xuvWLHQAfXZIRaWeDQ/zZ+y4+zxOI7nExdc3jrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpDW12As; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04225C4CEF5;
	Tue, 20 May 2025 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747748003;
	bh=rwZGlHunc9416As6oU5f4UP+1bKxmdgbimljbSoNk7Q=;
	h=From:To:Cc:Subject:Date:From;
	b=QpDW12AslYoMpMkQg2P2S4svRuVTYYxh/BShLbYDUVCwJ5SjLapzO7XFsTQ8cLO3K
	 MQUD0/tIj+MJNFVvJ4oUwJbUyxR0s3ts3BYXe7EWn/iRIOeyiE25Zkabv9hDGUQNfJ
	 Xg/ceSUPYebUf9kSn+zS0l4Ldkzuo6ZwMwZtV3SWI2Batm0lLCxCXNi/vJRXSODNCk
	 SdAHIHVsdXAes0jkMDtzD/ItIirEHbepTNfOL984zWxqKvUGTU2m9jyy8zCgVoqBwa
	 DjH2azDf2eAOH9AcS3guaUIJBuHg547hNkl+NXtfthwQ28PRilOzjp15RZiKnN17mk
	 Q217d+l1ZRTmQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHN5r-00000006n8I-1FOM;
	Tue, 20 May 2025 15:33:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Akira Yokosawa <akiyks@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Some kernel-doc fixes
Date: Tue, 20 May 2025 15:33:05 +0200
Message-ID: <cover.1747747695.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Hi Jon,

Let me consolidate some patches on a single PR to make life simpler
for you. Those should address Stephen and Akira's concerns with
regards to KernelDoc class usage via sphinx kerneldoc.py extension.

Patch 1:	don't let Sphinx suppress errors/warnings;
Patch 2:	fix a KeyError when trying to acess data from non-existing files;
Patch 3:	add try/except blocks to avoid crashes when handling bad
	kernel-doc markups;
Patch 4:	makes Lore and kernel-doc ML receive patches related
	to kernel-doc.py and get_abi.py.

Patches 1 to 3 were already submitted on separate series. Patch 4 is new.

Regards,
Mauro

Mauro Carvalho Chehab (4):
  docs: kerneldoc.py: don't use Sphinx logger
  scripts: kernel-doc: prevent a KeyError when checking output
  docs: kerneldoc.py: add try/except blocks for kernel-doc class errors
  MAINTAINERS: update linux-doc entry to cover new Python scripts

 Documentation/sphinx/kerneldoc.py | 27 ++++++++++++++++++++++-----
 MAINTAINERS                       |  5 ++++-
 scripts/lib/kdoc/kdoc_files.py    |  4 ++++
 3 files changed, 30 insertions(+), 6 deletions(-)

-- 
2.49.0



