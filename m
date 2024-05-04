Return-Path: <linux-kbuild+bounces-1753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC688BBBA8
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 14:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2753E281CDA
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DEA224CC;
	Sat,  4 May 2024 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY5D3DCF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974202C19E;
	Sat,  4 May 2024 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714827526; cv=none; b=mUWBIV/D59rk3NRcKWIL0jVCf0g4gkZt8xixbVrEeG7s+vM7o3+ONWrcsSkM5ivLKUXqPfFkpe/vCiypHmlgLPmoeRixRJQT9a80hsxSbepse+4bjtw4nuuuhIVPf/oWaZouJHSo+zU3jZgxiPpZGe5dy0ARu00SGq7k30WAI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714827526; c=relaxed/simple;
	bh=hXNgSkWwV5LZLhpVWGiACGemV4ufWhJzafZAUIlL/Ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyfsX88hR1BKJYC/ULAtINlQo3Lt3s8NsS5njLE7VyudTXJ5J0QVx/TmTXQO7w2X4u/folGbB5zKjKn35mfELWRKwqp7ReQIyd8drL4ccqgx2iFNJPW9DDRcHERAciLtS4YYJtq+wqUS2d3k70KDqno4PUvpf2KaqUzJ9F4oU1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY5D3DCF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34698C072AA;
	Sat,  4 May 2024 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714827526;
	bh=hXNgSkWwV5LZLhpVWGiACGemV4ufWhJzafZAUIlL/Ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XY5D3DCFrGDofD4I75mYiI07dMFEL4RGn44HFWdUfc0ryl9FZFN8BRFb0omeeKveY
	 DhJU6AWBxpP1gwd0ELWjjQQke4D3P+HhNaakmlRRxmdCnJKqxaeOnjNR3XQAWOPUA5
	 olRTI79+5ikFY0XkGz77Z+YVmBhP42Kp3EOS8LHyqkyUKoBT2glb2N9F8g+5fzoh7+
	 NQT+lWRjctX/Ffzsxg70Awni0kfibrogmW0BC0bM3Cqhs+YgLtU3w9VLFOmyWTM1Lq
	 c56xZqPLDe3IvqUWwp+RyHMBGoSAoGA1axgq7ImuRnrOLaafbd2bwdUAvWB6ah5t+p
	 fN/CvDO5Tevow==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52006fbae67so429357e87.0;
        Sat, 04 May 2024 05:58:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWXvQ2Ou2oWQE1TlhmCe0tF2H+lQ14Lot2WRAwg3K4otgMaTLpq5i/Zvv2CKDKTiaRbeJ+1EDqVghA+AQ4bbVagXP4ruiJVM0McD/pVQW71cPufZKIQnxdBxR5dqYGH43r9tKx0xqN1lgs
X-Gm-Message-State: AOJu0YxsQS9hL1TXpehMuaG3SGGOYiyv1J+H40DhDn8wGA/DRDpFJok2
	XPcoJwHImGDAeTVorHLi+GeWJFFfcJbjAzoXqZr0KNDVwxSB1quciEXvZXV7bj70cGmtpaJVBfr
	7YVRDYlgtGTm7s0JlhFNDf9jXVyM=
X-Google-Smtp-Source: AGHT+IFq7LW2EIDcLPPbgiqTYqA0fmtOzfyu2rvhKZGIplFMx7KFWO8jYCsN+xvmxPJWu7JvdXCHRan6u12lYo8HZ5g=
X-Received: by 2002:a05:6512:34c9:b0:51d:5f0b:816f with SMTP id
 w9-20020a05651234c900b0051d5f0b816fmr3281626lfr.15.1714827524974; Sat, 04 May
 2024 05:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com> <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
In-Reply-To: <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 May 2024 21:58:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
Message-ID: <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images
 as vmlinuz
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 8:16=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Use the KBUILD_IMAGE variable to determine the right kernel image to
> install and install compressed images to /boot/vmlinuz-$version like the
> 'make install' target already does.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
> This patch depends on Masahiro's patch at
> https://lore.kernel.org/r/20240414174139.3001175-1-masahiroy@kernel.org

Thank you for fixing the issue for riscv.
Only the question I have is how this patch series gets in.
If it waits for the next development cycle, it will be
cleanly applicable.

Anyway,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>




--=20
Best Regards
Masahiro Yamada

