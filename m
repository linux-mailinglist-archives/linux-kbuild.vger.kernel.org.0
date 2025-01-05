Return-Path: <linux-kbuild+bounces-5373-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47BEA019B2
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 15:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 920291627B7
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 14:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD551130E58;
	Sun,  5 Jan 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7pA+2xO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153F42A93;
	Sun,  5 Jan 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736086898; cv=none; b=HPDbHRDImQOscRyD7nmbZ/noChj8qm5TOAKFlXVAoWx+Py/ovMrj74Vgcgp5vjJv3FQH6pEwvZCJX5CcDWViO9OjEJuaPDDO/I+cCxxYZ0spWAfUT/S3XXjFco8bGuNc8VuqHlhMSjmUhMGXY6420CTsGMBJ43QdnmFJJaVTG64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736086898; c=relaxed/simple;
	bh=zhmSB7U+55M+P7j7NTDO/Y6M5HhYkiLPraR2/TSVDSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVEABUMG/iKxaATEUL470bsjTPxqMnWlvhgppTAonBFo6fMQraatpXL3rduT6Yo87SKu07U2xWconYH3rF0JE58M+5GqRf/osxdh4Wa4H7wAUYBHZLlluzHVvzDHHUtRdVyBbFX3EuDeui7dL2jN1BZCXWGqNuKPNWGj46moZ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7pA+2xO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19128C4CEE1;
	Sun,  5 Jan 2025 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736086898;
	bh=zhmSB7U+55M+P7j7NTDO/Y6M5HhYkiLPraR2/TSVDSk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S7pA+2xOVDt2QXNjPlkP8k5fcWKBaUKN2WjiUECiWHrqTSZjfPKei3c0id3F+0Oik
	 r9rFsLEUlcAPlafeACb5CMI0Cb4ptYnKJP8UNjHpvzpdfpgFuOEHSz90N2luNFCx2s
	 UwL8DeFu+/cNQd4mS1pO+TsVgSOkchEekd+GmS5MDgy/vhPryDi2X4AsH9xD2XkVaR
	 AXIQB50s0AY+Ny/2I1W9QQt+bkEOV4kNLVUjZkY5RPrX3r1HrD5S3fexGoVugp/jZl
	 zY1C/8tbDL8CyTtnesWpC1zs3LoMvdn7t6fiiN1C1Va2l+oBmac9owIUBUovoiKwnr
	 Pw77odOi+Z0mw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401c52000fso13768481e87.2;
        Sun, 05 Jan 2025 06:21:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfbdZjwxc+IQbGLV2gYVBPlnV+ks2gOImraj8mUXU5i4vKUf5K4siOf/tgynT1giHmV85T3ZkmTK/l9RNE@vger.kernel.org, AJvYcCWeT935iaYHMZNLDWEvbsNC4lJYiybLOu3KN6zlcOJMnUeo/lmwF1CKkf6OPQX5N7rZ7UB0pIrp/5OQ1XM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHS8XDELHdA7M+k3ehA+oNHbH/g2uiRuJ9Mzmv979UlXzN9ITg
	Nb0VcnYK5WhmfbVjXNNmk+xVYLdzaKniPfVX7yIG6HRuiDu7yitISRur8XF6+VgGLFP3Uvqnc26
	B9QA3G4HWkPIsNzjaIAmU4NlryEk=
X-Google-Smtp-Source: AGHT+IHcHKmXkasgIPNw/PwZP42biwqq1txg7E3H9XR2kuw63k6IXrDZu9kAX2YbKiEzwqC74XuX7OLIWIx1sGUaKFo=
X-Received: by 2002:a05:6512:308d:b0:540:2231:4a0f with SMTP id
 2adb3069b0e04-5422959d43fmr16477321e87.55.1736086896741; Sun, 05 Jan 2025
 06:21:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-kbuild-pacman-pkg-provides-v1-1-d568b4b9cfd5@weissschuh.net>
In-Reply-To: <20250103-kbuild-pacman-pkg-provides-v1-1-d568b4b9cfd5@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 5 Jan 2025 23:21:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQf2EV1nA5pa7ijMpmzMBw4ftu6Nk281wpNjaY4Ws_OiA@mail.gmail.com>
Message-ID: <CAK7LNAQf2EV1nA5pa7ijMpmzMBw4ftu6Nk281wpNjaY4Ws_OiA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: pacman-pkg: provide versioned linux-api-headers package
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 3:20=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> The Arch Linux glibc package contains a versioned dependency on
> "linux-api-headers". If the linux-api-headers package provided by
> pacman-pkg does not specify an explicit version this dependency is not
> satisfied.
> Fix the dependency by providing an explicit version.
>
> Fixes: c8578539deba ("kbuild: add script and target to generate pacman pa=
ckage")
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---

Applied to linux-kbuild.
Thanks!





--=20
Best Regards
Masahiro Yamada

