Return-Path: <linux-kbuild+bounces-12395-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBDzMZHry2l6MgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12395-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:43:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F0236BED9
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C232231670AC
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABBB411603;
	Tue, 31 Mar 2026 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s17XXjfJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F373129BD90;
	Tue, 31 Mar 2026 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971170; cv=none; b=T3XRydxXHEF382R4m7whJjIuxTFxtBlRu23HMh/urJ6UGFajk7YlnswQLofMD51fpEru7+sdfTO9IFsmJaDRZY3SRBMyYyVS3oy+XXokm3mW/8vXVT306V88Rr0jyEsNXCQWD7+/rZwQmrAihpym+YaK9KVx3EK7Ta/I/hvhEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971170; c=relaxed/simple;
	bh=dJDcPxfyfMu5O0Ii84uDvQDGlZwti4lETa+qQyfeSQk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=oMb5im2+yjXEHrDgatqx8nMhGY6rWHnIzstI/Op4IJRZoEummWYxztI8C7lceYRx21xuYWI71NiyJHskmk4gQHmCjQC6LpGl+8OUEwgZnq5aXpe6iTyVpySUNh5PJbcT1ylItDpGIS3palavierNuhi9xSLg8x7Hnri72hQHZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s17XXjfJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC882C2BCB1;
	Tue, 31 Mar 2026 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774971168;
	bh=dJDcPxfyfMu5O0Ii84uDvQDGlZwti4lETa+qQyfeSQk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=s17XXjfJX++h1ShuWFzB/WLscyACbmeUUGzW9AMhubo+zSlnXeCv/8eSMSePo+W0g
	 jQwTY1trQSSUQ216x5cpCC/ltMTxG68jysujNwZIgG7QWVCl1D/iMiFHjckWBlor3A
	 5DOg5Q99ojS+F7z2AQtli1crdAjRdLmq9pKUxahQoaoA9kCe5Lmjs8BCv1JMayDAO3
	 YkpayuNjzpULqN6mdiJEH+v/rLccdGTo2uaH6IQo8r7swUBqwzhA2QIm2VanH/84ir
	 zyWN+nccyvicRJjR/vWuDejPPXRX2+MhUyZxGHgJYt1qqBLXDLxq+NIl74HE5Ug82x
	 1QzBE/kMFUjHg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 3/4] kbuild: vdso_install: gracefully handle images
 without build ID
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320-kbuild-vdso-install-v1-3-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
 <20260320-kbuild-vdso-install-v1-3-e2e8a0970889@weissschuh.net>
Date: Tue, 31 Mar 2026 17:15:33 +0200
Message-Id: <177497013333.2338582.1689012121709214216.b4-review@b4>
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=240; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=dJDcPxfyfMu5O0Ii84uDvQDGlZwti4lETa+qQyfeSQk=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpy+UYVoQwPNIjRu3QPGyJ5pY4O9bU1q3BjZ+Te
 AjbZZWKoh2JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCacvlGAAKCRAHUgpwFiYS
 aYtWEADZF2uNIcF7r13p9oTAc+dfWZu6nj7zTJas67Qn4tNOHrPU55aKARdnYijubv4dfICeSvC
 JKyNfZjD/USq70ScUSoSfP1FGvanoxCOhhinGc0NRYVAUFYqKOaxmpOxbAe2Dz3A4v6dw7fve5z
 AYbArQMxzB2JAxpXkd6CK7417iSVJYJE0lWpREGtpBGjC7cm6kphvMWku7w3KQMHgkR/SaOeXfm
 a8uorhZFThN7mwk7dTHaSBR4K6EnNoD+AWPWLodh0ee3FMfrIEDDoRmTI+tZZbxrZresD8x+IUe
 43mt/lq0H6wp68HU13fwHn6pjeGzG4nBeYOtbDhTLQpZI/2ck9bs74HnRY1efEZZYZjVnomGJxM
 2pThI9K9YCFMjLWuSFV6gdoCfcoX6NTIIkR/Ac4bwHldWfOkGKPV3Jl0kUvKwcPi1szXa5/D0Ps
 90/hIVipPDv2h0N9nf8WC0BMxxPHzVc5OyPZKiF4DDov95eMCIkcFirSI6/iYZeZgQvkMvKXrw5
 TunlmVsc8kQiLBG0e6mq9qB3AcyoFz27oVr4T9WHqCeX9x0fNdscyNzj8AgRtmX02V5ixMb9qe1
 HW5Wqs68y4Q4b1VliYsO6Ms2iH/xtvfm1JHy8DNnr3ccxEJyeaoFz9Tnq3DLfpSV5ChvV9m+Poq
 EPjOqpbde6Fxh1w==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12395-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50F0236BED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 17:36:55 +0100, Thomas Weißschuh <linux@weissschuh.net> wrote:
> If the vDSO does not contains a build ID, skip the symlink step.

s/contains/contain/

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


