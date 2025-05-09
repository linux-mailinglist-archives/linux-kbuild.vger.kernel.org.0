Return-Path: <linux-kbuild+bounces-7060-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CFAB1ABF
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 18:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D47816CF08
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 16:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F052356BC;
	Fri,  9 May 2025 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aoby9jkY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D6F231841;
	Fri,  9 May 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809013; cv=none; b=fzoNk1QlSRP45vA0lDLDCp0ihEn550giWcD8x2j0H9czENLcmW3c+CNXqu4KBk0NdKsEhO0GsosLIBayRQHDe/Ko+0Pwlb+2TycEJvSFOUbRL3v3F8YfLsJ7f59LADTIAfJvuNRbVV/PsWFJmFmOa0x/3YVsO1MxQrD5aZ2DfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809013; c=relaxed/simple;
	bh=oXnee1VZARhUohEdYeUxwx5/k3rkR4bY04LGblDFCUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkKGUI0QTHbZG1j/6cMRdH+ickEdIM4nF3ej4bSs0x9MRvg2XpA9L7jY1t+1xqzRXH3pWXrWN+txUVbt7EL9zVnHaEa6gIt3A6dvdFfMZoGjdiFc18qQkHQAKq5QEEsWhaCQTRxmmGA9u9wd9FsvRpYXY6k94rdddLAz2LYN5to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aoby9jkY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F384C4CEE4;
	Fri,  9 May 2025 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746809012;
	bh=oXnee1VZARhUohEdYeUxwx5/k3rkR4bY04LGblDFCUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aoby9jkYSsHIORaZ+1lT/gzkUu86s+SxgtJVAx1Kzbg0oKGjugREOivEIR5YQ8bRU
	 ZOKU9PzT6k31bfe/aMEB4OesgnGZ39ZYdm9jqIPtDzoTlDEHuOXcaA5tJ/kaYOr55H
	 y+y1gVZ8fAvdIR1JHKeIfFPHGOZ55gXHaVuUt+fOk0q+N0KFcH1Cckibd/bxEbBnRM
	 OWXovWrOU7PPed7yHKipAzOMirLeuWd8OOftfmIqe84+3FYWe+OgI8sMLLe7raKg3n
	 6ReKFxDiT/AFEQKhaGIe6qhYA/ORcdZlUXq1W0EEBX6AKd35xrdwV0yA6d0nyp9aDa
	 Ap+yIoBkYS+CA==
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
Subject: [PATCH v2 0/6] Add generated modalias to modules.builtin.modinfo
Date: Fri,  9 May 2025 18:42:31 +0200
Message-ID: <20250509164237.2886508-1-legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
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
 scripts/Makefile.vmlinux    | 50 +++++++++++++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_o  | 26 +------------------
 scripts/mod/file2alias.c    | 34 ++++++++++++++++++++++---
 scripts/mod/modpost.c       | 13 +++++++++-
 scripts/mod/modpost.h       |  2 ++
 8 files changed, 116 insertions(+), 39 deletions(-)

-- 
2.49.0


