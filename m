Return-Path: <linux-kbuild+bounces-13041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIYQDqHa+mnYTQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13041-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 08:07:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E634D673C
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 08:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD9293003801
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 06:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94151301493;
	Wed,  6 May 2026 06:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzBR/sA8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701612F39C7;
	Wed,  6 May 2026 06:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047642; cv=none; b=DdwqUDC/4hMGhcQobjJ0SBp+wnIdw+V2wDY2YKqCwOT7ohUWG7vfp5SFunQEU3US72tQctc6Di0envpoNSwS2EgACCGSPzSYnpvkt1GyZV99FSuLUMPMFoxnOz9hj6u1+CIwzSx561xjZghzySmyPi1Qa/98qqNDkY7oD0BRWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047642; c=relaxed/simple;
	bh=pGYrHWqGfB2z2nfZmU6FqgLZODkRyfzBSxfRz+7Fmoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N6Lh8O3mMpJHeC5OzMAXNkZUNVlAi+I9XNP+t5c/VTaM4mm3KPZTn64irNp5FGkP9XSsM1MXO4lxy4WCATBmwpr2zhpwhl0UQ9fvY4P/KLBtzsIs3sDkuh5vQc1IKeJ49vgTt7Umg/XxXlx5W4QQVs7FJPiR9sOI+4sCNzsXWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzBR/sA8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF689C2BCB8;
	Wed,  6 May 2026 06:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778047642;
	bh=pGYrHWqGfB2z2nfZmU6FqgLZODkRyfzBSxfRz+7Fmoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzBR/sA8JERhf+A0jaH47+5bBjF1g+ocXp5/hxyIrkI5kcgpC+jBsIeE47E7LudXI
	 V4Wt9Wt5S8TerihNYNhwks9kRDZHBT8Bwde468D11NRwFiKckpZV2tA+/xDaJPEg07
	 nkAwj+kzQdNfDLIc0GTmZ+EyuwVRSyBmCZKZ43+Ee9n1TcVxX0NtbYagzDCFTkSI03
	 3GjrGwGAvmSbIDrc6w6jenolskZghaGal5tU+cHOnWQ8wPCXoxtocwuQoOpBb163cm
	 JSGMzTsaKcAHNyBJ1tB9BdXpBeowc1uUa/A5MTprKK0AOfSCdxEg8GVv5BMewm9P7z
	 Y6HENfFSWTBIA==
From: Nicolas Schier <nsc@kernel.org>
To: Hasan Basbunar <basbunarhasan@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] modpost: prevent stack buffer overflow in do_input_entry() and do_dmi_entry()
Date: Wed,  6 May 2026 08:07:10 +0200
Message-ID: <177804746712.556084.6581897920929338817.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505161102.44087-1-basbunarhasan@gmail.com>
References: <20260505161102.44087-1-basbunarhasan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 38E634D673C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13041-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, 05 May 2026 18:11:02 +0200, Hasan Basbunar wrote:
> Several functions in scripts/mod/file2alias.c build the module alias
> string by repeatedly appending into a fixed-size on-stack buffer:
> 
> 	char alias[256] = {};
> 	...
> 	sprintf(alias + strlen(alias), "%X,*", i);
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] modpost: prevent stack buffer overflow in do_input_entry() and do_dmi_entry()
      https://git.kernel.org/kbuild/c/bdb0ab97

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).  Patches applied to the
kbuild-fixes-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-fixes branch in a week if no issues are found.

Best regards,
-- 
Nicolas


