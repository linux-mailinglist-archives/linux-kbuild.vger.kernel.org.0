Return-Path: <linux-kbuild+bounces-9007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7DBBDDBD
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 13:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81C293B305A
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 11:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7433426B0B3;
	Mon,  6 Oct 2025 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii9hZK/A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065EB1E1A3D
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Oct 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750068; cv=none; b=nc25xBruqvIYGlWEw+K/RklBz63OmaAUYHLu9ZkmdTV3Vqh8f8D1U1kOfNZH9afYhURzfnjsZx3tMMqpJzRZXCBwz5ilwXJSzwkZ3vqAhBMCkFM4gsyZSB7qsZQrlOjGxC4QpfUla9V5ZtSHP5xgjBgoLcM9IAbA8bSnENQe5+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750068; c=relaxed/simple;
	bh=E/FPw0fY1WNiYy4hyNh9nlCHleoKAmsLZkg3ptd5JBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgrBVia5G2JVem2DeCs+tvB+K0i5wk16W6/Np4JJaIBfPgYNloe+kWQmVRdNVaXPUeLxdxzoAMoiuG63xQqu0EFWC878z6GE4ouFUqL8ZlnFp8BjLhHAxQe1vacBbXCbFAIKZkyEYs1R/qp5/WmpUz428WauAAkno5tTByTLiEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii9hZK/A; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32f3fa6412dso811594a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759750066; x=1760354866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/FPw0fY1WNiYy4hyNh9nlCHleoKAmsLZkg3ptd5JBE=;
        b=ii9hZK/AUgJGOk0I8YPiYshKZ9iCAW29phYwM1KVj+qUqT4tNScpOcq+plPVv2MtiA
         AVkf0ZYudHlZmjk2ao32OTnXqTtRh+kMfppatE0M7R3BSkG4z0kT/bp/9AsqlxJzEC0p
         hzlVJQbNvI14fp/PhMdcdJDDwNrHtpuUHD0wOv6KSlAbK5mSUBFg5msXnnRfiqhom/CA
         abpJ7XO6yhXN0d9EaQJWN8UXLJokutMHpbvTDWFYL9hvKH5ieZrTGDt8nhGZZ99psIeV
         dqNbmtEvySGD9tueSk5zgMFkZiQyaLzTFGCqGP+IX4bxVOzJZxQpAgRCYevYmVFFy+Me
         Sh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750066; x=1760354866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/FPw0fY1WNiYy4hyNh9nlCHleoKAmsLZkg3ptd5JBE=;
        b=hODrf3XQqgFHLkqs0+yhsZc/aNwOCKo1mV4he/5Ci4CdVJa2BEM8DdCvaoO+QKnY0y
         8ezzK/6is5LDAmV/H6hrNP+bRb3zlVmYceIElH7P0YeawWrVn5I650tGeurPukETxtzj
         CJLlHkrM63Pd9pt0/8jopePwE7csDQ5v+DsSyDXBm+oLXlQR8R7djhpyAnVu1t0JsOWw
         3G9k+KICrCmEhzlliruhzv4bWNvn7Z3Og+vlaVC2SkqxHKBbv+3Je882DZMMvojuB5wf
         USBPomeo0Gs1BiGmuxa/wpiY5ga7zlzkcqS00bNzdD6lTdh8Pr8DOm1SbwMy0Hukbf1I
         H69g==
X-Forwarded-Encrypted: i=1; AJvYcCUGwoYXOhdYTeQGuxL26ITFTzOEW9n1PzN6f1g5e/BSh4wTZqKZy6R/s+r7ne87SM8ZU+JCu9q8Z3XdmE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTaIhfUgJ/aeIX5ddz0vlcaABvy7ItcfDRiX2Y/tgUdpDqCLBs
	obJq5Y/iwz1iWkdInxmpvnDih+MM+A2TLm2WHNm9EH9Ko+xo+T1M4Wgid0ZaRgIPfPjkJiaa0Nc
	pKrrUlKuxNzqCGAOQ8VSwd2w6IVvqYLw=
X-Gm-Gg: ASbGncsdA116kXMaRmP16UDCiikPFSxT8O+M/R9BS7jlvn8jDxwFjknX45Vx/3HMpvm
	PxguhKLXI11pKL7qWitI4XT9kZn6gBB++la+U5o0U4ZHuHqqYf0NleWkGugUQcjEt9zLDFT9XTk
	B3A8Q2TCuV8GLsWFJjPBwlX3lRfZIFV554er9waz9ZRpxEPFazZBj/RgKvYBiq/1k1jiEp+MSqU
	l6f5M0iisT0bem4zk/q9S+qIzpelM+eC1AmKbPgHvCX2I3lvaGPsgzDMxnnF/iDr1DWeYDiXgnS
	UeexJl2Dj33vHe8M4HyN5k2YK/6QLpXnIW2X93s4Q1g0PyGouBdwYLKGrs0RE0sWGV4wPAU=
X-Google-Smtp-Source: AGHT+IGU552WBlNxXYsiZP3k+YaYGnd0eztZK4BBARL/9cAMbZoEa5fIfV4DQMF8tLrK1/G2rwbinID+IDLRpUaG874=
X-Received: by 2002:a17:903:18b:b0:257:3283:b859 with SMTP id
 d9443c01a7336-28e9a6ce25fmr71533365ad.9.1759750066264; Mon, 06 Oct 2025
 04:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
 <20251005011100.1035272-1-safinaskar@gmail.com> <20251005205335.GA2561157@ax162>
In-Reply-To: <20251005205335.GA2561157@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Oct 2025 13:27:33 +0200
X-Gm-Features: AS18NWADaxVflRFqTezzJZlF2JybUbasQ-cTILinYfyS9GRIdfm3RSh3CWudziU
Message-ID: <CANiq72kDT_uDpmvMyMEXodSXP3rsevjzW7G134H9A7Pmx6_7nA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
To: Nathan Chancellor <nathan@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Nicolas Schier <nsc@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, sam@gentoo.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 5, 2025 at 10:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Thomas and Nicolas, thoughts?

I think it would be good to eventually split the hostprog flags into 2
sets: the ones that are used for bootstrapping, and the ones that go
after that.

That way, we can get the best of both worlds, if I understand correctly.

Cheers,
Miguel

