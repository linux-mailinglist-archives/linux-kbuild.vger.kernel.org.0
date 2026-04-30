Return-Path: <linux-kbuild+bounces-12941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBMHBgWh8mmdtAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12941-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 02:23:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7000849BA8C
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 02:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C210301C88A
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 00:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD7D18B0F;
	Thu, 30 Apr 2026 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMtbkrv8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E874A3E;
	Thu, 30 Apr 2026 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777508609; cv=none; b=Jwz/gVgNeKllWtZjD3XNSTuU/YCAKl8z0PEbqm009LyLk3f9PXrZtynyfbln0c+CRCqaHet3d9wL9m6mHIjKIZWI+6N0yGwHP79GUN4d12Sr7aCyagT1f6tMj8cCEQcUx9cje6eZmnUFrbp1yW7ZJ4GR0B0JfexqfCrqLLD+4gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777508609; c=relaxed/simple;
	bh=f6YsKcN2qibSakcpbydW5wbLBg0bEfvx5O/+Lje0v5s=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=e+QdTmTTdbA6drRCUbH/TH/bLW0AmuOarDBvJnfkKuM0TF3/2WA8oio3fFRQ+n2Sni4ircbK78WSmQYCHO1BsFlpvDerPUAp6d4eUHCH3OzRqRcoZZcweZGVNJ4Ug+FD1l7cXnnU6izisAJ6C9gFflpjVTFYoUcuCiM9HqG0Hq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMtbkrv8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A596C2BCB4;
	Thu, 30 Apr 2026 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777508609;
	bh=f6YsKcN2qibSakcpbydW5wbLBg0bEfvx5O/+Lje0v5s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=GMtbkrv8HqL30QdJimwUFatbNwpwyjpd3NZdVy9hfeIXFcZH7frh0QptI7AfnRoLZ
	 4ZcpeyoCKp5LoCqCd/gNt7qSc9aTBuI5Z5F7pTCsWXf8MCT0xpOXuRN7wbPftW6Drx
	 dvSOt6haaDzGgBC8KFTIY09XPnklz80mq3mhf97kkCsCVd2WPbKwTQVeVRXnSnV2fh
	 yneL45UzKnL4EhH2Pf8eAt8ZwqHfev9OkuuMAQ7sE1L/nP4zxlOmJHpSnn09gr4n0x
	 8mM2kkG9J+NartmgqZ8llhKnGExDvtzy2o/xc5hOdY6cPpM2rS+BCCQmNCgu5TDaoI
	 73ZB/1OuJuLxg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 00/15] add SPDX SBOM generation script
From: Nathan Chancellor <nathan@kernel.org>
To: Luis <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, 
 maximilian.huber@tngtech.com
In-Reply-To: <20260410212255.9883-1-luis.augenstein@tngtech.com>
References: <20260410212255.9883-1-luis.augenstein@tngtech.com>
Date: Wed, 29 Apr 2026 17:23:15 -0700
Message-Id: <177750859587.2042162.11401905742333459790.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821; i=nathan@kernel.org;
 h=from:subject:message-id; bh=f6YsKcN2qibSakcpbydW5wbLBg0bEfvx5O/+Lje0v5s=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfFvyLXDR9kq7yq9MvBYRb5Q15hI9GNU19k/Xy7jcNn
 aUbtHPiO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEeHIY/he3HyvZL5Sc3hSl
 eWFmeHS10u2VHxTfcRXteRY3IZun7zjDH+7Wya2y3pa+U501/ioLP6kpsW/zP8q8rO+tksr7hex
 aLAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 7000849BA8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12941-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]

On Fri, 10 Apr 2026 23:22:40 +0200, Luis <luis.augenstein@tngtech.com> wrote:
> This patch series introduces a Python-based script for generating SBOM
> documents in the SPDX 3.0.1 format for kernel builds.

I see the following error when building ARCH=arm64 virtconfig sbom:

  | $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- CROSS_COMPILE_COMPAT=arm-linux-gnueabi- mrproper virtconfig sbom
  | [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py", line 33, in log_error_or_warning
  | Skipped parsing command arch/arm64/kernel/vdso32/../../../arm/vdso/vdsomunge arch/arm64/kernel/vdso32/vdso.so.raw arch/arm64/kernel/vdso32/vdso32.so.dbg because no matching parser was found
  | ...
  | make[3]: *** [/src/Makefile:2184: sbom] Error 1
  | ...

I would highly recommend running some randconfig builds with ARCH=arm64
and ARCH=x86_64 if you have not already done so to ensure you have
caught all corner cases. This one was understandably missed because GCC
builds require a separate 32-bit cross compiler (specified with
CROSS_COMPILE_COMPAT) to build this code. Testing with LLVM=1 would help
with that since the build system handles cross compile automatically in
that case.

> [...]
> modules as root nodes, the script reconstructs the dependency graph up
> to the original source files. Build dependencies are primarily derived from
> the `.cmd` files generated by Kbuild, which record the full command used
> to build each output file.
> 
> Currently, the script only supports x86 and arm64 architectures.

This does not appear to be codified anywhere? I can run the sbom target
when targeting ARCH=arm for example, resulting in:

  | [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py", line 33, in log_error_or_warning
  | Skipped parsing command sh /src/arch/arm/tools/syscallnr.sh /src/arch/arm/tools/syscall.tbl arch/arm/include/generated/asm/unistd-nr.h because no matching parser was found
  | [ERROR] File "/src/scripts/sbom/sbom/cmd_graph/savedcmd_parser/savedcmd_parser.py", line 33, in log_error_or_warning
  | Skipped parsing command ./arch/arm/vdso/vdsomunge arch/arm/vdso/vdso.so.raw arch/arm/vdso/vdso.so.dbg because no matching parser was found
  | [WARNING] Could not infer primary purpose for /src/arch/arm/tools/mach-types
  | [WARNING] Could not infer primary purpose for /build/arch/arm/boot/compressed/piggy_data

Otherwise, from a Kbuild perspective, this seems fine. I will provide my
Ack on patch 2, which is the only place it should matter. I think Greg
can take this when he thinks it is in good enough shape.

Sashiko points out a number of things as well:

  https://sashiko.dev/#/patchset/20260410212255.9883-1-luis.augenstein@tngtech.com

-- 
Cheers,
Nathan


