Return-Path: <linux-kbuild+bounces-13161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKNdHfLxBWq3dgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13161-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 18:01:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E1544677
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 18:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C9719300698B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 16:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84CC30E828;
	Thu, 14 May 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibM6y1Kw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC9282F3A;
	Thu, 14 May 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774503; cv=none; b=ItQmMq7ami6JXtg6o7z2Uy4LLe0hjkkqDSpViIJ+JWA+Tog+vFLhWE1E7faqPiInyZdVJglgoEjNY6ND/eeb0UR4KfjMwyQcJDC/Jp4I1gLQHLJLxd48MWwYDHov6QIkEP3IlJtgfo5tThdk83J/FywDoujNCY+jh1VmLbGF5h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774503; c=relaxed/simple;
	bh=NwiqWl07mMFzTIpcBLHSV/jNNYcGeaGAae+sSXAbZzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmORrWvB4PMGCt3XSdZVhGkj2RKd9KHyq8c5jOxbDQNzEfrcsYBGd8OpRImtDSxZyr8qfMoiAwS7FKugF+P1sBGHUXSH9Bs6kyQa+7wlva81cUdDMdaN3pneVWAt8iJDlwuXbZqVj4QGFKFnYvk8bBwaA6JsKAu3mVW46MOMDE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibM6y1Kw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC95C2BCB3;
	Thu, 14 May 2026 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778774503;
	bh=NwiqWl07mMFzTIpcBLHSV/jNNYcGeaGAae+sSXAbZzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibM6y1KwVQy3VzJyCivePtjEwT25FqDNjV76bB9SN/dFykRlL0P/45q/6mMcPX/+s
	 ihQ+dBlgCu6AjX4y3cWWkwt5lfpIaXAhQ6s2PnPa/8ONc1Zfbwto7SEj4x2gCfFHyM
	 kkYJGpvLz6eBn6tXTak+T1QWu12YuCFlqzdrLvhf0ZHT0sLXcIADx1HlWM04r1R8iI
	 AZE2m5mj2PF6yuunrb37PpABcipWhyYM+Fbh6LjnwOfucIrU2vHueWW8Q7v4QRMUrT
	 Fg7dRL9X9W3kIr2qifGz2kIwIP6kDatOiH7q09PpP5cEzg7iNf+71ziu2gABuRcuQP
	 iN1oqe2Ti5s7Q==
Date: Fri, 15 May 2026 01:01:39 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, nsc@kernel.org,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <20260514160139.GB2229579@ax162>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
 <6d11bbb5-4877-4707-9f98-1b6ba2744ce8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d11bbb5-4877-4707-9f98-1b6ba2744ce8@gmail.com>
X-Rspamd-Queue-Id: BA3E1544677
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[linux.dev:query timed out];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13161-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 04:26:42PM +0100, Julian Braha wrote:
> On 5/14/26 14:32, Nathan Chancellor wrote:
> > On Wed, 13 May 2026 16:03:29 -0500, Andrew Jones <andrew.jones@linux.dev> wrote:
> > 
> > Hi Andrew,
> > 
> >> [...]
> >>
> >> This new static checker is the script used for [1] with a few
> >> improvements to avoid some false positives.
> >>
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748 [1]
> >> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > 
> > I think something like this is reasonable, as least until kconfirm
> > is potentially ready for integration into the tree.
> > 
> >   https://lore.kernel.org/20260509203808.1142311-1-julianbraha@gmail.com/
> > 
> Agreed, don't let kconfirm block this. While I do have future plans to
> support these same alarms in that tool, there's currently no overlap
> between these two, and no ETA on that support either ;)
> 
> Side note, this script was actually part of my inspiration to go
> searching for more misusage of kconfig and build kconfirm. I also
> previously cleaned up some dead code, thanks to this script:
> https://lore.kernel.org/all/20260309122321.1528622-1-julianbraha@gmail.com/

Thanks a lot for that additional context, especially around the lack of
overlap between the two tools. This seems worth pursuing then.

-- 
Cheers,
Nathan

