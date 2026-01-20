Return-Path: <linux-kbuild+bounces-10749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ62BHTob2lhUQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10749-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 21:41:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6B4B792
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 21:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA2D1A4D49B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B1033C52F;
	Tue, 20 Jan 2026 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXuUYGhv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E917132C33D;
	Tue, 20 Jan 2026 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932287; cv=none; b=ZxrfrD2c+1EoMRnEHHdDjXCmtDIOxOl74CTcVOXRhNN5lb23fm7bMH/HJn4r/Qxyn1Ew/eifAzGzJ7n9XcYtGdO+9uYHkiiQUCFfyPNVShZuWGn+kCrQO2H9pKMoZgMSlsyDdgeRJ2FzxtNqqDcGeWwDwXBW8EhGQuaChc15c9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932287; c=relaxed/simple;
	bh=i76IY6wVrhMk2ojXnbmZS3hN7z/LiaBWnElA9GCIKPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNgHS0fjSv9m+B/LW0m9/cRHf/FWBmg4YkBvTsMdHPYdJcFMEXYIQP8ITOh3l3MZelckxQUgNNyF3AQXkiRC6TVfgTnOwE3nqX2FVS4fufC4Q7Oiwu94puhpF64Mjis7glFzkXjCbymg0wHp+SdhVYz5blbn/7FRcqN8kaNgzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXuUYGhv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C95C2BC86;
	Tue, 20 Jan 2026 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932286;
	bh=i76IY6wVrhMk2ojXnbmZS3hN7z/LiaBWnElA9GCIKPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXuUYGhv0tc9enDktnoXiyMm5P5uzcsaHgdc6a6IK1t2sswrKQN2oXuQpT/0YU32g
	 3rGN3ve3zUp46qSKC25h4gti6HEEFtwUK/XWD2ksdEfjCeoFDEiUo0nd+J/fvi5Goq
	 VasvD+aOd4OpCsPtmRCUxiEz4lkdNSW9sh9j3HMXq+YdSv6uDWlRwzeoF33cFGiaUb
	 i0IC5FqaboneNHsOR8uoQBWClxi8WD/uoux1ff5QPymOd1t7N/eNEPIRe2iGhGEvtw
	 yrnp8tAl3dc3OgKnJnLoDQ5JWNtpQvFc3AM39jf40niEwz3AMQ7v1ky4PLtrALO4j7
	 1eYbFTST7c5dQ==
Date: Tue, 20 Jan 2026 11:04:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <20260120180441.GC2749368@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-10749-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: ADE6B4B792
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:54:47PM +0100, Nicolas Schier wrote:
> Out-of-source builds do not work on my system with podman.  If this is
> expected, I think it would be great to mention that somewhere in the
> documentation.

Yeah, that is expected for this revision of the script, I brought that
up in a previous review:

https://lore.kernel.org/20251219194748.GA1404325@ax162/

Cheers,
Nathan

