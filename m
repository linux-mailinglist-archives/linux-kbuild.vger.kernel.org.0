Return-Path: <linux-kbuild+bounces-7988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20711B021A9
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 18:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 728227A1DFE
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 16:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE002EF2B8;
	Fri, 11 Jul 2025 16:26:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0CE2EF2B6;
	Fri, 11 Jul 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752251170; cv=none; b=F4CgkXg2oyfezLlfBLPR6oK8KC0lWBlTTDy5JMSGCNVbjerv5PTbrUR3nwv62bam+jAY1fxAkIwxq4PzUhn5K9tEL0fIuyxIM7F6iDA5sNvDQymKIHcPzwiaaAXJVYBlCZvANf5cFf5z9McYhItQtIMyjqUSJrg3Qih+etlPYrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752251170; c=relaxed/simple;
	bh=lFtsIy/1m3SroYU84jPKnFUy4QrvbrN6+GIIQtM1Jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TOvIhoUHC5HHP/E/5iJs1Ibz1fOPf1VA8kOShNUXUv5fBV9VZcCSQqX4pSZXJCaJ0X7u06rSrmyNPmnIRJv/QTscocm/7/jeGTeYex91laxJrPiThRI7MKi++MslHtoSeVkVbjWKGOWyfMDVT8jxZPiMvDiORwI8nHWoEWlI9Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A581F16F8;
	Fri, 11 Jul 2025 09:25:56 -0700 (PDT)
Received: from u200865.usa.arm.com (unknown [10.119.38.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD4633F6A8;
	Fri, 11 Jul 2025 09:26:06 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v2 0/1] scripts: add zboot support to extract-vmlinux
Date: Fri, 11 Jul 2025 11:26:04 -0500
Message-ID: <20250711162605.545514-1-jeremy.linton@arm.com>
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


