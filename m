Return-Path: <linux-kbuild+bounces-11885-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLhcNWCtsmkjOwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11885-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 13:11:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291827179A
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 13:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 154363120578
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 12:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFD836DA09;
	Thu, 12 Mar 2026 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odIJVO+y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652B3859DB;
	Thu, 12 Mar 2026 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317434; cv=none; b=JVd241MItAGW6Zw6bcpzqXLSejIAEO5dqJhMC+w1c+Wy5/O5uhueL16KcSWjV2ThTSqTnpX4OXSWMS5aex1H4YYsKPEri0R0015E4Z1VVm2lVgglpTbuupNSwj+Y8eCzSlJ5IcSTNZ5S+PKfeymcnUt0ZUOVll0SHJ3mhtw4aRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317434; c=relaxed/simple;
	bh=Uy44JtFCaQETPOQmn0NLrcXjDSVVxXklwtav5/rwLsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZjvH+mpP9BbpwwjG5X+97m6XqHBlM68s8au6P1jdHLkwXo+BRc67eiCxM4OQZ0GQA+vq4BdPtKKfirSTG3nKR/kbVXm1f/XDMB8zSyQ1QO30VJJ6n051zCrnrZTVKyTnm3f/hVjp7eYkRPfdCAEJws6dQP36hXpy7kbzD7rOjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odIJVO+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DC7C4CEF7;
	Thu, 12 Mar 2026 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773317433;
	bh=Uy44JtFCaQETPOQmn0NLrcXjDSVVxXklwtav5/rwLsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=odIJVO+yarTpEbMuYOpV4oISuKTu+51RiGjba9b+t2f4iRckiJyy2BBW2sYpo2U8d
	 7h2AdU8UQoKuyIg4E+85tNtcy++PeAkUmXWb7ReexAILKZqll/Bi2wfCkZA7NwUSIl
	 Sl+l/nvjGE1mLRY0JZ3dHUWZK91vj7CJjr0hFEA3jvT5vN38VEYpDWI9sqoN7z0cI/
	 16yV/C0iSvELary+I5ekWoloOSAjDJcmMB4Jb7pmorrk841EfUMBcx9tjUDma/qUn4
	 fp4Ax0WUkGlEH5ztSkVUq24XVhhI/hocp5DJO50mj9kxW3qJMONIe48BIKCKkgqoV6
	 Fqrs7J4Rt3X1g==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-hexagon@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 0/9] kbuild: uapi: remove usage of toolchain headers
Date: Thu, 12 Mar 2026 13:08:47 +0100
Message-ID: <177331711839.39835.7291910138948892352.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11885-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0291827179A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Feb 2026 07:37:58 +0100, Thomas Weißschuh wrote:
> Currently the test compilation of some UAPI headers requires a toolchain
> libc headers. Remove that dependency.

Applied to kbuild/kbuild-next.git (kbuild-next), thanks!

[1/9] hexagon: uapi: Fix structure alignment attribute
      https://git.kernel.org/kbuild/c/47bca1cb
[2/9] kbuild: uapi: test linux/bpf_perf_event.h on powerpc
      https://git.kernel.org/kbuild/c/a8c9d3cc
[3/9] kbuild: uapi: deduplicate linux/bpf_perf_event.h exclusions
      https://git.kernel.org/kbuild/c/45bd8643
[4/9] kbuild: uapi: completely exclude linux/bpf_perf_event.h on nios2
      https://git.kernel.org/kbuild/c/60a16bee
[5/9] kbuild: uapi: only use dummy-include for headers which use libc
      https://git.kernel.org/kbuild/c/0ef1b7a6
[6/9] kbuild: uapi: provide stub includes for some libc headers
      https://git.kernel.org/kbuild/c/aad94ba6
[7/9] kbuild: uapi: use custom stub headers instead of libc ones
      https://git.kernel.org/kbuild/c/579f103f
[8/9] kbuild: uapi: simplify libc dependency logic
      https://git.kernel.org/kbuild/c/510c7a57
[9/9] kbuild: uapi: remove now unneeded guard headers
      https://git.kernel.org/kbuild/c/febb5c81

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Best regards,
-- 
Nicolas


