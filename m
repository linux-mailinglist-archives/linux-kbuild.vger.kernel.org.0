Return-Path: <linux-kbuild+bounces-12420-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLORNXQJzGn+NQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12420-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:50:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F936F648
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ECAA33321E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADF83101A7;
	Tue, 31 Mar 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCvIO/HN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5330AD00;
	Tue, 31 Mar 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977166; cv=none; b=Sl+vihLzFSN0yjSw/8NFrUA4l3WHmtL8OvQKBpEZ5/OJ3/6Y6uHggJFExXxJeQswl23/5kW+GFRJBlZ05Fx7W2R4gjIf7qalLr212kCo/5m84f+gnDqbu2vjJH5FNMK5U9+PqF/AC1kDSe7VeSdfISmdUYq0zzVOiIIyzu7fCvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977166; c=relaxed/simple;
	bh=fxIRGe/y6mJunVbm18p1ceB7jmJCwYI+AEFtSL5ICuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTHYyaSrh/cLxxsjiX0da7yFzGahqzItOkRqkByFaj4gX0muHFA4bmMqJJwqI/9SZzDRSiakf15vv6S/dBvdQ/f6f2HTxFL5pzq6s3O3uYiKlxVSiRV4VfmGkG4QDtW0TmuuzSiDYMtSQ9peZQjoivnP2O69h45evX/f8u0kZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCvIO/HN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A3FC19423;
	Tue, 31 Mar 2026 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774977166;
	bh=fxIRGe/y6mJunVbm18p1ceB7jmJCwYI+AEFtSL5ICuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCvIO/HN62hjl15rrsBUrjqm8WnkQSEdpyRLDpNqQBa+s1QxX8RZSB73CJNXqKZ8r
	 EP8vk3p6B0ST7ctsU7ctfo2mnqZlU1hZ314h6N8qfgi4qPTr5Bs/JRV5UNlFqnFOO8
	 LJdv5GidGN4Mw747xR5cszwVYa41nrdrTtyrej4gb7dpjhsmucU7IgLw+jf4D5rHcP
	 tjOamKnObCFB7PyALmEfbWkv744YujFEAN6QFkvYMZMYEYQe6DcTNTOCInH+TpUv0B
	 GMvsOtUfUAu5bVjHrzHXoisMCVd1XoPmVLdZef/ZE1Tw3cT4sAB8+cyWPdlbFNnVTO
	 nO2XW1YAOBwWw==
Date: Tue, 31 Mar 2026 19:09:46 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] kbuild: vdso_install: drop build ID architecture
 allow-list
Message-ID: <acv_2nZNmPPal05p@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
 <177497336368.2732896.13736355342879030780.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177497336368.2732896.13736355342879030780.b4-ty@b4>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12420-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 413F936F648
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 06:09:39PM +0200, Nicolas Schier wrote:
> On Fri, 20 Mar 2026 17:36:52 +0100, Thomas Weißschuh wrote:
> > This list is incomplete. Instead of maintaining it manually,
> > detect a vDSO with build ID automatically and handle it.
> 
> Applied to kbuild/linux.git (kbuild-next-unstable), thanks!
> 
> [1/4] kbuild: vdso_install: split out the readelf invocation
>       https://git.kernel.org/kbuild/c/9780cef0
> [2/4] kbuild: vdso_install: hide readelf warnings
>       https://git.kernel.org/kbuild/c/6ba86c59
> [3/4] kbuild: vdso_install: gracefully handle images without build ID
>       https://git.kernel.org/kbuild/c/5cd6177e
> [4/4] kbuild: vdso_install: drop build ID architecture allow-list
>       https://git.kernel.org/kbuild/c/80b1f3e6
> 
> Please look out for regression or issue reports or other follow up
> comments, as they may result in the patch/series getting dropped,
> reverted or modified (e.g. trailers). Patches applied to the
> kbuild-next-unstable branch are accepted pending wider testing in
> linux-next and any post-commit review; they will generally be moved
> to the kbuild-next branch in about a week if no issues are found.
> 
> Best regards,
> -- 
> Nicolas
> 

I didn't want to merge that already; please ignore.  Sorry for the
noise.

-- 
Nicolas

