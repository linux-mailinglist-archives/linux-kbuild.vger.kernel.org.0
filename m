Return-Path: <linux-kbuild+bounces-9687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D51C70EA8
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 20:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id C897929793
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 19:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A1636826D;
	Wed, 19 Nov 2025 19:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="b+5LHHKo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8731196D
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582163; cv=none; b=U+sNa2bHHAlK38LplfloJiXu3jAZhsD6lzxxKzRF4ZJhKNtQuPN16lX9vrsBzzopKXl9CG4ipXG9C4WyLf07LvHM2UwF23evhLYsdhugiQpsWhgxCoAMnAVrHklb57LlKl9gLg5ho+GQKPYLxBNmQpsY2N+oEGmyj7D9i3WEay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582163; c=relaxed/simple;
	bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BH5SC8zeVHi3xeMgemXf6JBlcEP+WmZFe8YZ9xdjvT10mbnsb/6GsxWoWEGliRtaAiiQ6bo/diVg97XP9EzW5eWGtkI31piMe6hwFLtSILSSZdU4BmQ90ZX4j0cob6APMVJlE0bYNnoGl3XxAshm+bXQiiXGfoOqhvFcAOJTLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=b+5LHHKo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29558061c68so1848155ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1763582159; x=1764186959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
        b=b+5LHHKo2uZFLgJwzREuY9gs6Zw+2e6wzfSVyCM6Eis7Crav0/UquXBkt3eWPsDkr1
         zumaiIjnYOrQCagOg1M2UzdnVGm3MhCL43iRsDPC336Q2WCxQBcvPSe5leC4gw2poj7s
         KsOFzixapMh3zBZemmBMkB2vuw8fEux8tQwtslZ2bLQ3n2gaiOIK1Uu0J9TWwaRmPCA+
         pt6Y0hN/mNSTc+o/bby86XwRBgkwB+PebYDHdrqrwjXs9A5Hinsb/r9fsAi6ZI/yH2hl
         sdlkuhJF03Ne6XEcF+wR8x9Cg5D3Y3iaZenTQdNJuE9JeHIAuVTfHPQjXHX1SWWjwTId
         norw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582159; x=1764186959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DN/DzA6q+86ev6MGPfAT+dLF+J2Uxfsbiqindp3jA1o=;
        b=DrCSrEOzt/GRuziLXGl+pD/lZi1U4i3cN310yEQacuAF0tNESoGCA8AxoslwAIeWLv
         YjyYKNVN4Bf62vmoNQoRNOhY8nD9XLGMGQuEwZwuR9Aw3ZbC2oEcdUwK7S4qrOK1ip6a
         gf5s3mAIo6qwPKSd8HKBbZvYK3t+f8iAB7V/aB1aIVKgNifUaYUKy/PvTBWzWWvlqW/Z
         V+DLC+Pp6UcYOBdE00EQCd+OGTvG2qp5mF6Dbn+ML+SdsmWAEJdzw/GbkOZ8fJs2LpUM
         YtbQ6F18MNGpAtC9LhpPvhR5ERSvAky1OdcmS72oG+B6PbusjFyFg0jVnbRWTWfbLCYr
         9Mpg==
X-Forwarded-Encrypted: i=1; AJvYcCXbYVq4v6VM1TDTt+e7LExS/UEoeXNfW/LmjOgEzx9fUz64iDBvxmHo1Gw+HM4M8iDoo4d7Ejn0ZkKVHSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytS5zdKWd5JIn/0a53277YAh1XwW2F+O+kjMusV0YdyYQ/6e9V
	tVZGPZCiqOS89eAw/r9FCPq77MD7pgBZ0UjW18Q2I8vaD/82MMLgkl7Go90m0FssM3HbvIW4E2y
	fxnuTir4cQ/pcbJ6o9G6zKRpSyt2OcPyFS2eJ/q1y
X-Gm-Gg: ASbGncuBYJeb2b1GEMpRvUotTK5IXzpsSBddRWol0+gJgBVzAIOTKzEO7EfqQYjn+ID
	2Mkn62wW8eGHhKtBaHTgwjrhbw60Ug44eoCeCWq7NKdrzcUedTEgI6XtKv1jM24Ev5ZYXX0jZjt
	jyH8DpvMu/fg6bnMKZWeWUjq90n154Gj2z1CqjysvRDsWI3fTSED4glVrqaTtbDKuKqRjhv2Tla
	1cch5brcr3pGObXe9590ovBuKfveDyGYc7SeDj+BhQzpKKqa44Bs3/c81DbfC+Fa4rQDNg=
X-Google-Smtp-Source: AGHT+IFH9MSHfJWp6YXFB42UsuMhoLOkEWsFTDtMBAdcLCsEfu9ycctu3VPOXdyMN2njeOgrz0I5tCYbRs8o2VLROfk=
X-Received: by 2002:a17:903:19cd:b0:295:a1a5:baf7 with SMTP id
 d9443c01a7336-29b5b0d7f17mr6451945ad.37.1763582159025; Wed, 19 Nov 2025
 11:55:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <20250429-module-hashes-v3-7-00e9258def9e@weissschuh.net> <20251119112055.W1l5FOxc@linutronix.de>
In-Reply-To: <20251119112055.W1l5FOxc@linutronix.de>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 19 Nov 2025 14:55:47 -0500
X-Gm-Features: AWmQ_bn1L21n_pWrZnJvXRwL1Z-01d6qlYWdrkllcBBpENXLHykDJ3f6oq3wlNk
Message-ID: <CAHC9VhTuf1u4B3uybZxdojcmz5sFG+_JHUCC=C0N=9gFDmurHg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] module: Move lockdown check into generic module loader
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai=2DDrosi?= <mcaju95@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:20=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 2025-04-29 15:04:34 [+0200], Thomas Wei=C3=9Fschuh wrote:
> > The lockdown check buried in module_sig_check() will not compose well
> > with the introduction of hash-based module validation.
>
> An explanation of why would be nice.

/me shrugs

I thought the explanation was sufficient.

> > Move it into module_integrity_check() which will work better.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
paul-moore.com

