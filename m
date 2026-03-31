Return-Path: <linux-kbuild+bounces-12452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B5+FZk6zGlyRgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12452-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:20:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E5A3718F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 23:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52F430D2079
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 21:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A703DBD6B;
	Tue, 31 Mar 2026 21:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EMtNBvdF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A323A382E;
	Tue, 31 Mar 2026 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991602; cv=none; b=uuhJMRLFs8xAmrg00QXvPoJyopngn+5TyKwqK65hjVKhRGRfGLeuf2EBPKrd7DdBfGwS0dNyn4xY1RJAcCdp7LL15kbK8A5UZRgIHg+X6Pv6eU6fMcyRHJmAmAFNYMDPjkNSK05jwBqADhJqGdRAdNcH98x9nohOPywX0OQGDxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991602; c=relaxed/simple;
	bh=3ub7FLx8g+kpNzEIlrGsLALoShCKV0JrWd3GkE4odCM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=lxwk1xSTkyKoCi1UAb1MGXrijRLj+2hIALzCwpm27aLDkZuDxDQyhF88zivXe8PKbyJAwr+YM+Obgnxxqrjc/AEggRxqFR3lQX8dqtQWM13zGUstCnC+R2wM2FscOgyAZUR4TbWuzw4Nsh4TNQkBXlqm2ixFG/IveZM/FGNubFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EMtNBvdF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0698C19423;
	Tue, 31 Mar 2026 21:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774991601;
	bh=3ub7FLx8g+kpNzEIlrGsLALoShCKV0JrWd3GkE4odCM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=EMtNBvdFLiW+60zYyGE3xU668RV4eACwOpeYT9TsFk5sbBSi44LItwZcBZ9vyHftB
	 y2P9NYeJiPHk0RmZ8k0JM2mt8BKmZ375lbXiC/oST0zg5PV4k5p96BvgKq9w/l8NFF
	 SiO9k0gGQCU3jAAZxTWEQ9XXsG2l1u0GqLlpFic2kDT5G1PuF2HcQWTnGR4WWOfZgd
	 RiTM3hWxS0nh0iIDA5KKlIlg0WRqax5fB5yCf61oS4XYz/IZS2q8zgG9u+sw4G1lqV
	 e+xHzywwy4HmA8C6Yp02fMuYxb7HJSK9C8UhaJuYoPN+xmPhGoE1cycsoZdcowyhy0
	 NWqPMKBinDR2w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] kbuild: vdso_install: drop build ID
 architecture allow-list
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
References: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
Date: Tue, 31 Mar 2026 22:13:10 +0100
Message-Id: <177499159014.1741142.7219917962979782500.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=330; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3ub7FLx8g+kpNzEIlrGsLALoShCKV0JrWd3GkE4odCM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlnLD5Iy8gcX+FbWL/zMVur45WY//dPufXe7Dy+qftLq
 oSz5dymjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARna+MDA8/7GQLbrwRw8l8
 Z8X7nspLa/WX1ZjOuyTEe/7p97UzfCoYGSYukZ64KObGnWMWbU5vKudPrvodvveYnczEwD/XJm6
 TC+ADAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12452-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:email]
X-Rspamd-Queue-Id: C6E5A3718F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 19:50:18 +0200, Thomas Weißschuh <linux@weissschuh.net> wrote:
> This list is incomplete. Instead of maintaining it manually,
> detect a vDSO with build ID automatically and handle it.

Looks good to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Nathan Chancellor <nathan@kernel.org>

