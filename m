Return-Path: <linux-kbuild+bounces-3304-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAC967615
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 13:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07F0B1F21113
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB77A1684A6;
	Sun,  1 Sep 2024 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnbS0Ou3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF214E2D6;
	Sun,  1 Sep 2024 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725189071; cv=none; b=lGS/Z3nW3YEG/m+CvhEYMX/NLX43LwUrCLmnhlyy5CTom+FHOPAGaNcV0deYXCt6Vdx83YNRYjjhhjx1WZ1FvKi24x5hBEiDYYa+EEUYMRniy8Vu6yq9xNjI93bu3644y1hmb8Ji0Q7zzor7ZZtR2ODg94dl6C62RT+A2SwtfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725189071; c=relaxed/simple;
	bh=/kRi1BXJNk68ynXZVdjZXz+kAeHQl3DMktw9NiNziFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkCvPsSZDyEH7J6IhjLUbQqhtEGQB5Pa5UA1LroOQGmfLlg5xuy/C91hKwe+m1tisZZOxdS242zOFERlqa0qCawQ5lu1epwAOrousdLXEPzsc9yK2ILjIWLSVPUa8GESJwCSy3D6PRebHo4+fke3L8oTDOCnp1RE3Ev7iY/K3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnbS0Ou3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BFCC4AF0D;
	Sun,  1 Sep 2024 11:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725189071;
	bh=/kRi1BXJNk68ynXZVdjZXz+kAeHQl3DMktw9NiNziFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OnbS0Ou3skR01dhiVlJKj8rj/O5JBVog91U1k3JTY9WAnP/2LxM8nW1vr7zvQXEPX
	 s5VN7sFRoAil9yWinLqzc7Pd0WrZKASUDpvHM1RBr/KQ+DWZAw/8WGgsVhwZg4rbhC
	 noNuV5QbXbLfipfP2UR6XzRmdZvWLO5IIBfyyjvl7P0KHnV4ZJHDC+2WpVXW6pNLXC
	 kPjfFuIN6/bkTNdcx24zdXmoUZytgwYuZpEdB1uQPm4qtujblV9oH155+M/XmB2IcA
	 1aI/8PFe0Kc2otFOIeRSUl5OuGNgCfHjV8vvp4I/+6xUk35ULV35Ad3UpZfMsyiNyG
	 cPDdPSokJzusQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so36940431fa.2;
        Sun, 01 Sep 2024 04:11:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKduDUAmijZHkkYGyEhne68gnS6dSM67sMf4iY7RLELc+wO9Sx6zZvi9dtGjsTAh0eFiOWvsJyq+7dSrY=@vger.kernel.org, AJvYcCViwTBUPKufNEU+Rf9iKiIEoQcxZrwX5v6p6A66KS7xINmBp7JAyU6IjY6VuqkafDCd4COo1K+ZtmtnvBwn2Q==@vger.kernel.org, AJvYcCXmWDA3afKRlRt4IXl3d8uBLKaTAU9EUMConmF77EdzMK08pELsobkqAnSmjl3KH5L+EeiySmW8UInaMYaR@vger.kernel.org, AJvYcCXyUXa7aXziWUxApw/w9mBtCwdf4ctUJW9j8YdH62puRlOMAvcIlH1Fk/APzLxMvC2cLghJbOmCeZUi0gp6ipY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqOsBNNFtUH+067Z/PPdhu0eMQDwHo4tDOdEO9WTWXUn4PsSZ
	UrwvxOLgHPOS6cDQoXE1uVjFX+cRa9pGD+Es1ZpWuUwjVsqu+tPRFJWFt2LMPXPpzhvdzwp2gWf
	jVZtyfmbcGDzpza0l+cTw36l26/Q=
X-Google-Smtp-Source: AGHT+IGL1wiKwsPDCCGF0WzuPHnHYCPElIIuyjIRQwpKZEHvrO1ORjYTSgWFNnuEJwzIxVk6iNSghfJV1on1F8hryJA=
X-Received: by 2002:a05:6512:a8f:b0:52c:d80e:55a5 with SMTP id
 2adb3069b0e04-53546ba108emr4422637e87.41.1725189069989; Sun, 01 Sep 2024
 04:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-24-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-24-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 20:10:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQs8E1pKo1Bcn4RUAkGbBFPmUsWRRrQCnUUiB588FB09A@mail.gmail.com>
Message-ID: <CAK7LNAQs8E1pKo1Bcn4RUAkGbBFPmUsWRRrQCnUUiB588FB09A@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The compiler may choose not to emit type information in DWARF for all
> aliases, but it's possible for each alias to be exported separately.
> To ensure we find type information for the aliases as well, read
> {section, address} tuples from the symbol table and match symbols also
> by address.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---

> +
> +static int set_symbol_addr(struct symbol *sym, void *arg)
> +{
> +       struct symbol_addr *addr =3D arg;
> +
> +       if (sym->addr.section =3D=3D SHN_UNDEF) {
> +               sym->addr.section =3D addr->section;
> +               sym->addr.address =3D addr->address;


These two lines can be replaced with

                  sym->addr =3D *addr;





--
Best Regards
Masahiro Yamada

