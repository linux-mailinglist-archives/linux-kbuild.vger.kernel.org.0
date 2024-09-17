Return-Path: <linux-kbuild+bounces-3587-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E1297B12A
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CBB283564
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE27E14D282;
	Tue, 17 Sep 2024 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u657feON"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E117BA4;
	Tue, 17 Sep 2024 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582651; cv=none; b=fFCrdJpk6Td4yF+qhugKPO4kNXci393Rr1hb6HUZsE4nRXySwbZJKNdhuOUnAxW9Hnvw2zAEJFbPoVnuFl3JZtMQyeBtFe92WiOljsrOhFHVGcEbzqD4pBj8S1QF5fu4QNaCF0tkKAAyK8mU0AzQxS8JtwB5viOBzUkPSLuSzko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582651; c=relaxed/simple;
	bh=cXtrVxko+bYy6VIL0S9Rr7zVK18U+V1WxiblSEg+Ngo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHrBX+TUJXlQKi+vKQ2tg1YQhrY1IU1AHgrKrLFjJW0tHWGy5e8w/oi8pQ7QSKSCHZZK+tZHC1RBdfdnORiWnmXzPCSUysbtKJyqdgt7Olc3pFr1dbySnbSKWhTmQpWUur5dHQFWY/TKQB25GMEw1VR2LstRbkNTcyfmizgss8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u657feON; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE31DC4CEC5;
	Tue, 17 Sep 2024 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582651;
	bh=cXtrVxko+bYy6VIL0S9Rr7zVK18U+V1WxiblSEg+Ngo=;
	h=From:To:Cc:Subject:Date:From;
	b=u657feONuwCk/khWe/VqpWBRTvuW/d9qWfscF0tOevNYlvj3Adzc4hPU19d4szuK4
	 qrvsjpJJMVdIfHt44ZSC6wMtWxxu62F/nlbs3HTtMBQo8dNSOuFo+vcU6k9r/hsJDn
	 HOkUvOEI1K6Y5gmITVjifhL2SEOg2qoP88WVEgGX+LbTq1odVuGSErQjhTXWVM2AGX
	 9+SKk7iOJ8jIpjJG8zSodSCz1EHSKG3iazN3VtzEsB5DTxYggGuvfCuSXX9LA68b48
	 NTBX51KhkvnbDA87KBmlhZl50OGiFx5+tm/hvaCtiTSQgzcJqAsjO8FktodNTHDOzg
	 IidHKHgkdliog==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 00/23] kbuild: support building external modules in a separate build directory
Date: Tue, 17 Sep 2024 23:16:28 +0900
Message-ID: <20240917141725.466514-1-masahiroy@kernel.org>
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

The first half is cleanups of documents and Makefiles.

The last part adds KBUILD_EXTMOD_OUTPUT (MO=).
This is too big changes, and too late for the current MW.
(I did not test kselftest at all.)
I hope people test this and may uncover some issues.



Masahiro Yamada (23):
  kbuild: doc: update the description about Kbuild/Makefile split
  kbuild: doc: remove description about grepping CONFIG options
  kbuild: doc: remove outdated description of the limitation on -I usage
  kbuild: doc: remove the description about shipped files
  kbuild: doc: describe the -C option precisely for external module
    builds
  kbuild: doc: replace "gcc" in external module description
  kbuild: remove unnecessary prune of rust/alloc for rustfmt
  kbuild: simplify find command for rustfmt
  speakup: use SPKDIR=$(src) to specify the source directory
  kbuild: refactor the check for missing config files
  kbuild: check the presence of include/generated/rustc_cfg
  scripts/nsdeps: use VPATH as src_prefix
  kbuild: replace two $(abs_objtree) with $(CURDIR) in top Makefile
  kbuild: add $(objtree)/ prefix to some in-kernel build artifacts
  kbuild: rename abs_objtree to abs_output
  kbuild: use 'output' variable to create the output directory
  kbuild: build external modules in their directory
  kbuild: remove extmod_prefix, MODORDER, MODULES_NSDEPS variables
  kbuild: support building external modules in a separate build
    directory
  kbuild: support -fmacro-prefix-map for external modules
  kbuild: use absolute path in the generated wrapper Makefile
  kbuild: make wrapper Makefile more convenient for external modules
  kbuild: allow to start building external module in any directory

 Documentation/dev-tools/coccinelle.rst |  19 +--
 Documentation/kbuild/kbuild.rst        |  11 ++
 Documentation/kbuild/modules.rst       | 104 ++++----------
 Makefile                               | 184 ++++++++++++++++---------
 drivers/accessibility/speakup/Makefile |   4 +-
 rust/Makefile                          |   4 +-
 scripts/Kbuild.include                 |   2 +-
 scripts/Makefile.build                 |   4 +-
 scripts/Makefile.compiler              |   2 +-
 scripts/Makefile.modfinal              |  16 +--
 scripts/Makefile.modinst               |   4 +-
 scripts/Makefile.modpost               |  24 ++--
 scripts/coccicheck                     |   6 +-
 scripts/depmod.sh                      |   4 +-
 scripts/nsdeps                         |   6 +-
 scripts/package/install-extmod-build   |   7 +
 16 files changed, 209 insertions(+), 192 deletions(-)

-- 
2.43.0


