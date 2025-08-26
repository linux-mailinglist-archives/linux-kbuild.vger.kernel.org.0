Return-Path: <linux-kbuild+bounces-8614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F501B365C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 15:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 688707B1712
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 13:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C9734F497;
	Tue, 26 Aug 2025 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmZ9tT8l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A1A34F48D;
	Tue, 26 Aug 2025 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216155; cv=none; b=Bd+AW3UzKIOlD5hbfojBRIN9EoWy9rpc/y3f946c1Lg00cVdU29vOeLDbJegyvkTUdmgyfyFNDs/pZI9Lbi+EMRYIKPCSXEED60ypjRDYc5dISrdmuYaKinl2MxPS8+R//2/flnFUVsgkaBb6KIbvxMtj+wJO5GA5MIuLHhg5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216155; c=relaxed/simple;
	bh=uoA1CYUxZEFdCmGeERe6R+Cvcvwqvl/vTuWjK6SwcjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWoFJvmJq2twHkX574kxSCxJKllo+Nk0El1oWlx35GgcCPS2N1ONFNtguZ074uattqW5jNcvVx6uuSa7Ku5HGLPfjPOS6AWjbr4Vn5xYQvdGRz2ZXMWgLiSYVqWww0ZkAuMpv6rGuiCfUNg0WGq0o8FwTBF0cY7F5+xvQOS+W1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmZ9tT8l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A186C113CF;
	Tue, 26 Aug 2025 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756216155;
	bh=uoA1CYUxZEFdCmGeERe6R+Cvcvwqvl/vTuWjK6SwcjE=;
	h=From:To:Cc:Subject:Date:From;
	b=rmZ9tT8ldgZx6a8CIcCzSPIhmnD+yPipPv9GiBdPv27sOkhzZKqZmV75d5/a8mUy3
	 4qhZwqqZza72LzVVjNIxnnm4LHMsn/sX+QLLOB9RoR8eFw4EuXeEu80dwb0mKXyXGU
	 L2OiV13r4iaQcpnQeE0MEhE8EhSeKPufk9QatN5Rrb7ub2mbRqyX8lA+3Kun8c6+D0
	 egOE3MhysIjs3+Q947cdebqGlltUVVGnvYeFTR4tXSOT84o5MD3kDlK5XHczVocmxM
	 HsQyXS3VvmEbJfqiX8oqwUSgRCD+NKY86utgHSkT1jqjidM3NNVIEpIe+3ZaKLJujM
	 8zkrOYUE/iT4w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uqu2z-00000000Fao-17rv;
	Tue, 26 Aug 2025 15:49:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 0/1] add a make target to generate man pages from kernel-doc
Date: Tue, 26 Aug 2025 15:49:03 +0200
Message-ID: <cover.1756215924.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, generation of manpages is hacky: one needs to run
kernel-doc over c source files and then use an extra script to
split results.

The new kernel-doc tool supports multiple files and even dirs,
so there's no need to use git ls-files anymore.

Yet, it produces a single output. Change the logic to add, instead
a target to docs Makefile to produce them, moving the split
and build logic to sphinx-build-wrapper.

That allows honoring SPHINXDIRS when they point to a subdir,
while scanning all files by default.

This series comes after:
    https://lore.kernel.org/linux-doc/cover.1756138805.git.mchehab+huawei@kernel.org/T/#t

Mauro Carvalho Chehab (1):
  docs: add support to build manpages from kerneldoc output

 Documentation/Makefile                 |  3 +-
 Documentation/doc-guide/kernel-doc.rst | 19 ++-----
 Makefile                               |  2 +-
 scripts/split-man.pl                   | 28 ----------
 tools/docs/sphinx-build-wrapper        | 77 ++++++++++++++++++++++++--
 5 files changed, 80 insertions(+), 49 deletions(-)
 delete mode 100755 scripts/split-man.pl

-- 
2.51.0



