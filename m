Return-Path: <linux-kbuild+bounces-2880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA594A730
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 13:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D15711F23DFD
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 11:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6011E487F;
	Wed,  7 Aug 2024 11:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FEKNIGEl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795471E3CC1
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Aug 2024 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723031387; cv=none; b=saS45AiA0e6xubVg+iiPTouymXXfp8GVmLRHObihlbpY45FNVwYYco2vVPQS5g3yRDtwxKMD/1FcCk34WwXzX+lcdcvA9U9YbV3BAA2CF7bYuzrpVWBB1PHgO/CwHP8nAEZfvT1Q5WFhODvxwYCCbUB3k6Q15U1vM/jdvlBqjZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723031387; c=relaxed/simple;
	bh=a/dC9WYEQPdmFDxHth1Lwu8KV1JB3jsWpTUlohgSUHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ci1R2hXmsooXbYghqsvdllLma7uGSwSUAWhCo6hwtnTZngsuhW9qa8xumuzPGPYElbxAJLtbyyBz1mlFWzEXmt203kli+44u2I6YlVNQBef+Dqa9EVrd7tjAIOzSpI9Gznzgi5Qf2albqEeKY5P8xI5XPg2SqZv/t2w0dZERx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FEKNIGEl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3683329f787so916471f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Aug 2024 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723031384; x=1723636184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/dC9WYEQPdmFDxHth1Lwu8KV1JB3jsWpTUlohgSUHI=;
        b=FEKNIGEle8UdU0r3AgKUFk14fuW4eAyW8P7UHRBDH6vwOeOpIDJyJoOTymY68HUtsD
         qwOHqR6s0z/B1vCivnH4DwOiRVBeZQSIUdTstjvvvPbhDdAlzWH3WhYcZbcI4O6CicF4
         0GZMpqDusJS2Y8bG1z0AthK5OyRpFE6MSrpXeZIyjibRqch9O7AikNPcT7ZTqP/+vRax
         94kTufczu0/XqsxqzSL6p2knT5+lrTDhMwd1B8EhNKkY0LHI1CGpCpomEfio6bCL54IW
         AxmW+SToRYa+fSGrLL4uNlfL3QVAR0x3r6A3gg7P4g3tfcrxH69/xtfRao7GmOVm2Qs9
         VE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723031384; x=1723636184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/dC9WYEQPdmFDxHth1Lwu8KV1JB3jsWpTUlohgSUHI=;
        b=cMD3gHeaDh1e5iPwh2tyjQj8LUaayWj0i3dSq9rnzqNjQvgnyb3/4HTwQ8dUXmELPr
         zojEwVLubxUhKQCHGRLVgBr9M0LYSy8YtDqfVCALnf1/zTuXBj5PsETc3bd9S7oZJCLs
         mvN/FqvKi1fWP37HP44EpCo6n+PaOpI3cVAc47C8htUBuqed3BeQ+JdgyqvecrMCmrtx
         PMDKR3huCpAi8B+EqiPAM1yL/4MqBlVCqfCc7pd/QoIlYNFkE+wVqhk05YluBAYrUclp
         jBPOYSoz8mPECQpK6WBXq2tYI62CyAUWFhmy2qHh7QlMXyLO7pLKF4yNOk1ZYH8a9QRT
         t7ig==
X-Forwarded-Encrypted: i=1; AJvYcCVOq+Ms7dv9+X0zmoPmnBOJRqD3OB0gIK+USSiWXrAZO1XFzEfrZgpke+TyyIIvRu7s5efFxWb78cLur9yJqIL9LW2thjC3rSoA+kGa
X-Gm-Message-State: AOJu0Yy7S+vpEI447fhvOMqoHG9HiLXHF0NaOB7iCe5PlkI0sgGiWMAj
	ADxHvU5B/xAE1iReTd3pr4AKGeME3cjyQ1zwaRBfWydrYEjZ82/SwOmyTrbahcidpKqFiY116a4
	y3oonMhW3mkvbvYRlXsiR6hz+9Z9w7jOlSpbq
X-Google-Smtp-Source: AGHT+IEtTOVqbzU4EcqZnKqzn7ZHQ6dJC1In4BJyyOOt1USL9W8GtpPF1PcUdjk686l2fHYBMyX04R1GUZOIR9Bydzc=
X-Received: by 2002:a05:6000:bc2:b0:368:6ab:ba69 with SMTP id
 ffacd0b85a97d-36bbc1005bemr12210634f8f.28.1723031383491; Wed, 07 Aug 2024
 04:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806233559.246705-1-ojeda@kernel.org>
In-Reply-To: <20240806233559.246705-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 13:49:31 +0200
Message-ID: <CAH5fLgiVwsxrY-PmwCntsx2=9u24TfFkNuJCJ4aioGD6V6ddHQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust-analyzer: mark `rust_is_available.sh`
 invocation as recursive
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 1:36=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> When calling the `rust_is_available.sh` script, we need to make the
> jobserver available to it, as commit ecab4115c44c ("kbuild: mark `rustc`
> (and others) invocations as recursive") explains and did for the others.
>
> Otherwise, we get a warning from `rustc`. Thus fix it.
>
> Fixes: 6dc9d9ca9a72 ("kbuild: rust-analyzer: better error handling")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

