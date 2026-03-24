Return-Path: <linux-kbuild+bounces-12234-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJq0F57awmm0mwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12234-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 19:40:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B377231AFA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 19:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03F2A300D17E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 18:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D195F3A3E60;
	Tue, 24 Mar 2026 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShRHU68p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF31938423C;
	Tue, 24 Mar 2026 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377306; cv=none; b=rQJMLr8xRKNKq28qyuXKzfD/eYXAW0S5nMKqj1tl9rcPCGOSDaBeocqxadkyNy3BWIM6mPESYMIcARVF1zviWs11wUaFdhkEjfed0wjGAoIirMGm4rL26JM7PunfVAuJkbqS6oL/r8Gi/crSxb7UvrnEzZG+05aTtQFbK7HhOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377306; c=relaxed/simple;
	bh=3mtnNrWs7NVLaSpyjfBfDkRiPq2NuFpzWPSxxsmseg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRJX/1kOXHuh+Pr2szd6qQs3fRBTASGdyt7eGDLGeDAcEi/GK/BJmhw8yzREqdhHyV1AOmJ6urcZ9o1/7v6eR1yskmKdVnssrf2nc4Vsw+rkoypTw83L89NjGQ5ZOj1NdlgTWx3OXBZmu5JsEzK617tlK+BXdMVhqL6UfdypzHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShRHU68p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50E3C19424;
	Tue, 24 Mar 2026 18:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774377306;
	bh=3mtnNrWs7NVLaSpyjfBfDkRiPq2NuFpzWPSxxsmseg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShRHU68ptBW0OeMmkoNE6B59UtRu4BWo7CrSi2kc3enumnRIoT5vqzd/14etWExC3
	 O3kfcGEVq59qFPVdn8tatrBwL+gOtsmp/1znRSauf16l9KdKuaZE8HOyGHI1RbDY6s
	 I5K0FLUVY6L42sbhOT3v2TqNU3FkzLQnpwU5bkDbZH1Pyj6RGDq4ye1lfBs8JIu+vl
	 luNfBjAfk/0GQyNzKnBY8noj5IZjckMvCiUtYXjmvaB0gr6s9JEHfnL8he3Qhg/5cA
	 r0afUGiBPhEoHQVwQ3PdSgQPKbBAYn5HrOX+1v1h3YV3N0XqZDMQjreS3us6Mpx4Qi
	 /L9VvT396wZRg==
Date: Tue, 24 Mar 2026 11:35:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <20260324183501.GA3704429@ax162>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <20260313235618.GA4171564@ax162>
 <3d6608fe-be15-497a-85a3-e6af2dbded0a@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d6608fe-be15-497a-85a3-e6af2dbded0a@t-8ch.de>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,orcam.me.uk,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12234-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B377231AFA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 06:05:34PM +0100, Thomas Weißschuh wrote:
> On 2026-03-13 16:56:18-0700, Nathan Chancellor wrote:
> > It sounds like the "< GCC 3.0" part of that might not be true based on
> > Maciej's research?
> > 
> >   https://lore.kernel.org/alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk/
> 
> Yes, indeed. In my opinion the consistency aspect is still sufficient
> to have this change. What do you think?

Yes, I think so. Will you keep it as going from __ASSEMBLY__ to
__ASSEMBLER__? It probably makes more sense that way given there should
be no regressions on the compiler side and that is the intended end
result?

Cheers,
Nathan

