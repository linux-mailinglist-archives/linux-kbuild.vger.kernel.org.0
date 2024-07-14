Return-Path: <linux-kbuild+bounces-2512-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694C930B46
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 21:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1C0E1F2151F
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 19:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B5013C3DD;
	Sun, 14 Jul 2024 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPQ7VRq1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4438139CFF;
	Sun, 14 Jul 2024 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720984282; cv=none; b=NHssWKBa3SpAd0BUXRSBUN/RvdvKTLwJKuQKF+vxx/HrFFPwIIaNmkSZHwVe8wHl4YfT+8731b2JkLSuCFnk6EYzWY1XJrj2I+/jzED0cFpqIaShuvWzlUG3qIQlDMZ6NhS1ozovHBAIkZMpfHd+Htn1dhMnB53QLckesl3s9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720984282; c=relaxed/simple;
	bh=j1K+FHZkDrmPGCmRtv9k9UB1axm98p1I0h+AuSiKzUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vb92Z+HMJfXFc5XQHoo3deus2MhAypxScFcD+B8C0jqBZ53yjBGf3KWPzp5h/Scotm+EeGV8ICu+PYvBSmgTQMyGBJYm5mEz+yQJTbOKkksxwwB1Nd+7cCpuIvb1G3gXcqrz0QCX50VPdky4sJcPthcjnHHhTgyMf2igjcHDrhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPQ7VRq1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D1EC4AF09;
	Sun, 14 Jul 2024 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720984282;
	bh=j1K+FHZkDrmPGCmRtv9k9UB1axm98p1I0h+AuSiKzUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PPQ7VRq1SyJdFQ/vrIS/BwD8aDEIyNzyzyKkmv/4qMm7CIVy4260GLbB7uQDrkVis
	 m7G5up3miZkaYpPthpdgKdRdjWAjReTDvRK1aKjd/8BtNEWHuAf+3AwhHLOGXrBwT+
	 QKSREO9RLxDYsIHrjZrjJ0ouu/lGAQ3LE5IQHvYGgrvYJppMinfDj1v+7mZ4iQ32q3
	 nA72XPpd7XSNgbmC12wa0KtNf/7KXQGzo3z+OD2WKZN4CxIX+YJx8s3Smq3iIk3Rhh
	 mRcQSX3HM7txL8sIZ8dyZ7Dko0DRi66wT1Xyrhb5s3EH/+utMT2uByQVjU4w1mA0QW
	 Oh+la7VoVTDoA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea7d2a039so3734549e87.3;
        Sun, 14 Jul 2024 12:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWx/NfF40zOrMew+OuH35fxws2xHLjs047daQrx/d5Hydxm7HYIg5jDWyB+hw+R//ST8vpDgNWD0ihOnT3KFGesGYYZiTjyFiYgtl8Hpi+6Lwf1rYSPGa1cMngHuVxkA/svRGR2oa48XscGfOPbnea7x9dtiQWT0cEyO80XZTc5fyluT2TUT5jOL0RUe6IeGIK8LzZCt+b8C7HV5AUT3oWBTgMxpihkCKSxFbibO7E4prxOpIzrE+Qs314SjbWHUfA=
X-Gm-Message-State: AOJu0Yyhn8swuDnym1K7rLWk1b1BVG/zuNIWihXpDd0+hGp8mGPK91Kx
	6V0pscG2YMCYs1WOoIZsOCKR47UbxIuWrnzPv+fqhMKAyu2b8AUMJd2PQsi+3CzsaXFmO5J8MzT
	RiiYwUNF0xYEA+Ru4GAp2G+LXLbk=
X-Google-Smtp-Source: AGHT+IHco7JMHnTGGI6P5HuxenTXttge5tcKuT+hmuXdenuS/OHkLGnMUkXSXoFgko7rH3SUNvioLnYHIzgG21hNw84=
X-Received: by 2002:a05:6512:124d:b0:52c:8df9:2e6f with SMTP id
 2adb3069b0e04-52eb99d4c0fmr12914869e87.42.1720984260332; Sun, 14 Jul 2024
 12:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714085751.176357-1-xtex@envs.net> <20240714085751.176357-2-xtex@envs.net>
In-Reply-To: <20240714085751.176357-2-xtex@envs.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 04:10:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=nK4jJA6VOsZ6+dfFRDDX88HzwDpb4ZF7vLPEkVuGzQ@mail.gmail.com>
Message-ID: <CAK7LNAS=nK4jJA6VOsZ6+dfFRDDX88HzwDpb4ZF7vLPEkVuGzQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Abort make on install failures
To: Zhang Bingwu <xtex@envs.net>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Zhang Bingwu <xtexchooser@duck.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 5:58=E2=80=AFPM Zhang Bingwu <xtex@envs.net> wrote:
>
> From: Zhang Bingwu <xtexchooser@duck.com>
>
> Setting '-e' flag tells shells to exit with error exit code immediately
> after any of commands fails, and causes make(1) to regard recipes as
> failed.
>
> Before this, make will still continue to succeed even after the
> installation failed, for example, for insufficient permission or
> directory does not exist.
>
> Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>


Applied to linux-kbuild. Thanks!


--=20
Best Regards
Masahiro Yamada

