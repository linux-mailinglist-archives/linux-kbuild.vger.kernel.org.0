Return-Path: <linux-kbuild+bounces-6752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A80A9DC28
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF20D4A3BE6
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4CF203704;
	Sat, 26 Apr 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHOrANK6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3224BA944;
	Sat, 26 Apr 2025 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684315; cv=none; b=d7r+fJ0ScyX2AFAT5gnrwyNVGVtrtCED2GfDCz25A7ISS4jkL3ADPlol8fMx2tGCQmciesVFCuy3V3tq5frO965HBasBsorb6QM/Wt3+H2LbqBsKrsxoR67IMcykH55+AR1PrnfCtJCuh53rfLDhst3MaTAyNrlGjufACAw4DPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684315; c=relaxed/simple;
	bh=xhOmpn4iMQ7fOeW0MB6dXeNqAIdJgexldFWCP70d+FU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bi0I779MhddCjSmW0fN6x5JAGDhdvkQc3hshA0eEBrMnxoogN2ZyrFzHOJYEAkrsjM5+y0Tam8QK5rsBlZ9oRiYyIuEWLiA7pz5nUKlIGouTIA0c5ItYS9REFuoE4AJoEel/ubOZVEM2kSsi8CRAyVRbRmV8CPYRKV1epaZA0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHOrANK6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5134DC4CEE2;
	Sat, 26 Apr 2025 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684313;
	bh=xhOmpn4iMQ7fOeW0MB6dXeNqAIdJgexldFWCP70d+FU=;
	h=From:To:Cc:Subject:Date:From;
	b=nHOrANK6bt6o7hHFX/2Nz5EYQu8bCXnKXLD9kjOkxUnUjPkDX+rHA6N1I/ii0Cv9z
	 g1CVYZmlmqQ9iY5KowsLYwwqZGpGoYjDcr4WW+Y74TOtrX3wptV4cNFqKc3ItVOowX
	 Bs5Iyl7yMgdDvcUeqiPr/rARA5AqnkD2mwhUJd+zZKgfapWXjXNf+wbX4ZrBMqdM1W
	 3e2vty08qi6hxVZbnxHC9B51R4zzsQWualmx/+UlQeNPDP0pgBhIxmbgZSzC+zyjrh
	 cav1b/k1iZ193GI+tFO24kEsvaruFcn6AAx4y+BsTN1Rq9+woh/ED1SQBWFWp2UyzB
	 do3flU2vuKN9w==
From: Alexey Gladkov <legion@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v1 0/7] Add generated modalias to modules.builtin.modinfo
Date: Sat, 26 Apr 2025 18:16:31 +0200
Message-ID: <cover.1745591072.git.legion@kernel.org>
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


Alexey Gladkov (7):
  mfd: stmpe-spi: Correct the name used in MODULE_DEVICE_TABLE
  scsi: Define MODULE_DEVICE_TABLE only if necessary
  modules: Add macros to specify modinfo prefix
  modpost: Make mod_device_table aliases more unique
  modpost: Create modalias for builtin modules
  kbuild: Move modules.builtin.modinfo to another makefile
  kbuild: Create modules.builtin.modinfo for modpost results

 drivers/mfd/stmpe-spi.c     |  2 +-
 drivers/scsi/BusLogic.c     |  2 +-
 include/linux/module.h      | 21 +++++++++++-----
 include/linux/moduleparam.h |  7 ++++--
 scripts/Makefile.vmlinux    | 50 +++++++++++++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_o  | 26 +------------------
 scripts/mod/file2alias.c    | 31 +++++++++++++++++++----
 scripts/mod/modpost.c       | 21 +++++++++++++---
 scripts/mod/modpost.h       |  7 +++++-
 9 files changed, 123 insertions(+), 44 deletions(-)

-- 
2.49.0


