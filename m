Return-Path: <linux-kbuild+bounces-11634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJjRMzZ8q2lUdgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11634-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 02:15:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 390902294B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 02:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9976F303A12D
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Mar 2026 01:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1835E29ACC0;
	Sat,  7 Mar 2026 01:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2cUXOzm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EDC28BA95;
	Sat,  7 Mar 2026 01:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845973; cv=none; b=Cn6fMhY+iFoDzZrUk1zN2QeEmndYOPf5aatM4Wv4LF2i2jwjUAR5b0PzMIzBtACH+685OjoKw7TT7YbvvgiBtpD0ByYMKwG7uQnVh2ejsS4bear6M7bD6D+fReFXrSjktNo62orrNju0isymrCh5M32rUj+NC3tpitehlEfn5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845973; c=relaxed/simple;
	bh=wqk8k7Vt9qq1nNERcAIYCPZzARPydojrpFXFB2KInlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5VPCSlo+jR4CRAZkvb8FC1PPVhxwX6VP3QJwnrii9KphIU0f/c22QNzmdY1RG+S8ShbGuRKwtvVpL12nl9leCmuxYGnVTXkjRXlTT7BBdfsYRZAi/5ulOE8q/8Yt1jrrPMHWNjJRRBNqt2jKTjds5NsmzBgJgSd70w1gScXhrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2cUXOzm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEEFC4CEF7;
	Sat,  7 Mar 2026 01:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772845972;
	bh=wqk8k7Vt9qq1nNERcAIYCPZzARPydojrpFXFB2KInlY=;
	h=Date:From:To:Cc:Subject:From;
	b=U2cUXOzm2D1oQMR2cSrK92btOD3EwUKtcmQhLJ56z6S+2hcxeF5fo7wKnJBTobwCG
	 O+mx3RKyuLFqWHuATFovEGcelv4IpkaTTZ+FUtMuz8SIppK/Yuy3ku+G+vuMHT6/+o
	 cKQtawhbZWInPtGiN137McfkgsQ8Im9Rb4lq4uNBeP0khNSOkPSzkBD9S2Zpy4as9a
	 zuKQB8w7waQmrljrHRcE3GNb0iULko932438Yp6yfvemH/XNrqFKgbVQVkl1zsIQ8k
	 ay3bje86iYXH3sWu0IkGaIDoV6bob6a/ygblpryjIOQzeur1WHzp45lzzZ7aHIfI+6
	 czLmdQbu/C93A==
Date: Fri, 6 Mar 2026 18:12:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.0 #2
Message-ID: <20260307011249.GA748682@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 390902294B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11634-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.952];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Linus,

Please pull this second round of Kbuild fixes for 7.0. While the number
of files changed might look kind of scary for a fixes pull request, it
is due to having to modify individual architecture vmlinux linker
scripts to move .modinfo out of the ELF_DETAILS macro, so the actual
change is fairly minimal (just dropping .modinfo from compressed kernel
images and the like).

If there are any issues, please let me know.

Cheers,
Nathan

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-2

for you to fetch changes up to fdb12c8a24a453bdd6759979b6ef1e04ebd4beb4:

  kbuild: Leave objtool binary around with 'make clean' (2026-03-02 14:22:39 -0700)

----------------------------------------------------------------
Second round of Kbuild fixes for 7.0

- Split out .modinfo section from ELF_DETAILS macro, as that macro may
  be used in other areas that expect to discard .modinfo, breaking
  certain image layouts

- Adjust genksyms parser to handle optional attributes in certain
  declarations, necessary after commit 07919126ecfc ("netfilter:
  annotate NAT helper hook pointers with __rcu")

- Include resolve_btfids in external module build created by
  scripts/package/install-extmod-build when it may be run on
  external modules

- Avoid removing objtool binary with 'make clean', as it is required for
  external module builds

----------------------------------------------------------------
Nathan Chancellor (3):
      kbuild: Split .modinfo out from ELF_DETAILS
      genksyms: Fix parsing a declarator with a preceding attribute
      kbuild: Leave objtool binary around with 'make clean'

Thomas Weiﬂschuh (1):
      kbuild: install-extmod-build: Package resolve_btfids if necessary

 Makefile                                  | 8 ++++----
 arch/alpha/kernel/vmlinux.lds.S           | 1 +
 arch/arc/kernel/vmlinux.lds.S             | 1 +
 arch/arm/boot/compressed/vmlinux.lds.S    | 1 +
 arch/arm/kernel/vmlinux-xip.lds.S         | 1 +
 arch/arm/kernel/vmlinux.lds.S             | 1 +
 arch/arm64/kernel/vmlinux.lds.S           | 1 +
 arch/csky/kernel/vmlinux.lds.S            | 1 +
 arch/hexagon/kernel/vmlinux.lds.S         | 1 +
 arch/loongarch/kernel/vmlinux.lds.S       | 1 +
 arch/m68k/kernel/vmlinux-nommu.lds        | 1 +
 arch/m68k/kernel/vmlinux-std.lds          | 1 +
 arch/m68k/kernel/vmlinux-sun3.lds         | 1 +
 arch/mips/kernel/vmlinux.lds.S            | 1 +
 arch/nios2/kernel/vmlinux.lds.S           | 1 +
 arch/openrisc/kernel/vmlinux.lds.S        | 1 +
 arch/parisc/boot/compressed/vmlinux.lds.S | 1 +
 arch/parisc/kernel/vmlinux.lds.S          | 1 +
 arch/powerpc/kernel/vmlinux.lds.S         | 1 +
 arch/riscv/kernel/vmlinux.lds.S           | 1 +
 arch/s390/kernel/vmlinux.lds.S            | 1 +
 arch/sh/kernel/vmlinux.lds.S              | 1 +
 arch/sparc/kernel/vmlinux.lds.S           | 1 +
 arch/um/kernel/dyn.lds.S                  | 1 +
 arch/um/kernel/uml.lds.S                  | 1 +
 arch/x86/boot/compressed/vmlinux.lds.S    | 2 +-
 arch/x86/kernel/vmlinux.lds.S             | 1 +
 include/asm-generic/vmlinux.lds.h         | 4 +++-
 scripts/genksyms/parse.y                  | 4 ++--
 scripts/package/install-extmod-build      | 4 ++++
 tools/objtool/Makefile                    | 8 +++++---
 31 files changed, 44 insertions(+), 11 deletions(-)

