Return-Path: <linux-kbuild+bounces-8458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43253B2664F
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 15:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198E41CC6A52
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626262FE05B;
	Thu, 14 Aug 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp932hix"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A02FD7B1;
	Thu, 14 Aug 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176876; cv=none; b=u8Lg/phRH7F4/d6WGWyF666EkhwoACrplsolSTln5eNe3H++RmpJbx0Cou62ZDjR5dtDtDDFjzggu3HZgPgOmGT2M1rvBkUqVaDGIE8wqUM5rBcr3mWqpdkk3tHKzYvqg9kbF/1vTVe9VEXl/HY6VJJ+m4y/djpEe+MVjVVSvC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176876; c=relaxed/simple;
	bh=i/ET7s7Tj1J84FEGP9UbodHwBPcPrdFt5gh6RmuE2DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpBQYsxo7kYm4L1jPONsaCjxk2pnWfPKOtCIjyMKAWYrtyZ5yIZgF/u4WHkxJaw+65CqO5pyXxlwHy8olN+y5ecqrXlftffXj9h1bAx2nrCWkiiR/0W+nPb6rU2iKPbl+N2gTcVff4sEGyThKoIeElfbGR3UbHnD4k9D8uLhi3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp932hix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694D1C4CEED;
	Thu, 14 Aug 2025 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755176875;
	bh=i/ET7s7Tj1J84FEGP9UbodHwBPcPrdFt5gh6RmuE2DU=;
	h=From:To:Cc:Subject:Date:From;
	b=kp932hixuF3y2+woIsJTmdXBF1aSyCxYiRTq6XZA4/d+56vvUBb56i1B4b/jfcHEJ
	 PiDtciLfO1Xi96U8SbYP8GNR2z34JsKDano7vJXqtGVtuM0BWZAu0UG/y5kJKWVw8W
	 LZ9LoL49F8lD4wTGo98ZcsnXMQGbdq0Vi143jWMjKSV55kfeMWp3PD7fSLSVGs/4rp
	 dENEiaoQkP51fIIKRFMnjTvjRkrtyPGAMHFYdhNZKoz7njX4QNH1gwsBA6S6UtS5Ya
	 b8SQXnWIDdeWT4w6o5MVzlJyo6dfuC70t16wjoJaiJrd2yqEfpP9Iwq2RYV3FAWvCt
	 xsVJ9wvUH9Tag==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v6 0/9] Add generated modalias to modules.builtin.modinfo
Date: Thu, 14 Aug 2025 15:07:08 +0200
Message-ID: <cover.1755170493.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The modules.builtin.modinfo file is used by userspace (kmod to be specific) to
get information about builtin modules. Among other information about the module,
information about module aliases is stored. This is very important to determine
that a particular modalias will be handled by a module that is inside the
kernel.

There are several mechanisms for creating modalias for modules:

The first is to explicitly specify the MODULE_ALIAS of the macro. In this case,
the aliases go into the '.modinfo' section of the module if it is compiled
separately or into vmlinux.o if it is builtin into the kernel.

The second is the use of MODULE_DEVICE_TABLE followed by the use of the
modpost utility. In this case, vmlinux.o no longer has this information and
does not get it into modules.builtin.modinfo.

For example:

$ modinfo pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
modinfo: ERROR: Module pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30 not found.

$ modinfo xhci_pci
name:           xhci_pci
filename:       (builtin)
license:        GPL
file:           drivers/usb/host/xhci-pci
description:    xHCI PCI Host Controller Driver

The builtin module is missing alias "pci:v*d*sv*sd*bc0Csc03i30*" which will be
generated by modpost if the module is built separately.

To fix this it is necessary to add the generated by modpost modalias to
modules.builtin.modinfo. Fortunately modpost already generates .vmlinux.export.c
for exported symbols. It is possible to add `.modinfo` for builtin modules and
modify the build system so that `.modinfo` section is extracted from the
intermediate vmlinux after modpost is executed.

---
Notes:
- v6:
  * Rebase to v6.17-rc1-16-g8742b2d8935f to pick up the fixes made by Masahiro Yamada.
  * Fix an issue on i386 configs caused by the use of string_32.h.
  * v5: https://lore.kernel.org/all/cover.1753354215.git.legion@kernel.org/

- v5:
  * Rebase to v6.16-rc6-281-gf4a40a4282f4 to pick up the fixes made by Masahiro Yamada.
  * Attempt to fix linker warning on s390.
  * Fix typo in pinctrl/meson found by the kernel test robot.
  * v4: https://lore.kernel.org/all/cover.1750511018.git.legion@kernel.org/

- v4:
  * Rework the patchset based on top of Masahiro Yamada's patches.
  * Add removal of unnecessary __mod_device_table__* symbols to avoid symbol
    table growth in vmlinux.
  * rust code takes into account changes in __mod_device_table__*.
  * v3: https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.org/

- v3:
  * Add `Reviewed-by` tag to patches from Petr Pavlu.
  * Rebase to v6.15.
  * v2: https://lore.kernel.org/all/20250509164237.2886508-1-legion@kernel.org/

- v2:
  * Drop patch for mfd because it was already applied and is in linux-next.
  * The generation of aliases for builtin modules has been redone as
    suggested by Masahiro Yamada.
  * Rebase to v6.15-rc5-136-g9c69f8884904
  * v1: https://lore.kernel.org/all/cover.1745591072.git.legion@kernel.org/


Alexey Gladkov (6):
  scsi: Always define blogic_pci_tbl structure
  pinctrl: meson: Fix typo in device table macro
  modpost: Add modname to mod_device_table alias
  modpost: Create modalias for builtin modules
  kbuild: vmlinux.unstripped should always depend on .vmlinux.export.o
  s390: vmlinux.lds.S: Reorder sections

Masahiro Yamada (3):
  kbuild: always create intermediate vmlinux.unstripped
  kbuild: keep .modinfo section in vmlinux.unstripped
  kbuild: extract modules.builtin.modinfo from vmlinux.unstripped

 arch/s390/kernel/vmlinux.lds.S             | 10 +--
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c |  2 +-
 drivers/scsi/BusLogic.c                    |  4 +-
 include/asm-generic/vmlinux.lds.h          |  2 +-
 include/linux/module.h                     | 18 +++--
 rust/kernel/device_id.rs                   |  8 +--
 scripts/Makefile.vmlinux                   | 77 ++++++++++++++--------
 scripts/Makefile.vmlinux_o                 | 26 +-------
 scripts/link-vmlinux.sh                    |  5 +-
 scripts/mksysmap                           |  6 ++
 scripts/mod/file2alias.c                   | 34 ++++++++--
 scripts/mod/modpost.c                      | 15 +++++
 scripts/mod/modpost.h                      |  2 +
 13 files changed, 130 insertions(+), 79 deletions(-)

-- 
2.50.1


