Return-Path: <linux-kbuild+bounces-10783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCwuIKZocWmaGgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10783-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 01:00:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D82D95FC2F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 01:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4770E4E6CD8
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB633A8FEE;
	Thu, 22 Jan 2026 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9cN0IiX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18094369219;
	Thu, 22 Jan 2026 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769040007; cv=none; b=BS/rasvT627pGoEeS2G9TDfMy7q07ZJCGsQmqyTSlUzYewtHLU2sBjZVImwttbJzgkO6NmmOy221EbY/2Ws9lR7JAyMzQsm6y32cdTWb/orD6IwviN/cKgdkpaDMObAcxOywrjtPsZqRGSpkU6+o8fz5bK6fMu21WCPpBWjE5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769040007; c=relaxed/simple;
	bh=avlUTdvX4nmGg3CyKiz1VkZdEmtyp8rApZZWOWIZtJQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RFwn5lyyb7nXeInr2GLMNM9Hi2GPuPSrtVK+Sl0nmi4wFozM2M9Li+UEEFOQPGTIJMqgKxX2KcG99jfRcD6D8Cbn7E0eGgeMOPxxUg5ihPmcY3EtMNsE2joVfP9qmrBVEIxxEQjRGbJsathZrBsMKLY+FwQXiRISlqbGaJX1fBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9cN0IiX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180AEC116D0;
	Thu, 22 Jan 2026 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769040006;
	bh=avlUTdvX4nmGg3CyKiz1VkZdEmtyp8rApZZWOWIZtJQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s9cN0IiXJDliH1HWk00H784MVzTtjCj37y2NxMW8bUhzAV1kySickNN3OuT/VaH9s
	 3p0xEum9s13eLqcVsrrzeGK1I6Sbr3MTXG/4GXto0x6vttPk85i8CCaHCreVwgSFAN
	 I+K0+KzmRvbCeSf2P12Ne+WJSMnEVnBPLWO6v4b33ZS+Uy4TFQigORfhYj2JvEz1hh
	 4ntRGbIIrH0UHEvN+K8me6evJOW1xTapWvrJCqQVrmlax4iV9G+Y+6TV8kVOBjLn73
	 GHwuqOYQaUGOF9upUnCuG6yZ1GoF9EGJTQPcW4jr9rQrjx3JKTt8q9gLijnEVrPPXR
	 GvjRwya6bzQow==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Jihan LIN <linjh22s@gmail.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
References: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
Subject: Re: [PATCH v2 0/2] gendwarfksyms: Document build dependencies
Message-Id: <176904000365.4112982.18214786412044027667.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 17:00:03 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10783-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,google.com,suse.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D82D95FC2F
X-Rspamd-Action: no action

On Wed, 14 Jan 2026 19:47:43 +0800, Jihan LIN wrote:
> I found there is no documentation for build dependencies in gendwarfksyms
> while digging into Rust drivers. Though Yuli added libdw-dev to the build
> dependencies for packaging [1], it seems that there is no documentation
> about it.
> 
> This series documents the build dependencies of gendwarfksyms, adds a few
> examples for installing these dependencies on some distributions and
> introduces indentation style cleanup as suggested.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/2] Documentation/kbuild: Document gendwarfksyms build dependencies
      https://git.kernel.org/kbuild/c/983233ac2ef1b
[2/2] Documentation/kbuild: gendwarfksyms: Style cleanup
      https://git.kernel.org/kbuild/c/301a02d405a3a

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


