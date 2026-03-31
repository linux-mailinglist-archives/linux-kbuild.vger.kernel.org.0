Return-Path: <linux-kbuild+bounces-12397-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMWcIC3qy2myMQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12397-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:37:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7DB36BD37
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1226303E3D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FCB413259;
	Tue, 31 Mar 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSOg7dcO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F73FB06C;
	Tue, 31 Mar 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971177; cv=none; b=mtzYnl5g79vuXanceU9nezGQsKmMcDQ21MD10J4pf+6FUdZhWahj09iwGwfc7SnBYcQADv2nkMYQVetm+n0N+ZfBJ4781iPAOA4Z+TySLJObvI0+fZJZX1wGFfCEENvtP26p9b4Y17Ko5Sha2dBdDzWXIlxbwMwLu/7LeA5VGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971177; c=relaxed/simple;
	bh=j/osdabo5+7oMMevfACFG/NErUwgr97GeQSEMt+X7OY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=JQQDrNKRHEEm2unjqjgovLA7nFjBfD4PJW9Sr4InrBs2Ptc5xhcL14HIL+EqHF7awyMm+fYJV/iU0j5yFk2tIoqSI25AQm9EWECwAMbS2BT0SOx7V0KzAhFE6ZqbXnhGTgO+8DLhg0uUoKt/dBf1Wi6BoGX5ZTH13y+Qqdg/NI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSOg7dcO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C5FC19423;
	Tue, 31 Mar 2026 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774971171;
	bh=j/osdabo5+7oMMevfACFG/NErUwgr97GeQSEMt+X7OY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=oSOg7dcOZ31I4+jE02XONRogfXmWPx5rMDFqMHysBHOwFENGj1Rmq5cPV6l5tTIyb
	 QHbRGA+6b10EeAa9bT4xOBh1ZpC3kfJMscRzF1ldwBjkt956r78CuJrDKNUfhTtGuv
	 OXMeaDhAG+pm7shBLACkhHepSNonPPD3NaeVpjPEVAdcvIsKAu0cBHXrPlgGqHYwLC
	 3k+XUx6q3qz9KAg4S9Vg4B9U32H63nJ6D3DqYkma2F3ZjFaHhcsLR2oNv1kLWa1lNP
	 1lhLneg9z3tQ+k8AtVrlj7e+Hwc2FCIcxE0cfaOLd3dLRxfiRytVNVOWjGFA25Jdqy
	 eLMQ+HZn6ZjpQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 4/4] kbuild: vdso_install: drop build ID architecture
 allow-list
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320-kbuild-vdso-install-v1-4-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
 <20260320-kbuild-vdso-install-v1-4-e2e8a0970889@weissschuh.net>
Date: Tue, 31 Mar 2026 17:15:33 +0200
Message-Id: <177497013335.2338582.9096004729671110999.b4-review@b4>
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=437; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=j/osdabo5+7oMMevfACFG/NErUwgr97GeQSEMt+X7OY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpy+UYba0J1WSaF+fh7oviE4cdpfp2gUP4WwwS2
 bp35DJNDHeJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCacvlGAAKCRAHUgpwFiYS
 aY3vD/40Q9hfYPPJ7joOJoNpNDMdFJXhE7pWsMug84bxJQ25hF+HjlxofraDC9HjkixakfMiNvg
 qOlLdGjIuAUD+fcGcisESsKMHKtO1O0QThEmFDi05/qHtE2jmXvFUuvB8y60YgKvaP9jXvOzxFc
 Xvku/Bd6PMnwMbN0cMr2FVw8VXOf15elejsO+wC09w8KTlIk2I4kYZrx1dKjiGSZgI0oe359HzH
 LW2NJuzabxVcDEkdmN3LZsFIEELB22bhaVON6K4sG8Njt4uUrtQHgqtn6fsYReYUzjYzkyR1fCZ
 llPlNYUoaJSNHadWdzrtF5+8lcHhdOK9JEySw+2n8lvtaPi4CrYzRduKdLEnuaT1Y/cCqrgvlCG
 LhZK5IxU8SO4cMwaUdkdGKTCr6l/Ld4QQjwXC4YwaYRhEYYwLC6PrHabZp6oHRJsNH9vMcw7vMT
 jPruWKNfIYI/HFm1vy5jaGiu8TQGEzP4OpAgaPXbsZ4y+DQIht/uZI6sxeFVJRhQMNfvVO3FzcI
 8S3F/Ptj7v7J3j+1yDetrUtnhv9m+3EZIPVQgOHx5k/s2K6/vzOGHEExm+6hfnfyZY1nTJns2Cw
 13Amrwk+7jtRSNJs3Hn9oX/kJORDwGSlS0sivLGqIH0BPpLmPfPPIiQt6zV+v9bXrF67FUxsJYv
 6u/nAG5RDENWrFQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12397-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D7DB36BD37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 17:36:56 +0100, Thomas Weißschuh <linux@weissschuh.net> wrote:
> Many architectures which do generate build IDs are missing from this
> list. For example arm64, riscv, loongarch, mips.
> 
> Now that errors from readelf and binaries without any build ID are
> handled gracefully, the allow-list is not necessary anymore, drop it.
> 
> 
> [...]

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


