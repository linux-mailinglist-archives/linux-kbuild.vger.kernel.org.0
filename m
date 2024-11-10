Return-Path: <linux-kbuild+bounces-4603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED239C303F
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC4A01F2175B
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F278627473;
	Sun, 10 Nov 2024 01:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwpL/xh0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A52914;
	Sun, 10 Nov 2024 01:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202617; cv=none; b=hIAoAMGKJxySzi0j+lDYKKYwbHPnp81jxt3bL/6NqThhv5Q5mgxmCB4Eufik37mMo2tywdVlVcxC646Ztp9R7onwBkT3AH37yo+F6vZe/npdyT49anMtSm6MXZuLQ76X0v9zPIGyfP6pl96wFrQTQePDvesVBqi2xlIPtHdS9dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202617; c=relaxed/simple;
	bh=RRk8hkZbK0GXrkrDHcAPZkWCioaFcl49ugyQjY7nwjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UP0zwFGZVggPq4Y4kLDMBLU5wguNibM9E0DpUoxCIJXUr+EDh0+ntj8Q5EXk5ST83dcMJ12FQoxveLjuTpDjiXmQxY8ax3HjE2vR6o9UIxPXN0ipZe06XvGT+etbgjGE2oYS+ZeeZk2jBrM7/Lj2GigmthwGqpvmEBv96TAJv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwpL/xh0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211B0C4CECE;
	Sun, 10 Nov 2024 01:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202617;
	bh=RRk8hkZbK0GXrkrDHcAPZkWCioaFcl49ugyQjY7nwjM=;
	h=From:To:Cc:Subject:Date:From;
	b=XwpL/xh0oLxBgoMv3XVu9sO4LH6EdkTzVVgRUaZSZwhIpCnYG+BUbbRMhxUG5QxAQ
	 wora8g+YJQiK/580Sn8rMH3Afj1r6LY2YmwNIFkusyo9tCQDxl6G9BmxmsjWp8gJl8
	 tQfWbusTh61BhCPPEOG+EHzsbOnKYMbPNwZOy95KzF9Pxjtk+5lhjoquwm7kKtuWv7
	 6CUze2QgF9Dl3jWuVtUwBNvU0HcNYKOurFIMtHk2NNB7Qid16Be4Ip53UkZZKoNCFh
	 9gXgxRi1VezOaVro4r/pgGMmPT9xBqJrKr0rLcIa02Sdz8/iOzxq4w48FrmwDBNeqc
	 gj+NVS7Np7wiQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 00/11] kbuild: support building external modules in a separate build directory
Date: Sun, 10 Nov 2024 10:34:28 +0900
Message-ID: <20241110013649.34903-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


There has been a long-standing request to support building external
modules in a separate build directory.

In v2, 05/11 introduces a 'srcroot' variable.
(I am not sure if this is the best name, though)
$(srcroot) points to the top of the source directory.
  - When M= is not given, it is the top of the kernel source
  - When M= is given, it is the top of the external module source


Masahiro Yamada (11):
  kbuild: replace two $(abs_objtree) with $(CURDIR) in top Makefile
  kbuild: add $(objtree)/ prefix to some in-kernel build artifacts
  kbuild: rename abs_objtree to abs_output
  kbuild: use 'output' variable to create the output directory
  kbuild: change working directory to external module directory with M=
  kbuild: remove extmod_prefix, MODORDER, MODULES_NSDEPS variables
  kbuild: support building external modules in a separate build
    directory
  kbuild: support -fmacro-prefix-map for external modules
  kbuild: use absolute path in the generated wrapper Makefile
  kbuild: make wrapper Makefile more convenient for external modules
  kbuild: allow to start building external modules in any directory

 Documentation/dev-tools/coccinelle.rst |  20 +--
 Documentation/kbuild/kbuild.rst        |   8 +-
 Documentation/kbuild/makefiles.rst     |  14 ++
 Documentation/kbuild/modules.rst       |  29 ++++-
 Makefile                               | 173 ++++++++++++++++---------
 arch/arm/Makefile                      |   4 +-
 arch/arm64/Makefile                    |   2 +-
 arch/powerpc/Makefile                  |   4 +-
 arch/riscv/Makefile                    |   2 +-
 rust/Makefile                          |   4 +-
 scripts/Kbuild.include                 |   2 +-
 scripts/Makefile.build                 |   6 +-
 scripts/Makefile.clean                 |   2 +-
 scripts/Makefile.compiler              |   2 +-
 scripts/Makefile.host                  |   8 +-
 scripts/Makefile.lib                   |   2 -
 scripts/Makefile.modfinal              |  20 +--
 scripts/Makefile.modinst               |   8 +-
 scripts/Makefile.modpost               |  24 ++--
 scripts/coccicheck                     |   6 +-
 scripts/depmod.sh                      |   4 +-
 scripts/nsdeps                         |  10 +-
 scripts/package/install-extmod-build   |   7 +
 23 files changed, 220 insertions(+), 141 deletions(-)

-- 
2.43.0


