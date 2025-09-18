Return-Path: <linux-kbuild+bounces-8847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 853AFB83713
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 10:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F591461A52
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 08:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43E12F0677;
	Thu, 18 Sep 2025 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIOYQOd4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445D2EFD88;
	Thu, 18 Sep 2025 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182816; cv=none; b=i9kKSPEu1XAqYlJcq9whzanHby3nOLKWPrqA1Ov9E3qRRAbs2E2ccqzMuKqx+ffTu/9bqAk8wwn6/EnpMq87pK4TGvZ4ryDmyfA6hVsWfmfMMkK/4ZMF5Rdg+NOabn87wzybaE8TPmuTzJ43OE4nSpbZD+AGXrwk4wGiNTEqtmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182816; c=relaxed/simple;
	bh=Ns1mKExqRXm12zo1+ws58dTagf2ok6afaTxISy8NecA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lCgyZ3mfFq14ChDgkxPmtEr25ZXYYQZGrizVUBhEnRDsvhl/wL9RHDxVPbjdWHo6dCIpSiHou79Aujhoh9vERMoKoDt5GdgmzlLwyu7Wng/7Y9hLUvHGW6xjMwiQrO5fsZGMgJ3APyZkASKJf6ucPzB4IanfqNi+Rtwj2mpfu+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIOYQOd4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240C2C4AF0B;
	Thu, 18 Sep 2025 08:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758182816;
	bh=Ns1mKExqRXm12zo1+ws58dTagf2ok6afaTxISy8NecA=;
	h=From:To:Cc:Subject:Date:From;
	b=OIOYQOd4V92yHglEPqiPlQh+qWfgkNX0u2K9J+Le13Q7rfGnaZa3l1DerzpjFCpUz
	 05WYvOd4BoHnnuLoelKVxDbcQpcQEjM66Zy3Oq15HbObnTBSSxidVkX341Xfug10KV
	 nB15ytBjll/8cDJIgzB/DqKJGyBUspwCMrlCTrwlE+BCs0UqtvxuW+G4Bza2pZeSfv
	 IC8oLHCYw9WYVDklI4ttYIr8T7tOuk/CHX5aMFmZE22i6H8vsCJYDMge1CZWWs/28F
	 RxLFXsEkmgTEoFgYkiF8G/mLr8CtHRNmkQvaekp0h9IbbJxrSyud1p+PHPM7+EY08B
	 SWRIV9JI6dUjg==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v8 0/8] Add generated modalias to modules.builtin.modinfo
Date: Thu, 18 Sep 2025 10:05:44 +0200
Message-ID: <cover.1758182101.git.legion@kernel.org>
X-Mailer: git-send-email 2.51.0
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
- v8:
  * Fix build warnings about unused variable.
  * Fix objcopy "warning: empty loadable segment detected ...".
  * v7: https://lore.kernel.org/all/cover.1755535876.git.legion@kernel.org/

- v7:
  * Reorder patches to avoid unnecessary linker warnings on s390.
  * Drop the patch for pinctrl since it's already been applied.
  * v6: https://lore.kernel.org/all/cover.1755170493.git.legion@kernel.org/

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


Alexey Gladkov (5):
  s390: vmlinux.lds.S: Reorder sections
  scsi: Always define blogic_pci_tbl structure
  modpost: Add modname to mod_device_table alias
  modpost: Create modalias for builtin modules
  kbuild: vmlinux.unstripped should always depend on .vmlinux.export.o

Masahiro Yamada (3):
  kbuild: always create intermediate vmlinux.unstripped
  kbuild: keep .modinfo section in vmlinux.unstripped
  kbuild: extract modules.builtin.modinfo from vmlinux.unstripped

 arch/s390/kernel/vmlinux.lds.S    | 10 ++--
 drivers/scsi/BusLogic.c           |  4 +-
 include/asm-generic/vmlinux.lds.h |  2 +-
 include/linux/module.h            | 18 +++++--
 rust/kernel/device_id.rs          |  8 ++--
 scripts/Makefile.vmlinux          | 79 ++++++++++++++++++++-----------
 scripts/Makefile.vmlinux_o        | 26 +---------
 scripts/link-vmlinux.sh           |  5 +-
 scripts/mksysmap                  |  6 +++
 scripts/mod/file2alias.c          | 34 +++++++++++--
 scripts/mod/modpost.c             | 15 ++++++
 scripts/mod/modpost.h             |  2 +
 12 files changed, 131 insertions(+), 78 deletions(-)


base-commit: aa943a280e88e3585ed5a06d55e78c4123fcead3
-- 
2.51.0


