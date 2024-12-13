Return-Path: <linux-kbuild+bounces-5122-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FF9F0CB5
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 13:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12FD281DEE
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418691DFDA3;
	Fri, 13 Dec 2024 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qiNEn3Qh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268E61A0AF7
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094213; cv=none; b=JX9qDrik/QNrX3c/cBjANp/OGVDs39TuPIr3X1GwlXV8yfz/NuU8fXfGD97PsqmXEQMzh7MnjLPviftprfHWgbmV0LVzBPnHF3huCP4WwGjP72y0BiQtGnSp7ZMymGQl2U1tpqtBbiyJVVyhmKyz6mrheh/yUdQP+9z3l9XiKfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094213; c=relaxed/simple;
	bh=k6suJOebW+T2tQfGVv5Vkd1GGLC7hP2TbXFK9BWUYTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgRAZjmFlDoA8XO7xvYd/NvaXgyIJORgTcOBS7Q6vqc5zxFV7dqALpOIBVrApL4zFx9+ZyqXSNbZTpLB1j5EbZAfCaHtOsjwwjPkgwwrN/jTTTupkQ6rQZwBLipf/wutxPr+Qupbw8rA8U4RrsA6WURrtxPnIGaCsYEgBRUGJ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qiNEn3Qh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1097622f8f.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Dec 2024 04:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734094208; x=1734699008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6suJOebW+T2tQfGVv5Vkd1GGLC7hP2TbXFK9BWUYTE=;
        b=qiNEn3QhLiGGvjAIHhKeDgnHAOD3NHqwCwbPPcCb7Mxn8sH9Pkm3ey73LvaXxUN3O4
         AEyh09OpMp1k07cGrAI5PJK3clmNjF6wzi6r87xhTRKDIB10AswRiE6XRFjJYQYwrihC
         OKnLkYyUyBJ1coY8UyVwmJO8a0IPL6JxL61MIBmK5tQ/za4+tV7SrkZUAr/f1eEJ6kPb
         wokxH6tfHnjtyynwEeM0I1gyq5vQIvyuyfiy7o/yJP1nYwMlMhEkJLOfkZ/u5X32Nvc7
         AY1je6Z19DzjxH3gNIE2yRWbWmv/z9RkqRTk0THHS7KjAXaMD8p+YoFjTIvACAuashBK
         HxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734094208; x=1734699008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6suJOebW+T2tQfGVv5Vkd1GGLC7hP2TbXFK9BWUYTE=;
        b=O4HmGDGUHp2MyRpJswvxOKbo+XXe1OQJKFvSDiSfBb5MazZ6/NGojzNRSbDTlMLwN4
         6smPJWSdFVjvJ8WhE/1jgPw86Xk4HTrCNWisMA5EVKhI5zUDIqQ+5RDmQwnTc4Yr5PR/
         noODxwTiT9MR+TdPMrvfdWKPtYmuu8Jiin2T18W0SAWVx3tap/B0K0Bw/7OTGqzMfBe5
         7Nka6sDvcgIpRsqFQHg9ctTri9/6L2H5810tJng6JE64DL1yDBUBvqx9MrAkWbvazHWf
         Vmki5r6gRvrE/KX1qsLE5tbKLsyHDJGSK7n8W7NARYnJrrDfPyaREX9R1bJ4v9VYfhdx
         5Yxw==
X-Forwarded-Encrypted: i=1; AJvYcCWS+4cJB+8417LG6jXlEHhPnliCeiYghY3o1d961i38GlJrVlT010jZYKWz4Rmgy02E8l9BPWUczP45NX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXIj5QdHI1948ZCAAyaecpRTrZvFzo7dYs921tJiJRvjUr/8Cd
	+WHjuDexcoJ/tgBQnj/nADx3Z8ruMDP3PW1mlldHe/vVVjIDalCa23XLjAjI4cvZmNmiY8Txo5u
	ihukbzML2eJ/UlGk+EEp+YEXmPekkPwB5AaUc
X-Gm-Gg: ASbGncvfVVRV9s7+wR3LpS36h5rcUj5Z8l0YH9/99/v8hGi8FNBWCoErj7h5T99CHxz
	MDi2LyDEJicbQa1C4M/DGbeuS1gX0teQWkEquPeU=
X-Google-Smtp-Source: AGHT+IFJwfW3yssZ7+jsglJf5d+5FmvssL5C/KzY0tcQAh75c2NrYq9vh2lXeL/kRzsw+F2F/hFZXHTrxvm3QYHIi+4=
X-Received: by 2002:a05:6000:1fa5:b0:386:45e9:fc8a with SMTP id
 ffacd0b85a97d-38880ac21c4mr1917804f8f.5.1734094208479; Fri, 13 Dec 2024
 04:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org> <20241213-module-params-v3-v3-1-485a015ac2cf@kernel.org>
In-Reply-To: <20241213-module-params-v3-v3-1-485a015ac2cf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Dec 2024 13:49:56 +0100
Message-ID: <CAH5fLghA6qHsSrC1YL9M=e-YHBa69xr7dp+_9nNR65C27ssO0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: str: implement `PartialEq` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 12:33=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Implement `PartialEq` for `BStr` by comparing underlying byte slices.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

