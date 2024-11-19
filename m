Return-Path: <linux-kbuild+bounces-4711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42E9D1C36
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 01:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258571F21204
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 00:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC8A139E;
	Tue, 19 Nov 2024 00:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiMVWM6X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D876175B1;
	Tue, 19 Nov 2024 00:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731975828; cv=none; b=pzj+04h0cT1ndewKHCLQ86WhsiSe3YWDgWjToDCmcshG/5vPiL02QO8Xd+Sm5t8Px9dHwkWT36OcEtf/lUMZnRCV0V5bW0aJe05nDvG0W5mCjGcKgQmrn8Edd1YjZHTbXhJD5xhND+2XlUwdC34MQGDrhk3hF9dcMFT4EBm+j94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731975828; c=relaxed/simple;
	bh=qxnLl53zQfJqF6mCn539db/hjWs8y+cjALac33d/YoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dt3PU226Y0bflbzdCmQWicmu4qCrffmADvTWwvXQi4OTIbhUGaL2znonbzA+KwcruIZfvyNfgY1Bt+3Jgg3JzMb8dyAmOzVg+oyZ2iX6DY6g0PTOpMFUdpP3JsSO/EI+/m3EVfk7eo+DZPXTx5r/53PgPVUO8YsPqjU/abeMaos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiMVWM6X; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731975826; x=1763511826;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=qxnLl53zQfJqF6mCn539db/hjWs8y+cjALac33d/YoM=;
  b=DiMVWM6XaECaiDjILaveEIAMbeAmEHpAyG+1fHMmSzUBEHBJzr6dSCQX
   fjtJnaL5LphMUHRwc4K34BFCg3ZPrf/PHSUlU2xt5gG24jQbwlkK3Jc+P
   F15TdbWRTh35VKxyUQUThWGQehF4xmRdxQm3vvqig7yr1sjEcksuOtBTU
   TMQliqKVhD8eX7RR6MLal5MK1kGOZY7YLf9T12nvUfYcDgtr8h2iCot21
   vPmZc7HvgghWzKdreULsWU8/TEdnnNanC8M6iLUuqdeuNzRJzI5tM/x0q
   GP/myKsO+bfrUj/u+Z4J5GV+AGvtgwLTFGDeZpuz1GpFZZJ/4je+L0FLK
   w==;
X-CSE-ConnectionGUID: R/1fXhuqSeSC5ubyHUm0Ew==
X-CSE-MsgGUID: B/UyIsPTTI+LJ42Onvp4Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31892412"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31892412"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:45 -0800
X-CSE-ConnectionGUID: 60oXhcp/R5SbBlc8tsJdCw==
X-CSE-MsgGUID: JF3tdnRjQ72Wgx7XQwfC7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89162713"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:45 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next RFC v6 0/9] lib: packing: introduce and use
 (un)pack_fields
Date: Mon, 18 Nov 2024 16:23:37 -0800
Message-Id: <20241118-packing-pack-fields-and-ice-implementation-v6-0-6af8b658a6c3@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInaO2cC/5XRzWrDMAwH8FcpPtfD3453Ggz2ALuOHhxFac0SJ
 yQmdJS8+9yMsdCdfBLC4vcX8o3MOAWcyfPhRiZcwhyGmBtzPBC4+HhGGprcE8GE4owpOnr4DPG
 8VdoG7JqZ+tjQAHm0HzvsMSafMkNrbsECViitJBkcJ2zDdQv7IBETjXhN94f3t1dyyvUS5jRMX
 9syC9/GfnI5L8ldOGW0cTVvrWbMKvYSYsLuCYZ+i1nEjha6iBaZtlJZa6Cq8D8t/2jOTBEtMw1
 aeQmu5c7ZHX08/JK2mBQWtDEehJLmcVu137YqolWmK+5dqwRIhvqR1ju68Pv0nWbA8p0dmnp/i
 NO6rt8rvp6VtAIAAA==
To: Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, netdev <netdev@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>
X-Mailer: b4 0.14.1

I'm sending v6 as RFC hoping to get feedback on the macro implementation
used in this version. I hope to receive feedback so that I can use the
time while the merge window is closed to address any remaining comments.

This series improves the packing library with a new API for packing or
unpacking a large number of fields at once with minimal code footprint. The
API is then used to replace bespoke packing logic in the ice driver,
preparing it to handle unpacking in the future. Finally, the ice driver has
a few other cleanups related to the packing logic.

The pack_fields and unpack_fields functions have the following improvements
over the existing pack() and unpack() API:

 1. Packing or unpacking a large number of fields takes significantly less
    code. This significantly reduces the .text size for an increase in the
    .data size which is much smaller.

 2. The unpacked data can be stored in sizes smaller than u64 variables.
    This reduces the storage requirement both for runtime data structures,
    and for the rodata defining the fields. This scales with the number of
    fields used.

 3. Most of the error checking is done at compile time, rather than
    runtime, via CHECK_PACKED_FIELD macros.

The actual packing and unpacking code still uses the u64 size
variables. However, these are converted to the appropriate field sizes when
storing or reading the data from the buffer.

This version returns to the C pre-processor macro checks, rather than use
of external tools. To limit the amount of generated code and ease the
driver burden, we now enforce ordering (same as with v5), where the fields
must be in ascending or descending order. This reduces the overlap checks
from O(N^2) to O(N), and reduces the amount of generated code from 20K
lines to 3K lines.

I also refactored to place the generator script in
scripts/gen_packed_field_checks.c, and no longer automatically generate at
compile time. This avoids needing to mess too much with the top level build
system, at the expense of saving the macros in git. I think the reduction
to 3K lines is a bit more within reason vs the 20K lines from v2.

This version returns to the 5-argument format of pack_fields and
unpack_fields, but now enforces that the passed pbuflen is a compile-time
constant via __builtin_constant_p(). This ensures we can still perform the
size checks, but keeps the API flexible rather than forcing users to always
wrap their buffer in a struct typedef. I think this is acceptable, and
enforcing a compile-time known size is a reasonable constraint.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
Changes in v6:
- Revert to macro checks similar to v2.
- Add a __builtin_choose_expr() based macro to automatically select the
  appropriate size macro.
- Keep the pbuflen check separate from the main loop check, similar to v5.
- Link to v5: https://lore.kernel.org/r/20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com

Changes in v5:
- Fix printf format specifier for the sym->st_size
- Link to v4: https://lore.kernel.org/r/20241108-packing-pack-fields-and-ice-implementation-v4-0-81a9f42c30e5@intel.com

Changes in v4:
- Move the buffer size checks to (un)pack_fields() macros.
- Enforce use of a sized type of the packed buffer, removing the now
  unnecessary pbuflen argument of (un)pack_fields().
- Drop exporting the buffer size to modpost.
- Simplify modpost implementation to directly check each symbol in the
  handle_packed_field_symbol() function. This removes the need for a hash,
  and is ultimately much simpler now that modpost doesn't need the size of
  the target buffer.
- Fix the width check to correctly calculate the width and compare it
  properly.
- Refactor modpost messages to consistently report the module name first,
  the symbol name second, and the field number 3rd.
- Correctly implement overlap checks in the modpost, rather than only
  checking field ordering.
- Link to v3: https://lore.kernel.org/r/20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com

Changes in v3:
- Replace macro-based C pre-processor checks with checks implemented in
  modpost.
- Move structure definitions into  <linux/packing_types.h> to enable reuse
  within modpost.
- Add DECLARE_PACKED_FIELDS_S and DECLARE_PACKED_FIELDS_M to enable
  automatically generating the buffer size constants and the section
  attributes.
- Add additional unit tests for the pack_fields and unpack_fields APIs.
- Update documentation with an explanation of the new API as well as some
  example code.
- Link to v2: https://lore.kernel.org/r/20241025-packing-pack-fields-and-ice-implementation-v2-0-734776c88e40@intel.com

Changes in v2:
- Add my missing sign-off to the first patch
- Update the descriptions for a few patches
- Only generate CHECK_PACKED_FIELDS_N when another module selects it
- Add a new patch introducing wrapper structures for the packed Tx and Rx
  queue context, suggested by Vladimir.
- Drop the now unnecessary macros in ice, thanks to the new types
- Link to v1: https://lore.kernel.org/r/20241011-packing-pack-fields-and-ice-implementation-v1-0-d9b1f7500740@intel.com

---
Jacob Keller (6):
      ice: remove int_q_state from ice_tlan_ctx
      ice: use structures to keep track of queue context size
      ice: use <linux/packing.h> for Tx and Rx queue context data
      ice: reduce size of queue context fields
      ice: move prefetch enable to ice_setup_rx_ctx
      ice: cleanup Rx queue context programming functions

Vladimir Oltean (3):
      lib: packing: create __pack() and __unpack() variants without error checking
      lib: packing: demote truncation error in pack() to a warning in __pack()
      lib: packing: add pack_fields() and unpack_fields()

 Makefile                                        |    4 +
 drivers/net/ethernet/intel/ice/ice_adminq_cmd.h |   11 +-
 drivers/net/ethernet/intel/ice/ice_common.h     |    5 +-
 drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h  |   49 +-
 include/linux/packing.h                         |   37 +
 include/linux/packing_types.h                   | 2831 +++++++++++++++++++++++
 drivers/net/dsa/sja1105/sja1105_static_config.c |    8 +-
 drivers/net/ethernet/intel/ice/ice_base.c       |    6 +-
 drivers/net/ethernet/intel/ice/ice_common.c     |  293 +--
 lib/packing.c                                   |  285 ++-
 lib/packing_test.c                              |   61 +
 scripts/gen_packed_field_checks.c               |   38 +
 Documentation/core-api/packing.rst              |   58 +
 MAINTAINERS                                     |    2 +
 drivers/net/ethernet/intel/Kconfig              |    1 +
 scripts/Makefile                                |    2 +-
 16 files changed, 3336 insertions(+), 355 deletions(-)
---
base-commit: d7ef9eeef0723cc47601923c508ecbebd864f0c0
change-id: 20241004-packing-pack-fields-and-ice-implementation-b17c7ce8e373

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>


