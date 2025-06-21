Return-Path: <linux-kbuild+bounces-7599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E762AE293F
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 15:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08C943B3B60
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 13:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C6D4120B;
	Sat, 21 Jun 2025 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRaMfz+/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70272DDC1;
	Sat, 21 Jun 2025 13:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514255; cv=none; b=ThQy7HTPS1elin/aY0/ZjDu88DSOpYdb80wUXzEHbsZIwoo+p2TcXejkSMM3lOy1AdycS6hEM22je1EV4EHZDMU64sG5O8g0V+pQCV8E5hZmfCyxupCJOc65+yJs8GEiI4Y9cZ1H3X/aJ9/smf66ISmpqVz+zPvRyiuXPptHClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514255; c=relaxed/simple;
	bh=ID7rjaE4ykN+fwkjvNTq6vv6yfCyYfVW7wahp8XmlUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1JJL0gkfw9bRn6jdLvffBcLw4DquEdYlTms4RRSPQKx8QdvphHar3wwffZxcxh4UnCSCVMjqOLI0aivLDTb5VPK+rQKyD3QskcQPbZ1tGmvC7T8cN6geWDDBqJetQWaT84gBfhUVdYz5J0pb8B/pOO4HqTuSTqpcqZ420Ov36w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRaMfz+/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B62C4CEE7;
	Sat, 21 Jun 2025 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750514255;
	bh=ID7rjaE4ykN+fwkjvNTq6vv6yfCyYfVW7wahp8XmlUE=;
	h=From:To:Cc:Subject:Date:From;
	b=dRaMfz+/QwayoSc09I81w3rRWTBbhVPP3Gwcpl4sDv3QqhcqZODVA31iRbfq6SwCq
	 YolgwDJd0LK9hKxPw/pIess9wEKNBx3KumKidug7lcoQiCfB6phSeEbe7PJyULpGOg
	 ha9rj1aUtT1oo0PsVS+fvLVukPLl1wn+XpV6PgEHeBedx3ejc11lzn/T9hADd1bh2R
	 sEnWlXiCkZ5R7zgMtMyWe9HS1RpG8dBvHPxRlNE0FxdDml5boVve+cfITQTC0M0/+1
	 1fW9oYL9Y6G9foE+RF0fng+zIJ5BmU7swp/w/NduVldTQxf/lMEUscAK4/Z84pwuDP
	 7R3iwdJXnTKKA==
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
	linux-scsi@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v4 0/7] Add generated modalias to modules.builtin.modinfo
Date: Sat, 21 Jun 2025 15:57:12 +0200
Message-ID: <cover.1750511018.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
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
modules.builtin.modinfo.

Fortunately modpost already generates .vmlinux.export.c for exported symbols. It
is possible to use this file to create a '.modinfo' section for builtin modules.
The modules.builtin.modinfo file becomes a composite file. One part is extracted
from vmlinux.o, the other part from .vmlinux.export.o.

Notes:
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


Alexey Gladkov (3):
  scsi: Always define blogic_pci_tbl structure
  modpost: Add modname to mod_device_table alias
  modpost: Create modalias for builtin modules

Masahiro Yamada (4):
  module: remove meaningless 'name' parameter from __MODULE_INFO()
  kbuild: always create intermediate vmlinux.unstripped
  kbuild: keep .modinfo section in vmlinux.unstripped
  kbuild: extract modules.builtin.modinfo from vmlinux.unstripped

 drivers/scsi/BusLogic.c           |  2 -
 include/asm-generic/vmlinux.lds.h |  2 +-
 include/crypto/algapi.h           |  4 +-
 include/linux/module.h            | 21 ++++-----
 include/linux/moduleparam.h       |  9 ++--
 include/net/tcp.h                 |  4 +-
 rust/kernel/device_id.rs          |  8 ++--
 scripts/Makefile.vmlinux          | 74 +++++++++++++++++++++----------
 scripts/Makefile.vmlinux_o        | 26 +----------
 scripts/mksysmap                  |  6 +++
 scripts/mod/file2alias.c          | 34 ++++++++++++--
 scripts/mod/modpost.c             | 17 ++++++-
 scripts/mod/modpost.h             |  2 +
 13 files changed, 131 insertions(+), 78 deletions(-)

-- 
2.49.0


