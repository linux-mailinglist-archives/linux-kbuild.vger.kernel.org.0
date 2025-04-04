Return-Path: <linux-kbuild+bounces-6408-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A5FA7BD1D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEE623B5B3D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3C9E56F;
	Fri,  4 Apr 2025 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Igs74AJL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DC42C9D
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Apr 2025 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771679; cv=none; b=mmlD8LgZI5oBxGlMG6CMbRRy9XIXAzmYbdMLN+nLq4pVuDHkghc+yzCcRtERaBp0iumDZ1lqixDBuQdGLeiB0ivvN5pMORq3ERCzRujvGXBpG8I4122pqb0hIjSvJdXRQcqJM5mpTtnsvBwuA7+1+7YN20Hf0RGXqvV29WPjJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771679; c=relaxed/simple;
	bh=ukvaDg/r+KEN9ByoXMgaiv5W5dYSErRX1Ou/ZV7leto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cb27yTMRhSUsQYuEsj1HvrnEXKy7wUDNjZi5N4xEZflGJsYJjZzlWF1ZukelhwJRp+DgJookDPMYCE+XEX7HhD0KUDHlRwT8dWJGhZN4hfsAyXjkwBuyOJhfDzq4BnHKJXUxnErwtmJgcoZ8g/U5ZHflOFHE8LyKWHOMr4bpc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Igs74AJL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40B6C4CEE9
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Apr 2025 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743771677;
	bh=ukvaDg/r+KEN9ByoXMgaiv5W5dYSErRX1Ou/ZV7leto=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Igs74AJLtO53TMkb+VRf/J4EvuhBzg/5YEweD3BIdlaGVw9yNkK9O/j2VBTeQo/BF
	 rTQAjFUkNgLR9HGYYwaPdYWp3P0qDvDg9Pj1kEm2/B1m8sl5vMtywYh7HQfq7S2F4b
	 zXbDaUjwuafdN88yVSfEfjvisv9lLveMuL7uLpmVyCN27QFG0tEZMEpx1EyOWWt8yq
	 Iw9m9+PxxtLSC0hqGfNMVaeDK8mQ4kLg7C9OB4JEUPfjykHPN6RZVc8QEYBNYGZyO+
	 +hc17v8j3nh5q0o3+tXdJvsyDpe0F7qBhVVHe2qcfTvvE7VnF9vJa8e+86ITsW0J/I
	 7RQXaJDos8qIw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso18121891fa.2
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Apr 2025 06:01:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YxG3p1MQo5jVgQ4v4J7lKLuJTn7XlnXnYMD2VJcrFMl3bUYltgY
	pmhuZl4ZLO20BL9GOxUzmBmW1K9L52MgWyF55gzLgmQ5dncywI6LPL+OQZRTyAzx++8Mh1xHTBM
	/idIZp2OYDNOvfanJ9qcVUWig9Xc=
X-Google-Smtp-Source: AGHT+IG00naJZZH6dEx1p7p3bEvbKQS75IqRH3WK71KC58LaMJki9CmtK5Gf93y1SahRV0eewH+A2vXKf39rujgiBio=
X-Received: by 2002:a2e:be86:0:b0:30b:c479:4017 with SMTP id
 38308e7fff4ca-30f0a0ef05bmr12258451fa.8.1743771676539; Fri, 04 Apr 2025
 06:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DS0PR10MB7317103847A838A01154D836EFA12@DS0PR10MB7317.namprd10.prod.outlook.com>
 <CAK7LNASc7jmzmW5HbvH6N=gZw2M5o=iSkk1revZAp_8P9-e9zA@mail.gmail.com> <DS0PR10MB73173D13E7322C77B6F10C3BEFAD2@DS0PR10MB7317.namprd10.prod.outlook.com>
In-Reply-To: <DS0PR10MB73173D13E7322C77B6F10C3BEFAD2@DS0PR10MB7317.namprd10.prod.outlook.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 4 Apr 2025 22:00:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWKW8zBdtJvi1L3QvZXRq=+HWRc1M3CYmnK8rq0dpkHQ@mail.gmail.com>
X-Gm-Features: ATxdqUGjTVg1XU5Twk2xAdk9lzIRbzC0xeAWq5B3RS5B8d6kYVK-x2VYsZOJY2k
Message-ID: <CAK7LNATWKW8zBdtJvi1L3QvZXRq=+HWRc1M3CYmnK8rq0dpkHQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9A=A0=EF=B8=8F_Re=3A_kbuild=3A_deb=2Dpkg=3A_Does_the_deb=2Dpkg_tar?=
	=?UTF-8?Q?get_discard_multi=2Dcore_compilation_options=3F?=
To: Richard Bastos Higuera <richard.bastos@smartmatic.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 5:44=E2=80=AFAM Richard Bastos Higuera
<richard.bastos@smartmatic.com> wrote:
>
> Hello Masahiro Yamada.
>
> However, the deb-pkg target seems to discard multi-core compilation. It c=
reates the DSC source package and rebuilds the debian/control and debian/ru=
les using scripts/package/mkdebian.
>
> Unfortunately, the build-arch and binary-arch targets compile the kernel =
sources using only a single core.
> I would like to avoid patching scripts/package/mkdebian to enable multi-c=
ore compilation. Could you kindly suggest an alternative way to activate mu=
lti-core compilation on the target dep-pkg? I'm trying to avoid wasting tim=
e searching for solutions that aren't practical.
>
> Your recommendation carries significant weight for me.


In my testing, "make deb-pkg -j<N>" builds the kernel in parallel.


Please provide me with the exact steps to reproduce the issue.

Perhaps, you and I might be doing something different.






--=20
Best Regards
Masahiro Yamada

