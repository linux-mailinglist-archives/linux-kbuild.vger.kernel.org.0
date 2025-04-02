Return-Path: <linux-kbuild+bounces-6388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1BA78EF3
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 14:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20EE23AE1BE
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 12:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0410E23A560;
	Wed,  2 Apr 2025 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crKExMJN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D274123A984;
	Wed,  2 Apr 2025 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598033; cv=none; b=bbFEDBzjSSLhHQ0nD9Ghym/6rnItoEtrhqkCGiVo8xzlCZXG6XX2DM4uEcTbEXu3Vzdm7ykOgN4Km8AEa8+BWfkpanzVA/gizTjc830AdPcQ5YbME0bJm2mPKksaAAQGcLL/N3WeR4+2JColLZoW25DdHplOXJGha8OHmb7/1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598033; c=relaxed/simple;
	bh=Gj2aB2JqBmqXPO78uNKvPd/l2jxWVWHHMd/bVheBitA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hEx2TLlCSgddCu+BxrZ9AKoCtTqtFNtFf9/CrMOJQhBjnIfal8RCbrF9BjWe7YvhG0Mk5hzK9K4aL+Q/Zj/1aLeKEtHUOS2tC68QaYvPRGBY9lt8If0Qmg3c0ED2kZv9manSAfrIguaHlWmpO2mSvV9ctjCR3KNh8DG/ChiYGog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crKExMJN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743598032; x=1775134032;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gj2aB2JqBmqXPO78uNKvPd/l2jxWVWHHMd/bVheBitA=;
  b=crKExMJNpdG7L2HgKhXEHICfSSc4GioVkXOrJl2ORe4d1X9H0KZcaEem
   1DrIR6VJ3DPhtMcp4vN2kzCGl4qrny3ie29nOd46X8I2is/m9IQd0sLAK
   fAmn3BpR+6Wfl9iUFjNC/GMPS7LlzNjgMYjRX9/kkT5D1/Q8c6gPKG/UP
   65zpava5oklBP8vaXtYm9qwINiCYFLYGT5n3ajJHlLGM4b/n57YTPA8Ly
   A5kMh27LgusJPv+j1TV6eKfx2/4bqL+qYWobP/ilojl2FscR9mClDaTEs
   6xDc3kqEDtYq41+924a7T2E50rPvlUfkr/dxKXwkGT3sgSz8FvcLiLR/c
   Q==;
X-CSE-ConnectionGUID: jOauTDryR6aLOG6ACu8KXg==
X-CSE-MsgGUID: T98rO5pyQWqHSNXeV2V6CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953435"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55953435"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:11 -0700
X-CSE-ConnectionGUID: gPJlNXYbQLS1e6N7A65cbg==
X-CSE-MsgGUID: xLyK4DAQQ6S0hlKPTGmchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127180570"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com,
	Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] kbuild: resurrect generic header check facility
Date: Wed,  2 Apr 2025 15:46:52 +0300
Message-Id: <20250402124656.629226-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Another go at hiding the turds.

In v1 [1] I hid the build artifacts under .hdrtest subdirectories, one in each
$(obj) directory, but the feedback from Linus [2] was to have one top level
directory for this.

This is not possible without turning the whole thing back into a generic header
check facility. Personally, I think this is a good thing. Just look at patches
2-4, it's great.

The main reason we've been doing this in the subsystem/driver level at all is
the opposition from the kbuild maintainer. We'd very much like for Masahiro to
support us in our efforts, but without that support, we're limited to hacking in
the subsystem/driver Makefiles.

BR,
Jani.


[1] https://lore.kernel.org/r/20250401121830.21696-1-jani.nikula@intel.com

[2] https://lore.kernel.org/r/CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com


Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org


Jani Nikula (4):
  kbuild: add generic header check facility
  drm: switch to generic header check facility
  drm/i915: switch to generic header check facility
  drm/xe: switch to generic header check facility

 drivers/gpu/drm/Kconfig           |  2 +-
 drivers/gpu/drm/Makefile          | 15 +--------------
 drivers/gpu/drm/i915/Makefile     | 14 ++------------
 drivers/gpu/drm/xe/Makefile       | 10 ++--------
 drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++++
 include/drm/Makefile              | 15 +--------------
 init/Kconfig                      | 25 +++++++++++++++++++++++++
 scripts/Makefile.build            | 13 +++++++++++++
 scripts/Makefile.lib              |  7 +++++++
 9 files changed, 56 insertions(+), 49 deletions(-)

-- 
2.39.5


