Return-Path: <linux-kbuild+bounces-10787-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBl+BNStcWlmLQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10787-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 05:55:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F20B61CBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 05:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19CE44E414C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 04:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B673E4611F4;
	Thu, 22 Jan 2026 04:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjxCu4pJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D48E38FF0F;
	Thu, 22 Jan 2026 04:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769057739; cv=none; b=ZRNQAIMTmikWaNLG9VoU1NgeeioQZFUuzzLwd6t0KYlgrAk1aU0GCWuYSk/o0sjXUt9/rSVrJkv9qlZrEYWa0ifgtPwVUGwpFt0G38ULQjPe57URXspXzPdLemmK94myUrgOz6pPNg8hUosgzAn+SMOfdDAltJIEm89xyfVkYJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769057739; c=relaxed/simple;
	bh=etPNqlh5MLSoKDLwcVjRqAXYlotDUbS97RdxMKgymYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxrCP2ba1T5hdz1w1Qv8FyA+FQIegQPHH0aWA4YJSybGAnB0P/Djfpq6IUT4LaSGhuP/vNLjmkpd/OhwcJi+L1On9tlVdxpDoKtVaNB+QTsiJFmmYIJrLLPA3tGHt+ZjkOdnjaggJp5cIRVmWjmNarZhrZpSyVAHBY0NlqG+VtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjxCu4pJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6FCC116C6;
	Thu, 22 Jan 2026 04:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769057739;
	bh=etPNqlh5MLSoKDLwcVjRqAXYlotDUbS97RdxMKgymYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjxCu4pJINmMaqmaFFAzUETZoCqYFTIMVwdITg3Q/pl/Y2KSqGwob3K2LCfHzKB4n
	 q738vSgP9Fxpbl4mJHwv3f3MilIJ5LovX5VWDF8lKsLkf62Wj6jAypmvD6LvpcdUoU
	 qFJCXDAKiLLicOpxIAUzB9yoDy6WxwKzPsP/VbI743fgCppjsubTyeIFOHBTQmxUPv
	 xNpdOjgL1N34kUlT74V90VmEdzNdaWLF2ohw55k63R+4Zun8vyGfYRDmz4cLMXPgl8
	 VE25i653hu+7w9hyxIQwgrGNWm12DfmOyk13QB1Y6UZZz9HM2B5TsQoPT0fVafY3v3
	 Zsclxs51p78NA==
Date: Wed, 21 Jan 2026 21:55:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
Message-ID: <20260122045534.GA3770486@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
 <aW-I3fNqp_7X0oeg@derry.ads.avm.de>
 <20260120183550.GD2749368@ax162>
 <e96a6e71-80b3-4556-a4eb-fd242e0f5713@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e96a6e71-80b3-4556-a4eb-fd242e0f5713@gtucker.io>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-10787-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F20B61CBA
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 10:55:53AM +0100, Guillaume Tucker wrote:
> Feel free to make these tweaks now, or we might wait a bit to see if
> others have more feedback with further changes and I can send a v4.

How about this? Send a v4 with:

1. An initial MAINTAINERS entry addition in patch 1 for
   scripts/container like I suggested earlier and scripts/container
   explicitly added to the KERNEL BUILD section so that Nicolas and I
   are included for handling patches.

2. Add the Documentation to the aforementioned MAINTAINERS entry as part
   of patch 2.

3. Either encorporate my suggested change for preferring podman over
   docker with the appropriate changes elsewhere inte the patch set like
   you mentioned or explore checking for the docker alias explicitly.
   Entirely up to you timewise, as long as it results in Nicolas's
   environment working, since I don't think that will be too uncommon.

4. Encorporate any other feedback that you feel is appropriate at this
   stage (if there is any low hanging fruit).

Then we can apply it so that folks can start using it in -next for
testing and validation. After that, you can start thinking of things you
would want to work on for future merge windows from the list you already
started, as I know how that goes when working on a new tool :)

Cheers,
Nathan

