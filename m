Return-Path: <linux-kbuild+bounces-7530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06067ADE128
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 04:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA411161739
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 02:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B61219F41C;
	Wed, 18 Jun 2025 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlsdBlgg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294918027;
	Wed, 18 Jun 2025 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214282; cv=none; b=Iyqt1ts0UFKKrAUsUJafORk0+uDUYldtJyJUe9DkTDlpZnKJXmi044TlHnf12wdOJZiuUqKjPdfZrPP9EimzNR4RPzpF90qfMe8FFpmhX9lw0mAHfm6jckuKUmgXYCW1KEQSZvAsw7lRWMWWO0S49GdA7jN7UHbOcePo4gE7H6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214282; c=relaxed/simple;
	bh=6b3iIfu6jzCCt3mWYw2MvJyu3GCzr8Fe/h54qXuaBAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIkbdtMDNLvRst0+6kwxx02go+Xt92c4F0H87KvXvqGxKJqhBnnAAl9AV5SIEdLwn2E9kxBcv93Zew7GiDiyQP+aRxG7E3Y76PAF3mFUldqk8jUuMkJDaldZsEi5m9Q8dXQR7/vQ4w6Bc84zwpPMA0HJGpq7d2Ht3ra7zx7M/UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlsdBlgg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D08C4CEF1;
	Wed, 18 Jun 2025 02:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750214281;
	bh=6b3iIfu6jzCCt3mWYw2MvJyu3GCzr8Fe/h54qXuaBAc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FlsdBlggwhpi3bHk9WUdle82DFNgz2Fjlutc+6GxJQtPLMVxpYJDH0cfObmocupLx
	 o1gUAXc3IFxfQQimvxH4idceYv1fEtExn8kAnKyWbqdNv3xXpvVR7nQ7/e1ecgMjtE
	 cnv2FewXpoDMg7FePO8Ccorw7QbMH/y5zvVNK90JxcwdPcZpM+jACwqVdBRJopjBdU
	 qb148RSZdQpTox69t8G5DLrTbd5k7bi+yF67RvsIxJprYO0n4i7qP0Q8nT7kSOttsi
	 OgMj9i2C22lQp0J4Gv3f7dyXYG6jBenQGl0+F5yo0gicP49G6NAVBzyeMcd22SgyGu
	 g8raMQ+Oi42Cg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553241d30b3so5705389e87.3;
        Tue, 17 Jun 2025 19:38:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBSnrpEgFIcWRMCQulCX186MhDDo0vrTALIfcdkxoJEnrSqw/12xLIUqNHl8nVp7qACWgbBZnKdEn541bH@vger.kernel.org, AJvYcCXhZSBxqA/A7cXS/Vpc4Pq9l0V7EGbSc/OyHOHZrCzjlRuEmkqLxdW/oqehqMzCa+I1SZLN06l9dsoNk9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGQYy+krTxu8qj1H5W53CLsh2331Pl/y5fWS2NsImiLazy5wX
	JxflUbgvOqqk/N0MxMreKFrPRy5+NSS4LSnhcngH7HCfC8jfkAdD1vSLpU6wSYq3frdjk43lV5X
	N7W4tuPgFHNUvmSpkNwcZcuP+rBXpEqE=
X-Google-Smtp-Source: AGHT+IEXp9iKMD2aWmN/efqPNL/5+ytd+gAAdg/TaHdlszXlhzBTbI9xZmTKnUdMm2uhIW7fcfDhXbuTHSJgfGYQd5s=
X-Received: by 2002:a05:6512:3986:b0:553:ae05:9c48 with SMTP id
 2adb3069b0e04-553b6f3937fmr3941573e87.45.1750214280525; Tue, 17 Jun 2025
 19:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617200406.GA3636948@ax162>
In-Reply-To: <20250617200406.GA3636948@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Jun 2025 11:37:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQTNU0GopxtHCYLDGrV5mDnkMfTydiW2SAHW3uV_bCc9w@mail.gmail.com>
X-Gm-Features: AX0GCFvOHlgCw9fwhQt3pZs1n5ukL5M4NyGJwOjnvbnH0PZqp1EFb3F_MVJyIP4
Message-ID: <CAK7LNAQTNU0GopxtHCYLDGrV5mDnkMfTydiW2SAHW3uV_bCc9w@mail.gmail.com>
Subject: Re: as-instr in Kbuild broken for arch/arm
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 5:04=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Masahiro,
>
> I backported commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use
> proper flags and language target") to 5.4 due to an upstream clang
> change that necessitates this [1] but it causes a failure for as-instr
> with arm [2] because arch/arm/Makefile uses '-include asm/unified.h' for
> KBUILD_AFLAGS but LINUXINCLUDE is not present in the as-instr command,
> resulting in
>
>   <built-in>:1:10: fatal error: 'asm/unified.h' file not found
>       1 | #include "asm/unified.h"
>         |          ^~~~~~~~~~~~~~~
>   1 error generated.
>
> There does not appear to be any uses of as-instr within Kbuild (as
> opposed to Kconfig) for arch/arm after commit 541ad0150ca4 ("arm: Remove
> 32bit KVM host support") in 5.7 but as far as I can tell, it is still
> possible to hit this issue in upstream if one were to be added.
>
> I see two obvious solutions but I am not sure what you would prefer.

The latter because this is more consistent with the existing cases.

The answer is in LINUXINCLUDE itself.

                -include $(srctree)/include/linux/compiler-version.h \
                -include $(srctree)/include/linux/kconfig.h

If we include them in a relative path, we would do:

                -include linux/compiler-version.h \
                -include linux/kconfig.h


Apparently, we always did this in an absolute path.



--=20
Best Regards
Masahiro Yamada

