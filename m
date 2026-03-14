Return-Path: <linux-kbuild+bounces-11930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FmPFDhutWlz0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11930-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:18:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D452E28D75B
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43D33300BB9F
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 14:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269C5344DB5;
	Sat, 14 Mar 2026 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6e+e9Z5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429D1C8634;
	Sat, 14 Mar 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497910; cv=none; b=Q2MgGbxK/MtAAPU2V/Dvw71OZaciPDbK4QMxwGjPttS78Dhkgey7F3AXHetmqa54FiNGigMLQHKvbX4Ug+6bvw97+CkdsZ4HT7FTneTqmf12tY64SHQZ+lmU9aI5rH3K6d3h+RPBVw955sgnqcoBt5/YnoxDfv/AVqeOxKoZMds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497910; c=relaxed/simple;
	bh=dFxsqf4Aca6k1P1SZv26A6CvFoof0deScWpgJp6w8aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o84FCgDS3LOcJPpc0cMpVIs0vvRUWCtDNUDhbV5vH46vc3q2Ix0jm/K0V6Lo9U31BiLsBTV9IKWUGOoERjJcGsG+lU96i9k5m4V0BSkI3aPE3coHH+SbQOknZMp5AOs3vgZQ6xXQI/34/1FDf+e7sLsbiq2yWpfGpKtIuV4R5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6e+e9Z5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1296C116C6;
	Sat, 14 Mar 2026 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773497909;
	bh=dFxsqf4Aca6k1P1SZv26A6CvFoof0deScWpgJp6w8aE=;
	h=From:To:Cc:Subject:Date:From;
	b=Y6e+e9Z55B5bFJ9VYj3j+DJug1ullxkjdgXYtpmfH9TltIqgnIDfbD8XWkAfUjy1U
	 7IXyctDnrZXSUiF3ZYrFO4cax0f3Hds9jtzjp8hxxqk+B1/+ghvm6ZmhSXUpGO0/D3
	 aGvBNcCz/NKpDW6Fi351fxSH8TB5aocOWXuLIaGmFgfFx0E91f6gsn1sl+6HwD3vim
	 aKeTVoN5EG11jCX1yUpy4qc0LIwpw+JizAJyFwK45s33CpD7BZhVE960lQ4nglvYRd
	 BZV3pPCYcfGy8dQSMW/uJGgn7qHWqJ1dpMwgSOGF+4uvmYHdaUCQpVxrjxdqkkdiNL
	 paxGmCchJKd6Q==
From: Sasha Levin <sashal@kernel.org>
To: oberpar@linux.ibm.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	nathan@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 0/4] gcov: Add MC/DC condition coverage support
Date: Sat, 14 Mar 2026 10:17:45 -0400
Message-ID: <20260314141749.3382679-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11930-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D452E28D75B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for GCC's MC/DC (Modified Condition/Decision
Coverage) instrumentation to the kernel's gcov subsystem.

MC/DC verifies that each condition in a boolean decision independently
affects the decision's outcome. It is required by safety standards such
as DO-178C (avionics) and ISO 26262 (automotive). GCC 14 added MC/DC
instrumentation via -fcondition-coverage.

Patch 1 fixes a pre-existing bug in gcov_info_add() where IOR-based
counters (bitsets) were incorrectly merged with += instead of |=.
Patches 2-3 add the CONFIG_GCOV_CONDITION_COVERAGE Kconfig option and
wire up the compiler flag. Patch 4 documents the feature.

With CONFIG_GCOV_CONDITION_COVERAGE=y, gcov --conditions shows per-line
condition coverage:

  4577658:  257:	if (node->num_loaded > 0)
  condition outcomes covered 2/2
  4577658:  355:	if (info && (strcmp(gcov_info_filename(info), name) == 0))
  condition outcomes covered 2/4
  condition  0 not covered (true)
  condition  1 not covered (true)
     2896:  420:	if (!copy)
  condition outcomes covered 1/2
  condition  0 not covered (true)

Tested with GCC 15.2, verified boot + gcov data extraction + gcov
--conditions output. Also verified clean build with LLVM=1 (condition
coverage correctly disabled for Clang).

Sasha Levin (4):
  gcov: fix gcov_info_add() merge semantics for IOR counters
  kconfig: add CC_HAS_CONDITION_COVERAGE for MC/DC support detection
  gcov: add MC/DC condition coverage support
  Documentation: gcov: document MC/DC condition coverage support

 Documentation/dev-tools/gcov.rst | 25 +++++++++++++++++++++++++
 Makefile                         |  3 +++
 arch/x86/um/vdso/Makefile        |  4 ++--
 init/Kconfig                     |  3 +++
 kernel/gcov/Kconfig              | 15 +++++++++++++++
 kernel/gcov/gcc_4_7.c            | 25 ++++++++++++++++++++++---
 6 files changed, 70 insertions(+), 5 deletions(-)

-- 
2.51.0


