Return-Path: <linux-kbuild+bounces-1807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A288BE6EB
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 17:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4391284168
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 15:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CDB15FCF0;
	Tue,  7 May 2024 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2/T+o14"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F72156C6A
	for <linux-kbuild@vger.kernel.org>; Tue,  7 May 2024 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094377; cv=none; b=qJfq9VL+Lqt2CAYIMfvcMjfqxGtcACJLvW3aGA9fIig7NpcxBI50CRSYfBzMxAlwwjyYzBYtOaMJZvq+DtBA8wV0iAweirix0OcnxGU6NMX9VBQGhJZkSaafUbhkTOfmYHaBvj1qpBHbsrbMT4BxNe+mcAQGdNth7K7OsdgntMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094377; c=relaxed/simple;
	bh=FIKFA7yIDY3Vv6kykK6nyLmumWnwZ12blZs7LHr+8Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zn5zhc/d89ff3l60FoQbC/28mLUDm0k8NoBIM4M/5qTKUuY9mojujJhqSPdKLrsCiluJ9eNRQOIq2kfjDeNkQbUbKQ5s7kxEQzyNjDeBCvmEAob4zAYtAxpS2jq6xKDbabZRhuUVrqQn2oAY3Lrt9ufrkJr6AfPYsFEy5NetnJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2/T+o14; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B206C4AF66
	for <linux-kbuild@vger.kernel.org>; Tue,  7 May 2024 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715094377;
	bh=FIKFA7yIDY3Vv6kykK6nyLmumWnwZ12blZs7LHr+8Z4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b2/T+o14zTAEW+5MF6mjbhsqGITAGsVF03MUTq9tJ2OGdYRqX1S2+FtoLbOEWlt7b
	 N/q1ZkjSdzf0ZuZSETSFmfMzIsx33NvFARdMUyEgj1PE/rbHLngfYestskXxYJeSX0
	 zZn7poo6qOl48jLrCnI1V/3/8eDsm561WIg3z5HzVAUHI2by7dYC6EQ0xoDjh3QQsi
	 gVZRcD4ryEF+lymOQmBlRclryvK6s9F0n1hK/iH3+TqGA86nyDC/Dv7KSJ6GCzA7H8
	 XcMLYpZXwGTq8C6Sf8g1jsgVXLoKA5DGqs7M9Ln6a8owc7vZT2jHi+rvoQeHAjQaUw
	 qMG6X/zR6NzGw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ef64d051bso2593262e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 May 2024 08:06:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YyejOTThU09gJC2WPhmMnM69DWr1kNRlrq3OTRS8hggd5rk9VGa
	b/Ypt9xfcZ5z2sK4qzHJ+KDdn0dOEhoriH7QNc7XS3QgSxeo+3+txpe0cSEUYzBlzAY8iLN5N2w
	QqZ6jov1NCObbb6uPDuf/TqzBOyQ=
X-Google-Smtp-Source: AGHT+IGi2Ze1cU8iTauu91g9xmtR9VwCxj74pDrEPxd34mYdxqnK8o9fiXwYyBTuoDsfyFtVLR1v0FFtMiKWONWyozk=
X-Received: by 2002:a05:6512:25a:b0:51f:1e8e:f7d5 with SMTP id
 b26-20020a056512025a00b0051f1e8ef7d5mr8209879lfo.35.1715094375772; Tue, 07
 May 2024 08:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG-UpRQ5Dp4sO2CBTiOpBtjZoRj4U2rNxAwSbari+VcqvayuSQ@mail.gmail.com>
In-Reply-To: <CAG-UpRQ5Dp4sO2CBTiOpBtjZoRj4U2rNxAwSbari+VcqvayuSQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 8 May 2024 00:05:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
Message-ID: <CAK7LNASSrB_L7VbS1z3O6QuMf0nti1hGJVwip7RRF_-=jn2OHw@mail.gmail.com>
Subject: Re: A link error related to DRM and fbdev
To: Henry Wu <triangletrap12@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fw: DRM list

On Mon, May 6, 2024 at 2:53=E2=80=AFPM Henry Wu <triangletrap12@gmail.com> =
wrote:
>
> Hi, all.
>
> I found a link error related to DRM and fbdev on branch linux-5.15.y
> (tag v5.15.157). It has same phenomenon with
> https://lore.kernel.org/all/202303150232.MBonYhiv-lkp@intel.com/.
>
> I tried to investigate this issue and found that build will fail if
> CONFIG_FB=3Dm and it will succeed if CONFIG_FB=3Dy.
>
> [user@localhost linux]$ cat .config | grep
> 'CONFIG_DRM_KMS\|CONFIG_FB\b\|FBDEV_EMUL'
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_FB=3Dm
> [user@localhost linux]$
>
> I'm not familiar with kbuild. Can anyone troubleshoot it further? You
> can find .config from attachment.


I do not have time to take a look at every build error,
but somebody in the DRM list may help you.



--=20
Best Regards
Masahiro Yamada

