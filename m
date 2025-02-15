Return-Path: <linux-kbuild+bounces-5763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CDCA36E51
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 14:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 592E416F100
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 13:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A9019DF41;
	Sat, 15 Feb 2025 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBp61BU+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102EF623
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624670; cv=none; b=UnhUaxFJFnLZ9GPgw1r4lQ/tKdnpiY1sSO4xJ3tnr3tsZ9AwifpMi2jrqaq7THNKm7DBhV2EAQhziBdWphSpQ4r7nMXZ6ahdKbA1sLgP8szFH3dvzMmjn094lc1bAuBZyr5Qhvb7Jq+xEpFGbi/AUPkm5dQuSErrxp10tLlOqSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624670; c=relaxed/simple;
	bh=kvQmOQpt/86fgoN0t8Vzx97wU1GoT9PaZgj93uUioes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwcUu0Gx/r3eKo9pfpUxY3RQxzwxJJV1MNAYK1PGWHeH16sagEj09LgV35gBwhCSmFlRqEhk1tuT8r0CNN8wK66Na9bww3EpGSrLzxc+erMJ8AFq/8TCP4En7OB8I8tSBHih0yVBEjXdOv0lu0LKaZ52zAlBGlrJs43gC5oZ1fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBp61BU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891C9C4CEDF
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 13:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739624669;
	bh=kvQmOQpt/86fgoN0t8Vzx97wU1GoT9PaZgj93uUioes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NBp61BU+5uoP3+PEZpM8HqhT8MzxtubTPDD9wF/33/aoTEkFcZmBfGr0p2bVCayBK
	 xrkRelQGpO97CW3Av6TYcihl0SHFWiv8kb1rje7SY3Wn/QCXYJIgmfjsrchelICkOi
	 G6hcPbN2bxBoOtc9AATq3KvBXl7ZEtI7I76cQutCFo/H+nTCjHrHjyg0oykDsxwXHs
	 w0ls5LP7Z+0K+YpV/0cobPnCqPtKa6rtSsv8jfgqkCOs6GtPyv5MZoj7BiMuNkLTgT
	 hEqddyH3YHx59oPy457qLeA8AsEqtZec2osWvJ0HaGODKeGy0WUdSqaAD0k/FwidNl
	 y7XDw4TVs25Jw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3091fecb637so13763481fa.1
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 05:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVW2+R8BxOOqFuINlbvG7tz4D3htJqvETf4J44MdtZ0r7U9tTybNlgii5w0HwNfkONyIYeMn/HDZxlU670=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXKL15LO5FlQhDaEjlY5lKm3DdRxp0jW+vdByvzXO1bGwWZla
	82aZ3IAEV+tIk3/ZxpRL/DPy70pNqS2o5zXVTrn99pPDTFqQ72rsBn+b3o9sol7lpZTUGaj5bAf
	GMV2hN05BBEmssCEQOdaaw0UnZWo=
X-Google-Smtp-Source: AGHT+IEftCjwFqDEImZ61vHNWrMTOAnCinmXGmSzn5WPK+SyfNQ0Q65Pqu7W7jA7Ij8TgpQd5mGW/mtcGzjod63Iwz0=
X-Received: by 2002:a2e:9ac2:0:b0:308:ec9d:d9c3 with SMTP id
 38308e7fff4ca-30927afdb64mr11363571fa.26.1739624668213; Sat, 15 Feb 2025
 05:04:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213160430.104118-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20250213160430.104118-2-u.kleine-koenig@baylibre.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Feb 2025 22:03:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASxw6aFfZG0j5rOnT41WHLkHnpxKq3woyOmEjATz-dzwg@mail.gmail.com>
X-Gm-Features: AWEUYZm1Y4fHsoPAZfB7y5g2qutNwkmfPlwMsz9G4r8OOfP3-jkZLR3EyVxIdFU
Message-ID: <CAK7LNASxw6aFfZG0j5rOnT41WHLkHnpxKq3woyOmEjATz-dzwg@mail.gmail.com>
Subject: Re: [PATCH] modpost: Fix a few typos in a comment
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 1:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Namely: s/becasue/because/ and s/wiht/with/ plus an added article.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>


Applied to linux-kbuild. Thanks!

--=20
Best Regards
Masahiro Yamada

