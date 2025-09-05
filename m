Return-Path: <linux-kbuild+bounces-8736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD7B45029
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 09:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D58ED177563
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 07:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C97F267AF6;
	Fri,  5 Sep 2025 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8Atzsl3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCDF25949A;
	Fri,  5 Sep 2025 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757058296; cv=none; b=fG9/ZtGsoMfQrGuXgUw5DeL0l51wE9eDSw/RMrBEeFdOzbcvHXUwdtWeGbetvPUCXl/rAqVeX1OOFBbodB9sOXGX3HGtlpI/QuD1OozbHRwS/ZpdKlXA8rwbIE30jG8it64exdWUekt27KPsUfpN2momFMjJE9+wc80TpDp3kkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757058296; c=relaxed/simple;
	bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbnfwOi2O6WtG2Qb0iuFbr1KA971hN9nTwjacQ6MJ7D0N3OElRgu7wnZr9qB+Khj0eCVGFalxjLHcBV9gCLV+DLCCXGC/3TqiBqrBbrTtpvEq0KoXTGowX+G3Uk2khmQ7UESraBGPNv6Ell95bJHZUNeujgWIPBKwEwKcZKm9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8Atzsl3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24b157ba91bso3742275ad.3;
        Fri, 05 Sep 2025 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757058294; x=1757663094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
        b=E8Atzsl3SwipG4Km1RjAtj9ZTMXwHyNV6sdMNs9KpRyQNrGvm08xyT3HA5Q5R0NhMx
         5Y3nlGJK3Oehh+2nzBEF3hrrqxzhFwfjdmohksMGgJuvqzeDOpaSn6J3sGi23oEdQWFb
         j/U1jFJJaADN8VInw+teFH+bQz1E0oZBpvClNp40TKNRJEN81G1kpBXjTj9QL7pzIgJV
         YQeNEgJTcQYEuyemj3G3CbLJW2Q0guLyd8SuYOhStm+jRpZ4q4g08CUvmr8Q0ahL/DXu
         jEshUGxUhIFMgCISGMPwj3iPit3nmYss4qd1uz5PUc80WK7dgV0LxP0/iuPaDTtEMu8H
         N5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058294; x=1757663094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
        b=cloA5Egf1rMgvJ/7+V6naP/EpPJpThjKixGElgjMQ1Q3q2aOpK5r3optuGtj6sMmnh
         zhk2LcumWfwZ9jB4gq6ahhORUZHvItOTaH0xNjagEscP2e/FmPcbOe015vBQt3pG7iR7
         H5e41Wc3SUB0lqBA5+ZsowlSM7e4X3BsALG6qZ2zs1w0umZ0LODoqEqRMFZtWW1f6YrC
         FoaUHnOGJ3RUjpvKQEbo6ox4QySRTaCPR2ziEnt2+F5eY0/G6E+zIa9aQ+M/b8ITLp61
         gwghA+4nbGwp3kz8bdBJflRgzf3uMTy7821YEcWaOSocegm5eKpZxli8zj40DhqdgQGe
         Btww==
X-Forwarded-Encrypted: i=1; AJvYcCUGTkv/LesNnpld45UuH1z3dRcSXYkiD/rMi+1Pho0125h0yzsNzY8B2YVlZMR4f4EqVL4DBkjkZLGpIBnQrlR3@vger.kernel.org, AJvYcCUlTnsmtHbXTaqADnMGZiiZgwvZu4nO/t3SgJ13ZktAJOSJ9PUTHIwca8HiCLXZi9UxsPRppD/vMjSPSqvP@vger.kernel.org, AJvYcCVnHVUid+jqP/BGxiMuPoz2V4aTmj2dX792yVRTKZYuSneGguzPiY6O/fCwP44r55MoT0+imGbvWoQ=@vger.kernel.org, AJvYcCVzATrv2h2IIkcOjChye53720Sfd2QC2cXIwmfdh/U/IX9sP4nLnUiVLqepUGfnS9oi5MXdcZlaE0cTyr3V@vger.kernel.org
X-Gm-Message-State: AOJu0YzmWX0BnCW+/e6ITg/w2+F2d5GrkrrlQ5iZdnDhzYQCOwqd8bVN
	LuX8iYjvCZrPmfYCoc0i6cl+CNOSaVncKu6DK5GqAazT3olDUUP1sBJm/pdYCEGFAonlReNkYjx
	2bKA9M3v1oBMV1SMfEPOEkK0kFO3Cjbg=
X-Gm-Gg: ASbGncsHawJ/E9kVFw88qA9NNtEY+oKx0n6qk+HxtU7YgTza6Rs1cnMqCKVvqEk4BZT
	NtqPV6iYGASHBMu1Izes/oJIv6AiGBeZ+mSZ9s+2sD0JssPTjRXMmA8+dPbQ8423EpmlzwltFcJ
	ZIbazJSgQ3ylEoxLFOagLy2EDFwqDuNUVEhqfKDZJXVOXnTakfyLn1ozklIj814r2GXk6XoFGvs
	OdaFGVOTvm8ZNCPuncNXvk0NECz8vFv5vvNr35DQqjFplFtCW38h0YV2SHRBxagReRdMYejHjiP
	eGuEH+6myaIznfyF6adq6RSPDQ==
X-Google-Smtp-Source: AGHT+IGp+cfcPTE7KjWQu/swfr5iYBHHS7MaJe/UBLnqHcZT/xW+eAFQaePAZ9b+NKm2RPENGVUXqKIAn3gIBqf29BI=
X-Received: by 2002:a17:902:d488:b0:24c:b6b6:e54c with SMTP id
 d9443c01a7336-24cb6b6e5f9mr45340275ad.3.1757058293921; Fri, 05 Sep 2025
 00:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904033217.it.414-kees@kernel.org> <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
 <202509040933.06AF02E714@keescook> <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
 <202509041740.1007FFEA@keescook>
In-Reply-To: <202509041740.1007FFEA@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Sep 2025 09:44:41 +0200
X-Gm-Features: Ac12FXxuAyzV67ABgZG5WJnwUzLnA_eITH6K0nXKAnUgoCmOACBUUDhH7lZTQYk
Message-ID: <CANiq72==vG_L35sQDGF6OFmTf=17qGs0k1NKiD17JYoforR30w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] kcfi: Prepare for GCC support
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, David Woodhouse <dwmw2@infradead.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Ramon de C Valle <rcvalle@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 2:42=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Assuming Nathan (and Vegard? or other folks from the other thread?) are
> okay with the kconfig changes, I'll take it via hardening.

I haven't had time to take a proper look, test it etc., so I didn't
reply, sorry -- but I am following the thread and I am glad if we have
something to easily/properly support this, so thanks for this.

(And sorry for having triggered all this discussion/work -- at least
if we get this done it will have been worth it :)

I will leave a quick message about the commit message.

Cheers,
Miguel

