Return-Path: <linux-kbuild+bounces-2568-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9E933F66
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 17:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3568B2377C
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC68917F4F1;
	Wed, 17 Jul 2024 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="is3C9OTk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81620381DE;
	Wed, 17 Jul 2024 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229532; cv=none; b=XhMNYUMc/wdBVtIofgmCcO4ePXFkZSgstuRFSXJT2Ti+RqbTZsqoccnt1NEPCxwWqqcDEsSotKfWmoDGravqtXAbBTlGcnPWueTFsspLFmoKJ1DhKrj3/lWhoRj3UmzI5otqPIGkoaWwMatFeBcH73grSMYval90CCRKqkJRJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229532; c=relaxed/simple;
	bh=N29zVA9Gg9dV/DYRkIRYkazBiVnYgRcNHwRkNvBo4wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQzhf+qsJdlrAjEVDGCJKYKN1O8A1qt9R2ST2hNx2vi5YltJ5rCuw/kl9idI8TqTfjuMglF4Eu5v9x+DrzRXZxgTwdjFZ/fr+HT/U7UI02xaJ5OoVPWs82gD0qxfUelSK6BboMi4Wn66VlnEfpNSZ59GaI6BGrPnB9AbgDIjXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=is3C9OTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F10C4AF0D;
	Wed, 17 Jul 2024 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721229532;
	bh=N29zVA9Gg9dV/DYRkIRYkazBiVnYgRcNHwRkNvBo4wU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=is3C9OTkxLcJw2vwaS86tBLa6lcgA54+32MhZ3mei08dHIOozj9XZ5E4rZcmURcIW
	 m/gbE79xoZ0OjjD8P+w3X/WZmIHFeBYHP2aK9+83tu53BoWF15c5BCgOxqlafwUHSI
	 xIKhp4Y6fLWCb3IEYCssbJJR/smzbOuZ0lXLjn9xkbi/gulMPGoFl+L5KdN6YFmP0L
	 w0HYAsevisQLJChyssiOdlg5pqdX0bfMN0138ajprrIOh2RpkgiEOqjsocmhSdfnFF
	 gTXArl3hLcyLvcAqyyjDqfL/vH90TWZVxNsdlORQSWisFszolNMsUMARw6G93g3k2M
	 OvVOe3/XL88RA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee9b1b422fso8447761fa.0;
        Wed, 17 Jul 2024 08:18:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGA4bqRtizCH7RVFHJ8hdmuR6XWgjGndggr8AfjOvJQWKowvAEwavWz0w5C5CWd30y816mlkw38l1Jhrj6/6lSAaYkwliS2dW3FCXsbt9qH56USDDTKI0+bwe0p0ZrFAQyogA+4Qj0S1vO
X-Gm-Message-State: AOJu0Yyk/WL1ra/Hcau/PRCVuYQbCRGIJpRmrsRq5EdnwzFOfBbCFDIV
	LudktxdT3e1m0BIsggAl3iaUXf+dfYRvao+BZ+AJb3MIBH+s6QqPXHss3nAx47ty6oS0O7hXYd2
	tnZL/r8ISbNt51wOOBVb6CxqGSHg=
X-Google-Smtp-Source: AGHT+IEZvAJVKOnWaFBxnGHDfWK3nhLIq/mI8jzjALhEr00GUk/nyAhVTZ5lKD0jRfHEVzqgOH15sDDlArefqY9avgY=
X-Received: by 2002:a2e:82c8:0:b0:2eb:ec25:b759 with SMTP id
 38308e7fff4ca-2eef569bc96mr15146161fa.3.1721229530639; Wed, 17 Jul 2024
 08:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717124253.2275084-1-arnd@kernel.org>
In-Reply-To: <20240717124253.2275084-1-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 00:18:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASOtyqJMET7YuuFzTCkwg02p850PnqCC57-BZNJhyKT7Q@mail.gmail.com>
Message-ID: <CAK7LNASOtyqJMET7YuuFzTCkwg02p850PnqCC57-BZNJhyKT7Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mark "FORCE" target as secondary
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 9:43=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Starting with make-4.4.1, Kbuild uses the special .NOTINTERMEDIATE
> target to mark all targets as not intermediate, which slightly changes
> the behavior compared to older versions of make.
>
> This causes a build regression with my change to the system call table
> scripts now in scripts/Makefile.asm-headers, forcing a rebuild of the
> generated files with every make invocation and effectively breaking
> incremental builds.
>
> I have narrowed down the change in behavior to the way that the
> 'FORCE' target is treated: If this is marked as not intermediate,
> the $(if_changed) macro always evaluates it as a missing prerequisite,
> but if it is marked as .SECONDARY, it works like before.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Fixes: 875ef1a57f32 ("kbuild: use .NOTINTERMEDIATE for future GNU Make ve=
rsions")
> Fixes: fbb5c0606fa4 ("kbuild: add syscall table generation to scripts/Mak=
efile.asm-headers")
> Closes: https://lore.kernel.org/lkml/91b10591-1554-4860-8843-01c6cfd7de13=
@app.fastmail.com/T/#m4c979c42d0c086f616e41b4ca76f2873902b8a25
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ----
> I'm still a bit confused by the way this works in detail, hopefully
> Masahiro Yamada can either confirm that this is a correct fix or provide
> a better one.


Of course, NACK.

Now I am surprised that this broken series was quickly merged
into the mainline.
I really dislike how you changed scripts/Makefile.asm-headers


I will send a correct fix.
Please do not break Kbuild even further.




> ---
>  scripts/Kbuild.include | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index faf37bafa3f8..aa1ffaeb8fc0 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -267,6 +267,7 @@ endif
>  # deleted files.
>  ifneq ($(and $(filter notintermediate, $(.FEATURES)),$(filter-out 4.4,$(=
MAKE_VERSION))),)
>  .NOTINTERMEDIATE:
> +.SECONDARY: FORCE
>  else
>  .SECONDARY:
>  endif
> --
> 2.39.2
>
>


--=20
Best Regards
Masahiro Yamada

