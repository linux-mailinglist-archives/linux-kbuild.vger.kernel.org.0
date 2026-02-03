Return-Path: <linux-kbuild+bounces-10981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JMOKFRhgWn6FwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10981-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 03:45:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C842D3D70
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 03:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E93D3017FB7
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 02:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D42EACE;
	Tue,  3 Feb 2026 02:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="df/ZD/4J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1642421C9FD
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 02:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770086737; cv=pass; b=XlNLKSHbzyyr1/WKD1aRHrggfFFY7XcxbhdCoz+IAbpVGYTzWyFshjRJVyXBg+nkRjAkwIguo2iYiAdu55OzPXO8RPTnJO4+5WgAGMO0k2iz9DzjzLM73LpVs54Cre2zfHrwijIt9p32Pnid5hS7+BwwJsED3JeixEmweAvYC/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770086737; c=relaxed/simple;
	bh=6sTA2PpkVjLwFOb90LxKZmc2KE/mHEEjKjJs58b4bG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCOsDXClEiupVDTdaTTqtoNHV4EJKZ6dcyILnzfCg34qccwVGDXxDPXGhkSbQSQise9cqM3CejRJsG2kHK2O2fAareR0S4NML0oqo3NeAztYQLNtJw/DkOiWe0jvvZv1/npQjZBSjEDhAzDaDfNpvhSuW8bYvyCO1YJKW+0gS6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=df/ZD/4J; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-658381b28e8so7172020a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Feb 2026 18:45:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770086734; cv=none;
        d=google.com; s=arc-20240605;
        b=R4Q66dCd3EhHcLrXP9VlHYlOEPiRW7IoVQ9VaF8sXDhZSypJnYI4fiX5xBok93kqCR
         mQ0/eASg7M2k7vX5b4TYHcE8AjPEY3bj6oMnAo0u6SB04wRoEHPRJaurD7ogby0DxU9I
         Eyxq/AgTMq3BQO42ZboEsLX9VhlWT0vFvtzC9NBHNTLzZRQId/li1WAFGKQT1XPFruoH
         4mlCqAOeU4Hfi17kvnczeo49z5aoxEycsX7lxVOvCCNvb/X7Db1/Tr8c9XwUBlGN+y0T
         mEInynKnWuSllt9Ew9uV2Nqh7ZsobejlBLK4l0FyruvKOK3ixM77v0qI8kofnrUFsDuv
         A2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xupDN7U8jo/ur0l8TEPJ5S+Q1LCfr8wdWzFtyWDAYZI=;
        fh=+Hm/41g3Xgs2ZejpoO38JQiQUneHZFS5yM3GVA8WdlE=;
        b=VefPzpFh9+AY+D8vr6zoriosRVqaVtl+YqoBWJ0uWeCfr2Ty/FQPKxsnDFtiPICVUA
         mbA6qt5rv1gOIwKT8M4U/ZDwwpNYLIWCnWfBvxuJiS6UrTDQt7MaYJ7h5/hYKp7WVQNJ
         8/PT4iDk5tGGecKbd8DqOWgvUrZ2fAsI4Eh6kTsaFB+W28elGqp/2LrQux8FkyVUa0d4
         XNo6009odorNHwIrnYa3II/wedzbTSD0KhkLA955VfxeVwejxXGGiirtDgJ6NLA71drX
         /gvnzOr/xeiUHS5z+BBMZtsUv+rWIve1zaFZql0S8BZrcsSW1oN1rAydtAAIZH08NjsI
         TdKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770086734; x=1770691534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xupDN7U8jo/ur0l8TEPJ5S+Q1LCfr8wdWzFtyWDAYZI=;
        b=df/ZD/4JONqg/8/GN+aPiHnvAAtkztrkenmiUORQwgsNPAvIhWlNyZIOKfghAsarQq
         birfkHcNSJP9qZ2/QmwCkshbKqBsSIsZMMan9wmEZaH97rpxyn4RSuK4XpCOktHpv3z8
         O1m3lQZ3a1ohrBcNyKfTc2N1ukcs5Fxz09yQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770086734; x=1770691534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xupDN7U8jo/ur0l8TEPJ5S+Q1LCfr8wdWzFtyWDAYZI=;
        b=UR1oTjRXeB3pHhaQRhyk3DEvj8uBQLSiB97uz848+xNP/xc03u2IHzxfvO8rHV7VPd
         1tU1ZVJ+SADE/ORFnOreF5SsjhapvFU0nXwotogncQAarlLuTuajw7lPLgVyZCIgKv4B
         +A96HSVFPYcEeIYERnAHWxp1G9nHfxVJIw2/oQhofdJsQ9HmVlPUPhUkP0IF2OAYIKpj
         p7CO4LAUnuw7MwxwzyRreIsQ99gNVSdsIPNfrPGycFTJnDTTMrw85pBldy0hWZ4/F2Mq
         ff9G814Rh5D6RDdZ9l7GhEIu/UgbMvxEwq1goDs0xlJzmZ+FLIs9ozuWyFCJYdp7AaMz
         aVBg==
X-Forwarded-Encrypted: i=1; AJvYcCX+29/LglfxnBk3xWCgb3C4lPMni9vnEpR5/IjXzAaOBqa50/WzfVic/uzsFGs2cJDtcQn2LbVCCuOQYvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCce/qXZITcy1BRtX9Bf9hMjl2ckLquFPxHpn3BJtu5ebyzwvn
	0nU/jEh1Fpn7buLyfZ7PQqmeeJ2FabMc0JcwMKRQ3uk3fz27Hjw4X1QHIgeZZSnPFOh2y/JwUE4
	ZZSTedl7n5+391tTL8Ayla/oF0oV5pJIJMwfkqLh7
X-Gm-Gg: AZuq6aIJTeVH1Twp8cCr3ZZqMUTAH/3vFNQ2XtPyKQqFNKWDkKfqr++GgxbZWds/+Mq
	DvxJqd9f1Q5EVnBJx/AIbQ277ONr4t8hma28+eEbTI07b6cE0kPll0OfUh7QgLR5vUSQCayAPbl
	qPHoFGz5n4uF25BF9M9+ryTNLi9jx9T/IOR4sMgGqGiUVnFrrhGplfvq/Ug8Fmt7ORi6v8zmlkM
	eiD5/70wrGNxEszdDIhlHphzV6CZ+PhiA5lt/E7RMu2S3QSgvhB5pzBKflTw2Luh+V5qYda
X-Received: by 2002:a17:907:c0c:b0:b88:6e10:62c8 with SMTP id
 a640c23a62f3a-b8dff5af6e7mr751989266b.2.1770086734497; Mon, 02 Feb 2026
 18:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106162738.2605574-1-sjg@chromium.org>
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 3 Feb 2026 15:45:36 +1300
X-Gm-Features: AZwV_QgnBfiJqJbH-3FGayscL5-1WELwFwvfl8RRJPEzpgV1MUQJt-MGQ4m0cAs
Message-ID: <CAFLszTgQWjewjYHWUhG44em+deNY9xWDFz_YohduWvM=Bd_D5A@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster operations
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, David Sterba <dsterba@suse.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	Nicolas Schier <nsc@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10981-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C842D3D70
X-Rspamd-Action: no action

Hi,

On Wed, 7 Jan 2026 at 05:27, Simon Glass <sjg@chromium.org> wrote:
>
> This series updates 'make image.fit' to support adding a ramdisk to the
> FIT, provided as a parameter.
>
> It also includes a few performance improvement, so that building a FIT
> from ~450MB of kernel/module/devicetree files only takes a few seconds
> on a modern machine.
>
> For this version I have dropped inclusion of built modules, as there is
> still more discussion to happen in that area.
>
> Changes in v9:
> - Rename the variable to FIT_EXTRA_ARGS
>
> Changes in v8:
> - Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'
>
> Changes in v7:
> - Add a note about the " -> ' change
> - Add a new patch with the MAKE_FIT_FLAGS change
> - Mention xz as well, in the commit message
> - Drop patch 'scripts/make_fit: Provide a way to add built modules'
> - Drop patch 'kbuild: Split out module targets into a variable'
> - Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'
>
> Changes in v6:
> - Drop the load address for ramdisk, as it is not needed
> - Bring back the ramdisk 'compression' property, set to 'none'
>
> Changes in v5:
> - Fix 'use' typo
>
> Changes in v4:
> - Update the commit message
>
> Changes in v3:
> - Move the ramdisk chunk into the correct patch
> - Add a comment at the top of the file about the -r option
> - Count the ramdisk in the total files
> - Update the commit message
>
> Changes in v2:
> - Don't compress the ramdisk as it is already compressed
>
> Simon Glass (6):
>   scripts/make_fit: Speed up operation
>   scripts/make_fit: Support an initial ramdisk
>   scripts/make_fit: Move dtb processing into a function
>   kbuild: Support a FIT_EXTRA_ARGS environment variable
>   scripts/make_fit: Support a few more parallel compressors
>   scripts/make_fit: Compress dtbs in parallel
>
>  scripts/Makefile.lib |   2 +-
>  scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
>  2 files changed, 145 insertions(+), 36 deletions(-)

Can this series be applied, please?

Regards,
Simon

>
> --
> 2.43.0
>
> base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
> branch: fita9

