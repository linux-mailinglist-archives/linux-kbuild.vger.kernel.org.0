Return-Path: <linux-kbuild+bounces-7278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C6AAC4B1F
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 11:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEA3D7AE123
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 09:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FED24A05B;
	Tue, 27 May 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kM4G+zTH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEE222688B;
	Tue, 27 May 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336891; cv=none; b=DI+G9I1rNIEf30Gc8wqqFeEP5Id6c14IODMqS74Qgv/X+UdEwHGlj6F2M2LltNNxp5TSLxI1QeFujpjFAps9IvkHRTie4t2xmcEw6biDqdTwn7L6Y2JF9Wo3NqNQeCbZ/OgUHc1ahwDAyxXxhmad64BDnLW5I/NxD7QCdw0j1nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336891; c=relaxed/simple;
	bh=1mVZilj0ei09PTF3v4no8nvYAaUQ6G6EroZGp/VBi4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oucbnrZK86ySbY5JBWmy2f1sUT2nj0vwfn3VIY7YKhUYaAZAgSyP55GkfCY9zWKOXVWawi/dvZV20pe+PBM3o0lMi6MP1M7LnG0yJLyU8Giq9aq2A9iDv92AfYGDGVwi/RUQZ1mbsnAd2jP7xdxgKfN/nJW5AW07UyxbXwXnyZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kM4G+zTH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B039CC4CEEA;
	Tue, 27 May 2025 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748336891;
	bh=1mVZilj0ei09PTF3v4no8nvYAaUQ6G6EroZGp/VBi4U=;
	h=From:To:Cc:Subject:Date:From;
	b=kM4G+zTHgnMRgobV2rm5Je+BnrSfMeK1TIbWYQMXT552VrxR3TVMy2GN7OsJCBkTx
	 42DUXlwJmh1x/Nd+g2jvOEp4fHW+DB/75W2PaHqf004DWCwha2hans8xfQh0TeEgmW
	 R1xIvnDThs+MlTDuKSkDAvQ7nwjbP2wuRXq1RdbPbccVaLdLn9GaVf4ag07F3Api69
	 uQ3p0ij+PtlCZZjFJjGglF47//ZNOFFClrknnFixRjd2QpmTQ+k5Jv9CV4ZRCa8Dyv
	 CuBi7Jp6SDwafFvdD0EJzlD4ZTggay8KIC/1qxxEsnI9ZpA0z5+r4MFx83nadxYSO7
	 wV7ikpCr41Gwg==
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v3 0/6] Add generated modalias to modules.builtin.modinfo
Date: Tue, 27 May 2025 11:07:54 +0200
Message-ID: <cover.1748335606.git.legion@kernel.org>
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
  scsi: Define MODULE_DEVICE_TABLE only if necessary
  modules: Add macros to specify modinfo prefix
  modpost: Make mod_device_table aliases more unique
  modpost: Create modalias for builtin modules
  kbuild: Move modules.builtin.modinfo to another makefile
  kbuild: Create modules.builtin.modinfo for modpost results

 drivers/scsi/BusLogic.c     |  2 +-
 include/linux/module.h      | 21 +++++++++++-----
 include/linux/moduleparam.h |  7 ++++--
 scripts/Makefile.vmlinux    | 48 +++++++++++++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_o  | 26 +-------------------
 scripts/mod/file2alias.c    | 34 ++++++++++++++++++++++----
 scripts/mod/modpost.c       | 13 +++++++++-
 scripts/mod/modpost.h       |  2 ++
 8 files changed, 114 insertions(+), 39 deletions(-)

-- 
2.49.0


