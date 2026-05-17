Return-Path: <linux-kbuild+bounces-13185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ReLH0dECWo6SgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13185-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:29:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF44155F328
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 06:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDA86300D47B
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 04:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693192F7F13;
	Sun, 17 May 2026 04:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3SZSfKT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E62F7EEA
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 04:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992196; cv=none; b=IBYfHpzNPTSAoE9m1ptexYzWBaitipwkASgWL1bNn0XnP6GcvrzQzXd+U2PQ9O502NHmYXgzWjZbC2vLDq4GJoppZ2BHp+e+/WCU6Zq571L5RHu46d69Shrk7uVIkhHh8t4QJMrHXh71TAXp0wZ7Li6urGcqKzgurz5++RuZjUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992196; c=relaxed/simple;
	bh=hdqmN2e/3IhT4kpfmaglQKS+H4DvsmQhKg0hgYa2RDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCE2LO4hdRJNOk86oSs0nZwtYQUwQpZL1IxNQWVWi2lG/BKLgQY2DkGPvJiV7ZCOGnA5FD1mmFb7yOTy2sX62D03NhlZokQM/ixCTBbSxgi/dp/rubQw/+61oCdixO0GPUJ8AKN4CYwiX6WaCvHqJRy95KqBdl/dkXPQ2rbq1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3SZSfKT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB94CC2BCB0;
	Sun, 17 May 2026 04:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778992195;
	bh=hdqmN2e/3IhT4kpfmaglQKS+H4DvsmQhKg0hgYa2RDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3SZSfKT3OqrKrTAsqOEc3jSLJmvkXGUyqPcKbob+Gk+i1j0dw+Ykn4ajAj65hkP/
	 8jsY5pBRJ5iIJwrmpkHStk71QcPgb63npv68gYemssCnBHM+9LNtflIh7W6NeODjoR
	 doDBSW4BXOu7C/FrXBFhHrks2Ge6rJvZO/rIQlxQAErIZzHdOyUw8mSUDLec8pK4TK
	 3zZJR6SAVRY7h58rxu22y9zOXQI3FR26xevokYHzEzclc8YGZhHvo28KcBf0eOtnDI
	 Cq3yYb5eLFzg9zZYwYnJGicLNc9wsMV2vzkBPK5nOBYagfuEYTOiypcvEbtgf3Ek04
	 iwc5xp1ioBM7Q==
Date: Sun, 17 May 2026 13:29:52 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Jill Ravaliya <jillravaliya@gmail.com>
Cc: nsc@kernel.org, masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in
 builddeb
Message-ID: <20260517042952.GB1534263@ax162>
References: <20260516071643.23179-1-jillravaliya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516071643.23179-1-jillravaliya@gmail.com>
X-Rspamd-Queue-Id: CF44155F328
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13185-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Jill,

On Sat, May 16, 2026 at 12:45:44PM +0530, Jill Ravaliya wrote:
> Hi Nathan, Nicolas,
> 
> You are correct. I tested locally and confirmed that
> set -e in the generated postinst does catch run-parts
> failures even in the && expression — execution does
> not reach exit 0 when run-parts fails.
> 
> My patch is therefore redundant. I am withdrawing it.
> 
> The root cause remains 55-initrd.install silently
> returning exit 0 when initrd is missing (LP#2141741),
> which run-parts sees as success. That is where the
> fix belongs.

Thanks for confirming!

> This was my first patch to the kernel mailing list.
> I apologize for the noise and thank you both for
> taking the time to review it carefully.

No apologies necessary, it is all part of learning :) thanks for
attempting to improve the usability of the Debian packaging.

-- 
Cheers,
Nathan

