Return-Path: <linux-kbuild+bounces-2134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA90909669
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Jun 2024 08:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D392B2178B
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Jun 2024 06:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97FEDDBE;
	Sat, 15 Jun 2024 06:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhgKAkUv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B817BA5;
	Sat, 15 Jun 2024 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718434231; cv=none; b=Z77ePvI/itohU9FRY1N3IhTI3ewgiXPQIUtMmCOYmh136bVXV6U/UK4o7X4hU/TFLgilQG8yBMm52XWm7ouN8Pqd+PyqJxePh0x3/DsSrQx2+HeR4vbo60q5Po3VpnEe5ZpAyoz8k5J9y6m4p7b5cezeCnQIMpCMy2bOzIqAumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718434231; c=relaxed/simple;
	bh=w9q4rwux8PEpDu8FkmvSmiQpihIq57Ai67mpNZdkY4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue+kMNY9tIE98fQQl+ZZaac4ERESZ2xumscm+Bvhwek6PTlE/i3jxnYKXhc/Mpl1WwPz4QejB4o5ZzQ0vdYZAvO4X0lzzwHFbxfq2vMmI4/L69sl3Vv9rGTW+db35BcZyqBM0PWQfl4QDX007vnBmNcYNnAUY2Qpbu4uxKgxcDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhgKAkUv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15C6C4AF48;
	Sat, 15 Jun 2024 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718434230;
	bh=w9q4rwux8PEpDu8FkmvSmiQpihIq57Ai67mpNZdkY4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qhgKAkUvn34QdT1i/JjLp8ZMBSvz2h3t+YJ4dXJeoY1P4ZNoSooW2wzmrH9Ih4XoS
	 +bjqPbCQXJIBrDZ2Orn/E0cwhxixbjU+8ZWbEoiFnFgOoakohFvZK6847rd5XgVKG7
	 CDanbZdsHu4r36jNOqYG2FSLbIFWCpFH8ZkWepN3ZORgkKq0Hn9HxLhAortgP1igx3
	 WSlCCnb+6GUPMHEoPjxszA/PkjfHZntSWrdhzVKAGpSKxYJwtqiwm10d1VWzIqyc7I
	 +Ud0qXnaRlXBQtKZWEsMBNK3COv8nFN6IsfpV4Jf5wbbwEemWLds6fI6qoKleMNV4M
	 OWdpGgg1g6s2Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso46416681fa.1;
        Fri, 14 Jun 2024 23:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRp48WuMYkixk5L1OoTRvmSRApWoAUnX+9hEaAt/SI0iU+E38DRBj6YBRorEOqyB6tDjIK5f9By2qv8z259HD5inJtrafhRhhloXbaLHFj6LGyGxQxy2IikXNXwgWtxkZksx8Nb3Yyre2Jlp7VhxGr9xhxqE25vwEJeNw7HEcQjOeDcuqu
X-Gm-Message-State: AOJu0YyiRXLoHEFQ1Tax1RbDVYk8zGOLmKAbXRBOoRpfpKfmvLaPYU5o
	pMLgrr4JKsJDgrR+8EjQujvGvb/LJ8IUMDUfmi0OlmizEdjddMWD9j0SJETz+FyU8ay/WPYj11v
	zC0sHrWyUdcwEasuj6gTGog0Sulo=
X-Google-Smtp-Source: AGHT+IE2jBzSWlCnzMDvbaAU1tAdAo/962aKov4fx3jwh5Oyi/Rg12iVqSJi65SEdda6X96E/o8cRRLhj3ohFjqRw4g=
X-Received: by 2002:a2e:a443:0:b0:2ec:1973:2b89 with SMTP id
 38308e7fff4ca-2ec19732c1amr25512591fa.30.1718434229513; Fri, 14 Jun 2024
 23:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614071507.11359-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20240614071507.11359-1-mark-pk.tsai@mediatek.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Jun 2024 15:49:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7rWh_=2WVV3CXTyda=6sZacrkYT=qJw3sJOAFpyH70g@mail.gmail.com>
Message-ID: <CAK7LNAQ7rWh_=2WVV3CXTyda=6sZacrkYT=qJw3sJOAFpyH70g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: doc: Update default INSTALL_MOD_DIR from extra to updates
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yj.chiang@mediatek.com, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 4:15=E2=80=AFPM Mark-PK Tsai <mark-pk.tsai@mediatek=
.com> wrote:
>
> The default INSTALL_MOD_DIR was changed from 'extra' to
> 'updates' in commit b74d7bb7ca24 ("kbuild: Modify default
> INSTALL_MOD_DIR from extra to updates").
>
> This commit updates the documentation to align with the
> latest kernel.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---

Applied to linux-kbuild.
Thanks!




--=20
Best Regards
Masahiro Yamada

