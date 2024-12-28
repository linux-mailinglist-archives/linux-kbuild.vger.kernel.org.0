Return-Path: <linux-kbuild+bounces-5262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE99FDB8A
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 16:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3234018807FC
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2827E161311;
	Sat, 28 Dec 2024 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CC9+1b2m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092638FAD;
	Sat, 28 Dec 2024 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735400809; cv=none; b=TZ2s8k+6C4HTxN9fy/WfIg4zNRl8qDWLQxlxFDRNNeXTmhfn3qtaLSZpcap5nN3p0jpNgNixHgV+JANGewjZruPs3aSNuZ7Oz+vLQuPnoKvOMr7Mq2a+EtPBqi/pIQaytHoNZV301vCSDhT4kUqQwsjmKvjTE+bDfrn0OYbcduM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735400809; c=relaxed/simple;
	bh=EbioE1fYXi25EGTAgK8ipToHTGMcZ/tvkSAzZwbL9M0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=keIx7uuiwBtAU5FP3L/PnPWEdrHZhx3tOU8YDwtjYRjTodkcPp0g1o+1YV7JED95K7vU2QkzreOQfgcVZH7SAZ4Dp9OSnzx/74Fb2bmB9Hay2psLQ75Jsm6AcUc89x3xaHz242O2KjGZ7l/kqCq8Ch+HmUtAc4J/QiJzaFH7Ozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CC9+1b2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2526BC4CECD;
	Sat, 28 Dec 2024 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735400808;
	bh=EbioE1fYXi25EGTAgK8ipToHTGMcZ/tvkSAzZwbL9M0=;
	h=From:To:Cc:Subject:Date:From;
	b=CC9+1b2mqhcQr632sQMJc2oAlq4p6NrLV0accP7RSq4N2CIhXyKKB4tR1XNzUaI0h
	 iv4RQ0KMI4WEKYWGlk0QLARiC3/xmz3Hwg1QJGOV5I97cNeLLmiBHrB4OSHeO95DDR
	 A0IBlPap59z2AGIHRRh9NFc/qh0a1nTSDH4A8Y8XTDzXnYVRFzzE84bwFQ1L3ufZ3k
	 W3YCvtMjS0boDoPaurSOpOVfoxCeu69uKYc/g6ZV9NSk5s/ArnVZp2mVW6TWrP0pni
	 dPpDP6jUhE80THiAcl/oTqpkMuIvxG6eJEYsQctCQQrv+s+knB7BuWq8o4z7uIy9J3
	 j7rnG1Fsmhj4w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-modules@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 0/2] Fixups before RUST modversions support
Date: Sun, 29 Dec 2024 00:45:27 +0900
Message-ID: <20241228154603.2234284-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


 - Fix s32 -> u32
 - Make printf() format consistent

Matthew Maurer is adding more 's32'.

I need to fix the code now.
Otherwise, I would need to fix more places.



Masahiro Yamada (2):
  module: get symbol crc back to unsigned
  modpost: zero-pad CRC values in modversion_info array

 include/linux/module.h   |  4 ++--
 kernel/module/internal.h | 10 +++++-----
 kernel/module/main.c     |  2 +-
 kernel/module/version.c  |  2 +-
 scripts/mod/modpost.c    |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.43.0


