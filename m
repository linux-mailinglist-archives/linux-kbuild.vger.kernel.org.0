Return-Path: <linux-kbuild+bounces-7825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83616AF0879
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 04:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF12A4A74A3
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 02:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FF670814;
	Wed,  2 Jul 2025 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjzbSl/T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB238F77;
	Wed,  2 Jul 2025 02:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751423443; cv=none; b=aOmhdwz+Y7If3OewIqAkLU4GeJTbI8rsLJI6UeHzWlYCHUXdfK6kgJ6Z/LRIWD9vZtqJUJH5jhBbvd1Iebu3GqcLz6sriyJF48fi4SmpTS4YWEpmh1nv164UfzOKP5HiAmuGkhXZWJlT7ObnRtCkcmCVCDTfL0nLmwCP487tFI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751423443; c=relaxed/simple;
	bh=nOJFQfwOfss2NyHRh7Sf9V00Sdr8q6zas3oVjvzNpvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMpRQR9oQ/UQSoguOj7W8Et2YY5jgYQKZWaeeqvBYUqCnnww6XIyz9DKLPBt926l/XQc3acyMfZbFim7M+5HPDBELX82N+1sM6EoKoQIJey96/cTWqBh9fXa9ftk7kGaKf4jTKdUTLrPcgW0AcTVePUsbBoq3AEVGF6+Op/JJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjzbSl/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7213C4CEEB;
	Wed,  2 Jul 2025 02:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751423442;
	bh=nOJFQfwOfss2NyHRh7Sf9V00Sdr8q6zas3oVjvzNpvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SjzbSl/TPrFOocvezBId2X3qbDulB9UGKGJ8Rq1YTyF6X8mpB2ndzkBI38ylvFn7X
	 IXZuejIZ/mOinCifATVRwL/DwR7Yb4XGE6gZzpP8b3lVkmMf9Zhohq4LoAGnkUe17x
	 1vWQfIFbytT6ed2HKWvMu8i37ArON0Qpgw2+Bc+XQA9lXt0OPzS+eg4+Q+fSB68wXD
	 E8h7fsMQ2vEjoA3L9V7P9sBG0vR9jFMYhNOKOynYGCFfIVd4U9T2u1A27QdJ2qIVa2
	 UrMgKaRhjNfYRTeU8vf+M8CQ2L8ALQ39wiv42BU9GFdpbOMdRP9E7ZVC00OPopZftU
	 Q1Kp7nA9qijzA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so38323351fa.1;
        Tue, 01 Jul 2025 19:30:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7tq0bj/OvjjMr1UDqgO66grEarzoxPxs5uCWSpUpOm7X2ODoCF27hxPW7JMxsfn/aYM2kixquluIOT6I=@vger.kernel.org, AJvYcCWyR1OovcaW78xUcO4grg1lpyEfch8oowiA1JXM0/HY1rP3sz4vmSMJPQMjBtsDQCYpHqgzUF2Fw5VhQeajDw==@vger.kernel.org, AJvYcCXtL7Sh3y+LPsGVI6wwNnsyGKxGTPx44XSuynweaKzfvAErQI/2ImJr0LSwZAHezpAXA7RUO7JEm0iHbdXz@vger.kernel.org
X-Gm-Message-State: AOJu0YzTOTBFC5prqWonaa7uX8iRgsKJIpoc3LermA4VV6Fu1g6kp1mq
	fLcACPKYyLpQGR1BTzs9bF/Bdii+Nftr9pP2k2dYVj6kl21eg7TLw1Q4hSAjFv1S+gOwAgHKrdq
	4d8DB9m1Hnh6al3qZBWknrwGqV5kO+u0=
X-Google-Smtp-Source: AGHT+IG8qma5BlB/p8uudhBhIOVBWqyt28tuit7Uo1ecmsNa3uMEIakYE9tjYUTQZClYvDp0LFbPMinm6Fs0RucwRAo=
X-Received: by 2002:a05:651c:31c2:b0:32a:8ac3:93f7 with SMTP id
 38308e7fff4ca-32dfff87430mr3318591fa.14.1751423441403; Tue, 01 Jul 2025
 19:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNASzE1CtRo9T4byPXJtB-HtuWsGe=OLba+8JU9fB28Chow@mail.gmail.com>
 <20250701152000.2477659-1-gprocida@google.com>
In-Reply-To: <20250701152000.2477659-1-gprocida@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Jul 2025 11:30:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR3YqsQc_kVfLba8Ti8HtrRWGr=KKB+MRdcKE5j8HOtHQ@mail.gmail.com>
X-Gm-Features: Ac12FXymuWYHvG3lICt1yLtE4SzCSkfOmdBQFCOI03uSMYviSsyoQoon5NM3XSM
Message-ID: <CAK7LNAR3YqsQc_kVfLba8Ti8HtrRWGr=KKB+MRdcKE5j8HOtHQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gendwarfksyms - improve symtypes output
To: Giuliano Procida <gprocida@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 12:20=E2=80=AFAM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> When investigating MODVERSIONS CRC changes from one build to the next,
> we need to diff corresponding symtypes files. However, gendwarfksyms
> did not order these files.
>
> The first change in this series makes gendwarfksyms code conform to
> the preferred style for the size parameter passed to allocation
> functions.
>
> https://github.com/torvalds/linux/blob/v6.15/Documentation/process/coding=
-style.rst?plain=3D1#L941
>
> The second change in this series ensures symtypes are output in key
> order.
>
> The series is marked as v2 to distinguish it from earlier versions
> where the changes were posted individually.
>

Both applied to linux-kbuild.
Thanks!



--=20
Best Regards
Masahiro Yamada

