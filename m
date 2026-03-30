Return-Path: <linux-kbuild+bounces-12345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKagKHAPymmS4wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12345-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:51:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33766355BE0
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC954300951F
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 05:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411C5285CB9;
	Mon, 30 Mar 2026 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+jgtszH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6821A6819;
	Mon, 30 Mar 2026 05:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849858; cv=none; b=iVFym1ysFJSQy0GAYm2K4PCYOgBkKckgyFPC32rmMJjIQ2klkSt8Q13CcAana+TYzG4di4uWuMis/xqGXJq6bq3FUG0c3yVzge/PoduIOu3ehoJ/gXd6qPv1npuXAXBgjfXmJUAe1XQ3OZPYyIJlmXF8mSrtlKFBuJac7dRSdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849858; c=relaxed/simple;
	bh=0CNVspFX398z0tBDyFBsx/45mT4EZOZvdGOm0AnmusY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSr2FrlLDFzjmEocKwJ7YNxf2BPwXNrhYDc3mrDKZbR+gNlgAcqgjeN7gn7lrtId1n3rKvzNJEfGnZdKsJOpEjkNmDkqca/L3dTTT8hBeDYdrYVAqjlwybjYecYpXPIErcLiWU3XMvO/kgIep36gJVgJ6G+Ra+wfZuWlQebI1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+jgtszH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51F3C4CEF7;
	Mon, 30 Mar 2026 05:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774849857;
	bh=0CNVspFX398z0tBDyFBsx/45mT4EZOZvdGOm0AnmusY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+jgtszHjQ6zWAWUcyolrn1/k6wihW69T94rgpGSLyEDI37YjKoU75ma9QL5ODO+u
	 m38JguODwpSzRI0AFcnRRq5JJinH7W0VxrbdgRELuHefCcApKBIsYBiokUr3gdzhTk
	 kU/gt/MVuXzBH2BEAU/44u//6RpywxqMXgpiZiLJt1OOu3FA1dWI2ihbQwDUdYPEHq
	 Qa9w66WmWFDxRasA/cLizaEJUGs0MfG8Rb9wDZRtwzc/W2O9tXfMmn8724Efu1NoCA
	 6QUMst3KM5eOs48/i8eRx4LZPbZtBCMFaitDzb07G50WhoVVyb4uWWJ0Sh0Ayl/qxB
	 vIQXu2x9iC42g==
Date: Mon, 30 Mar 2026 07:50:53 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Luis Augenstein <luis.augenstein@tngtech.com>, nsc@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH v4 00/15] add SPDX SBOM generation script
Message-ID: <20260330055053.GD879042@ax162>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
 <2026032913-unable-marbling-473f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026032913-unable-marbling-473f@gregkh>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12345-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 33766355BE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 08:29:12AM +0200, Greg KH wrote:
> Nathan and Nicolas, any objection from me taking this through my
> char/misc tree, or is there something remaining to be done here that
> would require another respin, or do you want to take it through the
> kbuild tree?

I don't have any objection to you taking this through char/misc but I do
have some comments on the kbuild integration that will likely require a
respin. I will try to get those out today.

Cheers,
Nathan

