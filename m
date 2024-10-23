Return-Path: <linux-kbuild+bounces-4280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9899AD14D
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFC30284506
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B981CC178;
	Wed, 23 Oct 2024 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6IV6K8Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64461E51D;
	Wed, 23 Oct 2024 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702137; cv=none; b=GLnSV4nBPjpE6TNyWi1ywgrHMrNMenmHIhixIe1A1aX6pOKIBVZVSND7kzE4eMD1HMcBngaS2xP3S9sJwcXV2cu3DYMvTM34UWQw7j81NTgS8bU0JBN/rmnQJSFjrMKNyi93EkTVCfz6wB1R/vkKvlcNftI/Hc1W/JZdcUpJ1q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702137; c=relaxed/simple;
	bh=jk5gnOltUG5k9FUWIy7ZyHs1nJtl4UkmbzMQ0rcKYVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/uwZ5g53CjbiOgfggR1YMQLp0TEBdZ3s4iosu9ZijXzb9nDIbuuZ8OndAutLS+tHYogI/bbfnbRysOPy0QBfoBwGTrocRjzIbeASbm00Pql3JbSXTnm8H/g3yz+HWayqZx8S53cwmu7L6frAvsR/d3v2MSN+ZfwxLgclQaXnRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6IV6K8Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F9FC4CEC6;
	Wed, 23 Oct 2024 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729702137;
	bh=jk5gnOltUG5k9FUWIy7ZyHs1nJtl4UkmbzMQ0rcKYVk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q6IV6K8Yn4yLfCmVLhv6ZQQmpD0zetNro7tqdkl1q9HJqKiuWT5AN6JzUj/X/AHR2
	 4h0McHqrZYQf/45fDcohQwrVkBlR+qufbx8n2ablaiITdlupA/4iOXGpJnh8l4/BRR
	 YPPWzeTDAZYbHyFTGnh5QM8yZxzZG2LsqSB4qlBWsCkxdrtN36xTgrd1/kNq4Tsf/V
	 30C8slKJoWGwtgIPmTAW7O5MSUWFDumxGwqKtc8or40TE/VF60CSrjE5sy7yvfv/wy
	 e9xUBL3KdeosrPYXcgXpdE27GTctsbK8gwE2VvZg2nCsf/OTDWT5bRCvTE5oLsz0ey
	 K45QNSYDM8qTw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so8243205e87.1;
        Wed, 23 Oct 2024 09:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGvjl9YODYjB3UNAl7umhCGWs+2zl+0i9DWAYOYccJF/v6puSg4GKisf/zv0VoxOpNr0AUWNVPbAN+ats=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPg00B5xt7jpVYbjqSvFtak1BMZZ5C/DAQGWUwWSXRzluQrXZw
	yRPp0n00nRlZ4AdgjGylnKc0li6fIiJ3QwxyEs/C0L9BWBNTyGFwcWX4AUXest7bUHfCouXwQvY
	46E/wWVTEDhnywtvS3CU96Mt+BzE=
X-Google-Smtp-Source: AGHT+IHeShVqL6klxnFkLKEIG5eyeLd7RSjj8g30kEWNkqm32h6CTQ1ylCF38rTGwFc/IryiNGwJvkaTsJN5FmL+dWw=
X-Received: by 2002:a05:6512:33c8:b0:539:f961:f485 with SMTP id
 2adb3069b0e04-53b1a3303damr1964447e87.29.1729702136201; Wed, 23 Oct 2024
 09:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4960180.31r3eYUQgx@devpool47.emlix.com> <22467307.EfDdHjke4D@devpool47.emlix.com>
In-Reply-To: <22467307.EfDdHjke4D@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 24 Oct 2024 01:48:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQG3FyZfRMVhQ8v0W+xD1fW65A=h2aFJMWwJb9T8vPBXg@mail.gmail.com>
Message-ID: <CAK7LNAQG3FyZfRMVhQ8v0W+xD1fW65A=h2aFJMWwJb9T8vPBXg@mail.gmail.com>
Subject: Re: [PATCH 6/7] kconfig: qconf: use default platform shortcuts
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 3:36=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> This renames "Load" to "Open" and switches Ctrl-L to Ctrl-O for the defau=
lt
> platforms. This may break the workflow for those used to it, but will mak=
e it
> actually work for everyone else like me who would just expect the default
> behavior. Add some more standard shortcuts where available. If they repla=
ce
> the existing shortcuts they would have the same value in my case.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

Applied to linux-kbuild. Thanks!



--=20
Best Regards
Masahiro Yamada

