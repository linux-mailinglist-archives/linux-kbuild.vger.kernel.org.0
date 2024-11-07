Return-Path: <linux-kbuild+bounces-4555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 487989C0F52
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD10B1F21CE9
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB6A2178F2;
	Thu,  7 Nov 2024 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMXFNU7i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E6185B56;
	Thu,  7 Nov 2024 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009044; cv=none; b=RW9Km3gB6rg6yHLiH4vo7XOGESJYukKzXJJn4myKe0zgOynwQNcTnuJmiBe0fIoe7HC1jfWUGbQCQ3HNx5pX9H3Uxo14CWYGc8sdQ+CT4vlWItdoOPEGzX/p9kD1OBnb0KdjXBjKJnvSxl7VB6SXEptJIHxvAMs+c3L795Myu1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009044; c=relaxed/simple;
	bh=OGModTI+rfDZaPKu3z3IphpihOm8dRhSHkRWJ33XsIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rpKapyyVvxZPLUd1squ806RQpEP3MXpJLEIYYu5mzvwa0ncw16bPOhC6He5guQc0Q7Ed/7oMdWVFyj6zrRDzYSgiTUhSrOcZC1QGRi5NPjrFP/48/u2jh6y+NMbEP7tYdCqATtmGfhzQJu98ftQC336aO/nJP3D/YVDNewk7H6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMXFNU7i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731009043; x=1762545043;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=OGModTI+rfDZaPKu3z3IphpihOm8dRhSHkRWJ33XsIQ=;
  b=kMXFNU7ib6MkHSXA0AfOZIjff1+4mJuro5T2d8U+8lr5SOVqsF+kJcaP
   RIOAr/AX9rePeq1JsuvNjghDguiKkDUetgMEyt/5OH/kOlRmF3oEhq3n+
   feMrry0cK+dAwyxnOitg3pxje8gFB0grXNd+r5L91ra3QzwBhnRKyBU+t
   bfqcDUa7xGLPk4tsz2q6qyC/nb7aiBaR7geuGiWFlvQgyjyivmnV/5O8d
   CcEmpHchHeVNGBakkQO2kbLepQqDQKi1jRfFU6audSKORvvrIvzjSw+n0
   bIyj8WszjUdFOVfnD9V8WzNthga418knaUVL2++xX+BbNOBPptjQcNY++
   w==;
X-CSE-ConnectionGUID: t3i2NA5eRkGJvMA56VDE5Q==
X-CSE-MsgGUID: yzQcHlwYSTe7sEGzLsNqfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30647670"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30647670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
X-CSE-ConnectionGUID: a5xAPL2LQlOp2M1ym+5yog==
X-CSE-MsgGUID: E0+cYLUKSEKlWW1rOH404Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="86009611"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next v3 0/9] lib: packing: introduce and use
 (un)pack_fields
Date: Thu, 07 Nov 2024 11:50:31 -0800
Message-Id: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgaLWcC/5XOwWrDMAwG4FcpPs/Dsp0q2WnvMXZwFaUVS5wQm
 9BR8u4z3mGFnXISPxLfr4dKvAon9XZ6qJU3STLHEtzLSdEtxCtr6UtW1lgPxni9BPqSeK1TD8J
 jn3SIvRYqp9My8sQxh1wYfQEkJG7ZoVMFXFYe5F7LPlTkrCPfs/osm5ukPK/f9YsN6v63EOBI4
 Qba6L67wICNMejNu8TM4yvNU63Z7BNtm0O0LTQ6j3imtuX/tPujwZwP0a7Q1PjgqBug6/CZ3vf
 9B0D9cIqkAQAA
To: Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, netdev <netdev@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>
X-Mailer: b4 0.14.1

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
    runtime, via additional checks added to modpost. This saves wasted
    computation time *and* catches errors in the field definitions early,
    rather than only after the offending code is executed.

The actual packing and unpacking code still uses the u64 size
variables. However, these are converted to the appropriate field sizes when
storing or reading the data from the buffer.

The compile time checks do add some complexity to modpost. An attempt was
made originally to implement the checks with C macros. Unfortunately, the C
pre-processor cannot generate loops. Without loops, drivers are responsible
for calling the correct CHECK macro. In addition, this required
several thousand lines of macro to provide variants for the sizes expected
to be used. While this was possible to be generated, it still meant a lot
of mess spreading to the drivers, Makefile, and build process.

To enable modpost checks, the packed field arrays are placed into a special
section of the binary, using DECLARE_PACKED_FIELDS_(S|M) macros. This makes
it relatively easy for drivers to enable. We can also easily implement
checkpatch or cocinelle scripts to detect raw usage of the packed fields
structures if this becomes a problem.

The modpost logic is implemented by scanning the symbols to find entries
in the relevant ".rodata.packed_field_s" or ".rodata.packed_field_m"
sections. This must be extended if we ever add support for a
"packed_field_l" or similar, though this seems unlikely.

In order to enforce buffer size, modpost must have access to the size of
the target buffer. This is achieved by having DECLARE_PACKED_FIELDS* also
generate a const variable with the buffer size. I tried a couple of other
methods of obtaining the size, but this was the simplest one. I think it
may be possible to have the unused symbols discarded, but I did not attempt
this.

I'm in favor of this modpost implementation vs the macros attempted in
previous iterations.

Pros:

 * Significantly less code to implement the checks, even if we ignore the
   generated portions in <generated/packing-checks.h>

 * The modpost checks are able to work in arbitrarily sized arrays, without
   needing to add any modification in the future. The macro implementation
   could require adding additional macros if a driver ever needed >50
   fields.

 * Checks are relatively self contained to modpost. We don't need to edit
   the top level build Kbuild, we don't need to add 50 extra config
   options, and we don't need to leave behind a 20K+ LOC generated header
   file.

 * The fields are required to be fully ordered, by detecting whether the
   first two fields indicate ascending or descending order. This enables
   driver authors to order the fields in which ever ordering is most
   natural for their data. The macro checks did a full overlap check but
   did not enforce order.

 * Drivers simply DECLARE_PACKED_FIELDS_(S|M) and get modpost warnings,
   without requiring a manual call to CHECK_PACKED_FIELDS*. This should
   make it easier to review, and less likely that checks are skipped.

Cons:

 * modpost doesn't seem to have a way to track the symbols back to line
   numbers, so we can't report that info to the user.

 * modpost errors are reported slightly later in the compile process.

 * To maintain the full set of checks, we need to export the size of the
   target buffer to modpost, which I implemented with an additional
   variable that is otherwise entirely unused.

 * We have to place the packed field arrays in special sections to enable
   modpost. This is handled by DECLARE macros, so we have to ensure all
   users use these macros. I did not attempt to add a check for that in
   this series, but it could be done in principle with cocinelle or
   checkpatch.

 * A fair amount of boilerplate code is required to extract the relevant
   data from the symbol definitions, including special casing to handle the
   potential endian issues when using packed_field_m.

 * These type of checks do feel somewhat ancillary to the original purpose
   of modpost.

The fact that the mess of checking the fields is fairly self contained and
avoids the mess of the CHECK_* and config options is a big win, and I think
the modpost option is significantly better for this.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
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

 drivers/net/ethernet/intel/ice/ice_adminq_cmd.h |  11 +-
 drivers/net/ethernet/intel/ice/ice_common.h     |   5 +-
 drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h  |  49 +---
 include/linux/packing.h                         |  29 +++
 include/linux/packing_types.h                   |  54 +++++
 scripts/mod/modpost.h                           |  19 ++
 drivers/net/dsa/sja1105/sja1105_static_config.c |   8 +-
 drivers/net/ethernet/intel/ice/ice_base.c       |   6 +-
 drivers/net/ethernet/intel/ice/ice_common.c     | 297 +++++-------------------
 lib/packing.c                                   | 285 +++++++++++++++++------
 lib/packing_test.c                              |  61 +++++
 scripts/mod/modpost.c                           |  18 +-
 scripts/mod/packed_fields.c                     | 294 +++++++++++++++++++++++
 Documentation/core-api/packing.rst              |  55 +++++
 MAINTAINERS                                     |   2 +
 drivers/net/ethernet/intel/Kconfig              |   1 +
 scripts/mod/Makefile                            |   4 +-
 17 files changed, 828 insertions(+), 370 deletions(-)
---
base-commit: a84e8c05f58305dfa808bc5465c5175c29d7c9b6
change-id: 20241004-packing-pack-fields-and-ice-implementation-b17c7ce8e373

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>


