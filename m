Return-Path: <linux-kbuild+bounces-4618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171F9C396B
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 09:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 757A71C2081B
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 08:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112121591F0;
	Mon, 11 Nov 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5XzBiX3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B720B22;
	Mon, 11 Nov 2024 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312536; cv=none; b=lqbFETlyXpjmgPYiHl90uptiILMklKO9Y3M55Q4RSyyEFcimneefyoJuu3BYeoo0qPw37Fb5H3r6Jajr4RZoyRM+6hXqAPeeinmI15dN4Su72KrVVNZx2nBVmdg1H+2DGg+X5bW/ivPGGOJ2AmPjI85Pon86okKc/M32RSTVBBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312536; c=relaxed/simple;
	bh=85Iyog3gqyct6e3PZpARDGMRXtwa/eLkH9q7andW/cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VkwHO6CO76UWRBGggC/h4g6haATs762HpleXQlyEtPRSgNlSo/xy82glsn6gw+kQkweyid3NfVvIAF3C1chAyTeQOLcW8nxPCCPRIMaT6CFKKKEYiyp5U/Fs4l+3LfzLZPOlmDtrBkxQDKag54bslp/PRFHH35zLn2+4aUiVx78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5XzBiX3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312534; x=1762848534;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=85Iyog3gqyct6e3PZpARDGMRXtwa/eLkH9q7andW/cM=;
  b=i5XzBiX3dWJCwPd/JVgo/TQ7qQI+IvH+qD7M0AZ7+HEByeiGl8Q3R+JV
   /M6OYwwzYijtI3pp36xm0Y5lDd0RxK9NgEIC4SZ6UuxuhzNcj+/O9/nbm
   8VfSf+pMWnRmo76t+/rcoCoaSz6G3AaYwNaDs9/HTwZFEqYpq5jf0ebX9
   UsVLF2Kdvu+usyiEWpOKWFwxX8Z1ZNElKDq+Phfem4z3/Brr8NPDl52FD
   NPEfVnctEJvhFiFaveASY8TYoCmUUGTdAsVULGvHkchdXxtV2vRcSRhB2
   9JRgYliJSTRDi3SZAlogliYK5XqB2akP7K4i+uueKpLCfyjSIUoHLkubY
   w==;
X-CSE-ConnectionGUID: C3z2vFAQR9+7mG72rSWmCQ==
X-CSE-MsgGUID: o8Eb3tcMRlua77ezV0YVuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41723200"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41723200"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:53 -0800
X-CSE-ConnectionGUID: TafoUJFlSgKI4/44qPh1Vg==
X-CSE-MsgGUID: Z7tRErwnQRKsXqh0vjG4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91323637"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:52 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH net-next v5 0/9] lib: packing: introduce and use
 (un)pack_fields
Date: Mon, 11 Nov 2024 00:08:41 -0800
Message-Id: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIm7MWcC/5XOTWrDMBAF4KsYraOiX4+dVe9RslDG40TUlo0tT
 ELw3StUSk270moYZvjee7GVFk8rO1cvttDmVz+FtNhTxfDuwo2479LOlFBGCmH47PDTh1uevPc
 0dCt3oeMe0+s4DzRSiC4mhl8lICA1pEGzBM4L9f6Rwz5YoMgDPSK7pMvdr3FanrnFJvP9O1DKk
 sBNcsG79ip7sEKAEe8+RBrecBpzzKYOtLJFtEo0aANQY9PQf1r/0lLURbRONFrjNLa9bFs40Kf
 qh4RiUgHaunaojK7/tjXHtk0RbRLdSNf2RqEWZI/0vu9fgcE9W1ICAAA=
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

The majority of the "compile time" checks are placed into modpost. This is
done to enable checking ordering and overlap of the fields. An attempt was
made to implement these checks via macro in version 2 of this series.
However, the C pre-processor cannot use loops to execute compile time
checks. Without the loops, drivers were responsible for using the specific
CHECK_PACKED_FIELDS_<N> macro. We generated these macros at compile time,
but this resulted in thousands of lines of macro in the
<generated/packing-checks.h> header. To limit the size, we tried config
options to only generate the macros that are used. This resulted in even
more complexity in the drivers and the build system.

By using modpost, all of this complexity is kept in one place, minimizing
the complexity on driver authors.

Modpost can easily check the field overlap and ordering restrictions, but
it cannot easily check that the fields fit within the buffers. To do that,
modpost would need to obtain the size of the target buffer. This was
attempted in v3, but the result was a mess, as modpost had to obtain a
special symbol with the target size.

Instead, modpost now only checks the things that are simple for it to
check. The buffer size check is now handled directly by the pack_fields and
unpack_fields macros. To obtain the size, we enforce that users wrap their
buffer with an appropriate type (such as via a packed structure with a
fixed size buffer). This reduces the number of arguments, and enables easy
size checking. To allow both ascending and descending order, the first and
last elements are checked to be within the size of the buffer. Modpost
ensures that we do not allow other orderings, so we only need to check 2
places.

This version has much simpler modpost checks, as we no longer need to keep
a hash of all the symbols: each symbol is independently checked. This
reduces the amount of code even further, and avoids some other
modifications that were originally required.

This implementation is even simpler than before, and I do think modpost is
better overall. The macro checks require additional work from drivers and
might need to be extended if a user ever needs more than 50 fields.

If the enforcement of a structured type is frowned upon, I believe we could
keep the original API with a pbuflen argument and use
__builtin_choose_expr() and __is_constexpr() to determine whether to have
the checks run at compile time or run time.

I'm in favor of this modpost implementation over the previous macro based
solution. The fact that the mess of checking the fields is fairly self
contained and avoids the mess of the CHECK_* and config options is a big
win, and I think the modpost option is significantly better for this.

Pros:

 * Significantly less code to implement the checks, even if we ignore the
   generated portions in <generated/packing-checks.h>

 * The modpost checks are able to work in arbitrarily sized arrays, without
   needing to add any modification in the future. The macro implementation
   could require adding additional macros if a driver ever needed >50
   fields.

 * Keeping the size checks within pack_fields() and unpack_fields() greatly
   simplifies the modpost implementation as we no longer need to determine
   the sizes. This makes the checks extremely self contained.

 * This solution avoids needing to edit the top level Kbuild.

 * We don't need to leave 20K+ lines of code in a generated header.

 * We don't need to add extra config options.

 * Field order is enforced, which I think is useful even outside
   simplifying the overlap checks to O(N).

 * Drivers simply DECLARE_PACKED_FIELDS_(S|M) and get modpost warnings,
   without requiring a manual call to CHECK_PACKED_FIELDS*. This should
   make it easier to review, and less likely that checks are skipped.

Cons:

 * modpost doesn't have source code line information, so we can't report
   that back to the user.

 * modpost errors are reported slightly later in the compile process.

 * We have to place the packed field arrays in special sections to enable
   modpost. This is handled by DECLARE macros, so we have to ensure all
   users use these macros. I did not attempt to add a check for that in
   this series, but it could be done in principle with cocinelle or
   checkpatch.

 * These type of checks do feel somewhat ancillary to the original purpose
   of modpost.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
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

 drivers/net/ethernet/intel/ice/ice_adminq_cmd.h |  11 +-
 drivers/net/ethernet/intel/ice/ice_common.h     |   5 +-
 drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h  |  49 +---
 include/linux/packing.h                         |  43 ++++
 include/linux/packing_types.h                   |  48 ++++
 scripts/mod/modpost.h                           |   5 +
 drivers/net/dsa/sja1105/sja1105_static_config.c |   8 +-
 drivers/net/ethernet/intel/ice/ice_base.c       |   6 +-
 drivers/net/ethernet/intel/ice/ice_common.c     | 293 +++++-------------------
 lib/packing.c                                   | 285 +++++++++++++++++------
 lib/packing_test.c                              |  61 +++++
 scripts/mod/modpost.c                           |   3 +-
 scripts/mod/packed_fields.c                     | 199 ++++++++++++++++
 Documentation/core-api/packing.rst              |  59 +++++
 MAINTAINERS                                     |   2 +
 drivers/net/ethernet/intel/Kconfig              |   1 +
 scripts/mod/Makefile                            |   4 +-
 17 files changed, 725 insertions(+), 357 deletions(-)
---
base-commit: 774ca6d3bf24287ff60b7d6dd4171ebb6e47760a
change-id: 20241004-packing-pack-fields-and-ice-implementation-b17c7ce8e373

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>


