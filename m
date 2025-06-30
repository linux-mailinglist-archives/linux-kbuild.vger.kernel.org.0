Return-Path: <linux-kbuild+bounces-7773-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A5AED37E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF8BE172749
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AACF42A80;
	Mon, 30 Jun 2025 04:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBLs9H7B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A058BF8;
	Mon, 30 Jun 2025 04:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751258262; cv=none; b=NYnNL7YBuE3fhzc4X0/bGtgaDwbvlpX1i2en7sIpylu5ZfKmYZUb2Z7NfWkNuLUWVjIlbrngSMdPSQreLU6H5d9fKJP97y7Wtai0qXXnMpm8d1xc0IdlxfmBjJcqTT4ZyLGlK/Bx93W3jvBSk9s6yavDh9xuy3aXx51H/HXwmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751258262; c=relaxed/simple;
	bh=8PbpZAFwz1ThZqnKf8QK9a2gYzzcLgFgD/RoXtzDJHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anGgpjCz9uY/DUfwpj6J7arfb5pjM2++y0bntCVaN956lpujYaM7NBdWtUBDNDeEoDh+v3PZ5aNWfGNUqy2vuLX7pu93PMAuto7O9y0GwE/1GaZeVG71CWXWfnb+yFZ5It+UhyR0iy6/KgZSB8UXHyb/8uWxD6ze8/9XjCxj7Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBLs9H7B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970E0C4CEEF;
	Mon, 30 Jun 2025 04:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751258261;
	bh=8PbpZAFwz1ThZqnKf8QK9a2gYzzcLgFgD/RoXtzDJHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hBLs9H7BTvtaoQnEFtskm+E0FLVr+MXN+Hin+w263L1HbNUq2ythjWwLXQKBSqgwo
	 BpOPnbF/e2XkCQzxqoyTJWLUdi+qsUh3SqC/hxf0sSXLc+QgHgWr//CEBk1OomLtdo
	 1mzgEYqO8YC40N+JO5l32Dxss18iaYSSHvpNi9Dd6/cg2t7W6hdvdIojYwGnhCI8pe
	 cX1zZRQshFglawHyoxpDD3wA33gt734c3La0oPSbil2rl5VZkxY6lEsVDlSMzzogFC
	 YDGBeZVTJech59RJ+6f8rZhZs2Uq7EarklhUFw0xQNMg1nuSWVCwONBoSGRJKKHfSU
	 mQNPlNHL8diGA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553e5df44f8so1387170e87.3;
        Sun, 29 Jun 2025 21:37:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvtYPkUxenvyEyw7xPUgHc+9WQl+fj6pMOZYdi1KZH2Sb6WnRVGtg0/kHbrUmQ7gOZKmVYi+BfE6et/aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBk+NcChSkKRTA8+ZvVxhYSG10NiXHdYfNmXUSNeZbccLi416N
	kw3ywwjp+kuWRSmicIw4uOdu7FoWyWnRSd1FaA5vKtcWbG4ye1I0ytPac3GlUkZ+ZYkpcE3hrhR
	jZUidwBfLcYXvmtTJ9y+Qk7znt3cPmxg=
X-Google-Smtp-Source: AGHT+IGjq3JKaXayuOI8gx+rNn5gQs93QYIqDTZqIhUpcYknSyWizv4Yz2KKj5YO/9io6C37IPmhYoFqIj3OghCVxc8=
X-Received: by 2002:a05:6512:3e1f:b0:553:24bb:daa1 with SMTP id
 2adb3069b0e04-5550b7ece62mr3357699e87.11.1751258260293; Sun, 29 Jun 2025
 21:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629184554.407497-1-masahiroy@kernel.org> <e23fc081-8a74-45cd-9250-977c6e59d69f@infradead.org>
In-Reply-To: <e23fc081-8a74-45cd-9250-977c6e59d69f@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 13:37:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+RonvRZt+X_68bmrjzY-kWs=0PqkYCy0O9D2aiMBd5g@mail.gmail.com>
X-Gm-Features: Ac12FXxpld1bAZLK6Mw5zs68xKK0v1VD2lAoOSI4Dq3NBQnEfvf8XgM2p74rhq4
Message-ID: <CAK7LNAT+RonvRZt+X_68bmrjzY-kWs=0PqkYCy0O9D2aiMBd5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] kconfig: improve gconfig
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 4:02=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 6/29/25 11:43 AM, Masahiro Yamada wrote:
> > - Code refactoring
> > - Migrate GTK 2 to GTK3
> > - Fix all compile warnings
> >
> >
>
> Hi,
>
> If I am testing your recent *config patches, should I replace all gconf
> patches from the patch 00/66 series with these patches?
>

Sorry for the confusion.

To avoid flooding the ML again, I only submitted v2
for some changed patches.

For convenience, I created a topic branch that contains
the entire patch set.

git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t
 gconfig-v2


Your review and test are appreciated.

--
Best Regards
Masahiro Yamada

