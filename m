Return-Path: <linux-kbuild+bounces-4281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A685A9AD1F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C277288CB9
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E541D0483;
	Wed, 23 Oct 2024 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dM7O36Pt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B967D1CF5C9;
	Wed, 23 Oct 2024 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702312; cv=none; b=CFulgkmViC8E/HuxB5uvGcg9I+t9oVpacrcTkyqR0xkpxU1THLNygFltbyEedKuZ6XD2gSD5JByN2TFYXxqlgHcnQu4VkU263PtosNMDAUJvRoL9d648qtPDoPIqNnizJgeVowRwWA+q3Z0+HgZ5p520dHvOL6QhqfBDFsPhY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702312; c=relaxed/simple;
	bh=esYxzWHZfczmmBYy5i8nzTkBzAx/4wwloNxA4P7+EXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5D0AEts5JcZbBgHIdI+d3/bj5ryTy7xSDR5G10tAisE6G0DjRxPVu/RaRWXm/Gouyh/HZKoUazetW9LYSGE47HIB7wIuw9SLntLylZIZGyQ+/tWw1wYIR5nmQCtCjTt/vSJmy9CqXAAdir0qz9I4euNEiq6d69hfjTyQBEBZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dM7O36Pt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C0EC4CEC6;
	Wed, 23 Oct 2024 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729702312;
	bh=esYxzWHZfczmmBYy5i8nzTkBzAx/4wwloNxA4P7+EXM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dM7O36PtRo09sWkvc2ow6OuLnIaTJkCdTCDXsqmpG6ZLkMxpDFNugKGSRklfWfLmT
	 XJCtAvmJDGSJq/Tft190tSWT+odHU89RIcT1vCbaEkopGhuldwVYjYF51SWMTsvNXt
	 vlR/KFDAT+8qK0puqMkjIf5G3JdR/zHLSPCMmsB8rf1cPO1rQpYS5WRpIRrHo3ifJC
	 VwovfcsKMOj8Gvei51sC6/Bd2XKHj0OTGlLhPVFgiotnYlVMUCKWpu05AeFGoYbUFQ
	 6Q+/srqxp0ocNYKfDeRMWboGzd2T7LeYQEukSLcHR2ZCxlp2/wsBN+aLQkpKx/zo5P
	 0ZUaz5N3aH01g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539fe76e802so8149737e87.1;
        Wed, 23 Oct 2024 09:51:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU07g0q62nzBJlDbEBSkRoY6bxWmDfgrdeJsGBFzHY0vjQgZz8JVY2lpgvWTa+Q6SeonLyF/26xYb0Cc2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpHMC0F6ATwAendh3d1NQgjv7xj7iPCA3VyuLN4P78MoCiEV2k
	sXXmwo6rlnXrisN6AimtyZ/Hwh2UOy+KCqCspvProKTSB5EcyFmoN7h8gDpLJiZMpGSBJ4ZqqGj
	1LZ3/3xOfVvEe5gfLFd85DxX/vSY=
X-Google-Smtp-Source: AGHT+IExaEg1MkxfPeCVBCY3VFdkujiXY7FIOzJD78B79Nwzh3cKlreBu/qzTE3sBGQzbw/Uo4CRstQges9g6E/oLG0=
X-Received: by 2002:a05:6512:334e:b0:536:a695:9429 with SMTP id
 2adb3069b0e04-53b1a2f4ec8mr1484438e87.10.1729702310984; Wed, 23 Oct 2024
 09:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <3592638.iIbC2pHGDl@devpool47.emlix.com>
In-Reply-To: <3592638.iIbC2pHGDl@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 01:51:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQMLZK5jG8zKty17AFJWSDwq-ihEVBYVRpnXN0X_MFUbw@mail.gmail.com>
Message-ID: <CAK7LNAQMLZK5jG8zKty17AFJWSDwq-ihEVBYVRpnXN0X_MFUbw@mail.gmail.com>
Subject: Re: [PATCH 7/7] kconfig: qconf: simplify character replacement
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 3:39=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> Replace the hand crafted lookup table with a QHash. This has the nice ben=
efit
> that the added offsets can not get out of sync with the length of the
> replacement strings.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

Applied to linux-kbuild. Thanks!



--=20
Best Regards
Masahiro Yamada

