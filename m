Return-Path: <linux-kbuild+bounces-12406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DdBBH31y2lwMwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12406-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:25:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658436C8E8
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C363A308AC62
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114D7421A1C;
	Tue, 31 Mar 2026 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbr5A5Wb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22AE3E4C6C;
	Tue, 31 Mar 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973388; cv=none; b=ZprTrVFbxttrDUFtG3s2jBV+BG/yd1JJHHbtAD3SomlLephD9WrSc63fvy4/Pxjbg+S2632rFI+ElcIaDPYgXct6G7+aoZT0YGmU0/1ouyZ6zNA7RLh5LfCUiXyEIJWoJCvKLi1CP411Ch/DBsysuMOLa8Q3nEe3l3QoTktbMmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973388; c=relaxed/simple;
	bh=y9Obcn7STRi+nGDIrN3IILOSxGkJsdbCAn3zuyVVPVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rRyE2vfPbBQaeWpunGntoVrRMH7NqT5vRXCuPETQb77DJcTcHf87cjcgVn2Ml4NLH8ZcalbApNXpMvKJBPqvr39+JJ1DdBrc2XqbRFQYzVz0yt950Lp0ZVC2W2rOV5XTzRGsmIXhpHXKeOukwfySgK1eozvGqnhO9K0d8NO1gpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbr5A5Wb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49593C19423;
	Tue, 31 Mar 2026 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774973387;
	bh=y9Obcn7STRi+nGDIrN3IILOSxGkJsdbCAn3zuyVVPVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dbr5A5WbwoLoHq9sWCTVdtxcgvkdKkWUQZ6UXLJ9rbeky9XFSzBBYWfdaMAGm70Iw
	 bZQo3dXNeBc+8OlTw4qmyD3qLWET0S8w0ZHZ0eX7M1DFVdBbZcFXDien4qGxyfkhqz
	 SP5x5f7sHojYstxeYzg1lRVYRNII07fZOmXdCwvgeSDUsskg6gvnUBw2RHVq9huDpD
	 qme/itxDVcAphbnv/Omc5xafhcgTZX9uev4u6eJCDZ6S+4gLqb2s9ck5OSfR3kjrhg
	 X2mGZfWIi6rlD5uPeNFDSfV1ofqT5U3voSA83izekd7x9xVpv6jhriPcoqiF0C7agj
	 7dxjwBDXHHV5w==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] kbuild: vdso_install: drop build ID architecture allow-list
Date: Tue, 31 Mar 2026 18:09:39 +0200
Message-ID: <177497336368.2732896.13736355342879030780.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12406-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1658436C8E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 17:36:52 +0100, Thomas Weißschuh wrote:
> This list is incomplete. Instead of maintaining it manually,
> detect a vDSO with build ID automatically and handle it.

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/4] kbuild: vdso_install: split out the readelf invocation
      https://git.kernel.org/kbuild/c/9780cef0
[2/4] kbuild: vdso_install: hide readelf warnings
      https://git.kernel.org/kbuild/c/6ba86c59
[3/4] kbuild: vdso_install: gracefully handle images without build ID
      https://git.kernel.org/kbuild/c/5cd6177e
[4/4] kbuild: vdso_install: drop build ID architecture allow-list
      https://git.kernel.org/kbuild/c/80b1f3e6

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


