Return-Path: <linux-kbuild+bounces-4485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 787569BA28E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A49E21C21A78
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C121AAE1E;
	Sat,  2 Nov 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNhuOeUo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1DB14AD20;
	Sat,  2 Nov 2024 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730583563; cv=none; b=Mgw1mjr3khvABYtdK831gRmas8EGtTvfZwj0oRNP+bA0ZT5cZGzt0cjmk6sjyCKoLya4CmNniQMS71aIri5j52Yh8/beAXpUHbXtbQ26LSOhsG5OmniWUkwQAqH3WEif2ok4vdRBiNYWSHZs31gaY947YG4RcK4i3dGBq0IYDuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730583563; c=relaxed/simple;
	bh=v31RHX7zwuGILSi524dbs8vBY+KRnW+z/Mvu0ZwXAKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pue7y+svg7915ZLOkIZy1CwZ0fnFK6Yo1dpULxKjAv0ofly/vy5ZH3Q2hROyp6otK9bT8adxN33MGdeSLpWGLSVTo3kC/ZhclVg5r2BqK4jcJLCBv2zYari8Bd5qaJ9g/+ECWPdJNfzjnFOp4TpR1kTyIWRSKHqX4uNA+JMagys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNhuOeUo; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ee36621734so529414a12.3;
        Sat, 02 Nov 2024 14:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730583560; x=1731188360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v31RHX7zwuGILSi524dbs8vBY+KRnW+z/Mvu0ZwXAKs=;
        b=DNhuOeUoGl2cdm1c/mWroqf70Pj6xZnSZ81zwWsKuYCzlyiL9oZqYGMuODTHx0b6PT
         yDBL7WIISASA+PzjlU6NgM+n+MhNb3xcdXMo2ZXLVpdrq4QOAXBSRNjyNuvtVh8+XL2b
         dmZuGKNhCoey/WyBFgZxsgyIz9xLwOOibp2dE1SiZ2/NgbNpmtkyV83NavNF4b306dN8
         6ZJmdwt/5FpOk/gUYObJy3FPXN4Mf/+RTJNU76tPUaho+evLbVucxVUa/+0AMz0bevYv
         fhSsZIb/Csx5phdCrfXTvdh2hsCf+JzlA5EoGoBaM61P4f0qFm8jfk4w3CTpbcBtx+Pd
         vCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730583560; x=1731188360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v31RHX7zwuGILSi524dbs8vBY+KRnW+z/Mvu0ZwXAKs=;
        b=QCP5gnEpTmHRypRkyepG6Vz5Njku5JLuiU9n9Pa3gS6Oe04rKVUB6emfIaIGbpuocN
         zTB+yaTRElZoK7Gn3z04arX6y6t6YF5wWqVh+9aHKF+7UhCYka+Fq1gErjhdAw+kaeXP
         vJJ3r9+HALDLX9zMUlA7dwOVZ07AjCJGXQ35Eno0PdqjTkM/b3yON4xaDWTAQMw2rn+u
         wf3/1REY1xIXNtclKdw0HEODHeWiw03DjFpmp5GFOd8S7er/k5Y9lXrD0D+qN9N013Ca
         mU9IVZbWdvzGX3x5cnW1N2g7M+C7iza9hmiD+4fXthHT8w/Urt0str/VvOrbjO4+En24
         5/9w==
X-Forwarded-Encrypted: i=1; AJvYcCUvODU6agSDGbgRPz0lf83aZZX+U4WZ0EuAg+uEB4ikzBbyiHlyQ0mBIwOI15KVSQSa9ET8SegQf8COKZCK@vger.kernel.org, AJvYcCVrdeC29B0gxxh5VeFaW3TMi944NNfiA5cJ2jLlSfN0+GQ4+K/jdhbFmB76rZgpDBEpQoCDN7hMEFD3pwf+acE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnMiRTfcNWXbGAacaZM1yLRhZxGgQVti/EJ/EGtYF4Wao55eOd
	swQ2mQC1lOWwGIHPyujRIj1cW4lO4xjoQwz0w6cR7bl/spH5dC09UDkh7JWiZ4CsdAVJgp3IZNo
	KaEaAWWgUCqRqoHrAi7eCA7cg8mQ=
X-Google-Smtp-Source: AGHT+IGTDQ78KZ9PYLKZS+mytEroKc5tLbkCIaArb9uL0Fb/3cBJwOS3qMJtGc88YNXaIBSQDu6+NYH4fhj8P8+kOUI=
X-Received: by 2002:a17:90a:b38e:b0:2e2:af5b:a18d with SMTP id
 98e67ed59e1d1-2e8f11ab185mr13252410a91.4.1730583560386; Sat, 02 Nov 2024
 14:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-2-vegard.nossum@oracle.com> <ZyaUkK57P4sL2uqm@fjasle.eu>
In-Reply-To: <ZyaUkK57P4sL2uqm@fjasle.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 2 Nov 2024 22:39:07 +0100
Message-ID: <CANiq72kJDTaTy91+QN_STHf9ppeiWtzuVORX+Zp36zbFApZ8HA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/11] kbuild: ignore .config rule for make --always-make
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Morten Linderud <morten@linderud.pw>, 
	Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>, Kees Cook <kees@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 10:08=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> As we still also support make v3.80 to v4.0, please use $(short-opts)
> defined around line 27.

We moved to 4.0 in 5f99665ee8f4 ("kbuild: raise the minimum GNU Make
requirement to 4.0") -- or do you mean something else / am I missing
something?

Thanks!

Cheers,
Miguel

