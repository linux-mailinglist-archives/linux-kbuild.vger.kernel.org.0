Return-Path: <linux-kbuild+bounces-9892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D148C8F76A
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 17:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A71EC350E69
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Nov 2025 16:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A969332ED6;
	Thu, 27 Nov 2025 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILUboCil"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F12D0C94
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259989; cv=none; b=nafnzChLr4bEqj0Vi9aIAeGJ8XoPdhYtUyIKc8a86nzIHMBADjlI9/4z5ubzlg5KwfjM1OjAIkT0qSViP+fQheqNi6+y0EEr/F2iQPfuT9xWqjusmKSEiajNyJiU7ZHc6YORPR6EoxancRJDlWqiyX4hT6WLn3/OpOD2SAjYruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259989; c=relaxed/simple;
	bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIm30kbFyrrHYCBVNzeFh9oP4LMCagi8/LkXVJ1Pn97A7Az5n7WM1JNk6MggeEi5vDRE9BsNPlZPxzQ3yzCq1rh6ehuTZIsekdeBPuAWuVuAzPwkBBUVNwWgXDMJQE9LdLHLPhBFOFw6I0gQsf6BkZ1EHRnJe3UCfIbzl7hoB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILUboCil; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b735487129fso147398366b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Nov 2025 08:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259986; x=1764864786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
        b=ILUboCilhRu7W2l5uL+twL13aTtqP0MhjgKRRx2EMIflWnKm2tTIgbXCp9YjNKx4uu
         UsKxTeNgyxoxqMXz3Cf64Of7brK0+IiX8CjgvisY2mcFDpRTG2JO2Le9mJDH3klbrY5N
         C/OCOysbYHIDDRPNHlyvUxA0eu+ypLJ3qSI0cw3KEbK3SzDI9oRyX9AvAq4QGNRy+d0K
         A1XUYALNm8gGVaBIqY93OILPgJ06q2xrQDn/ZR5NDnlmBPM2gk+t8BFZQI3+vNP+GF+B
         LdNWFf+5jS1NyT8YJ4G6rJmQd1u6PAQeU5jrjouOzp+aQCxDSNr8Q9J9Nj42mPRCY+rn
         HFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259986; x=1764864786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
        b=XRZRLNjaRXX26hWgldNcoDyv0lmgf4DUeRtVPfD9c9CYrs4xfmBy1z6z27VGcPcpxk
         WfbhG/Sfnfl7ceijFNNc/X9LVhF0pYsOKINIRuaVLVEI6uaGoaawotIbRKtI1QMKVoaK
         Z0eo4kQyhXi+7+Y4bFMyL3kNTEVSQyMCNuuoJ/JclzEyIpj50mHKeft0vlD/F388pkUI
         eFPj4u87yQzDneiLDQ8ealXH4Xg3SSYOh/2Iv5brXEB2PYJFf2ipmeZvx6XvheXqN903
         q4CZq8qDN5IZwxOAAFsTqes3pRhMJFPRh8AGMu9jFBmCZ9vm+fcr07rjidVvGfoUB9st
         4Zag==
X-Forwarded-Encrypted: i=1; AJvYcCVAweq0O6iShtxT3ztIXaBckSCFw5AU4uOXiH8tOkUWmvSHvdI2pUD+SASg19O6yZJThfbJaEWrORbpjCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZMj5V9w4RvwK8cmHAaHiK3UBR9xQIcw5rSLLwOKs6qvJr/OE
	+g3EHgCczn2HLnXB7MaEhty8njf+GxGesLFQdxyNDYWkZvQZWJlJ2/9a2GXb4xlvGE8a+UjgLSp
	vFNcjXyKTTx4yef/Nptygj38wTC2wfOo=
X-Gm-Gg: ASbGnctQt0Tslx4KSg3oxHf3JpUzQ2GwK422y+WbS8HyIVyhek72oV+h+6n3dUo8rv0
	W0zcV7Hz0kRARVS/K0W2FfRAd+ZcvKsnurY++HIZIuLAZsUCd/rBYo8DLhUKtByMiMKYoyzYgqP
	sTJp0QFTGc9kyoHOZmIoVFSs21+vTQ+9l6tIRT+u5lrGljSGOvNeJr+X1q4SyHkPGFxcRPocu66
	avHToIuZbZC2TglKJM87gf+BnFT4BLtdcwvr0MiQMk8QliavIZpBFZ4ze0pt6Tl1lEm45uBhvnu
	D81yWUD6q6UhHyas4/7J14i2y0Phakh5L2hviDabcAaaJTZeVkPhfVyffQsA38yaEFa31XM=
X-Google-Smtp-Source: AGHT+IHL5lD9l+Hh164xtP764PC1ElejfIHOpAawihP6o7z5n7+TtXrvPC3UUFXr2PXT/YoRMV/DR5xhbgT7VKwIfhk=
X-Received: by 2002:a17:907:d05:b0:b73:7ca6:220d with SMTP id
 a640c23a62f3a-b7671a4728bmr2613030766b.59.1764259985521; Thu, 27 Nov 2025
 08:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com> <20251127155452.42660-3-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251127155452.42660-3-dev-josejavier.rodriguez@duagon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Nov 2025 18:12:29 +0200
X-Gm-Features: AWmQ_bl-vjVNPE1-lBZUlM8SQoQAsmh5XSIjD1Lm2LJMWJiupqb_fmgKaxReBWs
Message-ID: <CAHp75VfhM5GuYY1qUKgBhePDo4oe5k3K1ZDTPbYJNr5NtjVVfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mcb: Remove MODULE_ALIAS from all mcb client drivers
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linus.walleij@linaro.org, brgl@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, morbidrsa@gmail.com, 
	jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org, 
	nsc@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 5:56=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> MODULE_ALIAS information is no longer needed as now all mcb client
> drivers are reporting such information through MODULE_DEVICE_TABLE.

While this is not a big change, I still would recommend to split on
per-driver basis, and with pushing the first one as kinda a fix after
v6.19-rc1 (to v6.19-rcX) allows other maintainers to apply the rest on
driver-basis. This helps everybody I assume.


--=20
With Best Regards,
Andy Shevchenko

