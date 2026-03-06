Return-Path: <linux-kbuild+bounces-11616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEnlBykDq2nDZQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11616-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:39:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD722540B
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 17:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1D7B3039312
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 16:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225C830F7F2;
	Fri,  6 Mar 2026 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCqkocIR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92BA36A029
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814800; cv=none; b=rKW4t3+w1wPMXw3VuodA4iicnhRdY+aUS1E2UzfWwarmbC71Jq7hz1DdoLmwD6hf8ANDgQHo4gphZCvE3qZ7cYossWyum4z8yyCirkbQHiCiCLtFNH1v4Chtj4TJrCp9nNS577tJzI+8w3hMSEqqFRPBD/CM8zlBiJku//oI9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814800; c=relaxed/simple;
	bh=Os7mTkihUOkI9LVMXSiyTjNwHSnrKvzytxZMwfXYZ38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ME7VfIGKwova3r9Fucd1jlH/3zfrla/whTjV8TJDqDED3/+Zg+7H9cizKvNBqJJ64pOux+7A0d3DrDTc9ivkK8hhr3r6cYtZlnV6v3hb1RFlnJhXXThLxF+JgmlMRkX0Uf2kdoWnRxouchXqD6gNG+NfderH6P7fPKr55eFClCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tCqkocIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66408C4CEF7;
	Fri,  6 Mar 2026 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772814800;
	bh=Os7mTkihUOkI9LVMXSiyTjNwHSnrKvzytxZMwfXYZ38=;
	h=From:To:Cc:Subject:Date:From;
	b=tCqkocIRrV32Wi4wrIBAv0Ov6Y+SmKRBnSwEPp9MaFIbFHI/G3fBHq+BM2foIDHLo
	 sbgqxJHWdL1xzvLKFpnVa6YfDGtBob6jwkHi9yCDuxsF6ytyrQQwbajCiGuFaxV3oQ
	 /iX2cEfsUOC1Q95/64qmVydlp8AZrYyEBSREUBhjW/M2d8Yh+6clMgc9U1Wu4HdodF
	 BXQ8YN4oKWCc5D5bj3ruJayznxPO83x6Vy2OI3dRfNuJDQ28XoD2jxAbUzu0IPn1kf
	 qb82pyL5GdV4psQx+Fm/U0EGjxBR4s/4/LatqrDNjbckAcj/gJg1lsIXHo4wR4sfI5
	 lkIlSuJe8dXxQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	libabigail@sourceware.org
Subject: [PATCH 0/3] check-uapi: improve portability for testing headers
Date: Fri,  6 Mar 2026 17:33:06 +0100
Message-Id: <20260306163309.2015837-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8DDD722540B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11616-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,jmoon.dev:email,arndb.de:email,weissschuh.net:email]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

While working on a series to clean up some uapi headers, I needed
to check the that the actual ABI remains unchanged. I found that
scripts/check-uapi.sh works well enough for architectures that have a
full toolchain installed, but not with the nolibc compilers I provide
on kernel.org.

I ended up with a series addressing three separate issues here, but in
the end I can now validate ABI changes across all supported architectures
and ABIs.

The third patch depends on a series from Thomas Weißschuh that was
just merged into the kbuild-for-next tree, the other ones could
also apply to older kernels. I have marked the second patch for
backports to stable kernels, this one is what caused me the most
work in debugging.

    Arnd

Arnd Bergmann (3):
  check-uapi: link into shared objects
  check-uapi: honor ${CROSS_COMPILE} setting
  check-uapi: use dummy libc includes

 scripts/check-uapi.sh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

-- 
2.39.5
Cc: Dodji Seketeli <dodji@seketeli.org>
Cc: John Moon <john@jmoon.dev>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Thomas Weißschuh <linux@weissschuh.net>
Cc: libabigail@sourceware.org
Cc: linux-kbuild@vger.kernel.org



