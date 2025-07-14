Return-Path: <linux-kbuild+bounces-8008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26336B04AAC
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Jul 2025 00:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A6187A6B3D
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 22:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BFD27780E;
	Mon, 14 Jul 2025 22:29:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12E1276054;
	Mon, 14 Jul 2025 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752532168; cv=none; b=MUH0eQfdecPLYifeGW1drhSbSfSt46d0rTtlR/2kdkCLNK1MxV+jUTpnlZJ5i3p/fxttWhvEt80TDYWlbl69UoK7P/8PpN57YFqejYdThoBPmKGlczXH8hghhbFttGSVqWh431F14/Cf01QSeYzDYncP6Cu+U2bA9jjk47stxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752532168; c=relaxed/simple;
	bh=sUyCSZ6BPtfUKz7Oy8Ay4cvVYF8vBw4Kbxh1AXXA6To=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahEzvqsVdhqvNn7BDJovKDLEkNSZGP4o4KRntGzJL0gt+/jC9McwT5wPNkuf8bzvs7zRG8ZKJjHf/MSeG8YkGWIdEEHGpOrPPfOYF1874FC7u0coznXHkIQphc9aOP0ECV/eKT0FI/m/zwPP9W8Eg7siOOIvOfMEf7TP/YDz6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7D38152B;
	Mon, 14 Jul 2025 15:29:16 -0700 (PDT)
Received: from u200865.usa.arm.com (unknown [10.119.38.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BBE23F6A8;
	Mon, 14 Jul 2025 15:29:25 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v3 0/1]  scripts: add zboot support to extract-vmlinux
Date: Mon, 14 Jul 2025 17:29:22 -0500
Message-ID: <20250714222923.1107205-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enhance the extract-vmlinux script for use with EFI_ZBOOT
compressed images.

v2->v3: Tweak line break, drop \ continuation

v1->v2:
	Merge 'file' check with its 'if' condition.
	Invert the resulting condition and move copy block inside. 
	Tweak the commit message to clarify arm/arm64
	as well as how recent of a 'file' command is needed.

Jeremy Linton (1):
  scripts: add zboot support to extract-vmlinux

 scripts/extract-vmlinux | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.50.1


