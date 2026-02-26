Return-Path: <linux-kbuild+bounces-11457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJnVDLiuoGnUlgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11457-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:36:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4AC1AF310
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD161302E328
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B2144B670;
	Thu, 26 Feb 2026 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efs813WP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBC2DE70B;
	Thu, 26 Feb 2026 20:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772138115; cv=none; b=ElRN0b8dapA8kKVkzDLQbr5282ZWwMIw4uzPenrFqbww1wDWTP8pvbzb5QuiCoPzNdiCWdqenK/qoR6FhPYDXZetY0eHe/u3xyWPsk9mrBixInbNsxU0HD6p29S8XftWnPJ92udVInWjQpm0xhVT1MwCe9NN2zu5NeOak59bYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772138115; c=relaxed/simple;
	bh=ttfDVW7C9pCIAoD1kF2vqxPvmPicC5zaoO2riwOvrNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJRAuepnO6DFwiXXuvidOqfaWAyf/VjOjXDYEEQGGKYxI5Pav7Cdur0CEmWK2pDYk1KJvIX3IxPKrELKf4zpT7NTbhA7o5UQLD21pFPIqZ+8Wq2AfffUVcoXjrHc1VeqaTTjRx6jw7W59lwET737Thb2FMGOEqFeUl5O9aPhZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Efs813WP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F95FC116C6;
	Thu, 26 Feb 2026 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772138115;
	bh=ttfDVW7C9pCIAoD1kF2vqxPvmPicC5zaoO2riwOvrNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Efs813WPjrcZZR3B89J9fe4/UEZuGmTqUNfILzdAUsK38oEDyhuMBzm6US7lNymqK
	 jGo8tuQREBQY+2PB+BWnjwUoxHOrabxzqtARaZaeOV9boQjkgqG5iYf50CcbN9B0A+
	 RLTVA+Gz5+83R3Cyp4VvZ5Zhq1eMQMiqzAWodCH4ht4QUrvlss2fdROVKnhHIS888k
	 P6Ds31RywUD2LWPvBb14z0vKIxjaejpz72AQqR8EESk+FNSqIJUAMvQIgvndqqD5qO
	 l2u4fzVrE0jn/xT6/eR2KESK6CvD2EiKJamNcMbxme8KzG4Cv2mKp2MpMzqE6ZoWG7
	 a3lJ2zQjzGClg==
Date: Thu, 26 Feb 2026 13:35:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: fix potential NULL pointer dereference in
 conf_askvalue
Message-ID: <20260226203511.GB3196155@ax162>
References: <20260225072246.3475275-1-micro6947@gmail.com>
 <20260225194404.GD2755225@ax162>
 <CAK+ZN9pkjJGD4h7jzQiMZGCr6kC4OFBVC4P9Y9zzm8orUjTp-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK+ZN9pkjJGD4h7jzQiMZGCr6kC4OFBVC4P9Y9zzm8orUjTp-Q@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11457-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C4AC1AF310
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 09:25:28AM +0800, Xingjing Deng wrote:
> Nathan Chancellor <nathan@kernel.org> 于2026年2月26日周四 03:44写道：
> >
> > On Wed, Feb 25, 2026 at 07:22:46AM +0000, Xingjing Deng wrote:
> > > In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_value)
> > > can be NULL. When the symbol is not changeable, the code calls
> > > printf("%s\n", def), which leads to a segmentation fault on certain
> > > systems/libc implementations when passing a NULL pointer to %s.
> >
> > How do you reproduce this segmentation fault? Surely someone would have
> > hit this if it were a real problem given the Fixes tag? Or is this a
> > corner case?
> 
> I tested printing NULL with printf locally and confirmed that it does
> cause issues. In my opinion, this problem is more of a corner case—I
> identified it through static program analysis and have not yet
> reproduced it in practice.

Thanks for confirming. I think it would be better to make this clearer
in the commit message because it reads as though the problem is
reproducible in practice. Also, 'def ?: ""' would do the same thing with
fewer characters.

Cheers,
Nathan

