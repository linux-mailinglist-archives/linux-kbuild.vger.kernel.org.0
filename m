Return-Path: <linux-kbuild+bounces-3356-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0D96AE7A
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 04:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3A181F25B4C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 02:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32351DDE9;
	Wed,  4 Sep 2024 02:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tffmEZe7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA9BE49;
	Wed,  4 Sep 2024 02:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725416181; cv=none; b=DMHLUMY9sfUAXMfVF80bwESx6CZ/U+ttOA3q2qZp8D3H4aoIGf+vBsMwk6CwuQugyAZzyC8TEUWkTM/KtIrjXGsSoHLa7AZpzVIK1ZggOG/fKOExuKicB7Z5yWqbp+oskApQX2v1MqgQCQmgJgGZia5VPUmKgIwImJAXsZaP8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725416181; c=relaxed/simple;
	bh=+6e/KTyy6zvpoxC1aqlcDjymL6VtOVD5DqVq1y8ne+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O418wCyzhsUbyxhtrdQXJX1488QCQOnnKf5gq1BFy8SyQXum/JYHlyF+LiOkkZp6TsNqF/L0dCkHs0BZEq73AaM4lH34DdPUnWp2vPK0eKnQCYXTdW363ik/2Vk8UgX8x68RhxX/99zogvhAHAeQ9g8ofveixMdDNGAWZkT2LNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tffmEZe7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C7CC4CEC4;
	Wed,  4 Sep 2024 02:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725416181;
	bh=+6e/KTyy6zvpoxC1aqlcDjymL6VtOVD5DqVq1y8ne+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tffmEZe7VL80ppP0Lmdf6pO0GauGuExvIuantmhPyjwzs3ZkBkIQe6dSS7JFm4bSC
	 5o8wzC+Q1G6ttVSZ3sl4zRnaB4KKLxogclm4+JQ+vmH5DlqpimYDpLD5KbRwZdDniw
	 jd402h9YlF/kR7k/DH9vmmvexQ3czSQT3FfmuQPznPnXEF4dSgh+T/PFRTHm2S5Zzs
	 9qIB9XiTWSGq//Az0VUcXS42ULf2Tr1I2e0VxR3Vh5zdmWNqoX/hdd7A9SVL1kT55S
	 N+hzYpbf9+UDkxnNaWJqfWVuiSa9mCNlRkitDlKWTMDdx6HSfPvPXNfTnueiBuo26H
	 9mYC8SD6SilTw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343eeb4973so9393357e87.2;
        Tue, 03 Sep 2024 19:16:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUruEks/nTaoPKcLuR4KXF/d9vYQOC5VLdieJ+4nEQj6nllZZYaPQ3NM004mi285ZDIZuLN5nsYRyAO+7Wm@vger.kernel.org, AJvYcCV5qA0rKgMcLgxsJl+ywMUujadBoef1A3Gkf1/S6rQzApGFzq7niFlfoDi6fXS82gzrMQYz96gzfwCBBH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydaf0ExWTmhNPPuMNGYqN7rH37jxpiEjYdDt2WFtgXS6Baf00Q
	ZZntyiaMdXWyQxgEh/N7WaguN8XF5ebOr5VU/qv8EkauQfyA7eIehZvpPSvCTs4rso+9wDxu83e
	BoDOaFl7pH4GCvMU1o3QleGtn0vc=
X-Google-Smtp-Source: AGHT+IErXPCTv6mUA7KQqm65PP55vlNSUJ0CbdcUIwEdpHVzOsM1+jrOcXUkKEh0TYLL0WzgXOqBH1NP9eIIfTeL+kI=
X-Received: by 2002:a05:6512:3da4:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-53546a55137mr12111329e87.0.1725416180049; Tue, 03 Sep 2024
 19:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902160828.1092891-1-ojeda@kernel.org> <CANiq72kV90EjHGitEVO4GQFYtQJZ_3-1rkXJnOwez7u7Ph+Z3g@mail.gmail.com>
In-Reply-To: <CANiq72kV90EjHGitEVO4GQFYtQJZ_3-1rkXJnOwez7u7Ph+Z3g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Sep 2024 11:15:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATf7A1z38rQP5tHKb0Zp-UouW=UfqyaEd+3A3giXxRh8Q@mail.gmail.com>
Message-ID: <CAK7LNATf7A1z38rQP5tHKb0Zp-UouW=UfqyaEd+3A3giXxRh8Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: pahole-version: improve overall checking and
 error messages
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 1:13=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Sep 2, 2024 at 6:09=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
> >
> > +if ! command -v "$@" >/dev/null; then
> > +       echo >&2 "***"
> > +       echo >&2 "*** pahole '$@' could not be found. pahole will not b=
e used."
> > +       echo >&2 "***"
> > +       exit 1
> > +fi
>
> We may not want to print a warning in this case if this case/setup is
> too common, though.




I am fine with your color (in case someone wants
to run it manually?) as long as stderr is suppressed
in Kconfig.

default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE) 2>/dev/null)




scripts/rust_is_available.sh is very verbose, but
we are not annoyed while running Kconfig because the
$(success ) macro suppressed stderr.





--=20
Best Regards
Masahiro Yamada

