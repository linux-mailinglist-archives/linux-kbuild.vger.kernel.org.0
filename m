Return-Path: <linux-kbuild+bounces-11018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDg5E+nvgmmWfQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11018-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:06:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA315E2846
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 168F33038539
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 07:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B76537F11F;
	Wed,  4 Feb 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugOvYQpu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0746E261B96
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188568; cv=none; b=FNJqd+/NS5MiY7Pp25ylhWFZkxPwY+yVwx+cXs7oW8KN0Y15fiRUUg9tdU/y6+G10b28vVtgOQzsL+uKym3Un1tUtLBmVWIkx9X+eR68faszMoND9tZYYv2cu7VyF+rYKyWMcULsqUmizFx1LHegeUbmN1kC+ES/aIWhhl8v9Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188568; c=relaxed/simple;
	bh=ESKGnMFTtSk4a+8/Q1DI02wtrLJUyqKthKtZoMbFZEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqUPN8SyZ4TDQKc53Ie4SY4mou/0m23moHdNfxDCvvcdS/7J9VIBIeMDoRsnW0BNwGV+rqQu5TCyaBSr4w2a6OTICzMK8TF+MGJ72r7otR4CVdlHDE9XrxPmcOvKD1yiJIelL6B/YYIAFbjTVAygudD9EgkVMSDQvNtDP57HGkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugOvYQpu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D226BC2BCB2
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 07:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770188567;
	bh=ESKGnMFTtSk4a+8/Q1DI02wtrLJUyqKthKtZoMbFZEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ugOvYQpu0fNo7A0EvEPhiSVQCuWzbKrFZsjMsRH2ODl9I2LPrvHgr5BJGFgRk+w/e
	 ylKVRR6UMA3HMW4z59rbEL+sluPcRUaCQD51KwB07TBnNrXv8+d3Z5o81MJrlqBGKS
	 p+XZ/l7YIIhVktkajVcN8R6Q44Q0Mn8Xurj7sutkrXoix8v34RJoPpdfhdxGWlUR0G
	 lFcAq598GapIxTytwIE11FHi29kDc6SWIqP3JOIiBQbLXi5RB5U/3jlek8WxlnXEfD
	 pD59EM2uklkqG18DQurmtc1TGHRQKQ/JWSRkrIfEaiI9e5Of65B76XLZDYriAjoUX5
	 BRpwhaAJ0xklA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-385e7cafef9so53692431fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 23:02:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViuGu601/gbnb7lUe7UwPNNzzf91peDf0qNooWdVV3h8BghEcOsWa5wRWgTtftZZPC2kDgMk3Gcvy8AGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOgRcTQnlLsyxIehdUOL9LGD5H0/Q3Uw0CJGkvLp9481lotIGo
	VXTHAfl5V2X7z9WvG309uHdQv+CwrrZEKKWlUtSgqU6HtOfSm79XdsKVIlBfM+cN8NpkoSIn7De
	QHgadF9n6lPcx6/+e3hc0Q6z19EZxX7E=
X-Received: by 2002:a05:651c:f0f:b0:385:cf70:1400 with SMTP id
 38308e7fff4ca-38691ccd570mr9009701fa.15.1770188566415; Tue, 03 Feb 2026
 23:02:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
 <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
In-Reply-To: <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Feb 2026 16:02:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
X-Gm-Features: AZwV_QgQL3IrroPkThQ9P6FtuElBQJN7HO9hgPM6xPyuY6IEtSep6KQECkd5XfI
Message-ID: <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external modules
To: Nicolas Schier <nsc@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Rong Zhang <i@rong.moe>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11018-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[masahiroy@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EA315E2846
X-Rspamd-Action: no action

On Sun, Feb 1, 2026 at 12:15=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> On Fri, 30 Jan 2026 14:37:47 -0700, Nathan Chancellor wrote:
> > After commit 778b8ebe5192 ("docs: Move the python libraries to
> > tools/lib/python"), building an external module with any value of W=3D
> > against the output of install-extmod-build fails with:
> >
> >   $ make -C /usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build M=3D$=
PWD W=3D1
> >   make: Entering directory '/usr/lib/modules/6.19.0-rc7-00108-g4d310797=
262f/build'
> >   make[1]: Entering directory '...'
> >     CC [M] ...
> >   Traceback (most recent call last):
> >     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts=
/kernel-doc.py", line 339, in <module>
> >       main()
> >       ~~~~^^
> >     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts=
/kernel-doc.py", line 295, in main
> >       from kdoc.kdoc_files import KernelFiles             # pylint: dis=
able=3DC0415
> >       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   ModuleNotFoundError: No module named 'kdoc'
> >
> > [...]
>
> Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!


I believe this is a wrong direction to go.

Since kernel-doc is a part of Kbuild,
all dependent libraries should exist under scripts/.


--
Best Regards
Masahiro Yamada

