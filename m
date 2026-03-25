Return-Path: <linux-kbuild+bounces-12252-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAxuKSHZw2lwuQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12252-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 13:46:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D53251C2
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 13:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16DCA309E240
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 12:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB95A3D0900;
	Wed, 25 Mar 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxP0w5oM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6C3CF68F;
	Wed, 25 Mar 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441661; cv=none; b=CDvuneAptlRX7rO7ozgWgrw+Fn51HfTcSMR/ools6Crws840ZRQ60kq5wsneCOXZ9Xpw20t4XYQ34OwrHVjWA7KijlAZOUelAIdo32aU8+9r5uXtg13fx1l/eDdbq1lSQyG+a1NN2aQUYhzXz/iO1B/Ba++81kavtgIxmSk+Pc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441661; c=relaxed/simple;
	bh=I9qOvfpmMqhhFBqDS8DN+mfdCofMKbVExq8WC1M0iH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvE5eYl3dw67XdxmEARks6E/IG6wiZQyUVCfaU+NpYtWZmHo6zkjRduSjkO1bgobLDt4KkDblypHINVqBxcHhmIB0wMbq66Dan42x3LTvC8AHr3QLkgfAUIerLULlr1UO0BpqW8mSMQJ9f4DOz/G5kj71FzBWBKak02eAUHsUS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxP0w5oM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC4FC4CEF7;
	Wed, 25 Mar 2026 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774441661;
	bh=I9qOvfpmMqhhFBqDS8DN+mfdCofMKbVExq8WC1M0iH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MxP0w5oMLl+iP9gUhRyCVHW9h47CyKw3I00FIS8x5Dk4s7wgnh0evj6oEsrDrdPtT
	 aA5I9tVS5dZp8BfzCgw9xC1xWMEe9k0hYC1M3tWTWp1QT8sURRLmHpvjQ9lB+X4MLC
	 0Udq3DeSGDoKczrexGIuTlTbngSloAWufaCb8wf39mG1dcODrKMG3j4yj9lEGR+Pzo
	 HPVMqVzsMR9+R+4ih0pCT3na9VFz+gBJYkamNNPLVGfYQKy5JoUYetEjS07gIdW8nX
	 R58ypQNut9HpaIWfzbNo5oHybZEZ5kpp0aOEbcl+wQJGCGoRnuG10YTLl3pvZQcZy2
	 c12ftEUtHGlqg==
From: Nicolas Schier <nsc@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v2 0/5] kbuild: uapi: also test UAPI headers against C++ compilers
Date: Wed, 25 Mar 2026 13:27:32 +0100
Message-ID: <177444163005.452866.645641010354091252.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
References: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12252-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B0D53251C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 17:51:57 +0100, Thomas Weißschuh wrote:
> C++ language requirements differ from those of C.
> 
> Also test the headers against C++ compilers to make sure no errors
> creep in accidentally.
> 
> There was a previous attempt by David Howells[0], but today with the
> existing UAPI testing infrastructure the implementation is a bit nicer.
> This series does not derive from David's, as I found it only after
> writing my patches.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/5] kbuild: uapi: move some compiler arguments out of the command definition
      https://git.kernel.org/kbuild/c/55d68ec5
[2/5] kbuild: uapi: move all include path flags together
      https://git.kernel.org/kbuild/c/cf822413
[3/5] kbuild: uapi: handle UML in architecture-specific exclusion lists
      https://git.kernel.org/kbuild/c/b4ec38cb
[4/5] kbuild: uapi: provide a C++ compatible dummy definition of NULL
      https://git.kernel.org/kbuild/c/b187c1a1
[5/5] kbuild: uapi: also test UAPI headers against C++ compilers
      https://git.kernel.org/kbuild/c/dcc99abe

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


