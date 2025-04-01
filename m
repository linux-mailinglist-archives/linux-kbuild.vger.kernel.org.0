Return-Path: <linux-kbuild+bounces-6386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63EA781A7
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 19:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C20C516CB86
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 17:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DF71494DB;
	Tue,  1 Apr 2025 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S34CMq7U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C0C53AC;
	Tue,  1 Apr 2025 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743529814; cv=none; b=WWQzCaiXYyRwoFJmm2yrLgc00YTt66OmjEHHorlEicfZZ1t/wckViAXtXIay0+j8d8EGXcC7y6Tl7eYPxWk6dgGJvaEu3ILInyMdajPNrIjBJLvE47ThtWxTlHobJBi1MYAqLmy3xVNpXC+g2BMxeVHxuo71G/dSQqt+3oeI7LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743529814; c=relaxed/simple;
	bh=5w1rWSu4FoKgUz0ufLzbenr7Kw901BbMLrngbLFGrlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtaOyH4I75tLfuW3Y83fKr0Me2j0laGU7N50dAJPiNT6kGmQoR3KAjrdvURiPD9oilV9L+gPShxGNSZfeXFg8X79Ijm22sX2ch8AoIZAZHOAt8LhoH/sJtjoPyHik9gYFS4BqFh/vKoNGwxQRTYi+K3OA/deZ0kN16EJVpIAnwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S34CMq7U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B734AC4CEE8;
	Tue,  1 Apr 2025 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743529813;
	bh=5w1rWSu4FoKgUz0ufLzbenr7Kw901BbMLrngbLFGrlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S34CMq7U+GwwfKhxHN1rfUSV9PEggYUCsmRvaCbOFa/6taOyTRfF4zT1Oba3Mrc2E
	 xEsM/EsBr7H0Wuoshsfs7Lj6VhykH1TXb8nb/2vO/MGIDAc4p33l06ncFTS5ea1l/N
	 VO3XWs9ZN3yEdbeFBahpMB6BUSYFAO++2F8sgAnv3USP6sv1M/t/yRbBaGuWdNteQO
	 ufx4Jn7zqD9KKFWJJxA80ZXIqMNdVT5tMxNzBRCBTOKaWJsM0Y0lftfg3iGGLC1xAP
	 Bh55HS0fAPOzMFxQA2ESasrNXA1WD0OBY5WVYzmkbJ8P45FX+WDB4v6V89/IMvjxgQ
	 WzM6a3Zj6C2aA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so57468061fa.1;
        Tue, 01 Apr 2025 10:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFxZcy06gWOTcsN1Qmx6l5Td0biInIlEnzbevYct3wvgka5ixzixISbyJiy96e3+t+yfqLYBoGo63r+So=@vger.kernel.org, AJvYcCXw4B+yx+/T/x2Tqa7uOgaE3ILXTBwtxHgPpxoEBLbPGqACuOwomRAkUMEJG7XCnKLhPENF+/SVB/BcaQMv@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQchSofm+BQ7W6HRK27ecjLXyIqvN6vGxsKegyC96L+Ri1YTP
	YaoUD12u5H9SvOsU/JOp+U7YEG1dqzh4HLEpvioIrNpB5ceacQsZztaK/IWvV4BHhf7xL0JHoKt
	Lk4oD7NzJMTi5sAnh3RFxTiX38Go=
X-Google-Smtp-Source: AGHT+IGkYmWarqLME3M5HUIsQ/RX+P/5BKahl7gfF2DogfQq8fD0ENinrg/PiXRnlDNAOxCWg2EL+7CI4PMqzlSG+Eg=
X-Received: by 2002:a2e:9fcb:0:b0:30b:9813:b010 with SMTP id
 38308e7fff4ca-30de0349ecbmr48182701fa.31.1743529812331; Tue, 01 Apr 2025
 10:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401121830.21696-1-jani.nikula@intel.com> <20250401121830.21696-5-jani.nikula@intel.com>
In-Reply-To: <20250401121830.21696-5-jani.nikula@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Apr 2025 02:49:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBy2NwnZ73ihzuD+LMg44abo0JOz6RrU2saH7+Ofnz7Q@mail.gmail.com>
X-Gm-Features: AQ5f1JqXPpYsKshoJPHuR6f9NFVrbpHQ-JH5po56qE-Fc4aHML7godt8OXSg-vY
Message-ID: <CAK7LNATBy2NwnZ73ihzuD+LMg44abo0JOz6RrU2saH7+Ofnz7Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: hdrtest: place header test files in .hdrtest subdirectories
To: Jani Nikula <jani.nikula@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 9:19=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> The header tests track whether headers have been checked using empty
> *.hdrtest files in the build tree. This pollutes the build directories,
> as the files live in the same "name space" as the real output files,
> messing with TAB completion among other things.
>
> Hide the disgusting turds by placing them in .hdrtest subdirectories.
>
> Note that it would be somewhat nicer to have the basename of the
> .hdrtest files be dot-prefixed instead of using subdirectories. However,
> it's challenging to come up with a pattern rule for that, as we can list
> headers to test in the subdirectories of $(src) too, without requiring
> Makefiles and kbuild to descend to each of them.
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/r/CAHk-=3DwjMrqzuUmH-mFbR_46EWEFS=3DbB=3D=
J7h9ABMVy56Vi81PKQ@mail.gmail.com
> Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---


Linus did not mention anything bad for usr/include/.

This crap is unneeded.

NACK.






>
> Cc: linux-kbuild@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> ---
>  usr/include/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index e3d6b03527fe..4fb574fd3fec 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -71,7 +71,7 @@ endif
>  # asm-generic/*.h is used by asm/*.h, and should not be included directl=
y
>  no-header-test +=3D asm-generic/%
>
> -always-y :=3D $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name=
 '*.h' 2>/dev/null))
> +always-y :=3D $(patsubst $(obj)/%.h,.hdrtest/%.hdrtest, $(shell find $(o=
bj) -name '*.h' 2>/dev/null))
>
>  # Include the header twice to detect missing include guard.
>  quiet_cmd_hdrtest =3D HDRTEST $<
> @@ -81,7 +81,7 @@ quiet_cmd_hdrtest =3D HDRTEST $<
>                 $(PERL) $(src)/headers_check.pl $(obj) $<; \
>                 touch $@
>
> -$(obj)/%.hdrtest: $(obj)/%.h FORCE
> +$(obj)/.hdrtest/%.hdrtest: $(obj)/%.h FORCE
>         $(call if_changed_dep,hdrtest)
>
>  # Since GNU Make 4.3, $(patsubst $(obj)/%/,%,$(wildcard $(obj)/*/)) work=
s.
> --
> 2.39.5
>


--
Best Regards
Masahiro Yamada

