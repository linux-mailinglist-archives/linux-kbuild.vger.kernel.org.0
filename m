Return-Path: <linux-kbuild+bounces-12339-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD4BHqyHyWmxywUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12339-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 22:12:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6015353EFD
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 22:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 508DB3016922
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 20:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FF236C5BD;
	Sun, 29 Mar 2026 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Psl4MS5C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89293876D5;
	Sun, 29 Mar 2026 20:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774815122; cv=none; b=ufYtwKx4hAL8fGCmeWc/OVqj2v3Q8vcHmflmyKX/O5eqHueJtzoVfe1Bs9GpvZTwhxqlhxvn2uO+8ENqnXTQbwInXEwok044DgiHNjMkv4V2phdjc6HcKdZAYcHqTV9qRpBAzzAdBPRldRk1UgVALclzCqQE87p6j16CX3/kvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774815122; c=relaxed/simple;
	bh=yPXsOrvNNpARmxyg0apI3fpyiErvyF05Uq/0KRal2Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1fu4CbxjmspNBhqsnut9kuoFH7nhUa4+rhfGKILQCIea7nwaljFJtOEkx7hskN3/g9boX8wgND5Yt1/ymiJtoXbc3Qwj/4TJMQOHU9/nxUDBBObeex2F/1CkLU+bbr+SY26WiAKYE3jXweXFs9+UhGzEdoiKQdA5v3fphkDO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Psl4MS5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C88C116C6;
	Sun, 29 Mar 2026 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774815122;
	bh=yPXsOrvNNpARmxyg0apI3fpyiErvyF05Uq/0KRal2Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Psl4MS5CH+A4QaY5kStfhw0/hXA4h/NXzo2mFE86jYQRpCjWziOOg7Ud4Hq3tx7Qp
	 i85lxgq6uvwzuJXU9+IJR2bMfzzimUJMkQRUuPiQAOKDcyFVThKU2XOVUsHiEHVWUX
	 SXzIe4dyJppdk9T2iZ7jCS2tkROY9rPJhzy4U9PzZl2tLAHIawFeyhTc/f1rbIZ2f4
	 1T3iXj3AaKFEU6eU9QtYLFckpTjpBCys9G4rz/ixTqfRJU9UYTQ/YkeY1YfOeMrK+R
	 G6yAr+DWcVNBYQKFsd+PRhSEIxIRmydnN+Mbo0gItW6T9a+v7oGhAAtIiomq0tMAAn
	 Rsznfpcg8aLXA==
Date: Sun, 29 Mar 2026 21:46:52 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, ojeda@kernel.org, gary@garyguo.net,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v5] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <acmBrKIkJ0p0zcuL@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Mohamad Alsadhan <mo@sdhn.cc>, nathan@kernel.org, ojeda@kernel.org,
	gary@garyguo.net, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Yoann Congal <yoann.congal@smile.fr>
References: <20260317112021.14353-1-mo@sdhn.cc>
 <20260321150034.9915-1-mo@sdhn.cc>
 <acOgkfn-cOOy2YNG@levanger>
 <v5gmt4ujqfr4xjxdzkmxo2qwehglc3btvhliyqcxr2npazhuwe@potf3itpqdzn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v5gmt4ujqfr4xjxdzkmxo2qwehglc3btvhliyqcxr2npazhuwe@potf3itpqdzn>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12339-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6015353EFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 05:12:41AM +0300, Mohamad Alsadhan wrote:
> Hello Nicolas,
> 
> On 26/03/25 09:45am, Nicolas Schier wrote:
> > Unfortunately, I overlooked the missing entries for 'clean'/'mrproper'
> > and scripts/.gitignore.  Is it ok for you if I the following diff to
> > your patch?
> 
> Please go ahead, I missed those as well. Thanks for catching that!
> 
> I also missed another instance where the linker is passed to `RUSTC`,
> in `rust/Makefile`, as Yoann pointed out. So it's worth considering
> adding the fix in there too.
> 
> Happy to send an updated patch with the missing bits if you'd prefer,
> but I'm also fine with you folding it in.

yeah, then I'd appreciate if you send a v6 patch.

Thanks and kind regards,
Nicolas

