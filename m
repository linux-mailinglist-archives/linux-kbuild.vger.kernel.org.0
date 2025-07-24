Return-Path: <linux-kbuild+bounces-8125-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69AB10BE0
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73FE73B4985
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89632DA772;
	Thu, 24 Jul 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/s4LKzR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADD92D8DBA;
	Thu, 24 Jul 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365008; cv=none; b=YbtOgEQC4Jle7/e+zjxLjCww8GexBroh1M0sFxJPCYo3pw22clMZ0Ce5p12qrMCKB7Lk8Prlwyli3HFgrigOQARS/42/jK7LM4JCPn23t4Pqo9RmcNbDi5+7pnnBHTUv/AMLrNLHzvKEH+67dabWNBITj2NFq6SBMHa1Rh39Sf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365008; c=relaxed/simple;
	bh=1iB/21lIXlfe4SY5fNdDnPing9qvMeRFAwRzkQfNa4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kH2avxxPNNm873AfU/DlYiQVWDW14tGSozogolhZV8vo4Xhr8FUWkAS55zGoOtzlu9eIHgSkUMWvgHqYbAyb/00KbhpTTebyrkEHFR73VybZEWce+ayGOxHvyZHE0yPnzLCp/xqgsAu0ifHBr2T5SQD74OCFZgLGBj0+rQ+1XXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/s4LKzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE00C4CEED;
	Thu, 24 Jul 2025 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365008;
	bh=1iB/21lIXlfe4SY5fNdDnPing9qvMeRFAwRzkQfNa4U=;
	h=From:To:Cc:Subject:Date:From;
	b=W/s4LKzRml/38b0kJ1ZmfX3qNI6rMlNYyRX8kEIjdxxgZHWi13lPTPSFEp8zc7mRg
	 Drwup1+yQlq0FFqIN4KrhO92pfbnbPSCOkPUNilcBJ5Fmh2P47jc4/x1Dl0l++Kqa4
	 aZrNyNQoVSb4LIQXwC8xzPa4s2NQEvjlq/P35yjq1/jPerIPHXerDK0aKs8NbA4A89
	 QQWNSReaA9fDiwng0ZBbeM78VNd+1KcrTJtlhassMRO25aNyXwLnjX00otQSRxnD6l
	 hacEjYCQ3Uc6+JkvYjtlcRLTKmwQlXHhEfacDNM44yHwvSwhXaeYlv2FN8pyj/EzTW
	 PDHNYozceXprQ==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v5 00/10] Add generated modalias to modules.builtin.modinfo
Date: Thu, 24 Jul 2025 15:49:37 +0200
Message-ID: <cover.1753354215.git.legion@kernel.org>
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

Masahiro Yamada (4):
  module: remove meaningless 'name' parameter from __MODULE_INFO()
  kbuild: always create intermediate vmlinux.unstripped
  kbuild: keep .modinfo section in vmlinux.unstripped
  kbuild: extract modules.builtin.modinfo from vmlinux.unstripped

 arch/s390/kernel/vmlinux.lds.S             | 10 +--
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c |  2 +-
 drivers/scsi/BusLogic.c                    |  2 -
 include/asm-generic/vmlinux.lds.h          |  2 +-
 include/crypto/algapi.h                    |  4 +-
 include/linux/module.h                     | 21 +++---
 include/linux/moduleparam.h                |  9 +--
 include/net/tcp.h                          |  4 +-
 rust/kernel/device_id.rs                   |  8 +--
 scripts/Makefile.vmlinux                   | 77 ++++++++++++++--------
 scripts/Makefile.vmlinux_o                 | 26 +-------
 scripts/link-vmlinux.sh                    |  5 +-
 scripts/mksysmap                           |  6 ++
 scripts/mod/file2alias.c                   | 34 ++++++++--
 scripts/mod/modpost.c                      | 17 ++++-
 scripts/mod/modpost.h                      |  2 +
 16 files changed, 139 insertions(+), 90 deletions(-)


base-commit: f4a40a4282f467ec99745c6ba62cb84346e42139
-- 
2.50.1


