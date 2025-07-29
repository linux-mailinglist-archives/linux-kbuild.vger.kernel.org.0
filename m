Return-Path: <linux-kbuild+bounces-8243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E39B14E9C
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 15:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF8683B4967
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 13:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7907D14D2B7;
	Tue, 29 Jul 2025 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7ccMgkR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137213D2B2;
	Tue, 29 Jul 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796655; cv=none; b=MF2qrV5xYib33ayNNAyLAoGf8YGOwWfLbJJbli7QE/JFD9eLWVW3iTtVX8nXoUNgFW8YvYelp04rS2LrNNdz1uJZjYZDxK4Xp5UQoNsO9eGXGCTT3fOjIMnVa3yWfGYJjKV+MJSDmccrYe6cKc0pqgnVcBIjN15Fv82KLAAay+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796655; c=relaxed/simple;
	bh=C34Av56n3VffzkC5BscMtX8Fcy4HtIfup26BVXc9LaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHq+QzoRJNGw4DHBZub7rtj5BHGmFFB+pnX7/QR1Gd2nYi/8LV7BSwMmLvf0HE2cbpoy+d4uOTLFQPCz5ZLPN19l7YZjZnoca2Waa3ZIuaLSslgHRgfoWQhiQig2Nl0ZMSXPBQtbXRsYq/Z+QmBezwaPX7WVYcW+3F2rTmFYZZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7ccMgkR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA33C4CEF4;
	Tue, 29 Jul 2025 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753796654;
	bh=C34Av56n3VffzkC5BscMtX8Fcy4HtIfup26BVXc9LaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p7ccMgkRAfs2oBEA/kDHQpv2chpYJgS5Yo4pRhVC2hL1Se+AoWLXlxerK3cw7fe3a
	 BsRWYxm2eJAy1idq8rzh9V2Ex3CxeanJrGZP/71FFNi/fujyvCZQYXxd+hmC1KmhLf
	 naLlg9VQReA4V3E41dKuLysQ7D7o8cBqzsxxHaJ4swttGPUkWUMH9Y5EggB4CwJHhT
	 fVklBfcl3HSCz+hSuqFBmmS8I2BWakS/gkkTDVab9Kq7PYQvmTNL4oSITDyF8ObCl/
	 xm0STDixCTQsAQxnrPwqmrthfevpNxJOT2tXYZS6v1xTOhUMMXSfWx5AknW4DT3dKw
	 RSjLJtuzVMczA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55a33eecc35so5902766e87.2;
        Tue, 29 Jul 2025 06:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9dppAI1xVFjbgzKgkMAJnWblQA6UZ2+Wt2eVHQry6kumtdhdrUFEVAA9coaciEEnQ7URrPSw/eA5d+09I@vger.kernel.org, AJvYcCXURh3eJi+vXbwivqL1HB+stDLxSzGoJz5MeEm/GbJhoA9KOu438AHL/p2ppnaWiD/d5vZeVroK2KkzXG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzWZohPH7BaRWxu4BMa/EGRqEeNX5USQKLJMgkA6V1cRXiHoE
	/ymQSgnyh+Prxyn3N1nWZmabBRWjgBsOCdvrStdLAzWJ1JP4V5OIxKLbrHIWWvSKwz+sm4GhEy0
	I1M4+6IMIOcKY9LSsL97l82E/AWX7vKg=
X-Google-Smtp-Source: AGHT+IFOu4L44SLH1czBt9sl9QBrTvCFLPl3Paqd80DA7MtUH02gka6T6cHLnh3GYm5/lkhopC+8Jv7aZXVAb3+zT0M=
X-Received: by 2002:a05:6512:3ba5:b0:553:35e6:393b with SMTP id
 2adb3069b0e04-55b5f4af96amr3814166e87.45.1753796653501; Tue, 29 Jul 2025
 06:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATotYMHVgNHkQcT33qQK+fdZAjoQpdJqtKKWT18uJcPXg@mail.gmail.com>
 <20250729132500.343778-1-mgorny@gentoo.org>
In-Reply-To: <20250729132500.343778-1-mgorny@gentoo.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 22:43:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYnfW8hyTYY1vySeUgg2tCJc17Rkz4C=sVCNhpiNO2GA@mail.gmail.com>
X-Gm-Features: Ac12FXyFg7eXzSiJ6HOIhgP1HAoQbkyle0SYF1Zf3hYxVqfehAsSSuSnL0fnaOY
Message-ID: <CAK7LNASYnfW8hyTYY1vySeUgg2tCJc17Rkz4C=sVCNhpiNO2GA@mail.gmail.com>
Subject: Re: [PATCH v4] kheaders: make it possible to override TAR
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sam James <sam@gentoo.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 10:25=E2=80=AFPM Micha=C5=82 G=C3=B3rny <mgorny@gen=
too.org> wrote:
>
> Commit 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226 ("kheaders: make headers
> archive reproducible") introduced a number of options specific to GNU
> tar to the `tar` invocation in `gen_kheaders.sh` script.  This causes
> the script to fail to work on systems where `tar` is not GNU tar.  This
> can occur e.g. on recent Gentoo Linux installations that support using
> bsdtar from libarchive instead.
>
> Add a `TAR` make variable to make it possible to override the tar
> executable used, e.g. by specifying:
>
>   make TAR=3Dgtar
>
> Link: https://bugs.gentoo.org/884061
> Reported-by: Sam James <sam@gentoo.org>
> Tested-by: Sam James <sam@gentoo.org>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---


Applied to linux-kbuild.
Thanks.


--=20
Best Regards
Masahiro Yamada

