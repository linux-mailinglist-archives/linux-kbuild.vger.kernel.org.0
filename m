Return-Path: <linux-kbuild+bounces-9133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F3BD9EC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 16:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BBA543F6C
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 14:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C21314B6A;
	Tue, 14 Oct 2025 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="nfWBwSKT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F73148D8;
	Tue, 14 Oct 2025 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450940; cv=none; b=cC7N8CBrhDvZftnYqfrTK5Pf8mnmif7qxyZCOOoZLuTGRrobmZCgeniZWi7YLGIanYWg5KTATnFtKS4zXa+WoH4GAJn24TR/86i1RvQQ0Iyu9zS9pITOMKw9VML5Tq6dyzdN7Uiek+ZwbiQzdK8tSz1iwvU4whTDGmCwJG0t4oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450940; c=relaxed/simple;
	bh=+Gt9kJRAP1FR3NGOwDbhhVO6lHrsAsZgxMH/OJhC338=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KwawLlCZjQ983EdGubw3NSJWSAhI9UnismXds0p6VPBEc8GJqAJpQcl/Le0gL9MAhPGtut9wIQmzT7U2Mi8VsVa9zy0I8vIXOWTH5T8rsuKHgAgqmsSql39jJ5umIFzAeZG2N83f1NonS9xifU81pF2cN1uvozj0GjQ7VSM0A4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=nfWBwSKT; arc=none smtp.client-ip=178.154.239.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net [IPv6:2a02:6b8:c1e:478a:0:640:bc50:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id 42AC181797;
	Tue, 14 Oct 2025 17:08:50 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id i8Q0FMjLNqM0-EIWoA07i;
	Tue, 14 Oct 2025 17:08:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760450929;
	bh=1T45731kJE0eHDcgjtqhLZsD2rcE2RQA+VvPNgn4Ymk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=nfWBwSKTZ5YAZ1v5qtW3oGNBz3sKz/Wd3i0Xbd+cFHI2L30Beoau7jfjmh8IKL0TI
	 HI9tB5UlE2TDNE6z069XQ3m/oAT021eZCxaF+EToOxPxgq8CWz70dwk6GMsQi2/Lbs
	 +ft1G+kFtqgqNXmixGt+zAi75Kkdr7rVAp/5AqXc=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 14 Oct 2025 17:08:42 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Guillaume Tucker <gtucker@gtucker.io>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Miguel
 Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 automated-testing@lists.yoctoproject.org, Arnd Bergmann <arnd@arndb.de>,
 workflows@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER
 option
Message-ID: <20251014170842.2fc00c88@nimda.home>
In-Reply-To: <CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com>
References: <20251014094511.627258-1-gtucker@gtucker.io>
	<20251014094511.627258-2-gtucker@gtucker.io>
	<CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Oct 2025 13:58:10 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, Oct 14, 2025 at 11:45=E2=80=AFAM Guillaume Tucker
> <gtucker@gtucker.io> wrote:
> >
> > Add scripts/Makefile.container to wrap the make command in a
> > container using the CONTAINER=3D variable to specify the image name.
> > For example:
> >
> >     make -f scripts/Makefile.container CONTAINER=3Dkorg-gcc defconfig
> >
> > The container image name is entirely arbitrary and the container
> > tool may be Docker, Podman or any other compatible alternative
> > specified by the CONTAINER_COMMAND variable.  The default is set to
> > docker for now.
>=20
> IIUC, this wraps reruns `make` inside the container, but it means
> hardcoding a particular tool and path, right? (unless one sets even
> more variables)
>=20
> The cover letter says one can create an alias for this, but one could
> also do that for the underlying call anyway, unless I am missing
> something. And if we do this, then I would prefer one doesn't need to
> type `-f ...`.
>=20
> Put another way, for a user, what is the benefit of having this extra
> way of running in a container? For instance, I could see the benefit
> if different tools had different flags or it was a complicated
> procedure, but I think at least `podman` shares the flags used here.
>=20
> Should this instead be a document inside `Documentation/` somewhere
> that explains how to do this, pitfalls, advanced options, etc. and
> give example command lines for different tools?
>=20
> If we do end up with `CONTAINER=3D`, then I think it should make it work
> without having to pass `-f ...`, to make it easier. Or, even better,
> like the KUnit script, we could have a script that does the right
> thing and reads a config from the user, so that one can just type
> something like, picking whatever tooling the user configured (e.g.
> Docker vs. Podman, default image, etc.):
>=20
>     scripts/container.py defconfig
>=20

I think this functionality would be better implemented as a script
(like you mentioned) rather than a Makefile. The current approach is
likely to run into several practical issues (e.g. file permission
mismatches between host and container, the need to manually remove
containers with `docker rm`, etc.) and addressing all of these
reliably in Makefile can become quite messy. Writing a python (or even
perl) script would make it much easier to maintain. Also, it can be
self-documented quite nicely with `scripts/container.py --help` command.

Regards,
Onur

> Thanks!
>=20
> Cheers,
> Miguel


