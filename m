Return-Path: <linux-kbuild+bounces-5094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F59EEE62
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 16:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8FAB1687F6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 15:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D199222D65;
	Thu, 12 Dec 2024 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HssL/8vf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A42210CD;
	Thu, 12 Dec 2024 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018628; cv=none; b=YIareyA81Xf/tsaA5AN/J7mLblP5WUmNVRlb6qsPKP7/+zpqiLMvtOxLoPeG7cqMAiFpFvZ+I0R1Zaw53O0Kpkgs/ODrbGu2p/8EYFzP72OARWyaotlDPBRJtKazSz47ciYkyjYxbf27iziR9yqbwEUOnpGR6/h+R6Hxu4HVHJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018628; c=relaxed/simple;
	bh=SAvTRNNbapiAg5dpA9PyCGERpK6EazCw4Yr2O+tX678=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezXwR7oe5Ef7k2UqXIOfs/hmqPbKJotcMlvAUlcAp9DEO0Nq5Mxs000L1jyPbB+HuqVRRC+AjP8UvC+QNycZtTJChWzKAO+LLSq/V5EJmxc/J7A2mzuGpUl2O+SsqsI2o5tfSwuYjCyRw6+q9dwFQTtS8yKID1PK1vKgHjc0LNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HssL/8vf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF80FC4CED3;
	Thu, 12 Dec 2024 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734018625;
	bh=SAvTRNNbapiAg5dpA9PyCGERpK6EazCw4Yr2O+tX678=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HssL/8vfQavJjMJ2WBf/N2FweKs9mml17vBqy+alDd7BzaE3eCS6i3GCHQJgpV2oA
	 oK9F4NqcXezotmGu70QTtWMu/rHmNi18b41Bm4YKNnjuBCMkVcXOsJSfxmj56fAa+d
	 /zyy00RvFs39afAAf/peAEXiXUd8uFRDpHDgeHp+pyoeZd9PcdIn1iPr34uby+cym2
	 PpbbLvEVwd/wjkiSrTWLB8I7rI+feVUjQoT4cmuyrT85La3ueNAwBUjiJVxiF6qj5j
	 hru9t07sNo7fM7DHA8GB+67CtI6WJUyiLVSbxFC0oEQrqykd8VB2pOqEUTwURgzvqP
	 X8r2M6BUNe+iA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so7811261fa.1;
        Thu, 12 Dec 2024 07:50:25 -0800 (PST)
X-Gm-Message-State: AOJu0Yz0lZ6A3o9rhXZ0/hBOX/n8DdueCrK2Ku49L4u8vTOpJwyEj08Z
	y8R8+NXUmjqJruio3hPE9wpkIfpKaH9B+pD4oRTQwZSLYPz+t0B+0cYqTHRZowpXqltKdIjPAum
	SO1pl64HFM9TJ8QJErhoExkzA7LI=
X-Google-Smtp-Source: AGHT+IEqcQZ0DjYZD0cBKnUgKIy6QbViNthhBj/SQzjcLeD8uNbIMPhOGGDD1hiQno/0oqEpCBXkQGyQ5UFUjKy6CIA=
X-Received: by 2002:a05:651c:1507:b0:300:329e:23fb with SMTP id
 38308e7fff4ca-30251e89840mr3539601fa.34.1734018624470; Thu, 12 Dec 2024
 07:50:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212154619.2235767-1-masahiroy@kernel.org>
In-Reply-To: <20241212154619.2235767-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 13 Dec 2024 00:49:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMT1k_sTpUDnzBE1Mho0faqzo_ZpouEoPvL5mAS8f_zQ@mail.gmail.com>
Message-ID: <CAK7LNASMT1k_sTpUDnzBE1Mho0faqzo_ZpouEoPvL5mAS8f_zQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: distinguish same module paths from different
 dump files
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 12:46=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> Since commit 13b25489b6f8 ("kbuild: change working directory to external
> module directory with M=3D"), module paths are always relative to the top
> of the external module tree.
>
> The module paths recorded in Module.symvers is no longer globally unique

    is -> are

> when they are passed via KBUILD_EXTRA_SYMBOLS for building other external
> modules, which may result in false positive "exported twice" errors.
> Such errors should not occur because external modules should be able to
> override in-tree modules.
>
> To address this, record the dump file path in struct module and check it
> when searching for a module.
>
> Fixes: 13b25489b6f8 ("kbuild: change working directory to external module=
 directory with M=3D")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/all/eb21a546-a19c-40df-b821-bbba80f19a3d@=
nvidia.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


--=20
Best Regards
Masahiro Yamada

