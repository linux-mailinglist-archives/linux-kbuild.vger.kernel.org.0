Return-Path: <linux-kbuild+bounces-13198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q+tfOyaNCWo7fQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13198-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:40:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EFF5604A1
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67818300822E
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 09:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3216353EE0;
	Sun, 17 May 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kk0YjYGv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF84D3537FD;
	Sun, 17 May 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010849; cv=none; b=nxNqH2g6sWZ9MLyjjyxfDIePNIdM/42+70SlLTSDKN3JSXJ0K0/CaNbDEretVuyERgyhoiljLOWIy5b4uMg0bdatdssnT0LobHoP7mtiQuy8jYjZyPG9ndD851pBMVtsIYbDsIYBvrcDFxSJE6uuxquJ7FAOAY3n/udrky09IzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010849; c=relaxed/simple;
	bh=4RRgohRU3SH85lc7Msbfu7A6eVWcOSe4EsViYkBMY7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9XZ470QcL6VMOOobAkJZCL/QIN7f3bK5xdm16l9rU5eM2g9oE2Yxa2e9H9kLLbkLVyCqbcdsOr+p63k/bsYAKm8bcW9YI7IwyCBInS2nl7BcYt7fZ85UTVKSy6pEbD417GdQO+0epVdCb0h8nJHPAfcz5dIw9lqgljw5GQYo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kk0YjYGv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58916C2BCB0;
	Sun, 17 May 2026 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779010849;
	bh=4RRgohRU3SH85lc7Msbfu7A6eVWcOSe4EsViYkBMY7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kk0YjYGvuJfOPKuOOSml5EjCqMZSQJP+xzeLPiHvGNVpnNlRdKmB2+ZKTNzBfdjfN
	 4bEHw3N1rkiYmWnqyEdKFiRegIj7B57IL0+BBNvXtKKeLjv2T4TA9sgS1duTHMI3Qv
	 N3ZKLM3SlZYOiySh4AKX1la3WrEu8GblzOB0tXefu8Y7j06ehQAowZyR3v9SJjTsN9
	 iE9YLxPnVV7RXM3oF0SBkT2dR+ysbSLNThTk1fZf9vrPr+qEazb94uI1cWOk+jrm48
	 lNubQkqUahIqwfS7Dpr8gBmLzaUMYAwfNS/ieU6zFCYvzRhduqk1S1KgWZ3BIYlj+b
	 SegaHYkPqJjjA==
Date: Sun, 17 May 2026 18:40:41 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nsc@kernel.org,
	jani.nikula@linux.intel.com, akpm@linux-foundation.org,
	gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
	corbet@lwn.net, qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net, demiobenour@gmail.com, ej@inai.de,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/3] Documentation: add kconfirm
Message-ID: <20260517094041.GC3773662@ax162>
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-3-julianbraha@gmail.com>
 <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
X-Rspamd-Queue-Id: 45EFF5604A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13198-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 08:05:30AM +0200, Miguel Ojeda wrote:
> On Sat, May 16, 2026 at 11:54 PM Julian Braha <julianbraha@gmail.com> wrote:
> > +In ``scripts/kconfirm/`` run the following to download the dependencies::
> > +
> > +  cargo vendor
> 
> I am not sure how important this is for `scripts/` and/or `tools/`
> (Kbuild may have a policy), but this should probably handle `O=`
> builds.
> 
> In some cases, the source tree may even be read-only, i.e. we wouldn't
> be able to create `target/` there.

I guess this is kind of a weird/unique situation. I agree that the files
generated by 'cargo run' should absolutely be contained within the build
folder; at that point, $(srctree) could be read only and I would
consider it rude not to respect the user's choice of build directory.
For 'cargo vendor' however, I am not sure. They are source files and I
would expect that running 'cargo vendor' would be more considered part
of preparing the source tree, rather than the build one (so it should
not be read only).

At the same time, it might be safer for dependency updates and internal
consistency that they are confined to the build folder. I guess we would
only want to remove them with a 'distclean', rather than 'mrproper' or
'clean', in that case, to avoid requiring users to constantly run
'cargo vendor'. It might be more ergonomic for this to be a Kbuild
target ('kconfirmvendor'?) so that this could be handled automatically
based on the user's build command.

Additionally, can we detect explicitly when dependencies are not
properly vendored and error with a more helpful error message? The build
command in patch 1 just throws up its hands when the build fails and
asks if the dependencies have been set up but if we provided our own
vendoring build target, we could add some canary that says we vendored
successfully and if that is not present, error before even running the
build and say "hey, you need to explicitly run this target before you
build".

-- 
Cheers,
Nathan

