Return-Path: <linux-kbuild+bounces-3813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04384987697
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 17:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91F971F27229
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 15:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089A27BB15;
	Thu, 26 Sep 2024 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4ybUihS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945F15A862
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2024 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364838; cv=none; b=hjovMb4pPcG3x/MNJHkUjRii/6636ZgiYKfeLCMtjkw1AQ8OrVK7ycIWOSESXvLqE7GNuvfcUraLX4J9k+WIdopgXBWFnELkXtJWUL5gTyG8jBfteznjE6KAmxOoNRoxgqWYeLt9mjJre5Y2v69somFsfUm1KvylqhZCR8gxcgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364838; c=relaxed/simple;
	bh=xhUp+qpLHHVy4/bnxlINU4y+2Q8Rb0M+mIeg/0YB6sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oG/vQ+J/yYaLwpxMf65IubmmZkXS00PRCKeERFp4EmqYL8UzA4+rOd1pBEsqAMRP/axGGkSv85QjIi5ebXptrFWj//NtXh7wfe6AgjXb4EQNYPzYoS4+ouLqq7c5CZ8MZ1Nb1xBat4UgEgzwOQWFfNBYUo9FSxf9KDFGi+43jX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4ybUihS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A56CC4CED0
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2024 15:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727364838;
	bh=xhUp+qpLHHVy4/bnxlINU4y+2Q8Rb0M+mIeg/0YB6sU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R4ybUihSjqwYRa3vjmULv5KRo2jeZvJ0UgIjGCrZikiIrLS9IJW7iH/yTTK8PS90+
	 CUYBY1lfGTF33834JkMshYoURoGS+IrA5hIHJ9M61LGRAugVTOYy+HuSolnmPOPZwU
	 wnbiRU/pIFKLEj0dfXJXFW0UCZ+VDBqsRT2JXcBCKRotc3D6bkyBjzslWZyf/t15Fl
	 s6+O5wIpn6ncuVnL107+7Yh/g5zB5THF2JHJAcxkAhYuE15c7Izk5kdAMJbNkeBCfa
	 1uWsW8SOsP//tOYeEE/ji51rQZV2RJm/cJa82Im0yMO/C8W8ErpML91A3eoLUpEmxp
	 3NqjjasVj7dcA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75f116d11so13181331fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2024 08:33:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmQYmx2PVmZgDRngVwNHnd/yiodxQ8TWsCRmlNMkcM7Y7sKSdbjBbA+xr+SpPveQN435U/91MCP+lToJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIBiIf0M41S0rFbk6yWNwTDxMFxowfrzViGuWCDo9HKLKFymo1
	7tbjU98JVfrclMz4+mt0rqUx/yxaSHbwUzwCKBSwudhU0iORoYiIO0OjQM0uKOL8fJXAfvQeCci
	YkhVqH4zrVLx5jFMCOr7tNZ9Wtlg=
X-Google-Smtp-Source: AGHT+IEBc3kKV7SWlvlROgv4gLKI6bzcuFa3zk9R5uC9VFII28LQWR7veYsRwYadErzB1e3atcN6zI2J3WYcGLnGdZc=
X-Received: by 2002:a05:651c:210a:b0:2f7:5cd3:7235 with SMTP id
 38308e7fff4ca-2f9d3dbb8f9mr918111fa.0.1727364836970; Thu, 26 Sep 2024
 08:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <rxsikukdh39.fsf@localhost.mail-host-address-is-not-set> <CANiq72nwcAAC8eGCzHZ_sOwccCqbg3KD6CraXj2r+hDwhYqqig@mail.gmail.com>
In-Reply-To: <CANiq72nwcAAC8eGCzHZ_sOwccCqbg3KD6CraXj2r+hDwhYqqig@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Sep 2024 00:33:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNASX-BDHeTeuEnQwJct5wcqmMGbBQo1EeughfKe83pYZ7w@mail.gmail.com>
Message-ID: <CAK7LNASX-BDHeTeuEnQwJct5wcqmMGbBQo1EeughfKe83pYZ7w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: use memcmp instead of deprecated bcmp
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas Meyer <thomas@m3y3r.de>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 5:50=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Sep 24, 2024 at 9:26=E2=80=AFPM Thomas Meyer <thomas@m3y3r.de> wr=
ote:
> >
> > Make build succeed on systems whose c library doesn't provided the depr=
ecated bcmp function.
>
> It would be good to mention which systems are those. Other than that,
> it looks good to me:
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>
> Cheers,
> Miguel


Agree.

If there is a known system that does not provide bcmp,
that information is appreciated.

It might be useful to add a link that mentions that this function is LEGACY=
.

https://pubs.opengroup.org/onlinepubs/007904875/functions/bcmp.html


--=20
Best Regards
Masahiro Yamada

