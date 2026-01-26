Return-Path: <linux-kbuild+bounces-10872-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC3iAV69d2l8kgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10872-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:15:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9AD8C6FB
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 20:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F36230209C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jan 2026 19:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCBB6D1A7;
	Mon, 26 Jan 2026 19:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9cVjp3d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A2317555
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454939; cv=none; b=dw6T6ihW88RrZRn3Md28b91BZNcJjG72SpD23Q6736bFoBdbGotqyF0xwYS7eLGL2FDmCxbEqHbAoO7vAWHepaaE10BXQWIj/RR8oWp7rRTNiAjC7w0Kf8ErN7FeJFkobY4nKlNaQ1dY0IX8/nEsoAqM9WVJxkVRh/0JIOWtIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454939; c=relaxed/simple;
	bh=dTGZk6l1d1yUnTJG6KbUdyIDnFLYoJUW9yqvtaipprg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsej3M8wgtwU1QyBz1U2t0VercQqF1gLQNW3AwvMHvqFS/4ta87oDnlzWqiAUE9x78EhuWcB5LENcH+2fg3g7icGz1F6NkwbNeCSe15xZ11LVH9QfRwngGiL4bsoqKYGSMBKUlwmRy1P0ESobo2PrlDB9S4kYQ9eZhXFe3/pGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9cVjp3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2EBC116C6
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 19:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769454938;
	bh=dTGZk6l1d1yUnTJG6KbUdyIDnFLYoJUW9yqvtaipprg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G9cVjp3du4pxZFI0mIzNaA7fpELINk01EGjlFkrgyXQ/K4DZK0ZgQTaVimGv2a3Vl
	 dneCQhrCRzTFGKoCjuHHzGuxZA72fdQdoTXhd0sZTFcKLOKENl8Sb7OBSarFTDXOsr
	 8dv/Rs1kb4h/A17NLTtyD/S1AitRRlZob9wBjgepILXzhZXpUhrPC19+dqWyf9kbtp
	 xtd0C51Sw9kLvORfrOj04qqyQzyPQtaWXD9+9Nn+7JRU0cWX4c7Nj0Wp7CLmjjp8tO
	 xy2I0+wEYW/Wf/BBbiZz4qR4P9VJ39yytGWXlMgfDay/2Wszh0vum63esEnfjKLJha
	 4ioWwM5LcqmeQ==
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89478e429afso43774296d6.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jan 2026 11:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUB/0OdPIjbPkP2FhJVuKv44D2yKJD0aFCB4nNDOmxvWQrch+P5epcvwmyoRXJLH7m9l/rRpH3WAuzQgAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/qnGdXDOcZZO9qlIQrRe0bMdsQnd9nElNPSZ0nEa3sBj0OMb
	Z0CowOHRs987S+aWAzZ2xdDOH+lmfU9HEIyanaHBpaik7v3ZNlvKguL+qTzG4PSGYoWQXn+PkHe
	4MZHwE0WY8GLEB8TBYTtzXiQrMe7wB3g=
X-Received: by 2002:a05:6214:19ee:b0:894:61f9:c63b with SMTP id
 6a1803df08f44-894b06b4effmr77870556d6.12.1769454937967; Mon, 26 Jan 2026
 11:15:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
 <20260123205359.GA95167@ax162> <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
 <20260123234418.GA206716@ax162> <CAPhsuW54fjr1tP+khcMYQ3qTjN_Eff_rm0dM4h3=TpFVwAdh5w@mail.gmail.com>
 <aXUfOK38XIapv1Ak@levanger> <CAPhsuW4xCmGu4g2N7eBzR4tt4yFffWSAjr_dQvUzkUvQAspvTA@mail.gmail.com>
 <2ad44cb3-2c17-4808-987e-a4b98a9601fe@infradead.org>
In-Reply-To: <2ad44cb3-2c17-4808-987e-a4b98a9601fe@infradead.org>
From: Song Liu <song@kernel.org>
Date: Mon, 26 Jan 2026 11:15:25 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5PVVeJ9Hu0kb76=T561r7up9Oz+NVFyjxqUuCnY4=ksg@mail.gmail.com>
X-Gm-Features: AZwV_Qg-idTz8GVV0NvLTQoDJxI83G5-8i08_fUrbkokai90L_eKzZNd5vrLFTs
Message-ID: <CAPhsuW5PVVeJ9Hu0kb76=T561r7up9Oz+NVFyjxqUuCnY4=ksg@mail.gmail.com>
Subject: Re: make olddefconfig surprises
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-10872-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,infradead.org:email]
X-Rspamd-Queue-Id: 5D9AD8C6FB
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 9:52=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 1/26/26 9:17 AM, Song Liu wrote:
> > On Sat, Jan 24, 2026 at 11:40=E2=80=AFAM Nicolas Schier <nsc@kernel.org=
> wrote:
> > [...]
> >> Have you tried to use something like
> >>
> >>   make KCONFIG_ALLCONFIG=3Dwhatever/minimal.config make allnoconfig
> >
> > Hmm.. This doesn't seem to work (or I didn't get it right):
> >
> > $ cat y.config
> > CONFIG_LIVEPATCH=3Dy
> > $ make KCONFIG_ALLCONFIG=3Dy.config allnoconfig
> > #
> > # No change to .config
> > #
> > $ grep LIVEPATCH .config || echo no LIVEPATCH
> > no LIVEPATCH
>
> You still need to supply all of the dependencies.
> We don't have an in-tree kernel config tool that will automatically
> set all of the dependencies.

Got it. Thanks for the clarification!

Song

